<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/*
 * Module_base class
 * 
 * @author Teodor Klissarov
 * @created 07.04.2013
 * 
 * This is a wrapper class for the modules in the system. It extends and initializes the ZCMS
 * class enabling the child modules to use all ZCMS properties
 * 
 */

class Module_base extends ZCMS {
    
    public function __construct()
    {
        parent::__construct();
        parent::init();
    }
}

/* End of file module_base.php */
/* Location: ./application/libraries/zcms/modules/module_base.php */
