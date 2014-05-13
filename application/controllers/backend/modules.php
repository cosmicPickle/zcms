<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/*
 * Modules class
 * 
 * @author Teodor Klissarov
 * @created 27.04.2013
 * 
 * This class will handle creating, editing and deleting modules
 * 
 */

class Modules extends CI_Controller {
        
        const MODULE_TEMPL = "module_templ.txt";
        private $modules_table = 'zcms_modules';

        public function __construct() {
            
            parent::__construct();

            $this->load->library("zcms/zcms");
            $this->zcms->init();
        }
        
	public function index($p = NULL, $ord = NULL, $dir = NULL)
	{   
             //Developper only area - redirect
             if($this->zcms->auth->session_info()->level > 1)
                   redirect($this->zcms->backend());
             
             $this->zcms->load_headers();
             $this->zcms->load_js();
             
             $this->zcms->interface->load_interface('list');
             
             $settings = array(
                                'p' => $p, 
                                'ord' => $ord, 
                                'dir' => $dir, 
                                's' => isset($_GET['s']) ? $_GET['s'] : NULL
                              );
             
             $this->zcms->interface->list->init($this->modules_table, NULL, $settings);
             $this->zcms->interface->list->set_links(0,0);

             $this->zcms->interface->list->render();
             
             $this->zcms->load_footers();
	}
        
        public function basic($id = NULL)
        {
            
            //Developper only area - redirect
            if($this->zcms->auth->session_info()->level > 1)
                if($id)
                    redirect($this->zcms->backend()."modules/data/".$id);
                else
                   redirect($this->zcms->backend()); 
                
            $this->zcms->load_headers();
            $this->zcms->load_js();
            
            $this->zcms->interface->load_interface('form');
            
            if(!$id)
                $this->interface->form->init($this->modules_table, NULL, NULL, FALSE);
            else
                $this->interface->form->init($this->modules_table, (object)array("where" => array("t1.id" => $id)));
            
            //Getting table list
            $table_list = $this->db->list_tables();
            foreach($table_list as $key => $tb)
            {
                $table_list[$tb] = $tb;
                unset($table_list[$key]);
            }
            
            $table_list = json_encode(array_merge(array(0 => ''), $table_list),JSON_FORCE_OBJECT);
            
            //Setting the data table select field
            $this->interface->form->get_field('data_table')->setting('opt_val_pairs', $table_list);
            $this->interface->form->get_field('advanced')->setting('opt_val_pairs', $table_list);
            
            //If this is an insert we need to create the module files
            if($this->zcms->interface->form->modify() && !$id)
                $this->_create_files();
            
            $this->zcms->interface->form->set_redirect(0);
            
            if($id)
                $this->load->view(ZCMS::VIEWS_BACKEND."module_nav");
            
            $this->zcms->interface->form->render();
            $this->zcms->load_footers();
        }
        
        public function advanced($id = NULL, $page_id = 0)
        {
            //Developper only area - redirect
            if($this->zcms->auth->session_info()->level > 1)
                if($id)
                    redirect($this->zcms->backend()."modules/data/".$id);
                else
                   redirect($this->zcms->backend()); 
            
            if(!$id)
                redirect($this->zcms->backend()."modules/"); 
            
            $this->zcms->load_headers();
            $this->zcms->load_js();
            if(!$page_id)
                $this->load->view(ZCMS::VIEWS_BACKEND."module_nav");
                
            //Getting module information from the database
            $module = $this->db->select('module, advanced')->where('id', $id)->get($this->modules_table)->row();
            
            //If we don't have na advanced table we quit
            if(!$module || !$module->advanced)
                return NULL;
            
            $this->zcms->interface->load_interface('form');
            
            //The advanced module table will store settings for any page the module might be in thus loading the appropriate 
            //settings with the page_id parameter
            $this->zcms->interface->form->init($module->advanced, (object)array('where' => array("page" => $page_id)));
            $this->zcms->interface->form->modify();
            $this->zcms->interface->form->set_redirect(0,0,1, uri_string());
            $this->zcms->interface->form->render();
                    
            $this->zcms->load_footers();
        }
        
