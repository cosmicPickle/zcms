<?php

class Product_Categories extends Interface_form{
    
    public function setup($form)
    {
        return $form->add_field('category',array(
                    'type' => 'text',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Category'),
                    'validation' => 'required'
                ))
                ->add_field('text',array(
                    'type' => 'textarea',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Text'),
                    'validation' => ''
                ))
                ->add_field('parent_id',array(
                    'type' => 'select',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Parent Id'),
                    'link_table' => 'product_categories',
                    'link_opt_column' => 'id',
                    'link_val_column' => 'category',
                    'opt_val_pairs' => array(
                        "0" => $this->translate->t('Top')
                    ),
                    'parent_column' => 'parent_id',
                    'validation' => ''
                ))
                ->add_field('image',array(
                    'type' => 'image',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Image'),
                    'path' => 'products/categories/',
                    'thumbs' => array("150x150"), //TO DO
                    'crop' => TRUE,
                    'size_limit' => 10,
                    'count_limit' => 1,
                    'ext_limit' => 'png|jpg|jpeg',
                    'validation' => '',
                    'delete_action' => 'categories/delete_img/{#id}/{@file}',
                ))
                ->add_submit(array(
                    'label' => $this->translate->t('Save'),
                    'css_class' => 'btn btn-primary btn-large'
                ));
    }
}

