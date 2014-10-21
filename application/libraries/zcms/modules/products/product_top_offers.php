<?php

require_once "product_listing.php";

class Product_Top_Offers extends Product_Listing {
    
    public function render()
    {
        $this->_set_lang_tables();
        $this->_load_types();
        $this->_load_products();
        $this->_map_types();
        
        $this->_load_view('products_listing_top_offer', array('listing' => $this));
    }
    
    protected function _load_products()
    {
         //Then we load the products in this category
         $this->db->from($this->product_table." as t1");
         $this->sql->add_lang_table($this->product_table_lang);
         $this->db->where("t1.top_offer", 1);
         
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
}