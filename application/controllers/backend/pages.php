<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/*
 * Pages class
 * 
 * @author Teodor Klissarov
 * @created 27.04.2013
 * 
 * This class will handle creating, editing and deleting of frontend pages
 * 
 */

class Pages extends CI_Controller {
    
        public function __construct() {
            
            parent::__construct();
            
            $this->load->library("zcms/zcms");
            $this->zcms->init();
        }
        
        public function index($p = NULL, $ord = NULL, $dir = NULL)
        {
            $this->zcms->load_headers();
            $this->zcms->load_js();
            
            $settings = array('p' => $p, 'ord' => $ord, 'dir' => $dir, 's' => isset($_GET['s']) ? $_GET['s'] : NULL);
            $this->zcms->interface->load_interface('list');
            $this->zcms->interface->list->init('zcms_pages',NULL ,$settings);
            $this->zcms->interface->list->set_links(0,0);
            $this->zcms->interface->list->render();
            
            $this->zcms->load_footers();
        }
        
        public function modify($id = NULL, $tab = 'basic')
        {
            $display = array('tab' => $tab);
            
            $this->zcms->load_headers();
            $this->zcms->load_js();
            
            $this->zcms->interface->load_interface('form');
            if(!$id)
                $this->zcms->interface->form->init('zcms_pages',NULL,NULL,FALSE);
            else
                $this->zcms->interface->form->init('zcms_pages',(object)array("where" => array("t1.id" => $id)));
            
            $this->zcms->interface->form->modify();
            $this->zcms->interface->form->set_redirect(0);
            $display['basic'] = $this->zcms->interface->form->render(NULL,TRUE);
            
            $this->zcms->interface->load_interface('list');
            $this->zcms->interface->list->or_setting('actions','[{"link":"modules/advanced/{@id}/'.$id.'","lbl":"'.$this->zcms->translate->t('Edit').'"}]');
            
            $control = new stdClass();
            $where = $this->zcms->interface->form->get_field('modules')->value();
            
            if($where)
                $control->where = "module = '".implode("' OR module='", $where)."'";
            else
                $control->where = "module = -1 ";
            
            $this->zcms->interface->list->init('zcms_modules',$control,$_GET);
            $this->zcms->interface->list->set_links(1,0,$id.'/modules/');
            $display['modules'] = $this->zcms->interface->list->render(NULL,TRUE);
            
            $this->load->view(ZCMS::VIEWS_BACKEND.'mod_page',$display);
            
            $this->zcms->load_footers();
        }
        
        public function modules()
        {
            
        }
}

/* End of file pages.php */
/* Location: ./application/controllers/backend/pages.php */
