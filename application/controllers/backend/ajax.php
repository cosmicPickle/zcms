<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/*
 * Ajax class
 * 
 * @author Teodor Klissarov
 * @created 21.04.2013
 * 
 * This class is a container of all ajax based requests. It will contain functions that are used
 * to create edit and delete various items in the CMS.
 * 
 * Note that the functions are not ordered. They are written in the order they get implemented.
 * (May change in the future)
 * 
 */

class Ajax extends CI_Controller {
        
        public function __construct() {
            
            parent::__construct();
            
            $this->load->library("zcms/zcms");
            $this->zcms->init();
        }
        
        public function delete_file()
        {
            $get = (object)$this->input->get();
            
            if(!isset($get->table) || !isset($get->id) || !isset($get->file) || !isset($get->field))
            {
                return NULL;
                echo json_encode(array("Invalid input."));
            }
            
            $files = $this->db->select($get->field)
                              ->where('id', $get->id)
                              ->get($get->table)
                              ->row();
            
            $files = json_decode($files->{$get->field});

            if(($found = array_search($get->file, $files)) !== NULL && $found !== FALSE)
            {
                 unset($files[$found]);

                 $this->db->set(array($get->field => json_encode(array_values($files))))
                          ->where('id', $get->id)
                          ->update($get->table);
                 
                 $this->zcms->interface->load_interface("form");
                 $fsettings = $this->db->select('t1.id, t1.type, t2.*')
                                       ->from($this->zcms->interface->form->return_table("basic") . " as t1")
                                       ->where(array("t1.link" => $get->table, "t1.name" => $get->field))
                                       ->join($this->zcms->interface->form->return_table("fi") . " as t2", "t2.id_ = t1.id","left")
                                       ->get()
                                       ->row();
                 
                 if(!$fsettings)
                     return NULL;
                 
                 $path = ZCMS::UPLOADS_PATH.$fsettings->path;
                 
                 if(file_exists($path.$get->file))
                         @unlink($path.$get->file);
                 
                 if($fsettings->type == 'image')
                 {
                     $path .= Interface_form::THUMBS_PATH;
                     if(file_exists($path.Interface_form::SYS_TB_PREF."_".$get->file))
                     {
                         @unlink($path.Interface_form::SYS_TB_PREF."_".$get->file);
                         clearstatcache();
                     }
                     
                     if($fsettings->thumbs = json_decode($fsettings->thumbs))
                         foreach($fsettings->thumbs as $thumb)
                             if(file_exists($path.$thumb."_".$get->file))
                             {
                                 @unlink($path.Interface_form::SYS_TB_PREF."_".$get->file);
                                 clearstatcache();
                             }        
                 }
            }
            
            echo json_encode(array("ok" => 1, "file" => str_replace('.', '', strtolower($get->file))));
        }
}

/* End of file dashboard.php */
/* Location: ./application/controllers/backend/dashboard.php */
