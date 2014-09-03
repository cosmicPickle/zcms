<?php

class Product_View extends Module_base {
    
    protected $product_id;
    protected $product;
    
    protected $product_table = "product_products";
    protected $product_table_lang;
    
    protected $category_table = "product_categories";
    protected $category_table_lang;
    
    protected $product_img_table = "product_images";
    protected $product_img_table_lang;
    
    protected $product_doc_table = "product_docs";
    protected $product_doc_table_lang;
   
    public function render()
    {
        $this->product_id = $this->input->get('id');
        if(!$this->product_id)
            return NULL;
        
        $this->load_category();
        $this->_load_view('products_view', array('product' => $this));
    }
    
    protected function load_category()
    {
         if(!$this->product_id)
             return NULL;
         
         $this->product_table_lang = $this->product_table.$this->translate->get_table_sufix();
         $this->category_table_lang = $this->category_table.$this->translate->get_table_sufix();
         $this->product_img_table_lang = $this->product_img_table.$this->translate->get_table_sufix();
         $this->product_doc_table_lang = $this->product_doc_table.$this->translate->get_table_sufix();
         
         $this->db->from($this->product_table." as t1");
         $this->sql->add_lang_table($this->product_table_lang);
         
         if($this->product_id)
             $this->db->where('t1.id', $this->product_id);
         
         $this->event->trigger("product_view_load_before", $this);
         
         $this->product = $this->db->get()->row();

         $this->event->trigger("product_view_load_after", $this);
         
         //Loading category 
         $this->db->from($this->category_table." as t1");
         $this->sql->add_lang_table($this->category_table_lang);
         $this->db->where("t1.id", $this->product->category);
         $this->product->category = $this->db->get()->row();
         
         //Loading images and docs
         $this->db->from($this->product_img_table." as t1");
         $this->sql->add_lang_table($this->product_img_table_lang, TRUE);
         
         $this->db->where(array(
            "t1.rel_id" => $this->product->id_,
         ));

         $this->product->images = $this->db->get()->result();
         
         $this->db->from($this->product_doc_table." as t1");
         $this->sql->add_lang_table($this->product_doc_table_lang);
         $this->db->where(array(
            "t1.rel_id" => $this->product->id_,
         ));

         $this->product->docs = $this->db->get()->result();
    }
}
