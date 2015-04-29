<?php

class Catalog_Categories extends Interface_form{
    
    public function setup($form)
    {
        return $form->add_field('alias',array(
                    'type' => 'text',
                    'disabled_on_update' => TRUE,
                    'label' => $this->translate->t('Alias'),
                    'validation' => 'required'
                ))
                ->add_field('category',array(
                    'type' => 'text',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Category'),
                    'validation' => ''
                ))
                ->add_field('keywords',array(
                    'type' => 'text',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Meta Keywords'),
                    'validation' => ''
                ))
                ->add_field('meta_description',array(
                    'type' => 'text',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Meta Description'),
                    'validation' => ''
                ))
                ->add_field('image',array(
                    'type' => 'image',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Image'),
                    'path' => 'catalog/categories/images/',
                    'thumbs' => array("150x150"),
                    'crop' => TRUE,
                    'size_limit' => 10,
                    'count_limit' => 1,
                    'ext_limit' => 'png|jpg|jpeg',
                    'delete_action' => 'catalog/category_delete_image/{#id}/{@file}',
                    'validation' => ''
                ))
                ->add_field('video',array(
                    'type' => 'text',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Video'),
                    'validation' => ''
                ))
                ->add_field('description',array(
                    'type' => 'textarea',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Description'),
                    'validation' => ''
                ))
                ->add_field('parent',array(
                    'type' => 'select',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Parent'),
                    'link_table' => 'catalog_categories',
                    'link_opt_column' => 'id',
                    'link_val_column' => 'category',
                    'opt_val_pairs' => array(
                        '0' => $this->translate->t("Top")
                    ),
                    'parent_column' => 'parent',
                    'validation' => ''
                ))
 
                ->add_submit(array(
                    'label' => $this->translate->t('Save'),
                    'css_class' => 'btn btn-primary btn-large'
                ));
    }
}

