<?php

class Content_Slider extends Interface_list {
    
    public function setup($list) {
        
        return $list->set('parent_column', 'parent')
                    ->set('indent_column', 'label')
                    ->set('link_show_table', 0)
                    ->set('link_mode', "uri")
                    ->add_column(array(
                        "name" => "label",
                        "label" => $this->translate->t('Label'),
                    ))
                    ->add_action(array(
                        "link" => "content/slider_edit/{@id}",
                        "label" => $this->translate->t("Edit")
                    ))
                    ->add_action(array(
                        "link" => "content/slider_delete/{@id}",
                        "label" => $this->translate->t("Delete")
                    ))
                    ->add_label(array(
                        'cond' => '{@parent}==0',
                        'type' => 'info',
                        'text' => $this->translate->t('Slider'),
                    ))
                    ->add_label(array(
                        'cond' => '{@parent}!=0',
                        'type' => 'success',
                        'text' => $this->translate->t('Slide'),
                    ))
                    ->set_global_action("content/slider_edit");
    }
}
