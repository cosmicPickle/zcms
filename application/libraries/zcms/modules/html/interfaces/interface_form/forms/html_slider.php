<?php

class Html_Slider extends Interface_form{
    
    public function setup($form)
    {
        return $form->add_field('title',array(
                    'type' => 'text',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Title'),
                    'validation' => ''
                ))
                ->add_field('url',array(
                    'type' => 'text',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('URL'),
                    'validation' => 'required'
                ))
                ->add_field('image',array(
                    'type' => 'image',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Image'),
                    'path' => 'html/slider/',
                    'thumbs' => array(), //TO DO
                    'crop' => TRUE,
                    'size_limit' => 10,
                    'count_limit' => 1,
                    'ext_limit' => 'png|jpg|jpeg',
                    'validation' => '',
                    'delete_action' => 'slider/delete_image/{@file}/{#id}',
                ))
                ->add_submit(array(
                    'label' => $this->translate->t('Save'),
                    'css_class' => 'btn btn-primary btn-large'
                ));
    }
}

