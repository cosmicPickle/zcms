<?php

class Menus_Recursive extends Module_Base {
    
    protected $menu_id;
    protected $menu;
    protected $menu_table = "menus_frontend_menus";
    protected $menu_table_lang;
    
    public function fetch()
    {
        $this->menu_id = $this->config->menu->value;
        $this->menu = $this->_load_menu();
        
        $this->view_data["menu"] = $this->menu;
    }
    
    protected function _load_menu($parent_id = 0, $level = 0)
    {
        //We don't have a menu id set
        if(!$this->menu_id)
            return NULL;
        
        $this->menu_table_lang = $this->menu_table. $this->translate->get_table_sufix();
        
        $this->db->from($this->menu_table." as t1");
        $this->sql->add_lang_table($this->menu_table_lang)
                  ->where("parent_id", $parent_id)
                  ->order_by("order","asc");

        if(!$parent_id)
            $this->db->where('t1.alias', $this->menu_id);
        
        $menu = ($parent_id) ?  $this->db->get()->result() : $this->db->get()->row();
        
        if($level < $this->config->max_levels->value)
        {
            $level++;
            
            if($parent_id)
                foreach($menu as $item)
                    $item->sublevel = $this->_load_menu($item->id_, $level);
            else
                $menu->sublevel = $this->_load_menu($menu->id_, $level);
        }
        
        return $menu;
    }
}
