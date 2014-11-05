<?php

class Elf extends CI_Controller {
    
    public function __construct() {
            
        parent::__construct();

        $this->load->library("zcms/zcms");
        $this->zcms->init();

    }
        
    function index($tiny_mce = FALSE, $path = NULL)
    {
        $this->load->view(ZCMS::VIEWS_BACKEND."elfinder", array("tiny_mce" => $tiny_mce, "path" => $path));
    }
    
    function init($path = NULL) 
    {  
        $path = base64_decode($path);
        if(!$path)
            $path = ZCMS::UPLOADS_PATH;
        
        $this->load->helper(array('path', 'url'));
        $opts = array(
          // 'debug' => true, 
          'roots' => array(
            array( 
              'driver' => 'LocalFileSystem', 
              'path'   => set_realpath($path), 
              'URL'    => base_url(). $path
            ) 
          )
        );
        $this->load->library(ZCMS::UTILS_FOLDER.'elfinder_lib', $opts);
    }

}
