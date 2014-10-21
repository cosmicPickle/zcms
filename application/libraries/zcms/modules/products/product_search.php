<?php

require_once "product_listing.php";

class Product_Search extends Product_Listing {
    
    protected $search;
    protected $search_columns = array();
    protected $search_columns_lang = array();
    
    public function render($search_columns, $search_columns_lang)
    {
        $this->search_columns = explode(";", $search_columns);
        $this->search_columns_lang = explode(";", $search_columns_lang);
        $this->search = $this->input->get('search');

        $this->_set_lang_tables();
        $this->_load_types();
        $this->_load_products();
        $this->_map_types();
        
       $this->_load_view('products_listing_search', array('listing' => $this));
    }
    
    protected function _load_products()
    {
         //Then we load the products in this category
         $this->db->from($this->product_table." as t1");
         $this->sql->add_lang_table($this->product_table_lang);
         
         $where = array();
         foreach($this->search_columns as $sc)
             $where[] = "t1.".$sc." LIKE '%".mysql_real_escape_string($this->search)."%'";
         
         foreach($this->search_columns_lang as $scl)
         {
             $where[] = "t2.".$scl." LIKE '%".mysql_real_escape_string($this->search)."%'";
         }
         
         $this->db->where("(".implode(" OR ", $where).")",NULL,FALSE);
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
         }
    }
}