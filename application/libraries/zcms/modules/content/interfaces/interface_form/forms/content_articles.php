<?php

class Content_Articles extends Interface_form{
    
    public function setup($form)
    {
        return $form->add_field('title',array(
                    'type' => 'text',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Title'),
                    'validation' => 'required'
                ))
                ->add_field('alias',array(
                    'type' => 'text',
                    'disabled_on_update' => TRUE,
                    'label' => $this->translate->t('Alias'),
                    'validation' => 'required|is_unique'
                ))
                ->add_field('category',array(
                    'type' => 'select',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Category'),
                    'link_table' => 'content_categories',
                    'link_opt_column' => 'alias',
                    'link_val_column' => 'label',
                    'parent_column' => 'parent',
                    'validation' => ''
                ))
                ->add_field('author',array(
                    'type' => 'select',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Author'),
                    'link_table' => 'zcms_admins',
                    'link_opt_column' => 'id',
                    'link_val_column' => 'name',
                    'validation' => ''
                ))
                ->add_field('date',array(
                    'type' => 'date',
                    'disable_past' => TRUE,
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Date'),
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
                ->add_field('content',array(
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

