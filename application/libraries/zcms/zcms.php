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
        
        //This will hold the Code Igniter master object
        protected $ci;
        
        //Following constants of the CMS name and version ( hard to tell I know )
        const VERSION = "0.1";
        const CMS_NAME = "ZCMS";
        
        //The following constanst create paths to the utilities and interfaces
        //folder to make it easier to load libraries from that folder
        const UTILS_FOLDER ="zcms/utilities/";
        const INTERFACE_FOLDER = "zcms/interfaces/";
        const MODULES_PATH = "zcms/modules/";
        
        //Same as above only for views
        const VIEWS_BACKEND = "zcms/backend/";
        const VIEWS_FRONTEND = "zcms/frontend/";
        const VIEWS_MODULES = "zcms/modules/";
        
        //Next is the public folder path and the uploads folder path as well as
        //js and css folders
        const PUBLIC_PATH = "public";
        const UPLOADS_PATH = "public/uploads/";
        const JS_PATH = "public/js/";
        const CSS_PATH = "public/css/";
        
        //The default header that is loaded with load_headers()
        const HEADER = "header";
        //The default footer that is loaded with load_footers()
        const FOOTER = "footer";
        //The view containing system javascript files that is loaded in load_js()
        const JS ="jsinclude";
        
        //The frontend and backend absolute paths will be saved here
        protected $backend;
        protected $frontend;
        
/*
 * __construct()
 * 
 * The constructor loads the Code Igniter Master object
 * and sets the frontend/backend variables
 * 
 */

        public function __construct()
        {
            $this->ci = & get_instance();
            
            $this->load->helper('url');
            $this->backend = base_url()."index.php/backend/";
            $this->frontend = base_url()."index.php/frontend/";
        }
        
/*
 * __get() 
 * 
 * This one is for convenience only, so I dont have to type $this->ci->...
 * every time.
 * 
 */
        
        public function __get($name) {
            
            if(isset($this->ci->{$name}))
                return $this->ci->{$name};
        }
        
/*
 * init()
 * 
 * Loads all basic classes (translate, logs, auth) and initializes them
 *  
 */

	public function init()
        {
            $this->load->library(self::UTILS_FOLDER."translate");
            $this->load->library(self::UTILS_FOLDER."logs");
            $this->load->library(self::UTILS_FOLDER."auth");
            $this->load->library(self::UTILS_FOLDER."menu");
            
            $this->load->library(self::INTERFACE_FOLDER."interface_base",'',"interface");
        }
        
        public function load_headers($view = NULL)
        {
            $this->load->view(self::VIEWS_BACKEND.($view ? $view : self::HEADER));
        }
        
        public function load_footers($view = NULL)
        {
            $this->load->view(self::VIEWS_BACKEND.($view ? $view : self::FOOTER));
        }
        
        public function load_js($view = NULL)
        {
            $this->load->view(self::VIEWS_BACKEND.($view ? $view : self::JS));     
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