        public function data($id = NULL, $p = NULL, $ord = NULL, $dir = NULL)
        {
            $this->zcms->load_headers();
            $this->zcms->load_js();
            
            //If we don't have id redirect to modules for developer and to dashboard for anyone else
            if(!$id && $this->zcms->auth->session_info()->level < 2)
                redirect($this->zcms->backend()."modules/"); 
            
            elseif(!$id && $this->zcms->auth->session_info()->level >= 2)
                redirect($this->zcms->backend());
            
            if($id && $this->zcms->auth->session_info()->level < 2)
                $this->load->view(ZCMS::VIEWS_BACKEND."module_nav");
            
            //Setting the module_id for use in the listing
            $module = $this->db->select('module, data_table')->where('id', $id)->get($this->modules_table)->row();
            
            if(!$module || !$module->data_table)
                return NULL;
            
            $this->zcms->interface->load_interface('list');
            $this->zcms->interface->list->module_id = $id;
            
            $settings = array(
                                'p' => $p, 
                                'ord' => $ord, 
                                'dir' => $dir, 
                                's' => isset($_GET['s']) ? $_GET['s'] : NULL
                              );
             
             $this->zcms->interface->list->init($module->data_table, NULL, $settings);
             $this->zcms->interface->list->set_links(0,0, $id."/");

             $this->zcms->interface->list->render();
             
            $this->zcms->load_footers();
        }
        
        public function edata($module = NULL, $id = NULL)
        {
            $this->zcms->load_headers();
            $this->zcms->load_js();
            
            if(!$module && $this->zcms->auth->session_info()->level < 2)
                redirect($this->zcms->backend()."modules/"); 
            
            elseif(!$module && $this->zcms->auth->session_info()->level >= 2)
                redirect($this->zcms->backend());
            
            if($module && $this->zcms->auth->session_info()->level < 2)
                $this->load->view(ZCMS::VIEWS_BACKEND."module_nav");
            
            
            $table = $this->db->select('data_table')->where('id', $module)->get($this->modules_table)->row();
            
            if(!$table || !$table->data_table)
                return NULL;
            
            $this->zcms->interface->load_interface('form');
            
            if($id)
                $this->zcms->interface->form->init($table->data_table, (object)array('where' => array("t1.id" => $id)));
            else
                $this->zcms->interface->form->init($table->data_table, NULL, NULL, FALSE);
            
            $this->zcms->interface->form->modify();
            $this->zcms->interface->form->set_redirect(0,0,1,uri_string());
            $this->zcms->interface->form->render();
            
            $this->zcms->load_footers();
        }
        
        private function _create_files()
        {
           $templ = './application/libraries/'.ZCMS::MODULES_PATH.self::MODULE_TEMPL;
           $body = file_get_contents($templ);
           
           //Removing the template annotation
           $body = preg_replace("#<TEMPLATE_ANOTATION>.*</TEMPLATE_ANOTATION>#ms",'',$body);
           
           //Replacing the module name, bundle, author and date
           $body = str_replace("<MODULE_NAME>",ucfirst($_POST['module']),$body);
           $body = str_replace("<BUNDLE>",(isset($_POST['bundle']) ? $_POST['bundle'] : NULL),$body);
           $body = str_replace("<AUTHOR>",$_POST['author'],$body);
           $body = str_replace("<DATE>",date('d.m.o'),$body);
           
           //Creating a safe description
           
           $desc = isset($_POST['description']) ? strip_tags(
                                                    preg_replace("#\n#ms", "\n * ", $_POST['description']))
                                                : NULL;
           //replacing in body
           $body = str_replace("<DESCRIPTION>",$desc, $body);
           
           //Creating the bundle folder if there is a bundle and the folder does not exist
           $bundle = isset($_POST['bundle']) ? $_POST['bundle'] : NULL;
           if($bundle && !is_dir('./application/libraries/'.ZCMS::MODULES_PATH.$bundle))
               mkdir('./application/libraries/'.ZCMS::MODULES_PATH.$bundle);
           
           $mod_dir = $bundle ? './application/libraries/'.ZCMS::MODULES_PATH.$bundle.'/' 
                              : './application/libraries/'.ZCMS::MODULES_PATH.'default/';
           
           //If the module file does not exist we create it.
           if(!file_exists($mod_dir.$_POST['module'].".php"))
               file_put_contents($mod_dir.$_POST['module'].".php", $body);
        }
}

/* End of file modules.php */
/* Location: ./application/controllers/backend/modules.php */
