<?php

class Elf extends CI_Controller {
    
    function index()
    {
      $this->load->helper(array('path', 'url'));
      $opts = array(
        // 'debug' => true, 
        'roots' => array(
          array( 
            'driver' => 'LocalFileSystem', 
            'path'   => set_realpath('public/uploads'), 
            'URL'    => site_url('public/uploads') . '/'
          ) 
        )
      );
      $this->load->library('zcms/utilities/elfinder_lib', $opts);
    }

}
