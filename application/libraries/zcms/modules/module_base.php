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
    protected $position;
    protected $position_string;
    protected $html;
    protected $module_pattern = "#\{([a-zA-Z0-9_/]*):([a-zA-Z0-9_-]*),([a-zA-Z0-9_-]*)(\?[a-zA-Zа-яА-Я0-9_\-@\.\&amp;\&\=\s]*)?\}@([a-zA-Z0-9_]*)#u";
    
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
            if($this->config->{$key}->can_override && $this->page->get_param($key) !== NULL 
               && (!isset($admin_overrides['disallow_url_override']) || !$admin_overrides['disallow_url_override']))
                $this->config->{$key}->value = $this->page->get_param($key);
        }
    }
    
    public function set_position_string()
    {
        if(!$this->position)
            return NULL;
        
        $this->position_string = "<module:".$this->position."/>";
    }
    
    public function render()
    {
        $this->view_data['module'] = $this;
        $this->_load_view($this->view);
    }
    
    public function load_module($str)
    {
        preg_match_all($this->module_pattern, $str, $matches);
        
        if(isset($matches[1]) && $matches[1])
        {
            $mod = NULL;
            foreach($matches[1] as $key => $mod_path)
            {
                $this->load->library(self::MODULES_PATH.$mod_path);
                $mod_name = end(explode('/',$mod_path));
                
                $mod = new $mod_name();
                $mod->set_string($matches[0][$key]);
                $mod->set_path($mod_path);
                $mod->set_name($mod_name);
                $mod->set_view($matches[2][$key]);
                
                $mod->set_config_file($matches[3][$key]);
                $mod->load_config();
                $mod->override_config($matches[4][$key]);
                
                $mod->set_position($matches[5][$key]);
                $mod->set_position_string();
            }
            $mod->action();
            $mod->fetch();
            $mod->render();
            
            return $mod->get_html();
        }
        return NULL;
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
        $this->set_html($this->load->view($this->get_view_path('modules').$path.$view, $this->view_data, TRUE));
    }
}

/* End of file module_base.php */
/* Location: ./application/libraries/zcms/modules/module_base.php */
