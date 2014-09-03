<?php

class Product_Products extends Interface_form{
    
    public function setup($form)
    {
        return $form->add_field('code',array(
                    'type' => 'text',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Code'),
                    'validation' => 'required'
                ))
                ->add_field('category',array(
                    'type' => 'select',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Category'),
                    'opt_val_pairs' => array(
                        "" => $this->translate->t('Choose')
                    ),
                    'link_table' => 'product_categories',
                    'link_opt_column' => 'id',
                    'link_val_column' => 'category',
                    'parent_column' => 'parent_id',
                    'validation' => ''
                ))
                ->add_field('filters[section]',array(
                    'type' => 'select',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Section'),
                    'opt_val_pairs' => array(
                        "" => $this->translate->t('Choose')
                    ),
                    'link_table' => 'product_filter_values',
                    'link_opt_column' => 'id',
                    'link_val_column' => 'value',
                    'link_query' => "t1.filter_id = 'section'",
                    'validation' => ''
                ))
                ->add_field('filters[fi]',array(
                    'type' => 'select',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Ф'),
                    'opt_val_pairs' => array(
                        "" => $this->translate->t('Choose')
                    ),
                    'link_table' => 'product_filter_values',
                    'link_opt_column' => 'id',
                    'link_val_column' => 'value',
                    'link_query' => "t1.filter_id = 'fi'",
                    'validation' => ''
                ))
                ->add_field('filters[valve]',array(
                    'type' => 'select',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Valve'),
                    'opt_val_pairs' => array(
                        0 => $this->translate->t('No'),
                        1 => $this->translate->t('Yes')
                    ),
                    'validation' => ''
                ))
                ->add_field('filters[high_temperature]',array(
                    'type' => 'select',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('High Temperature'),
                    'opt_val_pairs' => array(
                        0 => $this->translate->t('No'),
                        1 => $this->translate->t('Yes')
                    ),
                    'validation' => ''
                ))
                ->add_field('filters[use]',array(
                    'type' => 'select',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Use'),
                    'opt_val_pairs' => array(
                        "" => $this->translate->t('Choose')
                    ),
                    'link_table' => 'product_filter_values',
                    'link_opt_column' => 'id',
                    'link_val_column' => 'value',
                    'link_query' => "t1.filter_id = 'use'",
                    'validation' => ''
                ))
                ->add_field('filters[color]',array(
                    'type' => 'select',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Color'),
                    'opt_val_pairs' => array(
                        "" => $this->translate->t('Choose')
                    ),
                    'link_table' => 'product_filter_values',
                    'link_opt_column' => 'id',
                    'link_val_column' => 'value',
                    'link_query' => "t1.filter_id = 'color'",
                    'validation' => ''
                ))
                ->add_field('filters[led]',array(
                    'type' => 'select',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('LED Light'),
                    'opt_val_pairs' => array(
                        "" => $this->translate->t('Choose')
                    ),
                    'link_table' => 'product_filter_values',
                    'link_opt_column' => 'id',
                    'link_val_column' => 'value',
                    'link_query' => "t1.filter_id = 'led'",
                    'validation' => ''
                ))
                ->add_field('filters[timers_and_sensors]',array(
                    'type' => 'select',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Timers and sensors'),
                    'opt_val_pairs' => array(
                        "" => $this->translate->t('Choose')
                    ),
                    'link_table' => 'product_filter_values',
                    'link_opt_column' => 'id',
                    'link_val_column' => 'value',
                    'link_query' => "t1.filter_id = 'timers_and_sensors'",
                    'validation' => ''
                ))
                ->add_field('filters[twostepped]',array(
                    'type' => 'select',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Two Steped'),
                    'opt_val_pairs' => array(
                        0 => $this->translate->t('No'),
                        1 => $this->translate->t('Yes')
                    ),
                    'validation' => ''
                ))
                ->add_field('filters[other]',array(
                    'type' => 'select',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Other'),
                    'opt_val_pairs' => array(
                        "" => $this->translate->t('Choose')
                    ),
                    'link_table' => 'product_filter_values',
                    'link_opt_column' => 'id',
                    'link_val_column' => 'value',
                    'link_query' => "t1.filter_id = 'other'",
                    'validation' => ''
                ))
                ->add_field('filters[termal_sensor]',array(
                    'type' => 'select',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Termal sensor'),
                    'opt_val_pairs' => array(
                        0 => $this->translate->t('No'),
                        1 => $this->translate->t('Yes')
                    ),
                    'validation' => ''
                ))
                ->add_field('filters[centrifugal]',array(
                    'type' => 'select',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Centrifugal'),
                    'opt_val_pairs' => array(
                        0 => $this->translate->t('No'),
                        1 => $this->translate->t('Yes')
                    ),
                    'validation' => ''
                ))
                ->add_field('filters[type_va]',array(
                    'type' => 'select',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Type VA'),
                    'opt_val_pairs' => array(
                        0 => $this->translate->t('No'),
                        1 => $this->translate->t('Yes')
                    ),
                    'validation' => ''
                ))
                ->add_field('filters[type_pvo]',array(
                    'type' => 'select',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Type PVO'),
                    'opt_val_pairs' => array(
                        0 => $this->translate->t('No'),
                        1 => $this->translate->t('Yes')
                    ),
                    'validation' => ''
                ))
                ->add_field('images',array(
                    'type' => 'image',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Images'),
                    'path' => 'products/images/',
                    'link_table' => 'product_images',
                    'thumbs' => array("150x150", "100x100", "320x320"), //TO DO
                    'crop' => TRUE,
                    'size_limit' => 10,
                    'count_limit' => 4,
                    'ext_limit' => 'png|jpg|jpeg',
                    'edit_action' => 'pdimages/edit/{@id}',
                    'delete_action' => 'pdimages/delete/{@id}/{#id}',
                    'validation' => ''
                ))
                ->add_field('docs',array(
                    'type' => 'file',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Documents'),
                    'path' => 'products/docs/',
                    'link_table' => 'product_docs',
                    'size_limit' => 10,
                    'count_limit' => 10,
                    'ext_limit' => 'doc|docx|xls|xlsx|pdf',
                    'edit_action' => 'pddocs/edit/{@id}',
                    'delete_action' => 'pddocs/delete/{@id}/{#id}',
                    'validation' => ''
                ))
                ->add_field('schematic',array(
                    'type' => 'image',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Schematic'),
                    'path' => 'products/schematics/',
                    'thumbs' => array(), //TO DO
                    'crop' => TRUE,
                    'size_limit' => 10,
                    'count_limit' => 1,
                    'ext_limit' => 'png|jpg|jpeg',
                    'delete_action' => 'products/schematic_delete/{#id}/{@file}',
                    'validation' => ''
                ))
                ->add_field('title',array(
                    'type' => 'text',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Title'),
                    'validation' => 'required'
                ))
                ->add_field('shop_url',array(
                    'type' => 'text',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Shop URL'),
                    'validation' => ''
                ))
                ->add_field('short_description',array(
                    'type' => 'textarea',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Short Description'),
                    'validation' => ''
                ))
                ->add_field('description',array(
                    'type' => 'textarea',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Description'),
                    'validation' => ''
                ))
                ->add_field('technical_info',array(
                    'type' => 'textarea',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Technical Info'),
                    'validation' => ''
                ))
                ->add_submit(array(
                    'label' => $this->translate->t('Save'),
                    'css_class' => 'btn btn-primary btn-large'
                ));
    }
}

