<?php

class Catalog_Listing extends Module_base {
    
    protected $top;

    public function fetch()
    {
        $this->db->from($this->config->cat_table->value.' as t1');
        $this->sql->add_lang_table($this->config->cat_table->value.$this->translate->get_table_sufix());
        
        if(!$this->config->category->value)
            $this->top = $this->db->where('parent', 0)->get->row();
        else
            $this->top = $this->db->where('alias', $this->config->category->value)->get()->row();
        
        if(!$this->top)
            return NULL;
        
        $this->top->categories = NULL;
        $this->top->products = NULL;
        $this->top->product_count = NULL;
        
        if($this->config->show_child_categories->value)
        {
            $this->db->from($this->config->cat_table->value.' as t1');
            $this->sql->add_lang_table($this->config->cat_table->value.$this->translate->get_table_sufix());
            $this->top->categories = $this->db->where('parent', $this->top->id_)->get()->result();
        }
        
        if($this->config->show_pds_in_parent->value || 
           !$this->config->show_pds_in_parent->value && !$this->top->categories)
        {
            $this->db->from($this->config->pd_table->value.' as t1');
            $this->sql->add_lang_table($this->config->pd_table->value.$this->translate->get_table_sufix());

            $this->db->like('categories', '"'.$this->top->id_.'"');
            
            if($this->config->pagination->value) 
            {
                            
                //Cloning db to get count
                $db = clone $this->db;
                $this->top->product_count = $db->count_all_results();

                $page = $this->config->page->value;
                $ipp = $this->config->items_per_page->value;
                $offset = ($page - 1)*$ipp;

                $this->db->limit($ipp, $offset);
            }
            
            $this->top->products = $this->db->get()->result();
            
            $pd_ids = array();
            if($this->top->products)
                foreach($this->top->products as $pd)
                    $pd_ids[] = $pd->id_;
            
            $this->db->from($this->config->pd_img_table->value.' as t1');
            $this->sql->add_lang_table($this->config->pd_img_table->value.$this->translate->get_table_sufix(),TRUE);
            $imgs = $this->db->where('main', 1)
                             ->get()->result();
            
            $this->top->product_images = array();
            foreach($imgs as $img)
                $this->top->product_images[$img->rel_id] = $img;
        }
    }
    
    public function render()
    {
        $this->_override_meta_info();
        parent::render();
    }
    
    protected function _override_meta_info()
    {
        if($this->config->meta_use_title->value)
            $this->page->set_title($this->top->category);
        if($this->config->meta_use_keywords->value)
            $this->page->set_keywords($this->top->keywords);
        if($this->config->meta_use_description->value)
            $this->page->set_description($this->top->meta_description);
    }
}