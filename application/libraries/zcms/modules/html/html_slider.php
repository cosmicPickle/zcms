<?php

class Html_Slider extends Module_base {
    
    protected $slider;
    protected $slider_table = "html_slider";
    protected $slider_table_lang;
    
    public function __construct($obj = NULL) {
        parent::__construct($obj);
        
        $this->slider_table_lang = $this->slider_table.$this->translate->get_table_sufix();
    }
    public function render()
    {
        $this->_load_slider();
        $this->_load_view('html_slider', array("slider" => $this->slider));
    }
    
    protected function _load_slider()
    {
        $this->db->from($this->slider_table." as t1")
                 ->join($this->slider_table_lang." as t2", " t1.id = t2.id_ ", "left")
                 ->where("(t2.lang_id = IFNULL("
                        . "(SELECT t3.lang_id FROM ".$this->slider_table_lang." as t3"
                        . " WHERE t1.id = t3.id_ AND lang_id = '".$this->translate->get_lang()."'), "
                        . "'".$this->translate->get_default_lang(). "')) ");
                       
        $this->event->trigger("html_slider_load_before", $this);
        
        $this->slider = $this->db->get()->result();
        
        $this->event->trigger("html_slider_load_after", $this);
    }
}

