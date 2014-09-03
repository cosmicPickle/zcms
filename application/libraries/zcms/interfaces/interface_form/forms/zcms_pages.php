<?php

class Zcms_pages extends Interface_form{
    
    public function setup($form)
    {
        return $form->add_field('title',array(
                    'type' => 'text',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Title'),
                    'validation' => 'required'
                ))
                ->add_field('main_menu',array(
                    'type' => 'select',
                    'opt_val_pairs' => array(
                       0 => $this->translate->t("None")
                    ),
                    'link_table' => 'zcms_frontend_menus',
                    'link_opt_column' => 'id',
                    'link_val_column' => 'label',
                    'link_query' => 'parent_id = 0',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Main menu'),
                    'validation' => ''
                ))
                ->add_field('page_id',array(
                    'type' => 'text',
                    'disabled_on_update' => TRUE,
                    'label' => $this->translate->t('Page Id'),
                    'validation' => 'required|is_unique'
                ))
                ->add_field('template',array(
                    'type' => 'text',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Template'),
                    'validation' => ''
                ))
                ->add_field('keywords',array(
                    'type' => 'text',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Keywords'),
                    'validation' => ''
                ))
                ->add_field('images',array(
                    'type' => 'image',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Images'),
                    'path' => 'pages/images/',
                    'thumbs' => array(), //TO DO
                    'crop' => TRUE,
                    'size_limit' => 10,
                    'count_limit' => 100,
                    'ext_limit' => 'png|jpg|jpeg',
                    'delete_action' => 'pages/image_delete/{#id}/{@file}',
                    'validation' => ''
                ))
                ->add_field('description',array(
                    'type' => 'text',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Description'),
                    'validation' => ''
                ))
                ->add_field('html',array(
                    'type' => 'textarea',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Content'),
                    'validation' => 'required'
                ))
                ->add_submit(array(
                    'label' => $this->translate->t('Save'),
                    'css_class' => 'btn btn-primary btn-large'
                ));
    }
}

