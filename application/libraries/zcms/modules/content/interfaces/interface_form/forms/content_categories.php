<?php

class Content_Categories extends Interface_form{
    
    public function setup($form)
    {
        return $form->add_field('label',array(
                    'type' => 'text',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Label'),
                    'validation' => 'required'
                ))
                ->add_field('alias',array(
                    'type' => 'text',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Alias'),
                    'validation' => ''
                ))
                ->add_field('description',array(
                    'type' => 'text',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Description'),
                    'validation' => ''
                ))
                ->add_field('keywords',array(
                    'type' => 'text',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Keywords'),
                    'validation' => ''
                ))
                ->add_field('parent',array(
                    'type' => 'select',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Parent'),
                    'link_table' => 'content_categories',
                    'link_opt_column' => 'id',
                    'link_val_column' => 'label',
                    'opt_val_pairs' => array(
                        "0" => $this->translate->t('Top')
                    ),
                    'parent_column' => 'parent',
                    'validation' => ''
                ))
                ->add_field('order',array(
                    'type' => 'text',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Order'),
                    'validation' => 'required'
                ))
                ->add_submit(array(
                    'label' => $this->translate->t('Save'),
                    'css_class' => 'btn btn-primary btn-large'
                ));
    }
}


