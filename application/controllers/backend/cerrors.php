<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/*
 * Dashboard class
 * 
 * @author Teodor Klissarov
 * @created 13.04.2013
 * 
 * This class handles the display of critical errors
 * 
 */

class Cerrors extends CI_Controller {
        
        public function __construct() {
            
            parent::__construct();
            
            $this->load->library("zcms/zcms");
            $this->zcms->init();
            
        }
        
	public function critical($error = NULL)
	{
            if($error)
            {
                $this->zcms->logs->log($error, "", FALSE);
                $this->zcms->logs->render_critical();
            }
	}
}

/* End of file cerrrors.php */
/* Location: ./application/controllers/backend/cerrrors.php */
