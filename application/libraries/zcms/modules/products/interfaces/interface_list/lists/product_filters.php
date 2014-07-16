<?php

class Product_Filters extends Interface_list {
    
    public function setup($list) {
        
        return $list->set('rows_per_page', 10)
                    ->set('page', 1)
                    ->set('order_column', 'label')
                    ->set('order_direction', 'asc')
                    ->set('search', '')
                    ->set('link_show_table', 0)
                    ->set('link_mode', "uri")
                    ->add_column(array(
                        "name" => "name",
                        "label" => $this->translate->t('Name'),
                    ))
                    ->add_column(array(
                        "name" => "label",
                        "label" => $this->translate->t('Label'),
                    ))
                    ->add_search_column("name")
                    ->add_search_column("label")
                    ->add_action(array(
                        "link" => "filters/edit/{@id}",
                        "label" => $this->translate->t("Edit")
                    ))
                    ->add_action(array(
                        "link" => "filters/delete/{@id}",
                        "label" => $this->translate->t("Delete")
                    ))
                    ->set_global_action("filters/edit");
    }
}
