<?php

class Pages extends CI_Controller {
    
    protected $home_page_id = "home";
    
    public function index($page_id = NULL)
    {
        if(!$page_id)
            $page_id = $this->home_page_id;
        
        $this->load->library('zcms/zcms');
        $this->zcms->init();
        
        $this->zcms->page->render($page_id);
    }
}