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
                    'thumbs' => array('1440x398'), //TO DO
                    'crop' => TRUE,
                    'size_limit' => 10,
                    'count_limit' => 1,
                    'ext_limit' => 'png|jpg|jpeg',
                    'validation' => '',
                    'delete_action' => 'slider/delete_image/{@file}/{#id}',
                ))
                ->add_field('slider_id',array(
                    'type' => 'select',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Slider Id'),
                    'validation' => 'required',
                    'opt_val_pairs' => array(
                        '' => "",
                        'home' => $this->translate->t("Home"),
                        'fans' => $this->translate->t("Fans"),
                        'engines' => $this->translate->t("Engines")
                    )
                ))
                ->add_submit(array(
                    'label' => $this->translate->t('Save'),
                    'css_class' => 'btn btn-primary btn-large'
                ));
    }
}

