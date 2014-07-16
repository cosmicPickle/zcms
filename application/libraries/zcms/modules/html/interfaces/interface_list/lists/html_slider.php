<?php

class Html_Slider extends Interface_list {
    
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
                    ->add_search_column("title")
                    ->add_action(array(
                        "link" => "slider/edit/{@id}",
                        "label" => $this->translate->t("Edit")
                    ))
                    ->add_action(array(
                        "link" => "slider/delete/{@id}",
                        "label" => $this->translate->t("Delete")
                    ))
                    ->set_global_action("slider/edit");
    }
}
