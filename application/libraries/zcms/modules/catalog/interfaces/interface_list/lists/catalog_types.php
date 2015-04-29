<?php

class Catalog_Types extends Interface_list {
    
    public function setup($list) {
        
        return $list->set('rows_per_page', 10)
                    ->set('page', 1)
                    ->set('link_show_table', 0)
                    ->set('link_mode', "uri")
                    ->add_column(array(
                        "name" => "label",
                        "label" => $this->translate->t("Type"),
                    ))
                    ->add_action(array(
                        "link" => "catalog/types_edit/{@id}",
                        "label" => $this->translate->t("Edit")
                    ))
                    ->add_action(array(
                        "link" => "catalog/types_delete/{@id}",
                        "label" => $this->translate->t("Delete")
                    ))
                    ->set_global_action("catalog/types_edit/");
    }
}
