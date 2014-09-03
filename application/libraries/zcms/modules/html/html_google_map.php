<?php

class Html_Google_Map extends Module_base {
    
    protected $map_id;
    protected $map;
    
    protected $map_table = "html_google_maps";
    protected $map_table_lang;
    
    public function render()
    {
        $this->map_id = $this->input->get("id");
        
        if($this->map_id)
            $this->_load_map();
        
        $this->_load_view("html_google_map", array("map" => $this));
    }
    
    protected function _load_map()
    {
        $this->map_table_lang = $this->map_table.$this->translate->get_table_sufix();
        
        $this->db->from($this->map_table." as t1");
        $this->sql->add_lang_table_no_default($this->map_table_lang, FALSE);
        $this->db->where("t1.id", $this->map_id);
        
        $this->map = $this->db->get()->row();
    }
}