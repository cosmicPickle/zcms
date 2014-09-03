<?php

class Zcms_Frontend_Menus extends Interface_list {
    
    public function setup($list) {
        
        return $list->set('parent_column', 'parent_id')
                    ->set('indent_column', 'label')
                    ->set('link_show_table', 0)
                    ->set('link_mode', "uri")
                    ->add_column(array(
                        "name" => "label",
                        "label" => $this->translate->t('Label'),
                    ))
                    ->add_action(array(
                        "link" => "frontend_menus/edit/{@id}",
                        "label" => "Edit"
                    ))
                    ->add_action(array(
                        "link" => "frontend_menus/delete/{@id}",
                        "label" => "Delete"
                    ))
                    ->add_label(array(
                        'cond' => '{@parent_id}==0',
                        'type' => 'info',
                        'text' => $this->translate->t('Menu'),
                    ))
                    ->add_label(array(
                        'cond' => '{@parent_id}!=0',
                        'type' => 'success',
                        'text' => $this->translate->t('Item'),
                    ))
                    ->set_global_action("frontend_menus/edit");
    }
}
