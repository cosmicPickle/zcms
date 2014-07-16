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
    
    protected $string;
    protected $path;
    protected $name;
    protected $params;
    protected $html;
    
    public function __construct($obj = NULL)
    {
        if($obj)
        {
            $this->string = $obj->get_string();
            $this->path = $obj->get_path();
            $this->name = $obj->get_name();
            $this->params = $obj->get_params();
            $this->html = $obj->get_html();
        }   
        
        parent::__construct();
        parent::init();
    }
    
    public function __call($name,$args)
    {
        $matches = array();
        
        if(preg_match("#set_(.*)#", $name, $matches))
        {
            $property = $matches[1];
            
            if(isset($args[0]))
                $this->{$property} = $args[0];
            
            return $this->{$property};
        }
        
        if(preg_match("#get_(.*)#", $name, $matches))
        {
            $property = $matches[1];
            return $this->{$property};
        }
    }
    
    protected function _load_view($view, $data)
    {
        //We will need path to load the view.
        //It might have not been set if the module is called directly in a view
        if(!$this->get_path())
        {
            $path = explode("_",strtolower(get_class($this)));
            $path = $path[0];
        }
        else
        {
            $path = explode("/", $this->get_path());
            $path = $path[0];
        }
           
        $path .= "/";
        $this->set_html($this->load->view(self::VIEWS_MODULES.$path.$view, $data, TRUE));
    }
}

/* End of file module_base.php */
/* Location: ./application/libraries/zcms/modules/module_base.php */
