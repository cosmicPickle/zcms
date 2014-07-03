<?php

class Zcms_Admins extends Interface_list {
    
    public function setup($list) {
        
        return $list->set('rows_per_page', 10)
                    ->set('page', 1)
                    ->set('order_column', 'username')
                    ->set('order_direction', 'asc')
                    ->set('search', '')
                    ->set('link_show_table', 0)
                    ->set('link_mode', "uri")
                    ->add_column(array(
                        "name" => "username",
                        "label" => $this->translate->t('Username'),
                    ))
                    ->add_column(array(
                        "name" => "email",
                        "label" => $this->translate->t('Email'),
                    ))
                    ->add_column(array(
                        "name" => "level",
                        "label" => $this->translate->t('Access'),
                    ))
                    ->add_search_column("username")
                    ->add_search_column("email")
                    ->add_search_column("level")
                    ->add_action(array(
                        "link" => "admin/edit/{@id}",
                        "label" => "Edit"
                    ))
                    ->add_action(array(
                        "link" => "admin/delete/{@id}",
                        "label" => "Delete"
                    ))
                    ->set_global_action("admin/edit");
    }
}
