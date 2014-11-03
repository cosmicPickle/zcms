<?php

class Content_Slider extends Module_Base {

    protected $slider_table = "content_slider";
    protected $slider_table_lang;
    protected $slider_id;
    protected $slider;
    
    public function fetch()
    {
        if(!$this->config->slider->value)
            return NULL;
        
        $this->slider_id = $this->config->slider->value;
        
        $this->slider_table_lang = $this->slider_table. $this->translate->get_table_sufix();
        
        $this->db->from($this->slider_table." as t1");
        $this->sql->add_lang_table($this->slider_table_lang)
                  ->where("parent = (SELECT id FROM ".$this->slider_table." WHERE alias = '"
                          .  mysql_real_escape_string($this->slider_id)."')")
                  ->order_by("order","asc");
        
        $this->slider = $this->db->get()->result();
        $this->view_data["slider"] = $this->slider;
    }
    
    public function render()
    {
        if(!$this->slider)
            return NULL;
        
        parent::render();
    }
}