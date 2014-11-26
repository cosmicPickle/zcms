<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');


class Install extends CI_Controller {
        
        public function __construct() {
            
            parent::__construct();
            
            $this->load->library("zcms/zcms");
            $this->zcms->init();
            
        }
        
	public function index()
	{   
            if($this->input->post())
                $this->installer->run();
            
            $this->load->helper(array('url','form'));
            $this->load->view(ZCMS::VIEWS_BACKEND.'install');
	}
        
        public function uninstall($drop_db_flag = FALSE)
        {
            $this->installer->uninstall($drop_db_flag);
        }
}

/* End of file dashboard.php */
/* Location: ./application/controllers/backend/dashboard.php */

