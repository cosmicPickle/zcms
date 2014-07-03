<?php

class Zcms_Menu extends Interface_list {
    
    public function setup($list) {
        
        return $list->set('rows_per_page', 10)
                    ->set('page', 1)
                    ->set('order_column', 'order')
                    ->set('order_direction', 'asc')
                    ->set('search', '')
                    ->set('link_show_table', 0)
                    ->set('link_mode', "uri")
                    ->add_column(array(
                        "name" => "order",
                        "label" => $this->translate->t("Order")
                    ))
                    ->add_column(array(
                        "name" => "label",
                        "label" => $this->translate->t("Label")
                    ))
                    ->add_column(array(
                        "name" => "controller",
                        "label" => $this->translate->t("Controller")
                    ))
                    ->add_column(array(
                        "name" => "access",
                        "label" => $this->translate->t("Access")
                    ))
                    ->add_search_column("label")
                    ->add_search_column("controller")
                    ->add_search_column("access")
                    ->add_action(array(
                        "link" => "backend_menu/edit/{@id}",
                        "label" => "Edit"
                    ))
                    ->add_action(array(
                        "link" => "backend_menu/delete/{@id}",
                        "label" => "Delete"
                    ))
                    ->set_global_action("backend_menu/edit");
    }
}
