<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/*
 * ZCMS class
 * 
 * @author Teodor Klissarov
 * @created 07.04.2013
 * 
 * The ZCMS Library class will be a containment library that will have instances of the authentication, 
 * error reporting, translation and menu classes saved in object instances.
 * 
 */

class ZCMS {
        
        
        //Following constants of the CMS name and version ( hard to tell I know )
        const VERSION = "0.1";
        const CMS_NAME = "ZCMS";
        
        //The following constanst create paths to the utilities and interfaces
        //folder to make it easier to load libraries from that folder
        const LIBRARY_PATH = 'libraries/';
        const UTILS_FOLDER ="zcms/utilities/";
        const INTERFACE_FOLDER = "zcms/interfaces/";
        const OBSERVERS_FOLDER = 'zcms/utilities/observers/';
        const MODULES_PATH = "zcms/modules/";
        
        //Same as above only for views
        const VIEWS_BACKEND = "zcms/backend/";
        const VIEWS_FRONTEND = "zcms/frontend/";
        const VIEWS_MODULES = "modules/";
        const VIEWS_WRAPPERS = "wrappers/";
        const VIEWS_LAYOUTS = "layouts/";
        
        //Next is the public folder path and the uploads folder path as well as
        //js and css folders
        const PUBLIC_PATH = "public";
        const UPLOADS_PATH = "public/uploads/";
        const MEDIA_PATH = "public/uploads/media";
        const ASSETS_PATH = "public/assets/";
        const JS_PATH = "js/";
        const CSS_PATH = "css/";
        
        //The default header that is loaded with load_headers()
        const HEADER = "header";
        //The default footer that is loaded with load_footers()
        const FOOTER = "footer";
        //The view containing system javascript files that is loaded in load_js()
        const JS ="jsinclude";
        
        //The frontend and backend absolute paths will be saved here
        protected $backend;
        protected $frontend;
        
        //ZCMS configuration
        protected $zcms_config;
        
/*
 * __construct()
 * 
 * The constructor loads the Code Igniter Master object
 * and sets the frontend/backend variables
 * 
 */

        public function __construct()
        {
            $this->load->helper('url');
            $this->backend = base_url()."index.php/backend/";
            $this->frontend = base_url()."index.php/front/";
        }
        
/*
 * __get() 
 * 
 * This one is for convenience only, so I dont have to type $this->ci->...
 * every time.
 * 
 */
        
        public function __get($name) {
            $ci = & get_instance();
            $this->zcms_config = $ci->config->item("zcms");
            
            if(isset($ci->{$name}))
                return $ci->{$name};
        }
        
/*
 * init()
 * 
 * Loads all basic classes and initializes them
 *  
 */

	public function init()
        {
            $this->load->library(self::UTILS_FOLDER."globals");
            $this->load->library(self::UTILS_FOLDER."sql");
            $this->load->library(self::UTILS_FOLDER."fetcher");
            $this->load->library(self::UTILS_FOLDER."event");
            $this->load->library(self::UTILS_FOLDER."observer");
            $this->load->library(self::UTILS_FOLDER."translate");
            $this->load->library(self::UTILS_FOLDER."logs");
            $this->load->library(self::UTILS_FOLDER."auth");
            $this->load->library(self::UTILS_FOLDER."menu");
            
            if($this->environment() == 'backend')
                $this->load->library(self::INTERFACE_FOLDER."interface_base",'',"interface");
            else if($this->environment() == 'frontend')
            {
                $this->load->library(self::MODULES_PATH."module_base");
                $this->load->library(self::UTILS_FOLDER."page");
            }
                
            //Loads the observers
            $this->observer->load_observers();
            
            $this->event->trigger("zcms_init_after");
        }
        
        public function load_headers($view = NULL)
        {
            $this->event->trigger("zcms_load_headers_before", $this);
            $this->load->view(self::VIEWS_BACKEND.($view ? $view : self::HEADER));
            $this->event->trigger("zcms_load_headers_after");
        }
        
        public function load_footers($view = NULL)
        {
            $this->event->trigger("zcms_load_footers_before", $this);
            $this->load->view(self::VIEWS_BACKEND.($view ? $view : self::FOOTER));
            $this->event->trigger("zcms_load_footers_after", $this);
        }
        
        public function load_js($view = NULL)
        {
            $this->event->trigger("zcms_load_js_before", $this);
            $this->load->view(self::VIEWS_BACKEND.($view ? $view : self::JS));     
            $this->event->trigger("zcms_load_js_after", $this);
        }
        
        public function zcms_config($item, $value = NULL)
        {
            if($value)
            {
                $this->zcms_config[$item] = $value;
            }
            else
            {
                return (isset($this->zcms_config[$item]) ? $this->zcms_config[$item] : NULL);
            }
        }
        
        public function asset($type, $asset)
        {
            $path = base_url() 
                    . ZCMS::ASSETS_PATH 
                    . $this->environment(TRUE)
                    . $this->zcms_config('theme').'/';
            
            if(strtolower($type) == 'js')
                $path .= ZCMS::JS_PATH;
            
            if(strtolower($type) == 'css')
                $path .= ZCMS::CSS_PATH;
            
            return $path.$asset;
        }
        
        public function get_view_path($type = NULL)
        {
            if($type)
            {
                $refl = new ReflectionClass($this);
                $type = "VIEWS_".strtoupper($type);
                $type = $refl->getConstant($type);
            }
            
            $path = "";
            if($this->environment() == "frontend")
                $path .= self::VIEWS_FRONTEND;
            else if($this->environment() == "backend")
                $path .= self::VIEWS_BACKEND;
            
            $path .= $this->zcms_config('theme').'/';
            $path .= $type;
            
            return $path;
        }
        
        public function environment($add_trailing_slash = FALSE)
        {
            if(!$add_trailing_slash)
                return substr($this->router->fetch_directory(),0, -1);
            
            return $this->router->fetch_directory();
        }
/*
 *  I refuse to comment the last two functions.
 */
        
        public function backend()
        {
            return $this->backend;
        }
        
        public function frontend()
        {
            return $this->frontend;
        }
}

/* End of file zcms.php */
/* Location: ./application/libraries/zcms/utilities/zcms.php */
