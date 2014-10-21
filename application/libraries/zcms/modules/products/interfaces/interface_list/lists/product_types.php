<?php

class Product_Types extends Interface_list {
    
    public function setup($list) {
        
        return $list->set('rows_per_page', 10)
                    ->set('page', 1)
                    ->set('link_show_table', 0)
                    ->set('link_mode', "uri")
                    ->set('parent_column', 'parent_id')
                    ->set('indent_column', 'type')
                    ->add_column(array(
                        "name" => "type",
                        "label" => "Type",
                    ))
                    ->add_action(array(
                        "link" => "types/edit/{@id}",
                        "label" => "Edit"
                    ))
                    ->add_action(array(
                        "link" => "types/delete/{@id}",
                        "label" => "Delete"
                    ))
                    ->set_global_action("types/edit");
    }
}
