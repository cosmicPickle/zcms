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
                    'validation' => ''
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

