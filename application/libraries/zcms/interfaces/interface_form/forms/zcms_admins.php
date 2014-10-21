<?php

class Zcms_Admins extends Interface_form{
    
    public function setup($form)
    {
        return $form->add_field('username',array(
                    'type' => 'text',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Username'),
                    'validation' => 'required'
                ))
                ->add_field('email',array(
                    'type' => 'text',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Email'),
                    'validation' => 'required'
                ))
                ->add_field('image',array(
                    'type' => 'image',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Image'),
                    'path' => 'admins/images/',
                    'thumbs' => array("80x80"), //TO DO
                    'crop' => TRUE,
                    'size_limit' => 10,
                    'count_limit' => 1,
                    'ext_limit' => 'png|jpg|jpeg',
                    'validation' => ''
                ))
                ->add_field('password',array(
                    'type' => 'password',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Password'),
                    'validation' => 'required'
                ))
                ->add_field('level',array(
                    'type' => 'text',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Access'),
                    'validation' => 'required'
                ))
                ->add_submit(array(
                    'label' => $this->translate->t('Save'),
                    'css_class' => 'btn btn-primary btn-large'
                ));
    }
}

