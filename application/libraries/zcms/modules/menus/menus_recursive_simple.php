<?php

class Menus_Recursive_Simple extends Module_Base {
    
    protected $menu_id;
    protected $menu;
    protected $menu_table = "zcms_frontend_menus";
    protected $menu_table_lang;
    
    public function render($menu_id, $view = 'menus_main_menu')
    {
        $this->menu_id = $menu_id;
        $this->menu = $this->_load_menu();
        $this->_load_view($view, array('menu' => $this));
    }
    
    protected function _load_menu($parent_id = 0)
    {
        //We don't have a menu id set
        if(!$this->menu_id)
            return NULL;
        
        $this->menu_table_lang = $this->menu_table. $this->translate->get_table_sufix();
        
        $this->db->from($this->menu_table." as t1");
        $this->sql->add_lang_table($this->menu_table_lang)
                  ->where("parent_id", $parent_id);

        if(!$parent_id)
            $this->db->where('t1.id', $this->menu_id);
        
        $menu = ($parent_id) ?  $this->db->get()->result() : $this->db->get()->row();
        
        if($parent_id)
            foreach($menu as $item)
                $item->sublevel = $this->_load_menu($item->id);
        else
            $menu->sublevel = $this->_load_menu($menu->id);
        
        return $menu;
    }
}
