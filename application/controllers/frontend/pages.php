<?php

class Pages extends CI_Controller {
    
    
    public function index($page_id)
    {
        $this->load->library('zcms/zcms');
        $this->zcms->init();
        
        $this->zcms->page->render($page_id);
    }
}