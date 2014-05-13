<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/*
 * Dashboard class
 * 
 * @author Teodor Klissarov
 * @created 07.04.2013
 * 
 * The purpose of the Dashboard class is to serve as a container, a hub to 
 * all other functionality in the administration controll panel
 * 
 */

class Dashboard extends CI_Controller {
        
        public function __construct() {
            
            parent::__construct();
            
            $this->load->library("zcms/zcms");
            $this->zcms->init();
            
        }
        
	public function index($table = NULL, $id = NULL, $ord = NULL, $dir = NULL)
	{   
             $this->zcms->load_headers();
             $this->zcms->load_js();

             $this->zcms->load_footers();
	}
}

/* End of file dashboard.php */
/* Location: ./application/controllers/backend/dashboard.php */
