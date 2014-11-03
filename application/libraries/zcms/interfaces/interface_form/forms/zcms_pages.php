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
                ->add_field('page_id',array(
                    'type' => 'text',
                    'disabled_on_update' => TRUE,
                    'label' => $this->translate->t('Page Id'),
                    'validation' => 'required|is_unique'
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
                ->add_field('template',array(
                    'type' => 'text',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Template'),
                    'validation' => ''
                ))
                ->add_field('html',array(
                    'type' => 'text',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Layout'),
                    'validation' => 'required'
                ))
                ->add_field('assets',array(
                    'type' => 'textarea',
                    'disabled_on_update' => FALSE,
                    'tiny_mce' => FALSE,
                    'css_class' => 'form-control',
                    'label' => $this->translate->t('Assets'),
                    'validation' => ''
                ))
                ->add_field('modules',array(
                    'type' => 'textarea',
                    'disabled_on_update' => FALSE,
                    'tiny_mce' => FALSE,
                    'css_class' => 'form-control',
                    'label' => $this->translate->t('Modules'),
                    'validation' => ''
                ))
                ->add_submit(array(
                    'label' => $this->translate->t('Save'),
                    'css_class' => 'btn btn-primary btn-large'
                ));
    }
}

