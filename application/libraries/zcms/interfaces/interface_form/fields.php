<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');


/*
 * Fields class
 * 
 * @author Teodor Klissarov
 * @created 16.04.2013
 * 
 * This class will handle rendering of all the types of fields that will be supported by the Interface_form class
 * 
 */

class Fields extends Interface_form {
    
    const FIELDS_FOLDER = "fields/";
    
    protected $settings = array(
        'name' => NULL,
        'type' => NULL,
        'label' => NULL,
        'description' => NULL,
        'order' => NULL,
        'css_class' => NULL,
        'css_id' => NULL,
        'script' => NULL,
        'id_' => NULL,
        'disabled_on_insert' => NULL,
        'disabled_on_update' => NULL,
        'validation' => NULL,
        'opt_val_pairs' => NULL,
        'link_table' => NULL,
        'link_opt_column' => NULL,
        'link_val_column' => NULL,
        'parent_column' => NULL,
        'link_query' => NULL,
        'multiple' => NULL,
        'checked' => NULL,
        'path' => NULL,
        'size_limit' => NULL,
        'count_limit' => NULL,
        'ext_limit' => NULL,
        'thumbs' => NULL,
        'crop' => NULL,
        'padding' => NULL,
        'padding_color' => NULL,
        'disabled' => NULL,
        'disable_past' => NULL
    );
    
    protected $value = NULL;
    protected $rendered = NULL;
    
    public function __construct($obj = NULL) 
    {
        parent::__construct();
        
        if($obj)
            foreach($obj as $attr_key => $attr)
                $this->{$attr_key} = $attr;
    }
    
    public function __set($name, $value)
    {
        $this->settings[$name] = $value;
    }
 
    public function setting($setting, $value = NULL)
    {
        if(!$value) 
        {
            if(!isset($this->settings[$setting]))
                return NULL;
            
            return $this->settings[$setting];
        }
        else
            $this->settings[$setting] = $value;
    }
    
    public function value($val = NULL)
    {
        if($val === NULL) return $this->value;
        else
            $this->value = $val;
    }
    
    public function label()
    {
        return $this->settings['label'];
    }
    
    public function render()
    { 
        $class = $this->settings['type'];
        if(!class_exists($class))
            $this->load->library(self::INTERFACE_FOLDER
                                .self::INCLUDES_FOLDER
                                .self::FIELDS_FOLDER
                                .$class);
        
        $field = new $class($this);
        
        $this->event->trigger("interface_form_field_render_before", $field);
        $field->render();
        $field->_add_script();
        $this->event->trigger("interface_form_field_render_after", $field);
        
        return $field->rendered;
    }
    
    /**
     * This function handles the deletion of inline files. Meaning files that 
     * are not separated in a linked table. For those normal entry deletion method
     * should be used.
     * 
     * @param type $file
     * @return null
     */
    public function delete_file($file)
    {
        
        //There is a linked table use entry deletion
        if($this->setting('link_table'))
            return NULL;
        
        //The value is not generated or there are no files in the 
        if(!$this->value())
            return NULL;
        
        $files = json_decode($this->value());
        
        if(($filePosition = array_search($file, $files)) === FALSE)
            return NULL;
        
        unset($files[$filePosition]);
        $files = array_merge(array(),$files);
        $files = json_encode($files);

        //Path to main images
        $path = Interface_form::UPLOADS_PATH.$this->setting('path');
        //Path to thumbs
        $tpath = Interface_form::UPLOADS_PATH.$this->setting('path').Interface_form::THUMBS_PATH;      
        
        //Deleting the main file
        if(file_exists($path.$file))
            @unlink($path.$file);
        
        //If this is an image we have thumbs
        if($this->setting('type') == 'image')
        {
            //Check for a system thumb
            if(file_exists($tpath.Interface_form::SYS_TB_PREF."_".$file))
            {
                @unlink($tpath.Interface_form::SYS_TB_PREF."_".$file);
                clearstatcache();
            }

            //Loop throgh the thumbs if there are any ...
            if($thumbs = $this->setting('thumbs'))
                foreach($thumbs as $thumb)
                    //... and delete them
                    if(file_exists($tpath.$thumb."_".$file))
                    {
                        @unlink($tpath.$thumb."_".$file);
                        clearstatcache();
                    }        
        }
        //Updating the table
        $this->db->where('id', $this->raw_data[0]->id)
                 ->update($this->data_table, array($this->setting('name') => $files));
        
    }
    
