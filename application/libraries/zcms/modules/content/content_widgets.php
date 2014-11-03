<?php

class Content_Widgets extends Module_Base {

    protected $widgets_table = "content_widgets";
    protected $widget;
    
    public function fetch()
    {
        if(!$this->config->widget->value)
            return NULL;
        
        $this->db->from($this->widgets_table." as t1");
        $this->sql->add_lang_table($this->widgets_table.$this->translate->get_table_sufix());
        $this->db->where('alias', $this->config->widget->value);
        
        $this->widget = $this->db->get()->row();
        $this->view_data = array('widget' => $this->widget);
    }
    
    public function render()
    {
        if(!$this->config->widget->value)
            return NULL;
        
        parent::render();
    }
}