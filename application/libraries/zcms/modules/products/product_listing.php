<?php

class Product_Listing extends Module_base {
    
    protected $category_id;
    protected $listing;
    
    protected $product_table = "product_products";
    protected $product_table_lang;
    
    protected $product_img_table = "product_images";
    protected $product_img_table_lang;
   
    public function render()
    {
        $this->category_id = $this->input->get('category');
        $this->load_category();
        $this->_load_view('products_listing', array('listing' => $this));
    }
    
    protected function load_category()
    {
         $this->product_table_lang = $this->product_table.$this->translate->get_table_sufix();
         $this->product_img_table_lang = $this->product_img_table.$this->translate->get_table_sufix();
         
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