    protected function _add_script()
    {
        if($this->settings['script'])
        {    
            $this->rendered .= '<script type="text/javascript">';
            $this->rendered .= $this->settings['script'];
            $this->rendered .= '</script>';
        }           
    }

    protected function _get_select_pairs()
    {
        if(!$this->settings['link_table'] || !$this->settings['link_opt_column'] || !$this->settings['link_val_column'])
            return NULL;
       
        $link_table = $this->settings['link_table'];
        $link_oc = $this->settings['link_opt_column'];
        $link_vc = $this->settings['link_val_column'];
        $link_query = $this->settings['link_query'];
        
        $link_table_lang = $this->translate->get_table_sufix() 
                           ? $link_table.$this->translate->get_table_sufix()
                           : NULL;
        
        if($link_table_lang)
            $pairs_raw = $this->db->select("t1." . $link_oc . ", t2." . $link_vc . " as " . $link_vc,FALSE)
                              ->from($link_table." as t1")
                              ->join($link_table_lang." as t2", "t1.id = t2.id_", "left")
                              ->where(
                                        "(t2.lang_id = '" . $this->translate->get_lang() . "' OR t2.lang_id IS NULL)".
                                        (($link_query) ? (" AND (".$link_query.")" ): NULL)
                                     )
                              ->get()
                              ->result();
        else
            $pairs_raw = $this->db->select("t1." . $link_oc . ", t1." . $link_vc)
                              ->from($link_table." as t1")
                              ->get()
                              ->result();
        
        $pairs = array();
        foreach($pairs_raw as $p)
            $pairs[$p->$link_oc] = $p->{$link_vc};
            
        return json_encode($pairs);
    }

    protected function _basic_file()
    {
        $this->rendered = '<input type="file" 
                                  class="'.$this->settings['css_class'].'"
                                  id="'.$this->settings['css_id'].'"
                                  name="'.$this->settings['name'].'[]"
                                        '.$this->settings['disabled'].'
                                        '.($this->settings['count_limit'] == 1 ? NULL : 'multiple').'/>';
        
        $this->rendered .= "<div class='help-block'><small>";
        $this->rendered .= $this->translate->t("You can upload") . ": <strong>".($this->settings['ext_limit'] ? $this->settings['ext_limit'] : 'Any File')."</strong><br/>";
        $this->rendered .= $this->translate->t("Max file size") . ": <strong>".($this->settings['size_limit'] ? $this->settings['size_limit']." MB" : 'Any size')."</strong><br/>";
        $this->rendered .= $this->translate->t("Max files") . ": <strong>".($this->settings['count_limit'] ? $this->settings['count_limit'] : 'Any size')."</strong><br/>";
        $this->rendered .= "</small></div>";
    }
    
    protected function _parse_vars($str, $index)
    {
        $matches = array();
       
        //First we match the file variables located in the loaded_files array
        preg_match($this->paterns['file_var'],$str,$matches);
        if($matches && isset($this->loaded_files[$index]->{$matches[1]}))
            $str = str_replace($matches[0], $this->loaded_files[$index]->{$matches[1]}, $str);

        //Next we match the raw_data variables    
        preg_match($this->paterns['data_var'],$str,$matches);
        if($matches && isset($this->raw_data[0]->{$matches[1]}))
            $str = str_replace($matches[0], $this->raw_data[0]->{$matches[1]}, $str);
            
        return $str;
    }
}

/* End of file fields.php */
/* Location: ./application/libraries/zcms/utilities/fields.php  */
