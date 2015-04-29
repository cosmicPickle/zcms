<?php

class Catalog_Menu extends Module_base {
    
    protected $categories;
    
    public function fetch() 
    {
        $this->categories = $this->_fetch_recursive();
    }
    
    protected function _fetch_recursive($parent = 0)
    {
        $categories = array();
        $this->db->from($this->config->cat_table->value.' as t1');
        $this->sql->add_lang_table($this->config->cat_table->value.$this->translate->get_table_sufix());
        $categories = $this->db->where('parent', $parent)->get()->result();
        
        if($categories)
            foreach($categories as $key => $cat)
                $categories[$key]->subcategories = $this->_fetch_recursive($cat->id_);
        
        return $categories;
    }
}

