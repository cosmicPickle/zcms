<?php

class Product_Listing extends Module_base {
    
    protected $product_render_page = "product";
    protected $view_type = "categories";
    protected $category_id;
    protected $category;
    protected $listing;
    
    protected $categories_table = "product_categories";
    protected $categories_table_lang;
    
    protected $product_table = "product_products";
    protected $product_table_lang;
    
    protected $product_img_table = "product_images";
    protected $product_img_table_lang;
   
    public function render($category_id = NULL, $product_render_page = NULL, $product_param = NULL)
    {
        if($product_param && $this->input->get($product_param))
            return NULL;
        
        $this->category_id = $category_id;
        if($this->input->get('category'))
            $this->category_id = $this->input->get('category');
        
        //Setting global category id
        $this->globals->set("category_id", $this->category_id);
        
        if($product_render_page)
            $this->product_render_page = $product_render_page;
        
        $this->load_category();
        $this->_load_view('products_listing_'.$this->view_type, array('listing' => $this));
    }
    
    protected function load_category()
    {
         $this->categories_table_lang = $this->categories_table.$this->translate->get_table_sufix();
         $this->product_table_lang = $this->product_table.$this->translate->get_table_sufix();
         $this->product_img_table_lang = $this->product_img_table.$this->translate->get_table_sufix();
         
         //First we fetch the current category
         $this->db->from($this->categories_table." as t1");
         $this->sql->add_lang_table($this->categories_table_lang);
         $this->db->where('t1.id', $this->category_id);
         $this->category = $this->db->get()->row();
         //Then we try to ger child categories
         if($this->category_id)
         {
            $this->db->from($this->categories_table." as t1");
            $this->sql->add_lang_table($this->categories_table_lang);
            $this->db->where('parent_id', $this->category_id);
            
            $this->event->trigger("category_listing_load_before", $this);
         
            $this->listing = $this->db->get()->result();

            $this->event->trigger("category_listing_load_after", $this);
            
            if($this->listing)
                return NULL;
         }
         
         //If the current category doesn't have child categories we load the products
         $this->view_type = "products";
         $this->db->from($this->product_table." as t1");
         $this->sql->add_lang_table($this->product_table_lang);
         
         if($this->category_id)
             $this->db->where('category', $this->category_id);
         
         $this->event->trigger("product_listing_load_before", $this);
         
         $this->listing = $this->db->get()->result();
         
         $this->event->trigger("product_listing_load_after", $this);
         
         //Loading images
         foreach($this->listing as $product)
         {
             $this->db->from($this->product_img_table." as t1");
             $this->sql->add_lang_table($this->product_img_table_lang);
             $this->db->where(array(
                 "t1.rel_id" => $product->id_,
                 "t1.main" => "1"
             ));
             
             $product->main_image = $this->db->get()->row();
         }
    }
}
