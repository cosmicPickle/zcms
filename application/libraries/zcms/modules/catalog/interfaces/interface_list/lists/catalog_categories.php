<?php

class Catalog_Categories extends Interface_list {
    
    public function setup($list) {
        
        return $list->set('rows_per_page', 10)
                    ->set('page', 1)
                    ->set('link_show_table', 0)
                    ->set('parent_column', 'parent')
                    ->set('indent_column', 'category')
                    ->set('link_mode', "uri")
                    ->add_column(array(
                        "name" => "category",
                        "label" => $this->translate->t("Category"),
                    ))
                    ->add_action(array(
                        "link" => "catalog/category_edit/{@id}",
                        "label" => $this->translate->t("Edit")
                    ))
                    ->add_action(array(
                        "link" => "catalog/category_delete/{@id}",
                        "label" => $this->translate->t("Delete")
                    ))
                    ->set_global_action("catalog/category_edit/");
    }
}
