<?php

class Content_Widgets extends Interface_form{
    
    public function setup($form)
    {
        return $form->add_field('alias',array(
                    'type' => 'text',
                    'disabled_on_update' => 1,
                    'label' => $this->translate->t('Alias'),
                    'validation' => 'required|is_unique'
                ))
                ->add_field('link',array(
                    'type' => 'text',
                    'disabled_on_update' => 0,
                    'label' => $this->translate->t('Link'),
                    'validation' => 'required'
                ))
                ->add_field('title',array(
                    'type' => 'textarea',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Title'),
                    'validation' => 'required'
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

