<?php

class Test extends CI_Controller {
    
    public function index() {
        
        $this->load->library("zcms/zcms");
        $this->zcms->init();
        
        $this->zcms->load_headers();
        $this->zcms->load_js();

        $this->zcms->interface->load_interface('form');    
        $this->interface->form->init('mod_test_adv', (object)array("where" => array("t1.id" => 2)))
             ->add_field('param1',array(
                 'type' => 'text',
                 'disabled_on_update' => FALSE,
                 'label' => 'Module',
                 'validation' => 'required'
             ))
             ->add_submit(array(
                 'label' => 'Save',
                 'css_class' => 'btn btn-primary btn-large'
             ))
             ->modify()
             ->set_redirect()
             ->render();

        $this->zcms->load_footers();
    }
    
    
    public function test_list() {
        $this->load->library("zcms/zcms");
        $this->zcms->init();
        
        $this->zcms->load_headers();
        $this->zcms->load_js();

        $this->zcms->interface->load_interface('list');    
        $settings = array('p' => 1, 'ord' => NULL, 'dir' => "asc", 's' => isset($_GET['s']) ? $_GET['s'] : NULL);
        $this->zcms->interface->list->init('zcms_pages',NULL ,$settings);
        $this->zcms->interface->list->set_links(0,0);
        $this->zcms->interface->list->render();
        
        $this->zcms->load_footers();
    }
}
