<?php

class Products_Observer extends Observer {
    
    protected $filter_page = 'mmotors_fans_filter';
            
    public function interface_form_modify_after($observer) {
        
        $form = $observer->get_data();
        
        if($form->get_data_table() != "catalog_product_images" && $form->get_data_table() != "catalog_product_docs")
            return NULL;
        
        $raw_data = $form->get_raw_data();
        
        header("location: ".$this->backend()."catalog/product_edit/".$raw_data[0]->rel_id);
        die();
    }
    
}