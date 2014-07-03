<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');


class Translations extends CI_Controller {
    
        public function __construct() {
            
            parent::__construct();
            
            $this->load->library("zcms/zcms");
            $this->zcms->init();
        }
        
         public function index($p = NULL, $ord = NULL, $dir = NULL)
        {
            $this->zcms->load_headers();
            $this->zcms->load_js();
            
            $this->zcms->interface->load_interface('list');    
            $this->zcms->interface->list
                 ->set('page', $p)
                 ->set('order_column', $ord)
                 ->set('order_direction', $dir)
                 ->set('search', $this->input->get('search'))
                 ->init('zcms_lang_misc')
                 ->render();
            
            $this->zcms->load_footers();
        }
        
        public function edit($id = NULL)
        {
            $this->zcms->load_headers();
            $this->zcms->load_js();
            
            $rel = $id ? (object)array("where" => array("t1.id" => $id)) : NULL;
            $get_data = $id ? TRUE : FALSE;

            $this->zcms->interface->load_interface('form'); 
            $this->interface->form->init('zcms_lang_misc', $rel, $get_data);

            $this->interface->form->modify()
                                  ->render();
            
            $this->zcms->load_footers();
        }
        
        public function delete($id) 
        {
            $this->load->library("zcms/zcms");
            $this->zcms->init();

            $this->zcms->interface->load_interface('form'); 
            $this->interface->form->init('zcms_lang_misc', NULL, FALSE);

            $this->interface->form->delete(array('id' => $id), base_url('index.php/backend/translations/')); 
        }
}

/* End of file pages.php */
/* Location: ./application/controllers/backend/pages.php */
