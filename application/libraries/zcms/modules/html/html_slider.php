<?php

class Html_Slider extends Module_base {
    
    protected $slider_id = "home";
    protected $slider;
    protected $slider_table = "html_slider";
    protected $slider_table_lang;
    
    public function __construct($obj = NULL) {
        parent::__construct($obj);
        
        $this->slider_table_lang = $this->slider_table.$this->translate->get_table_sufix();
    }
    public function render($slider_id = NULL)
    {
        if($slider_id)
            $this->slider_id = $slider_id;
        $this->_load_slider();
        $this->_load_view('html_slider', array("slider" => $this->slider));
    }
    
    protected function _load_slider()
    {
        $this->db->from($this->slider_table." as t1");
        $this->sql->add_lang_table($this->slider_table_lang);
        $this->db->where("t1.slider_id = '".$this->slider_id."'");
                       
        $this->event->trigger("html_slider_load_before", $this);
        
        $this->slider = $this->db->get()->result();
        
        $this->event->trigger("html_slider_load_after", $this);
    }
}

