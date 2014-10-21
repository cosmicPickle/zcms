<?php

class Product_Docs extends Interface_form{
    
    public function setup($form)
    {
        return $form->add_field('title',array(
                    'type' => 'text',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Title'),
                    'validation' => ''
                ))
                ->add_field('file',array(
                    'type' => 'file',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Image'),
                    'path' => 'products/docs/',
                    'crop' => TRUE,
                    'size_limit' => 10,
                    'count_limit' => 1,
                    'ext_limit' => 'doc|docx|xls|xlsx|pdf',
                    'validation' => ''
                ))
                ->add_submit(array(
                    'label' => $this->translate->t('Save'),
                    'css_class' => 'btn btn-primary btn-large'
                ));
    }
}

