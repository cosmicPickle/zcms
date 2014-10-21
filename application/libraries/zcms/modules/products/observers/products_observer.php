<?php

class Products_Observer extends Observer {
    
    protected $filter_page = 'mmotors_fans_filter';
            
    public function interface_form_modify_after($observer) {
        
        $form = $observer->get_data();
        
        if($form->get_data_table() != "product_images" && $form->get_data_table() != "product_docs")
            return NULL;
        
        $raw_data = $form->get_raw_data();
        
        header("location: ".$this->backend()."products/edit/".$raw_data[0]->rel_id);
        die();
    }
    
    public function product_listing_load_before($observer) {
        
        if($this->globals->get('page_id') != $this->filter_page)
            return NULL;
        
        if(!$this->input->post('filters') && !$this->session->userdata('filters'))
            return NULL;
        
        if($this->input->post('filters'))
            $this->session->set_userdata('filters',$this->input->post('filters'));
        
        $listing = $observer->get_data();
        
        
        //Updating the where part of the query with filters
        foreach($this->session->userdata('filters') as $filter => $value)
        {
            if($value === '')
                continue;

            $listing->db->like('filters','"'.$filter.'":"'.$value.'"');
        }
    }
}