<?php

class Content_Slider extends Interface_form {
    
    public function setup($form)
    {
        return $form->add_field('label',array(
                    'type' => 'text',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Label'),
                    'validation' => 'required'
                ))
                ->add_field('alias', array(
                    'type' => 'text',
                    'disabled_on_update' => TRUE,
                    'label' => $this->translate->t('Alias'),
                    'validation' => ''
                ))
                ->add_field('link', array(
                    'type' => 'text',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Link'),
                    'validation' => ''
                ))
                ->add_field('parent',array(
                    'type' => 'select',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Parent'),
                    'opt_val_pairs' => array(
                        0 => $this->translate->t('New Slider'),
                    ),
                    'link_table' => 'content_slider',
                    'link_opt_column' => 'id',
                    'link_val_column' => 'label',
                    'parent_column' => 'parent',
                    'validation' => ''
                ))
                ->add_field('order', array(
                    'type' => 'text',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Order'),
                    'validation' => ''
                ))
                ->add_field('image',array(
                    'type' => 'image',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Image'),
                    'path' => 'slider/images/',
                    'thumbs' => array(),
                    'crop' => TRUE,
                    'size_limit' => 10,
                    'count_limit' => 1,
                    'ext_limit' => 'png|jpg|jpeg',
                    'delete_action' => 'content/slider_delete_img/{@file}/{#id}',
                    'validation' => ''
                ))
                ->add_submit(array(
                    'label' => $this->translate->t('Save'),
                    'css_class' => 'btn btn-primary btn-large'
                ));
    }
}


