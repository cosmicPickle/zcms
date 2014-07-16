<?php

class Product_Filter_Values extends Interface_list {
    
    public function setup($list) {
        
        return $list->set('rows_per_page', 10)
                    ->set('page', 1)
                    ->set('order_column', 'filter_id')
                    ->set('order_direction', 'asc')
                    ->set('search', '')
                    ->set('link_show_table', 0)
                    ->set('link_mode', "uri")
                    ->add_column(array(
                        "name" => "filter_id",
                        "label" => $this->translate->t('Filter'),
                    ))
                    ->add_column(array(
                        "name" => "value",
                        "label" => $this->translate->t('Value'),
                    ))
                    ->add_search_column("value")
                    ->add_action(array(
                        "link" => "filter_values/edit/{@id}",
                        "label" => $this->translate->t("Edit")
                    ))
                    ->add_action(array(
                        "link" => "filter_values/delete/{@id}",
                        "label" => $this->translate->t("Delete")
                    ))
                    ->set_global_action("filter_values/edit");
    }
}
