<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/*
 * Developer class
 * 
 * @author Teodor Klissarov
 * @created 21.05.2013
 * 
 * This module will serve as a wrapper for all developer functions.
 * 
 */

class Developer extends CI_Controller {
        
        
        public function __construct() {
            
            parent::__construct();
            
            $this->load->library("zcms/zcms");
            $this->zcms->init();
            
        }
        
	public function intf($type, $id, $func)
	{   
             $params = array_slice(func_get_args(), 3);
             
             $this->zcms->interface->load_interface($type);
             
             if(!method_exists($this->zcms->interface->{$type}, "dev_".$func))
             {        
                 $this->zcms->logs->log("INVALID_DEV_ACTION");
                 $output = $this->zcms->logs->render_logs(TRUE);
                 echo json_encode(array('return' => 0 , 'html' => $output));
                 exit(1);
             }
             
             ob_start();
             $return_code = call_user_func_array(array($this->zcms->interface->{$type}, "dev_".$func), array_merge(array($id), $params));
             $output = ob_get_clean();
             
             echo json_encode(array('return' => $return_code, 'html' => $output));
	}
}

/* End of file developer.php */
/* Location: ./application/controllers/backend/developer.php */
