<?php

class Html_News extends Interface_list {
    
    public function setup($list) {
        
        return $list->set('rows_per_page', 10)
                    ->set('page', 1)
                    ->set('order_column', 'date')
                    ->set('order_direction', 'desc')
                    ->set('search', '')
                    ->set('link_show_table', 0)
                    ->set('link_mode', "uri")
                    ->add_column(array(
                        "name" => "date",
                        "label" => $this->translate->t('Date'),
                    ))
                    ->add_column(array(
                        "name" => "title",
                        "label" => $this->translate->t('Title'),
                    ))
                    ->add_search_column("title, text")
                    ->add_action(array(
                        "link" => "news/edit/{@id}",
                        "label" => $this->translate->t("Edit")
                    ))
                    ->add_action(array(
                        "link" => "news/delete/{@id}",
                        "label" => $this->translate->t("Delete")
                    ))
                    ->set_global_action("news/edit");
    }
}
