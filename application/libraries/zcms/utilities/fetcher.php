<?php

class Fetcher extends ZCMS {
    
    const LIBRARIES_PATH = 'libraries/';
    
    protected $modules_path;
    protected $modules = array();
    
    public function __construct()
    {
        parent::__construct();
        $this->modules_path = APPPATH.self::LIBRARIES_PATH.self::MODULES_PATH;
        $this->_get_modules();
    }
    
    public function interface_file($interface, $type, $name)
    {
        $file_to_load = NULL;
        
        //First try to load it from the modules
        foreach($this->modules as $module)
        {
            if(isset($module->resources->interfaces->{$interface}->{$type}->files)
               && in_array($name.'.php', $module->resources->interfaces->{$interface}->{$type}->files))
            {
                $file_to_load = self::MODULES_PATH.$module->name."/interfaces/".$interface.'/'.$type.'/'.$name;
                break;
            }
        }
        
        //If the form isn't found among the modules we load from the base folders
        if(!$file_to_load)
            $file_to_load = self::INTERFACE_FOLDER.$interface.'/'.$type.'/'.$name;
        
        $this->load->library($file_to_load);
        return $name;
    }
    
    public function load_observers()
    {
        $loaded = array();
        //Loading core observers
        foreach(scandir(realpath(APPPATH.self::LIBRARIES_PATH.self::OBSERVERS_FOLDER)) as $obs)
            if($obs != '.' && $obs != '..')
            {
                $obs = explode('.', $obs);
                $obs = $obs[0];
                
                $this->load->library(self::OBSERVERS_FOLDER.$obs);
                $loaded[$obs] = new $obs();
            }

        //Loading module observers
        foreach($this->modules as $module)
            if(isset($module->resources->observers->files))
                foreach($module->resources->observers->files as $obs)
                {
                    $obs = explode('.', $obs);
                    $obs = $obs[0];
                    
                    $this->load->library(self::MODULES_PATH.$module->name.'/observers/'.$obs);
                    if(!isset($loaded[$obs]))
                        $loaded[$obs] = new $obs();
                }
        
        return $loaded;
    }
    
    protected function _get_modules()
    {
        $files = scandir(realpath($this->modules_path));
        
        foreach($files as $file)
            if(is_dir(realpath($this->modules_path.$file)) && $file != '.' && $file != '..')
            {
                $index = count($this->modules);
                $this->modules[$index] = new stdClass();
                $this->modules[$index]->name = $file;
                $this->modules[$index]->resources = $this->_parse_module_files($this->modules_path.$file, true);
            }
    }
    
    protected function _parse_module_files($directory, $recursive = true)
    {
        if(is_dir($directory) === false)
        {
            return false;
        }


        $resource = opendir($directory);
        $found = new stdClass();
        
        while(false !== ($item = readdir($resource)))
        {
            if($item == "." || $item == "..")
            {
                continue;
            }

            if($recursive === true && is_dir($directory . '/' . $item))
            {
                $found->{$item} = $this->_parse_module_files($directory . '/' . $item);
            }else
            {
                $found->files[] = $item;
            }
        }

        return $found;
    }
}
