<?php

require_once "product_listing.php";

class Product_View extends Product_Listing {
    
    protected $product_code;
    protected $product_list;
    protected $view = 'products_view';
    protected $vertical_gallery_collections = array(9,10);
    
    public function render($view = 'products_view', $get_product_list = FALSE)
    {
        $this->product_code = $this->input->get('code');
        if(!$this->product_code)
            return NULL;
        
        $this->_set_lang_tables();
        $this->_load_products();
        $this->_load_categories();
        
        if($get_product_list)
            $this->_load_product_list();
        
        if($view)
            $this->view = $view;
        
        $this->_load_view($this->view, array('product' => $this));
    }
    
    protected function _load_products() {
        
         $this->db->from($this->product_table." as t1");
         $this->sql->add_lang_table($this->product_table_lang);
         $this->db->where("t1.code", $this->product_code);
         
         $this->product = $this->db->get()->row();
         
         //Loading the images
         $this->db->from($this->product_img_table." as t1");
         $this->sql->add_lang_table($this->product_img_table_lang, TRUE);
         $this->db->where(array(
            "t1.rel_id" => $this->product->id_,
         ));
         $this->db->order_by('t1.file', 'asc');
         $this->product->images = $this->db->get()->result();
         
         //Loading the files
         $this->db->from($this->product_doc_table." as t1");
         $this->sql->add_lang_table($this->product_doc_table_lang, TRUE);
         $this->db->where(array(
            "t1.rel_id" => $this->product->id_,
         ));
         $this->db->order_by('t1.file', 'asc');
         $this->product->files = $this->db->get()->result();
    }
    
    protected function _load_product_list()
    {
        $this->db->select('t1.code, t2.title');
        $this->db->from($this->product_table." as t1");
        $this->sql->add_lang_table($this->product_table_lang);
        $this->db->where('t1.type',$this->product->type);
        $this->db->order_by('t1.id', 'desc');
        
        $this->product_list = $this->db->get()->result();
    }
}
