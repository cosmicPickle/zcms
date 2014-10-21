<?php

class Product_Categories extends Interface_list {
    
    public function setup($list) {
        
        return $list->set('rows_per_page', 10)
                    ->set('page', 1)
                    ->set('link_show_table', 0)
                    ->set('link_mode', "uri")
                    ->add_column(array(
                        "name" => "category",
                        "label" => $this->translate->t("Category"),
                    ))
                    ->add_column(array(
                        "name" => "type",
                        "label" => $this->translate->t("Type"),
                    ))
                    ->add_action(array(
                        "link" => "categories/edit/{@id}",
                        "label" => $this->translate->t("Edit")
                    ))
                    ->add_action(array(
                        "link" => "categories/delete/{@id}",
                        "label" => $this->translate->t("Delete")
                    ))
                    ->set_global_action("categories/edit");
    }
}
