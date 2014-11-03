<?php

class Content_Widgets extends Interface_list {
    
    public function setup($list) {
        
        return $list->set('rows_per_page', 10)
                    ->set('page', 1)
                    ->set('order_column', 'title')
                    ->set('order_direction', 'asc')
                    ->set('search', '')
                    ->set('link_show_table', 0)
                    ->set('link_mode', "uri")
                    ->add_column(array(
                        "name" => "title",
                        "label" => $this->translate->t('Title'),
                    ))
                    ->add_column(array(
                        "name" => "link",
                        "label" => $this->translate->t('Link'),
                    ))
                    ->add_search_column("title")
                    ->add_search_column("content")
                    ->add_action(array(
                        "link" => "content/widgets_edit/{@id}",
                        "label" => "Edit"
                    ))
                    ->add_action(array(
                        "link" => "content/widgets_delete/{@id}",
                        "label" => "Delete"
                    ))
                    ->set_global_action("content/widgets_edit");
    }
}
