<?php

class Content_Articles extends Interface_list {
    
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
                        "name" => "description",
                        "label" => $this->translate->t('Description'),
                    ))
                    ->add_column(array(
                        "name" => "category",
                        "label" => $this->translate->t('Category'),
                    ))
                    ->add_search_column("title")
                    ->add_search_column("description")
                    ->add_search_column("content")
                    ->add_search_column("category")
                    ->add_filter_column(array(
                        "name" => "category-!in", 
                        "value" => array("news", "testimonials")
                    ))
                    ->add_action(array(
                        "link" => "content/articles_edit/{@id}",
                        "label" => "Edit"
                    ))
                    ->add_action(array(
                        "link" => "content/articles_delete/{@id}",
                        "label" => "Delete"
                    ))
                    ->set_global_action("content/articles_edit");
    }
}
