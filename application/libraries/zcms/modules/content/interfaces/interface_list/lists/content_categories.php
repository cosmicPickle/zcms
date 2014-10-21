<?php

class Content_Categories extends Interface_list {
    
    public function setup($list) {
        
        return $list->set('rows_per_page', 10)
                    ->set('page', 1)
                    ->set('link_show_table', 0)
                    ->set('link_mode', "uri")
                    ->set('order_column', 'order')
                    ->set('order_direction', 'asc')
                    ->set('parent_column', 'parent')
                    ->set('indent_column', 'label')
                    ->add_column(array(
                        "name" => "order",
                        "label" => $this->translate->t("Order"),
                    ))
                    ->add_column(array(
                        "name" => "label",
                        "label" => $this->translate->t("Label"),
                    ))
                    ->add_action(array(
                        "link" => "content/category_edit/{@id}",
                        "label" => $this->translate->t("Edit")
                    ))
                    ->add_action(array(
                        "link" => "content/category_delete/{@id}",
                        "label" => $this->translate->t("Delete")
                    ))
                    ->set_global_action("content/category_edit/");
    }
}
