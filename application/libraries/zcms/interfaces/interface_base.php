<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');


/*
 * Base Interface class
 * 
 * @author Teodor Klissarov
 * @created 15.04.2013
 * 
 * The Database Interface is a center idea in the project. Any access to the Database with or without 
 * intention of modifying the existing data will be referred to as a Database Interface (DI). The 
 * purpose of DIs will be to create an abstract means for managing data without limiting the types 
 * of operations that can be used. The base DI library will serve as a parent to all DI classes 
 * available to the system.
 * 
 */

class Interface_base extends ZCMS {
    
    
/*
 * The control variable is an object that will help filter the data from the database
 * and should have the following structure:
 * 
 * (array) where/or_where   -> this should contain array similar to an array that can be used 
 *                             with CI Active Record class
 * (array) like/or_like     -> same as where but for the like part of the query
 * (array) order            -> this will contain two variables "by" and "direction" ([0] and [1] 
 *                             respectively)
 * (array(int, int)) limit  -> again similar to CI Active Record class variable are required
 * 
 * Note that t1. and t2. can be used in where and like for the table and its language counterpart.
 */
    protected $control;
    
    //if the child interface needs whatever settings from an outer source this variable is to hold them
    protected $settings;
    
    //This variable shows whether or not the base interface should try to extract data from the data_table
    protected $fetch_data;
    
    //The name of the table that is being interfaced
    protected $data_table;
    
    //If we are in language mode the name of the language data table NULL otherwise
    protected $data_table_lang;
    
    //The fields of the data_table
    protected $data_fields;
    
    //The fields of the data_table_lang
    protected $data_fields_lang;
    
    //If fetch_data is set to TRUE this variable will hold the extracted data
    protected $raw_data = NULL;
    
    //The number of results fetched
    protected $count_results = 0;
    
    //The number of results without any limit
    protected $count_all = 0;
    
    //Each interface can be generated multiple times (see load_interface)
    //This stores the variable name the new object is bind to in the object itself
    //for later use
    protected $caller = NULL;
    
    //The final view that is rendered
    protected $loaded_view = NULL;
    
/*
 * load_interface($interface_id)
 * 
 * Attempts to load an interface file called interface_{$interface_id}. Once load_interface function is
 * called, an object named $interface_id will be accessible through the interface_base object
 * 
 * ex. $this->zcms->interface->form...
 * 
 * The optional second parameter can be used to store the new interface object in sub object of the 
 * interface_id, thus allowing more then one instances of the same interface
 * 
 * ex. $this->zcms->iterface->form->form1...
 * 
 */
    public function load_interface($interface_id, $interface_name = NULL)
    {
        $this->event->trigger('interface_load_before', $data = array(
            "interface_id" => $interface_id, 
            "interface_name" => $interface_name
        ));
        
        $intf_class = "interface_".$interface_id;
        
        if($this->{$interface_id} && !$interface_name)
        {
            $this->{$interface_id} = new $intf_class ();
            $this->event->trigger('interface_load_after', $this->{$interface_id});
            return TRUE;
        }
        elseif($this->{$interface_id} && $interface_name)
        {
            $this->{$interface_id}->{$interface_name} = new $intf_class ();
            $this->{$interface_id}->{$interface_name}->caller = $interface_name;
            $this->event->trigger('interface_load_after', $this->{$interface_id});
            return TRUE;
        }

        $this->load_interface_dependancies($intf_class);
        $this->load->library(static::INTERFACE_FOLDER.$intf_class, '', $interface_id);
        
        if($interface_name)
        {
            $this->{$interface_id} = NULL;
            $this->{$interface_id}->{$interface_name} = new $intf_class ();
            $this->{$interface_id}->{$interface_name}->caller = $interface_name;
            $this->event->trigger('interface_load_after', $this->{$interface_id}->{$interface_name});
            return TRUE;
        }
        
        $this->event->trigger('interface_load_after', $this->{$interface_id});
        return TRUE;
    }
    
/*
 * init()
 * 
 * This function initializes the base interface.
 * 
 * Note: This function should not be called on an object of class Interface_base. It should be called on each
 * of the children interfaces that are loaded. This function however can be overloaded in the child class to 
 * achieve more flexability.
 * 
 */
    public function init($data_table = NULL, $interface_ca = NULL, $settings = NULL, $fetch_data = TRUE)
    {
        //Setting class variables
        $this->data_table = $data_table;
        $this->control = $interface_ca;
        $this->settings = $settings;
        $this->fetch_data = $fetch_data;
        
        //If the database table doesn't exist, nothing to interface
        if(!$this->db->table_exists($this->data_table))
           return NULL;
        
        //We set the language_table
        $this->_init_lang_table();
        
        $this->event->trigger('interface_fetch_data_before', $this);
        //If we are required to, we fetch the table data
        if($fetch_data)
            $this->_fetch_data();
        $this->event->trigger('interface_fetch_data_after', $this);
    }
    
