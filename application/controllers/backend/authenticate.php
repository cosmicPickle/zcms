<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/*
 * Authenticate (controller class) class
 * 
 * @author Teodor Klissarov
 * @created 07.04.2013
 * 
 * This is a controller which accesses the login/logout function of ZCMS
 * 
 */

class Authenticate extends CI_Controller {
        
        public function __construct() {
            
            parent::__construct();
            
            $this->load->library("zcms/zcms");
            $this->zcms->init();
            
        }
        
        public function index() {
            $this->login();
        }
        
	public function login()  {}
        
        public function logout() {}
}

/* End of file authenticate.php */
/* Location: ./application/controllers/backend/authenticate.php */
