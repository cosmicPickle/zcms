<?php

class Zcms_pages extends Interface_list {
    
    public function setup($list) {
        
        return $list->set('rows_per_page', 10)
                    ->set('page', 1)
                    ->set('order_column', 'title')
                    ->set('order_direction', 'asc')
                    ->set('search', '')
                    ->set('link_show_table', 0)
                    ->set('link_mode', "uri")
                    ->add_column(array(
                        "name" => "id",
                        "label" => "#"
                    ))
                    ->add_column(array(
                        "name" => "title",
                        "label" => $this->translate->t('Title'),
                    ))
                    ->add_column(array(
                        "name" => "description",
                        "label" => $this->translate->t('Description'),
                    ))
                    ->add_search_column("title")
                    ->add_search_column("description")
                    ->add_action(array(
                        "link" => "content/pages_edit/{@id}",
                        "label" => "Edit"
                    ))
                    ->add_action(array(
                        "link" => "content/pages_delete/{@id}",
                        "label" => "Delete"
                    ))
                    ->set_global_action("content/pages_edit");
    }
}
