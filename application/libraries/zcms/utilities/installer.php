<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');


class Installer extends ZCMS {
    
    var $ds;
    var $json_path;
    var $install_config;
    var $data;
    var $files;
    var $errors = array();
    var $req_config = array(
        'config_base_url',
        'config_db_username',
        'config_db_database',
        'config_zcms_theme',
        'config_zcms_default_lang'
    );

    public function __construct() {
        if (strtoupper(substr(PHP_OS, 0, 3)) === 'WIN')           
            $this->ds = '\\';
        else 
            $this->ds = '/';
        
        $this->json_path = realpath(__DIR__).$this->ds.'installer'.$this->ds."install.json";
        $this->install_config = json_decode(file_get_contents($this->json_path));
    }
    
    public function run() 
    {
        $this->data = (object)$this->input->post();
        if(!$this->validate())
            return NULL;
        
        $this->replace_files();
        $this->import_sql();
        $this->finalize();
    }
    
    public function uninstall($drop_db_flag = FALSE)
    {
        if(!$this->install_config->enable_uninstall)
            redirect('backend/authenticate');
        
        $this->replace_files(FALSE);
        $this->install_config->installed = 0;
        if($drop_db_flag)
            $this->install_config->db_installed = 0;
        
        file_put_contents($this->json_path, json_encode($this->install_config));
        
        redirect('backend/install');
    }
    
    public function check() {
        
        if($this->install_config->installed && $this->router->fetch_class() != "install")
            return FALSE;
        else if($this->install_config->installed && $this->router->fetch_class() == "install" && $this->router->fetch_method() != "uninstall")
            redirect('backend/authenticate');
        else if(!$this->install_config->installed && $this->router->fetch_class() != "install")
        {
            header('location: ./index.php/backend/install');
            die();
        }
        else if(!$this->install_config->installed && $this->router->fetch_class() == "install")
            return TRUE;
    }
    
    protected function validate()
    {
        
        foreach($this->req_config as $required)
            if(!isset($this->data->{$required}) || !$this->data->{$required})
            {
                $this->errors[] = "Please fill out all fields.";
                return FALSE;
            }
         
        return TRUE;
    }
    
    protected function replace_files($parse = TRUE)
    {
        $path = __DIR__.$this->ds.'installer'.$this->ds.$this->install_config->config_files_folder.$this->ds;
        $handle = opendir($path);
        
        while($file = readdir($handle))
        {
            if($file == '.' || $file == '..') 
                continue;
            
            if(is_file($path.$file))
                $this->files[$file] = file_get_contents($path.$file);
        }
        
        if($parse)
        {
            foreach($this->data as $key => $item)
                foreach($this->files as $fkey => $file)
                {
                    $this->files[$fkey] = str_replace("{".$key."}", $item, $file);  
                }
        }
        
        //Enabling/disabling database
        $this->files['database.php'] = str_replace("{config_db_autoinit}", ($parse ? "TRUE" : "FALSE"), $this->files['database.php']);  
        
        $install_path = getcwd().$this->ds.'application'.$this->ds.'config'.$this->ds; 
        foreach($this->files as $file => $content)
        {
            if(is_file($install_path.$file))
                file_put_contents($install_path.$file, $content);
        }
            
    }
    
    protected function finalize()
    {
        $this->install_config->installed = 1;
        $this->install_config->db_installed = 1;
        file_put_contents($this->json_path, json_encode($this->install_config));
        
        header('location: ');
    }
    
    protected function import_sql()
    {
        if($this->install_config->db_installed)
            return NULL;
        
        $config['hostname'] = "localhost";
        $config['username'] = $this->data->config_db_username;
        $config['password'] = $this->data->config_db_password;
        $config['database'] = $this->data->config_db_database;
        $config['dbdriver'] = "mysql";
        $config['dbprefix'] = "";
        $config['pconnect'] = FALSE;
        $config['db_debug'] = TRUE;
        $config['cache_on'] = FALSE;
        $config['cachedir'] = "";
        $config['char_set'] = "utf8";
        $config['dbcollat'] = "utf8_general_ci";
        
        $this->db = $this->load->database($config, TRUE);
    
        $path = realpath(__DIR__).$this->ds.'installer'.$this->ds."sql".$this->ds."zcms.sql";
        $lines = file($path);
        // Loop through each line
        $templine = "";
        foreach ($lines as $line)
        {
            // Skip it if it's a comment
            if (substr($line, 0, 2) == '--' || $line == '')
                continue;

            // Add this line to the current segment
            $templine .= $line;
            // If it has a semicolon at the end, it's the end of the query
            if (substr(trim($line), -1, 1) == ';')
            {
                // Perform the query
                $this->db->query($templine);
                // Reset temp variable to empty
                $templine = '';
            }
        }
    }
}
