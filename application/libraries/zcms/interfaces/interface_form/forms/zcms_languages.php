<?php

class Zcms_Languages extends Interface_form{
    
    public function setup($form)
    {
        return $form->add_field('lang_id',array(
                    'type' => 'text',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Language code'),
                    'validation' => 'required'
                ))
                ->add_field('language',array(
                    'type' => 'text',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Language'),
                    'validation' => 'required'
                ))
                ->add_submit(array(
                    'label' => $this->translate->t('Save'),
                    'css_class' => 'btn btn-primary btn-large'
                ));
    }
}

