<?php

class Product_Products extends Interface_list {
    
    public function setup($list) {
        
        return $list->set('rows_per_page', 10)
                    ->set('page', 1)
                    ->set('order_column', 'title')
                    ->set('order_direction', 'asc')
                    ->set('search', '')
                    ->set('link_show_table', 0)
                    ->set('link_mode', "uri")
                    ->add_column(array(
                        "name" => "code",
                        "label" => $this->translate->t('Code'),
                    ))
                    ->add_column(array(
                        "name" => "title",
                        "label" => $this->translate->t('Title'),
                    ))
                    /*->add_column(array(
                        "name" => "short_description",
                        "label" => $this->translate->t('Short Description'),
                    ))*/
                    ->add_search_column("title")
                    ->add_search_column("short_description")
                    ->add_search_column("code")
                    ->add_action(array(
                        "link" => "catalog/product_edit/{@id}",
                        "label" => $this->translate->t("Edit")
                    ))
                    ->add_action(array(
                        "link" => "catalog/product_delete/{@id}",
                        "label" => $this->translate->t("Delete")
                    ))
                    ->add_action(array(
                        "link" => "catalog/product_copy/{@id}",
                        "label" => $this->translate->t("Copy")
                    ))
                    ->set_global_action("catalog/product_edit");
    }
}
