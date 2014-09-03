<?php

class Product_Categories extends Interface_list {
    
    public function setup($list) {
        
        return $list->set('rows_per_page', 10)
                    ->set('page', 1)
                    ->set('link_show_table', 0)
                    ->set('link_mode', "uri")
                    ->set('parent_column', 'parent_id')
                    ->set('indent_column', 'category')
                    ->add_column(array(
                        "name" => "category",
                        "label" => "Category",
                    ))
                    ->add_action(array(
                        "link" => "categories/edit/{@id}",
                        "label" => "Edit"
                    ))
                    ->add_action(array(
                        "link" => "categories/delete/{@id}",
                        "label" => "Delete"
                    ))
                    ->set_global_action("categories/edit");
    }
}