    public function get_raw_data()
    {
        return $this->raw_data;
    }
    
    public function get_control()
    {
        return $this->control;
    }
    
    public function get_settings()
    {
        return $this->settings;
    }
    
    public function get_data_table()
    {
        return $this->data_table;
    }
    
    public function get_data_table_lang()
    {
        return $this->data_table_lang;
    }

 /**
  * This functions loads any interfaces of which the current one is dependant.
  * This is resolved the following way:
  * 
  * ex. If the interface name is Interface_list it has no dependancies.
  * If it is Interface_list_recursive - the class is dependant on the 
  * Interface_list class
  * 
  * @param type $intf_id
  */
    protected function load_interface_dependancies($intf_id)
    {
        $interface_parts = explode('_', $intf_id);
        
        $load = NULL;
        foreach($interface_parts as $part)
        {
            if($load)
                $load .= "_";
            
            $load .= $part;
            
            if($part == 'interface' || $part == $intf_id)
                continue;
            
            $this->load->library(static::INTERFACE_FOLDER.$load);
        }
    }
    
/*
 *  _fetch_data()
 * 
 *  As the name suggests this function extracts the needed data from the database
 * 
 */
    protected function _fetch_data()
    {
        
        //Building query data - This compound query will be too difficult for CI Active record to handle
        //so we are using $this->db->query();
        
        $count = "SELECT COUNT(*) as rows ";
        $select = NULL;
        $from = NULL;
        $join = NULL;
        $where = NULL;
        $order = NULL;
        $limit = NULL;
        
        
        if($this->data_table_lang)
        {
            //We will need to know which fields to get from which tables below
            $this->_locate_columns();
            
            //If we have a language table the query will be a bit more complicated
            $select = "SELECT ".$this->_map_select()." ";
            $from = "FROM ".$this->data_table." as t1 ";
            $join = "LEFT JOIN ".$this->data_table_lang." as t2 ON t1.id = t2.id_ ";
            $where = "WHERE (t2.lang_id = IFNULL("
                    . "(SELECT t3.lang_id FROM ".$this->data_table_lang." as t3"
                    . " WHERE t1.id = t3.id_ AND lang_id = '".$this->translate->get_lang()."'), "
                    . "'".$this->translate->get_default_lang(). "') OR t2.lang_id IS NULL) ";
        }
        else
        {
            //Otherwise simple stuff
            $select = "SELECT t1.* ";
            $from = "FROM ".$this->data_table." as t1 ";
            
        }
        
        //Any additional parts of the query set with the control object are added
        
        //If our where is a string we won't parse anything.
        if(isset($this->control->where) && !empty($this->control->where) && is_string($this->control->where))
        {
            
            $where .= $where ? "AND " : "WHERE ";
            $where .= $this->control->where;
        }
        elseif(isset($this->control->where) && !empty($this->control->where) && !is_string($this->control->where))
        {
            //Otherwise we do the work of Active Record + a little bit more
            $where .= $where ? "AND " : "WHERE ";
            $where .= $this->_parse_where($this->control->where);
        }
        
        if(isset($this->control->order) && !empty($this->control->order))
        {  
            $order = "ORDER BY ";
            $ob = $this->control->order[0];
            $od = $this->control->order[1];
            //Again we check the language if its different from the default we try to order by fields from the language table
            //and of course if the user hasn't specified which table he wants to pick from.
            if($this->data_table_lang && !preg_match('/^t[1-2]{1}\..+$/', $ob))
                $order .= in_array($ob, $this->data_fields_lang) 
                          ? "t2.".mysql_real_escape_string($ob)." ".mysql_real_escape_string($od)." "
                          : "t1.".mysql_real_escape_string($ob)." ".mysql_real_escape_string($od)." ";
            else
                $order .= "t1.".mysql_real_escape_string($this->control->order[0])." ".mysql_real_escape_string($this->control->order[1])." ";
        }
        
        //Limit nothing special here
        if(isset($this->control->limit) && !empty($this->control->limit))
        {
            $limit = "LIMIT ".(isset($this->control->limit[1]) ? ($this->control->limit[1].", ".$this->control->limit[0]) : $this->control->limit[0]);
        }
        
        
        //And we get our data
        $this->raw_data = $this->db->query($select.$from.$join.$where.$order.$limit)->result();

        //Counting results
        $this->count_all = $this->db->query($count.$from.$join.$where.$order)->row()->rows;
        $this->count_results = count($this->raw_data);
        
        
        
        //Some formatin to make the data easier for later use
        foreach($this->raw_data as $row)
        {
            if(isset($row->id_))
            {    
                $row->id = $row->id_;
                
                if(!$row->lang_id)
                 $row->lang_id = Translate::DEFAULT_LANG; 
                
                unset($row->id_);
            }   
        }
        
    }
    
/*
 * _init_lang_table()
 * 
 * If our language is the default or the table doesn't exist the  language table is set to NULL
 * the function returns FALSE. The name of the language table is set otherwise.
 * 
 */
    protected function _init_lang_table()
    {        
        if($this->translate->get_table_sufix())
            $this->data_table_lang = $this->data_table.$this->translate->get_table_sufix();
        else
            $this->data_table_lang = NULL;
        
        if($this->data_table_lang && $this->db->table_exists($this->data_table_lang))
            return TRUE;
        
        $this->data_table_lang = NULL;
        return FALSE;
    }

/*
 * _locate_columns()
 * 
 * This is a helper function that puts the list of columns and language columns
 * in the appropriate class variables
 * 
 */
    protected function _locate_columns()
    {
        $this->data_fields = $this->db->list_fields($this->data_table);
        $this->data_fields_lang = $this->db->list_fields($this->data_table_lang);
    }
    
/*
 * _map_select()
 * 
 * This is a helper function that helps us deside what to require from which table if 
 * we are in language mode.
 * 
 */
    protected function _map_select()
    {
        $mapped = array();
        $mapped[] = "t1.*";
        
        if(($id_key = array_search("id", $this->data_fields_lang, TRUE)) !== FALSE)
            unset($this->data_fields_lang[$id_key]);
        
        foreach($this->data_fields_lang as $lfield)
            $mapped[] = "t2." . $lfield;
           //$mapped[] = (in_array($lfield, $this->data_fields)) ? "IFNULL(t2." . $lfield . ", t1." . $lfield . ") as " . $lfield : "t2." . $lfield; 
        
        return implode(", ", $mapped);
    }
    
    	

/**
  * _parse_where function
  *
  * This is a recursive array parser. It recognises the following keys:
  *
  * key => val        equals to (AND) key = val <br/>
  * key>|<|! => val   equals to (AND) key >|<|!= val <br/>
  * key% => val       equals tp (AND) key LIKE %val% <br/>
  * !key => val       equals to (OR)  key = val <br/>
  * key-in => array() equals to       key IN (array()) <br/>
  * key => array()    equals to (AND) (recusrsion on array()) <br/>
  * !key => array()   equals to (OR)  (recusrsion on array()) <br/>
  *
  * <b> example: </b> <br/>
  *
  * array(<br/>
  *      key1>  => val1<br/>
  *      !key2% => val2<br/>
  *      !sub1  => array(<br/>
  *          key3!  => val3<br/>
  *          key4< => val4<br/>
  *      )<br/>
  * )<br/>
  *
  * <b> equals to: </b> <br/>
  *
  * WHERE key1 > val1 OR key2 LIKE val2 OR (key3 != val3 AND key4 = val4)
  *
  * @param array the where data
  * @return string the parsed where string
  */
     private function _parse_where($data)
     {
         //This as the array that will contain all conditions
         $conds = array();

         //Cycling through the data
         foreach($data as $key => $val)
         {
             //The index of the current condition
             $index = count($conds);

             //If this is an array we have to process it recursively
             if(is_array($val))
             {
                 //We evaluate to see if it is an "IN" request
                 if(preg_match('#^([a-zA-Z0-9_\.]*)-(!)?in$#', $key, $matches))
                 {
                     //Escaping the values
                     foreach($val as &$v)
                         $v = mysql_real_escape_string(urldecode($v));
                     
                     $conds[$index] = $matches[1] . (isset($matches[2]) ? " NOT" : NULL) . " IN ('" . implode("','", $val) . "')";
                 }
                 else if($val)
                     //Recursion
                     $conds[$index] = "(" . $this->_parse_where ($val) . ')';

                 //Are there previous conditions ?
                 if($index > 0)
                     if(preg_match('#^!.*#', $key))
                         //If the key starts with a '!' then we need to add an OR
                         $conds[$index] = "OR " . $conds[$index];
                     else
                         //Otherwise - AND
                         $conds[$index] = "AND " . $conds[$index];    
             }
             else
             {
                 //The values are automatically sanitized, but let's check the
                 //key. The regex matches: table.val OR (!)table.val(<|>|!|%)
                 if(!preg_match('#^(([a-zA-Z0-9_\.]*)|((![a-zA-Z0-9_\.]*|[a-zA-Z0-9_\.]*)(>|<|!|%)))$#', $key))
                     continue;

                 $conds[$index] = '';

                 if(preg_match('#^!.*#', $key))
                 {    
                     //Are there previous conditions ?
                     if($index > 0)
                         //If the key starts with a '!' then we need to add an OR
                         $conds[$index] .= "OR ";

                     $key = substr($key,1);
                 }
                 else
                     if($index > 0)
                         //Otherwise - AND
                         $conds[$index] .= "AND ";  


                 //Next we check for an expression
                 if(preg_match('#^(![a-zA-Z0-9_\.]*|[a-zA-Z0-9_\.]*)(>|<|!|%)$#',$key,$matches))
                 {      
                      $key = str_replace($matches[2], '', $key);
                      if($matches[2] == "%")
                      {
                          $val = "%".mysql_real_escape_string($val)."%";
                          $conds[$index] .= $key. " LIKE '".$val."'";
                      }
                      elseif($matches[2] == "!")
                          $conds[$index] .= $key. " != '".mysql_real_escape_string(urldecode($val))."'";
                      else
                          $conds[$index] .= $key . " ".$matches[2]." '".mysql_real_escape_string(urldecode($val))."'";
                 }    
                 else
                     $conds[$index] .= $key . " = '".mysql_real_escape_string(urldecode($val))."'";
             }
         }
         
         return implode(" ",$conds);
     }


}

/* End of file interface_base.php */
/* Location: ./application/libraries/zcms/utilities/interface_base.php  */