<?php

class Zcms_Lang_Misc extends Interface_list {
    
    public function setup($list) {
        
        return $list->set('rows_per_page', 30)
                    ->set('page', 1)
                    ->set('order_column', 'lang_id')
                    ->set('order_direction', 'asc')
                    ->set('search', '')
                    ->set('link_show_table', 0)
                    ->set('link_mode', "uri")
                    ->add_column(array(
                        "name" => "lang_id",
                        "label" => $this->translate->t('Language Code'),
                    ))
                    ->add_column(array(
                        "name" => "text",
                        "label" => $this->translate->t('Text'),
                    ))
                    ->add_column(array(
                        "name" => "lang",
                        "label" => $this->translate->t('Translation'),
                    ))
                    ->add_search_column("lang_id")
                    ->add_search_column("text")
                    ->add_search_column("lang")
                    ->add_action(array(
                        "link" => "localisation/translations_edit/{@id}",
                        "label" => "Edit"
                    ))
                    ->add_action(array(
                        "link" => "localisation/translations_delete/{@id}",
                        "label" => "Delete"
                    ))
                    ->set_global_action("localisation/translations_edit");
    }
}
