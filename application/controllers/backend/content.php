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

class Content extends CI_Controller {
    
        public function __construct() {
            
            parent::__construct();
            
            $this->load->library("zcms/zcms");
            $this->zcms->init();
        }
        
        public function pages_list($p = NULL, $ord = NULL, $dir = NULL)
        {
            $this->zcms->load_headers();
            $this->zcms->load_js();
            
            $this->zcms->interface->load_interface('list');    
            $this->zcms->interface->list
                 ->set('page', $p)
                 ->set('order_column', $ord)
                 ->set('order_direction', $dir)
                 ->set('search', $this->input->get('search'))
                 ->init('zcms_pages')
                 ->render();
            
            $this->zcms->load_footers();
        }
        
        public function pages_edit($id = NULL)
        {
            $this->zcms->load_headers();
            $this->zcms->load_js();
            
            $rel = $id ? (object)array("where" => array("t1.id" => $id)) : NULL;
            $get_data = $id ? TRUE : FALSE;

            $this->zcms->interface->load_interface('form'); 
            $this->interface->form->init('zcms_pages', $rel, $get_data);

            $this->interface->form->modify()
                                  ->render();
            
            $this->zcms->load_footers();
        }
        
        public function pages_delete($id) 
        {
            $this->load->library("zcms/zcms");
            $this->zcms->init();

            $this->zcms->interface->load_interface('form'); 
            $this->interface->form->init('zcms_pages', NULL, FALSE);

            $this->interface->form->delete(array('id' => $id), base_url('index.php/backend/content/pages_list/')); 
        }
        
        public function category_list($p = NULL, $ord = NULL, $dir = NULL)
        {
            $this->zcms->load_headers();
            $this->zcms->load_js();
            
            $this->zcms->interface->load_interface('list');    
            $this->zcms->interface->list
                 ->set('page', $p)
                 ->set('order_column', $ord)
                 ->set('order_direction', $dir)
                 ->set('search', $this->input->get('search'))
                 ->init('content_categories')
                 ->render();
            
            $this->zcms->load_footers();
        }
        
        public function category_edit($id = NULL)
        {
            $this->zcms->load_headers();
            $this->zcms->load_js();
            
            $rel = $id ? (object)array("where" => array("t1.id" => $id)) : NULL;
            $get_data = $id ? TRUE : FALSE;

            $this->zcms->interface->load_interface('form'); 
            $this->interface->form->init('content_categories', $rel, $get_data);

            $this->interface->form->modify()
                                  ->render();
            
            $this->zcms->load_footers();
        }
        
        public function category_delete($id) 
        {
            $this->load->library("zcms/zcms");
            $this->zcms->init();

            $this->zcms->interface->load_interface('form'); 
            $this->interface->form->init('content_categories', NULL, FALSE);

            $this->interface->form->delete(array('id' => $id), base_url('index.php/backend/content/categories_list')); 
        }
        
        public function articles_list($p = NULL, $ord = NULL, $dir = NULL)
        {
            $this->zcms->load_headers();
            $this->zcms->load_js();
            
            $this->zcms->interface->load_interface('list');    
            $this->zcms->interface->list
                 ->set('page', $p)
                 ->set('order_column', $ord)
                 ->set('order_direction', $dir)
                 ->set('search', $this->input->get('search'))
                 ->init('content_articles')
                 ->render();
            
            $this->zcms->load_footers();
        }
        
        public function articles_edit($id = NULL)
        {
            $this->zcms->load_headers();
            $this->zcms->load_js();
            
            $rel = $id ? (object)array("where" => array("t1.id" => $id)) : NULL;
            $get_data = $id ? TRUE : FALSE;

            $this->zcms->interface->load_interface('form'); 
            $this->interface->form->init('content_articles', $rel, $get_data);

            $this->interface->form->modify()
                                  ->render();
            
            $this->zcms->load_footers();
        }
        
        public function articles_delete($id) 
        {
            $this->load->library("zcms/zcms");
            $this->zcms->init();

            $this->zcms->interface->load_interface('form'); 
            $this->interface->form->init('content_articles', NULL, FALSE);

            $this->interface->form->delete(array('id' => $id), base_url('index.php/backend/content/articles_list')); 
        }
}
