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
    protected $view;
    protected $view_data;
    protected $config_file;
    protected $config_file_ext = ".json";
    protected $config;
    protected $html;
    
    const MODULE_CONFIG_PATH = "config/";
    
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
    
    public function load_config()
    {
        //We will need path to load the view.
        //It might have not been set if the module is called directly in a view
        if(!$this->get_path())
        {
            $path = explode("_",strtolower(get_class($this)));
            $path = $path[0]."/";
        }
        else
        {
            $path = explode("/", $this->get_path());
            $path = $path[0]."/";
        }
        
        $config_path = APPPATH.
                       self::LIBRARY_PATH.
                       self::MODULES_PATH.
                       $path.
                       self::MODULE_CONFIG_PATH.
                       $this->get_config_file().
                       $this->config_file_ext;
        
        
        $config = json_decode(file_get_contents($config_path));
        foreach($config as $key => & $val)
        {
            if(!is_object($val))
            {
                $tmp = $val;
                $val = new stdClass();
                $val->value = $tmp;
                $val->can_override = 1;
            }
        }
        
        $this->set_config($config);
    }
    
    
    public function override_config($admin_overrides)
    {
        parse_str(substr(str_replace('&amp;', '&', $admin_overrides),1),$admin_overrides);
        foreach($this->get_config() as $key => $val)
        {
            //First, overriding with parameters from the admin panel. Those can override everything
            if(isset($admin_overrides[$key]))
                $this->config->{$key}->value = $admin_overrides[$key];
            
            //Then we override from the URL. Only overrides values flagged as public in the config file
            if($this->config->{$key}->can_override && $this->page->get_param($key) !== NULL)
                $this->config->{$key}->value = $this->page->get_param($key);
        }
    }
    
    public function render()
    {
        $this->_load_view($this->view);
    }
    
    protected function _load_view($view)
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
        $this->set_html($this->load->view(self::VIEWS_MODULES.$path.$view, $this->view_data, TRUE));
    }
}

/* End of file module_base.php */
/* Location: ./application/libraries/zcms/modules/module_base.php */
