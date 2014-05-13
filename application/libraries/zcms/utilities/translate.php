<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');


/*
 * Translate class
 * 
 * @author Teodor Klissarov
 * @created 08.04.2013
 * 
 * This class will set the language of the CMS itself and the language of the content in a variable via a session variable. 
 * As far as the system is concerned if the language is different than the default labels/messages etc. will be pulled from tables
 * with the specific sufix saved in the class variable lang_sufix. The content tables may or may not have language table counterparts.
 * If the version language is different than the default and the language table is missing or no value is found for the current
 * language the default values will be used.
 * 
 */

class Translate extends ZCMS {
    
    //the default language constant
    const DEFAULT_LANG = "EN";
    
    //the misc translation table
    const MISC_TABLE = "zcms_lang_misc";
    
    //the page translations cache table
    const CACHE_TABLE = "zcms_lang_cache";
    
    //current language will be saved here
    private $lang = NULL;
    
    //language table suffix. Every language table will have to have this fellow at the end of its name
    private $lang_table_sufix = NULL;
    
    //This will contain an array of all values in the current page that need translating 
    //(actually not all of them only the ones that are already saved).
    private static $misc = array();
    
    //This value will contain corresponding translations of the misc array
    private static $translations = array();
    
    //This will hold the cached ids
    private static $cache_ids = NULL;
    
    
/*
 * __construct()
 * 
 * It takes the current language out of a GET/session variable. If it's empty or doesn't exist -
 * sets to default language. Also sets the language table suffix.
 * 
 */
    public function __construct()
    {
        parent::__construct();
        
        //First we check the session variable
        $session_lang = $this->session->userdata("zcms_lang");
        
        //Then we override with the GET variable if set
        if(isset($_GET['lang']))
        {
            $session_lang = strtoupper($_GET['lang']);
            $this->session->set_userdata("zcms_lang", $session_lang);
        }
            
        if($session_lang && $session_lang !== self::DEFAULT_LANG)
        {    
            $this->lang = $session_lang;
            $this->lang_table_sufix = "_lang";
            $this->_retrieve_lang_cache();
        }
        else
            $this->lang = self::DEFAULT_LANG;
    }
    
    // Ok. I am not commenting getters. Ever!
    public function get_lang()
    {
        return $this->lang;
    }
    
    public function get_table_sufix()
    {
        return $this->lang_table_sufix;
    }
    
/**
 * The misc translation logic
 * 
 * The following set of functions will help translating static texts throughout the CMS. Wherever some text needs to be translated
 * it should be passed to the t() function. It will then be rendered translated. How it works:
 * 
 * We have two tables one of which contains all static translations for all languages (reffered to as misc table). The other table contains ids of the static 
 * translations used in each page(reffered to as cache table).
 * 
 * _retrieve_lang_cache()
 * 
 * This function tries to retrieve the line for the current page from the cache table. If no line exists creates one for the current language. It then selects 
 * the needed lines from the misc table and constructs the $misc and $translations arrays
 * 
 */
    private function _retrieve_lang_cache()
    {
        //Default language - bye!
        if($this->lang == self::DEFAULT_LANG)
            return NULL;
        
        //Selecting the ids
        $ids = $this->db->select("ids")
                        ->where("link", uri_string())
                        ->get(self::CACHE_TABLE)
                        ->row();
        
                
        //No ids. Insert row and we are done
        if(!$ids)
        {    
            $this->db->insert(self::CACHE_TABLE, array('link' => uri_string(), "lang_id" => $this->lang));
            return NULL;
        }
        
        $ids = $ids->ids;
        
        //We had a row just not any values in it
        if(!$ids || !$ids = json_decode($ids))
            return NULL;
        
        //We wont get out of work this time
        
        //Constructing the WHERE query for the ids. Not using active record entirely 'cuz it will ruin the 
        // ANDs and ORs
        $where = array();
        foreach($ids as $id)
            $where[] = "id = '".$id."'";
        $where = "(" . implode(" OR ", $where) . ") AND lang_id='".$this->lang."'";
        
        //Getting the translations
        $tmp = $this->db->where($where)
                        ->get(self::MISC_TABLE)
                        ->result();
        
        //Constructing $misc and $translations arrays
        foreach($tmp as $val)
        {
            self::$misc[] = $val->text;
            self::$translations[] = $val->lang;
        }
        
        //Setting the cache ids for later use
        self::$cache_ids = $ids;
    }

/*
 * t( $subj )
 * 
 * This function looks for $subj in the $misc array. If found t() replaces it with the corresponding value in $translations.
 * If not t() look s for the value in the misc table. If the value is found it is put in the list with ids and the cache table
 * is updated. If $subj is not found in the misc table the value is added to the misc table and in the cache table.
 * 
 */
    public function t( $subj )
    {
        //We are on default
        if($this->lang == self::DEFAULT_LANG)
            return $subj;
        
        //Attempt 1: The easy way. We have a match, though we need to return the original text if its empty
        if(($key = array_search($subj, self::$misc)) !== FALSE)
             return self::$translations[$key] ? self::$translations[$key] : $subj;
       
        //No match ...
        
        //Attempt 2: The value is translated in the misc table, but not added to the list
        $misc_row = $this->db->where('text', $subj)->get(self::MISC_TABLE)->row();
        
        if($misc_row)
        {
            if(!self::$cache_ids) 
                self::$cache_ids = array($misc_row->id);
            else
                if(!in_array($misc_row->id, self::$cache_ids))
                    self::$cache_ids[] = $misc_row->id;
            
            //Updating the cache table
            $this->db->where("link", uri_string())
                     ->set(array("ids" => json_encode(self::$cache_ids)))
                     ->update(self::CACHE_TABLE);
            
            //If the translation is empty return the original text
            return $misc_row->lang ? $misc_row->lang : $subj;
        }
        
        //Again no match ...
        
        //We need to create an entry
        $this->db->insert(self::MISC_TABLE, array('lang_id' => $this->lang, 'text' => $subj));
        
        $ins_id = $this->db->insert_id();
        
        if(!self::$cache_ids) 
                self::$cache_ids = array($ins_id);
            else
                if(!in_array($ins_id, self::$cache_ids))
                    self::$cache_ids[] = $ins_id;
        
        //Again updating the cache table
        $this->db->where("link", uri_string())
                 ->set(array("ids" => json_encode(self::$cache_ids)))
                 ->update(self::CACHE_TABLE);
        
        //We don't have a translation return the original text
        return $subj;
    }

}

/* End of file translate.php */
/* Location: ./application/libraries/zcms/utilities/translate.php */
