<?php

class Product_Pathway extends Module_base {
    
    protected $product_id;
    protected $category_id;
    
    protected $category_page;
    protected $product_page;
    
    protected $pathway = array();
    
    protected $product;

    protected $category_table = "product_categories";
    protected $product_table = "product_products";
   
    public function render($category_id = NULL, $category_page = NULL, $product_page = NULL)
    {
        $this->category_page = $category_page;
        $this->product_page = $product_page;
        
        $this->product_id = $this->input->get('id');
        $this->category_id = $category_id;
        if($this->input->get('category'))
            $this->category_id = $this->input->get('category');
        
        if($this->product_id)
        {
            $this->db->select('t1.*, t2.title')->from($this->product_table." as t1");
            $this->product = $this->sql->add_lang_table($this->product_table.$this->translate->get_table_sufix())
                                       ->where('t1.id', $this->product_id)
                                       ->get()->row();
            $this->category_id = $this->product->category;
        }
        
        if($this->category_id)
            $path_obj = $this->sql->get_node_path($this->category_table, $this->category_id);
        
        
        $this->_extract_path($path_obj);
        
        $this->pathway = array_reverse($this->pathway);
        $this->_load_view('products_pathway', array('path' => $this));
    }
    
    private function _extract_path($path_obj) {
        
        $index = count($this->pathway);
        
        if(!$index && $this->product)
        {
            $this->pathway[$index] = new stdClass();
            $this->pathway[$index]->title = $this->product->title;
            $this->pathway[$index]->url = $this->frontend().'pages/index/';

            if($this->product_page)
                $this->pathway[$index]->url .= $this->product_page;
            else
                $this->pathway[$index]->url .= $this->globals->get("page_id");

            $this->pathway[$index]->url .= "?id=".$this->product->id;
            
            $index++;
        }
        
        if(!$path_obj)
            return NULL;
        
        $this->pathway[$index] = new stdClass();
        $this->pathway[$index]->title = $path_obj->category;
        $this->pathway[$index]->url = $this->frontend().'pages/index/';
        
        if($this->category_page)
            $this->pathway[$index]->url .= $this->category_page;
        else
            $this->pathway[$index]->url .= $this->globals->get("page_id");
        
        $this->pathway[$index]->url .= "?category=".$path_obj->id_;
        
        $this->_extract_path($path_obj->parent);
    }
}

