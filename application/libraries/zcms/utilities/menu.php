<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/*
 * Menu class
 * 
 * @author Teodor Klissarov
 * @created 15.04.2013
 * 
 * The menu class will create and render the main menu. It will be separate and
 * independant from the menu module which will handle frontend menus
 * 
 */

class Menu extends ZCMS {
        
       //This will hold the menu variables ready for rendering
       private $menu;
        
       //The MySQL table in which the menu items are stored
       private $menu_table = "zcms_menu";
        
       //Same as before only for languages different than the default (EN)
       private $menu_table_lang;
        
       /*
        * __construct()
        * 
        * Checks the language and properly sets the language table for the menu. The constructor also
        * loads the menu from the database
        * 
        */
       public function __construct()
       {
           parent::__construct();
           if($this->translate->get_table_sufix())
               $this->menu_table_lang = $this->menu_table.$this->translate->get_table_sufix();
           else
               $this->menu_table_lang = NULL;
           
           if($this->menu_table_lang)
              $raw = $this->db->select("t2.label as label, t1.controller, t1.method, 
                                        t1.tail, t1.order, t1.access, t2.id_, t2.lang_id", FALSE)
                              ->from($this->menu_table." as t1")
                              ->join($this->menu_table_lang." as t2", " t1.id = t2.id_ ", "left")
                              ->where("(t2.lang_id = IFNULL("
                                        . "(SELECT t3.lang_id FROM ".$this->menu_table_lang." as t3"
                                        . " WHERE t1.id = t3.id_ AND lang_id = '".$this->translate->get_lang()."'), "
                                        . "'".$this->translate->get_default_lang(). "')) ")
                              ->order_by("t1.order","asc")
                              ->get()->result();
           else
               $raw = $this->db->from($this->menu_table)->order_by("order","asc")->get()->result();
           
           foreach ($raw as $item)
           {
               $this->menu[$item->order] = new stdClass();
               
               $this->menu[$item->order]->label = $item->label;
               $this->menu[$item->order]->link = $this->backend.$item->controller."/";
               $this->menu[$item->order]->access = $item->access;
               
               $item->method = $item->method ? $item->method : "index";
               $this->menu[$item->order]->link .= $item->method."/";
                       
               if($item->tail)
                   $this->menu[$item->order]->link .= $item->tail;
               
           }
       }
       
       public function get_menu_table()
       {
           return $this->menu_table;
       }
       
       public function get_raw_menu()
       {
           return $this->menu;
       }
       
       public function render_menu($return = FALSE)
       {
           //If the $return parameter is set to TRUE, the view will be returned and not rendered.
           return $this->load->view(self::VIEWS_BACKEND."menu", array('menu' => $this->menu), $return);
       }
}

/* End of file menu.php */
/* Location: ./application/libraries/zcms/utilities/menu.php  */
