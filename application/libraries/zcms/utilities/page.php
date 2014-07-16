<?php

class Page extends ZCMS {
    
    protected $_pages_table = 'zcms_pages';
    protected $_404_page_id = 'zcms_404';
    protected $_parser_pattern = "#\{([a-zA-Z0-9_/]*)(:([a-zA-Z0-9_\-@,\.]*))?\}#";
    
    protected $_page_id;
    protected $_main_menu;
    protected $_page_template = "pages";
    protected $_keywords;
    protected $_description;
    protected $_title;
    protected $_html_raw;
    protected $_html_parsed;
    protected $_modules;
    
    public function render($page_id)
    {
        $this->_page_id = $page_id;
        $this->_load_page();
        $this->_get_modules();
        $this->_render_modules();
        $this->_parse_html();
        
        $this->load->view(self::VIEWS_FRONTEND.$this->_page_template, array("page" => $this));
    }
    
    public function __call($name,$args)
    {
        $matches = array();
        
        if(preg_match("#set_(.*)#", $name, $matches))
        {
            $property = "_".$matches[1];
            
            if(isset($args[0]))
                $this->{$property} = $args[0];
            
            return $this->{$property};
        }
        
        if(preg_match("#get_(.*)#", $name, $matches))
        {
            $property = "_".$matches[1];
            return $this->{$property};
        }
    }
    
    public function get_html($raw = FALSE)
    {
        if($raw)
            return $this->_html_raw;
        else
            return $this->_html_parsed;
    }
    
    protected function _load_page()
    {
        //If there is no page_id, nothing to load
        if(!$this->_page_id)
           return NULL;
        
        //Trying to load the page
        $this->db->from($this->_pages_table. " as t1");
        
        //We need to join the language table
        if($suffix = $this->translate->get_table_sufix())
            $this->db->join($this->_pages_table.$suffix. " as t2", "t1.id = t2.id_");
        
        if($this->_page_id != $this->_404_page_id)
            $this->db->where(array(
                't1.page_id' => $this->_page_id,
                't2.lang_id' => $this->translate->get_lang()
            ));
        else
            $this->db->where("(t2.lang_id = IFNULL("
                            . "(SELECT t3.lang_id FROM ".$this->_pages_table.$suffix." as t3"
                            . " WHERE t1.id = t3.id_ AND lang_id = '".$this->translate->get_lang()."'), "
                            . "'".$this->translate->get_default_lang()."')) "
                            . " AND t1.page_id ='". $this->_page_id . "'");
        
        $page = $this->db->get()->row();
        
        if(!$page)
        {
            $this->_page_id = $this->_404_page_id;
            $this->_load_page();
            return NULL;
        }
        
        if($page->template)
            $this->_page_template = $page->template;
        
        $this->_main_menu = $page->main_menu;
        $this->_keywords = $page->keywords;
        $this->_description = $page->description;
        $this->_title = $page->title;
        $this->_html_raw = $page->html;
    }
    
    protected function _get_modules()
    {
        $matches = array();
        $this->_modules = array();
        
        preg_match_all($this->_parser_pattern, $this->_html_raw, $matches);
        
        if(isset($matches[1]) && $matches[1])
            foreach($matches[1] as $key => $mod_path)
            {
                $this->load->library(self::MODULES_PATH.$mod_path);
                $mod_name = end(explode('/',$mod_path));
                
                $index = count($this->_modules);
                $this->_modules[$index] = new $mod_name();
                $this->_modules[$index]->set_string($matches[0][$key]);
                $this->_modules[$index]->set_path($mod_path);
                $this->_modules[$index]->set_name($mod_name);
                $this->_modules[$index]->set_params(explode(',',$matches[3][$key]));

            }
    }
    
    protected function _render_modules()
    {
        foreach($this->_modules as $module)
        {
            
            if(!method_exists($module, "render"))
                continue;
            
            call_user_func_array(array($module, "render"), $module->get_params());
        }
    }
    
    protected function _parse_html()
    {
        foreach($this->_modules as $module)
        {
            $this->_html_parsed = str_replace($module->get_string(), $module->get_html(), 
                                              ($this->_html_parsed) ? $this->_html_parsed : $this->_html_raw);
        }
        
        if(!$this->_html_parsed) 
            $this->_html_parsed = $this->_html_raw;
    }
}
