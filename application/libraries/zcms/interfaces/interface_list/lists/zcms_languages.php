<?php

class Zcms_Languages extends Interface_list {
    
    public function setup($list) {
        
        return $list->set('rows_per_page', 10)
                    ->set('page', 1)
                    ->set('order_column', 'language')
                    ->set('order_direction', 'asc')
                    ->set('search', '')
                    ->set('link_show_table', 0)
                    ->set('link_mode', "uri")
                    ->add_column(array(
                        "name" => "language",
                        "label" => $this->translate->t('Language'),
                    ))
                    ->add_column(array(
                        "name" => "lang_code",
                        "label" => $this->translate->t('Language Code'),
                    ))
                    ->add_search_column("language")
                    ->add_search_column("lang_id")
                    ->add_action(array(
                        "link" => "languages/edit/{@id}",
                        "label" => "Edit"
                    ))
                    ->add_action(array(
                        "link" => "languages/delete/{@id}",
                        "label" => "Delete"
                    ))
                    ->set_global_action("languages/edit");
    }
}
