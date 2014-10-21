<?php

class Product_Listing extends Module_base {
    
    protected $product_render_page = "product";
    protected $view_type = "categories";
    protected $category_id;
    protected $type_id;
    
    protected $type;
    protected $types_list;
    
    protected $category;
    protected $categories_list;
    
    protected $listing;
    
    protected $categories_table = "product_categories";
    protected $categories_table_lang;
    
    protected $types_table = "product_types";
    protected $types_table_lang;
    
    protected $product_table = "product_products";
    protected $product_table_lang;
    
    protected $product_img_table = "product_images";
    protected $product_img_table_lang;
    
    protected $product_doc_table = "product_docs";
    protected $product_doc_table_lang;
   
    public function render($category_id = NULL, $collection_id = NULL, $view_type = 'categories')
    {
        $this->category_id = $category_id;
        if($this->input->get('category'))
            $this->category_id = $this->input->get('category');
        
        $this->type_id = $collection_id;
        if($this->input->get('collection'))
            $this->type_id = $this->input->get('collection');
        
        $this->view_type = $view_type;
        
        $this->_set_lang_tables();
        $this->_load_types();
        $this->_load_categories();
        $this->_load_products();

        $this->_load_view('products_listing_' . $this->view_type, array('listing' => $this));
    }
    
    protected function _set_lang_tables()
    {
         $this->categories_table_lang = $this->categories_table.$this->translate->get_table_sufix();
         $this->types_table_lang = $this->types_table.$this->translate->get_table_sufix();
         $this->product_table_lang = $this->product_table.$this->translate->get_table_sufix();
         $this->product_img_table_lang = $this->product_img_table.$this->translate->get_table_sufix();
         $this->product_doc_table_lang = $this->product_doc_table.$this->translate->get_table_sufix();
    }
    
    protected function _load_types()
    {
        $this->db->from($this->types_table." as t1");
        $this->sql->add_lang_table($this->types_table_lang);
        $this->types_list = $this->db->get()->result();
        
        if($this->type_id)
            foreach($this->types_list as $_type)
                if($_type->id_ == $this->type_id)
                    $this->type = $_type;
    }
    
    protected function _load_categories()
    {
        //First we fetch the category list
        $this->db->from($this->categories_table." as t1");
        $this->sql->add_lang_table($this->categories_table_lang);
        $this->categories_list = $this->db->get()->result();
        
        
        //Then we get the current category from the list
        if($this->category_id)
            foreach($this->categories_list as $_cat)
                if($_cat->alias == $this->category_id)
                    $this->category = $_cat;
    }
    
    protected function _load_products()
    {
         if($this->view_type == 'categories' && !$this->category_id)
            return NULL;
         if($this->view_type == 'types' && !$this->type_id)
            return NULL;
        
         //Then we load the products in this category
         $this->db->from($this->product_table." as t1");
         $this->sql->add_lang_table($this->product_table_lang);
         
         if($this->view_type == 'categories')
            $this->db->like('t1.categories', '"'.$this->category->alias.'"');
         elseif($this->view_type == 'types')
             $this->db->where('t1.type', $this->type_id);
         
         $this->db->order_by('t1.id', 'desc');
         $this->listing = $this->db->get()->result();
         
         foreach($this->listing as $product)
         {
             $this->db->from($this->product_img_table." as t1");
             $this->sql->add_lang_table($this->product_img_table_lang);
             $this->db->where(array(
                 "t1.rel_id" => $product->id_,
                 "t1.main" => "1"
             ));
             
             $product->main_image = $this->db->get()->row();
             
             if(!$product->main_image)
             {
                 $product->main_image = new stdClass();
                 $product->main_image->id = 0;
                 $product->main_image->id_ = 0;
                 $product->main_image->rel_id = $product->id_;
                 $product->main_image->file = "noimage.png";
                 $product->main_image->main = 1;
             }
         }
    }
    
    protected function _map_types()
    {
        foreach($this->listing as $product)
            foreach($this->types_list as $type)
                if($type->id == $product->type)
                    $product->type = $type;
    }
}
