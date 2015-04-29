<?php

class Catalog_Product_Images extends Interface_form{
    
    public function setup($form)
    {
        return $form->add_field('title',array(
                    'type' => 'text',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Title'),
                    'validation' => ''
                ))
                ->add_field('main',array(
                    'type' => 'checkbox',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Main'),
                    'validation' => 'required'
                ))
                ->add_field('file',array(
                    'type' => 'image',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Image'),
                    'path' => 'catalog/products/images/',
                    'thumbs' => array("249x180","249x364" , "116x87", "85x120"), //TO DO
                    'crop' => TRUE,
                    'size_limit' => 10,
                    'count_limit' => 1,
                    'ext_limit' => 'png|jpg|jpeg',
                    'validation' => ''
                ))
                ->add_field('alt',array(
                    'type' => 'text',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Alt'),
                    'validation' => ''
                ))
                ->add_submit(array(
                    'label' => $this->translate->t('Save'),
                    'css_class' => 'btn btn-primary btn-large'
                ));
    }
}

