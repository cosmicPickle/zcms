<?php

class Catalog_View extends Module_base {
    
    protected $product;
    
    public function fetch()
    {
        if(!$this->config->product->value)
            return NULL;
        
        $this->db->from($this->config->pd_table->value.' as t1');
        $this->sql->add_lang_table($this->config->pd_table->value.$this->translate->get_table_sufix());
        $this->product = $this->db->where('t1.alias', $this->config->product->value)
                                  ->get()->row();
        
        if(!$this->product)
            return NULL;
        
        
        if($this->config->show_categories->value && json_decode($this->product->categories))
        {
            $this->db->from($this->config->cat_table->value.' as t1');
            $this->sql->add_lang_table($this->config->cat_table->value.$this->translate->get_table_sufix());
            $this->product->categories = $this->db->where_in('t1.id', json_decode($this->product->categories))
                                                  ->get()->result();
        }
        
        $this->db->from($this->config->pd_img_table->value.' as t1');
        $this->sql->add_lang_table($this->config->pd_img_table->value.$this->translate->get_table_sufix(), TRUE);
        $this->product->images = $this->db->where('t1.rel_id', $this->product->id)
                                          ->get()->result();
       
        $this->product->attr_labels = array();
        if($this->product->type) {
            
            $this->product->attributes = json_decode($this->product->attributes);
            $this->db->from($this->config->type_table->value.' as t1');
            $this->sql->add_lang_table($this->config->type_table->value.$this->translate->get_table_sufix());
            $type = $this->db->where('t1.id', $this->product->type)->get()->row();
            
            if($attrs = json_decode($type->attributes))
                foreach($attrs as $attr)
                {
                    $this->product->attr_labels[$attr->alias] = $attr->label;
                }
        }
        
        $this->db->from($this->config->pd_docs_table->value.' as t1');
        $this->sql->add_lang_table($this->config->pd_docs_table->value.$this->translate->get_table_sufix(), TRUE);
        $this->product->docs = $this->db->where('t1.rel_id', $this->product->id)
                                          ->get()->result();
        
    }
    
    public function render()
    {
        $this->_override_meta_info();
        parent::render();
    }
    
    protected function _override_meta_info()
    {
        if(!$this->config->product->value)
            return NULL;
        if($this->config->meta_use_title->value)
            $this->page->set_title($this->product->title);
        if($this->config->meta_use_keywords->value)
            $this->page->set_keywords($this->product->keywords);
        if($this->config->meta_use_description->value)
            $this->page->set_description($this->product->meta_description);
    }
}

