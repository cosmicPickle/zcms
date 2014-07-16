<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Pddocs extends CI_Controller {
    
        public function __construct() {
            
            parent::__construct();
            
            $this->load->library("zcms/zcms");
            $this->zcms->init();
        }
        
        
        public function edit($id = NULL)
        {
            $this->zcms->load_headers();
            $this->zcms->load_js();
            
            $rel = $id ? (object)array("where" => array("t1.id" => $id)) : NULL;
            $get_data = $id ? TRUE : FALSE;

            $this->zcms->interface->load_interface('form'); 
            $this->interface->form->init('product_docs', $rel, $get_data);

            $this->interface->form->modify()
                                  ->render();
            
            $this->zcms->load_footers();
        }
        
        public function delete($id, $pd_id) 
        {
            $this->load->library("zcms/zcms");
            $this->zcms->init();

            $this->zcms->interface->load_interface('form'); 
            $this->interface->form->init('product_docs', NULL, FALSE);

            $this->interface->form->delete(array('id' => $id), base_url('index.php/backend/products/edit/'.$pd_id)); 
        }
}

/* End of file pages.php */
/* Location: ./application/controllers/backend/pages.php */
