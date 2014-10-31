<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Catalog extends CI_Controller {
    
        public function __construct() {
            
            parent::__construct();
            
            $this->load->library("zcms/zcms");
            $this->zcms->init();
        }
        
        public function product_list($p = NULL, $ord = NULL, $dir = NULL)
        {
            $this->zcms->load_headers();
            $this->zcms->load_js();
            
            $this->zcms->interface->load_interface('list');    
            $this->zcms->interface->list
                 ->set('page', $p)
                 ->set('order_column', $ord)
                 ->set('order_direction', $dir)
                 ->set('search', $this->input->get('search'))
                 ->init('product_products')
                 ->render();
            
            $this->zcms->load_footers();
        }
        
        public function product_edit($id = NULL)
        {
            $this->zcms->load_headers();
            $this->zcms->load_js();
            
            $rel = $id ? (object)array("where" => array("t1.id" => $id)) : NULL;
            $get_data = $id ? TRUE : FALSE;

            $this->zcms->interface->load_interface('form'); 
            $this->interface->form->init('product_products', $rel, $get_data);

            $this->interface->form->modify()
                                  ->render();
            
            $this->zcms->load_footers();
        }
        
        public function product_delete($id) 
        {
            $this->load->library("zcms/zcms");
            $this->zcms->init();

            $this->zcms->interface->load_interface('form'); 
            $this->interface->form->init('product_products', NULL, FALSE);

            $this->interface->form->delete(array('id' => $id), base_url('index.php/backend/catalog/product_list')); 
        }
        
        public function product_copy($id)
        {
            $this->load->library("zcms/zcms");
            $this->zcms->init();

            $this->zcms->interface->load_interface('form'); 
            $this->interface->form->init('product_products', (object)array("where" => array('t1.id' => $id)));
            
            $this->interface->form->copy();
            redirect(base_url('index.php/backend/catalog/product_list'));
        }
        
        public function schematic_delete($id, $file)
        {
            $this->load->library("zcms/zcms");
            $this->zcms->init();

            $this->zcms->interface->load_interface('form'); 
            $this->interface->form->init('product_products', (object)array("where" => array('t1.id' => $id)));
            
            $this->interface->form->get_field('schematic')->delete_file($file);
            header("location: ". base_url('index.php/backend/catalog/product_edit/'.$id)); 
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
                 ->init('product_categories')
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
            $this->interface->form->init('product_categories', $rel, $get_data);

            $this->interface->form->modify()
                                  ->render();
            
            $this->zcms->load_footers();
        }
        
        public function category_delete($id) 
        {
            $this->load->library("zcms/zcms");
            $this->zcms->init();

            $this->zcms->interface->load_interface('form'); 
            $this->interface->form->init('product_categories', NULL, FALSE);

            $this->interface->form->delete(array('id' => $id), base_url('index.php/backend/catalog/product_category_list/')); 
        }
        
        public function product_image_edit($id = NULL)
        {
            $this->zcms->load_headers();
            $this->zcms->load_js();
            
            $rel = $id ? (object)array("where" => array("t1.id" => $id)) : NULL;
            $get_data = $id ? TRUE : FALSE;

            $this->zcms->interface->load_interface('form'); 
            $this->interface->form->init('product_images', $rel, $get_data);

            $this->interface->form->modify()
                                  ->render();
            
            $this->zcms->load_footers();
        }
        
        public function product_image_delete($id, $pd_id) 
        {
            $this->load->library("zcms/zcms");
            $this->zcms->init();

            $this->zcms->interface->load_interface('form'); 
            $this->interface->form->init('product_images', NULL, FALSE);

            $this->interface->form->delete(array('id' => $id), base_url('index.php/backend/catalog/product_edit/'.$pd_id)); 
        }
        
        public function product_doc_edit($id = NULL)
        {
            $this->zcms->load_headers();
            $this->zcms->load_js();
            
            $rel = $id ? (object)array("where" => array("t1.id" => $id)) : NULL;
            $get_data = $id ? TRUE : FALSE;

            $this->zcms->interface->load_interface('form'); 
            $this->interface->form->init('product_docs', $rel, $get_data);

            $this->interface->form->modify()
                                  ->render();
            
            $this->zcms->load_footers();
        }
        
        public function product_doc_delete($id, $pd_id) 
        {
            $this->load->library("zcms/zcms");
            $this->zcms->init();

            $this->zcms->interface->load_interface('form'); 
            $this->interface->form->init('product_docs', NULL, FALSE);

            $this->interface->form->delete(array('id' => $id), base_url('index.php/backend/catalog/product_edit/'.$pd_id)); 
        }
}

/* End of file pages.php */
/* Location: ./application/controllers/backend/pages.php */
