<?php

class Menus_Frontend_Menus extends Interface_form {
    
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
                ->add_field('parent_id',array(
                    'type' => 'select',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Parent Id'),
                    'opt_val_pairs' => array(
                        0 => $this->translate->t('New menu'),
                    ),
                    'link_table' => 'menus_frontend_menus',
                    'link_opt_column' => 'id',
                    'link_val_column' => 'label',
                    'parent_column' => 'parent_id',
                    'validation' => ''
                ))
                ->add_field('page_id',array(
                    'type' => 'select',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Page'),
                    'opt_val_pairs' => array(
                        0 => $this->translate->t('None'),
                    ),
                    'link_table' => 'zcms_pages',
                    'link_opt_column' => 'page_id',
                    'link_val_column' => 'title',
                    'validation' => ''
                ))
                ->add_field('type',array(
                    'type' => 'select',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Type'),
                    'opt_val_pairs' => array(
                        'general' => $this->translate->t('General'),
                        'article' => $this->translate->t('Article'),
                        'category' => $this->translate->t('Category'),
                        'static' => $this->translate->t('Static')
                    ),
                    'validation' => ''
                ))
                ->add_field('article',array(
                    'type' => 'select',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Article'),
                    'opt_val_pairs' => array(
                        0 => $this->translate->t('None'),
                    ),
                    'link_table' => 'content_articles',
                    'link_opt_column' => 'alias',
                    'link_val_column' => 'title',
                    'validation' => ''
                ))
                ->add_field('category',array(
                    'type' => 'select',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Category'),
                    'opt_val_pairs' => array(
                        0 => $this->translate->t('None'),
                    ),
                    'link_table' => 'content_categories',
                    'link_opt_column' => 'alias',
                    'link_val_column' => 'label',
                    'validation' => ''
                ))
                ->add_field('params',array(
                    'type' => 'text',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Params'),
                    'validation' => ''
                ))
                ->add_field('url',array(
                    'type' => 'text',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Url'),
                    'validation' => ''
                ))
                ->add_field('target',array(
                    'type' => 'select',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Target'),
                    'opt_val_pairs' => array(
                        '_self' => $this->translate->t('Self'),
                        '_blank' => $this->translate->t('Blank')
                    ),
                    'validation' => ''
                ))
                ->add_field('order',array(
                    'type' => 'text',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Order'),
                    'validation' => ''
                ))
                ->add_trigger(array(
                    "action_type" => "display",
                    "target" => "article",
                    "observed_field" => "type",
                    "value" => "article"
                ))
                ->add_trigger(array(
                    "action_type" => "display",
                    "target" => "category",
                    "observed_field" => "type",
                    "value" => "category"
                ))
                ->add_trigger(array(
                    "action_type" => "display",
                    "target" => "params",
                    "observed_field" => "type",
                    "value" => "general"
                ))
                ->add_trigger(array(
                    "action_type" => "display",
                    "target" => "url",
                    "observed_field" => "type",
                    "value" => "static"
                ))
                ->add_submit(array(
                    'label' => $this->translate->t('Save'),
                    'css_class' => 'btn btn-primary btn-large'
                ));
    }
}


