<?php

class Zcms_Lang_Misc extends Interface_form{
    
    public function setup($form)
    {
        return $form->add_field('lang_id',array(
                    'type' => 'select',
                    'disabled_on_update' => FALSE,
                    'link_table' => 'zcms_languages',
                    'link_opt_column' => 'lang_id',
                    'link_val_column' => 'language',
                    'label' => $this->translate->t('Language code'),
                    'validation' => 'required'
                ))
                ->add_field('text',array(
                    'type' => 'text',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Text'),
                    'validation' => 'required'
                ))
                ->add_field('lang',array(
                    'type' => 'text',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Translation'),
                    'validation' => 'required'
                ))
                ->add_submit(array(
                    'label' => $this->translate->t('Save'),
                    'css_class' => 'btn btn-primary btn-large'
                ));
    }
}

