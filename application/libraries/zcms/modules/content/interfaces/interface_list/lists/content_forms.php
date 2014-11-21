<?php

class Content_Forms extends Interface_list {
    
    public function setup($list) {
        
        return $list->set('parent_column', 'parent_id')
                    ->set('indent_column', 'label')
                    ->set('link_show_table', 0)
                    ->set('link_mode', "uri")
                    ->set('order_column', 'order')
                    ->set('order_direction', 'asc')
                    ->add_column(array(
                        "name" => "label",
                        "label" => $this->translate->t('Label'),
                    ))
                    ->add_action(array(
                        "link" => "content/forms_edit/{@id}",
                        "label" => "Edit"
                    ))
                    ->add_action(array(
                        "link" => "content/forms_delete/{@id}",
                        "label" => "Delete"
                    ))
                    ->add_label(array(
                        'cond' => '{@parent_id}==0',
                        'type' => 'info',
                        'text' => $this->translate->t('Form'),
                    ))
                    ->add_label(array(
                        'cond' => '{@parent_id}!=0',
                        'type' => 'success',
                        'text' => $this->translate->t('Field'),
                    ))
                    ->add_label(array(
                        'cond' => '{@enabled}==0',
                        'type' => 'danger',
                        'text' => $this->translate->t('Disabled'),
                    ))
                    ->add_label(array(
                        'cond' => '{@required}==1',
                        'type' => 'warning',
                        'text' => $this->translate->t('Required'),
                    ))
                    ->set_global_action("content/forms_edit");
    }
}
