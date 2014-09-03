<?php

class Html_News extends Interface_form{
    
    public function setup($form)
    {
        return $form->add_field('title',array(
                    'type' => 'text',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Title'),
                    'validation' => ''
                ))
                ->add_field('date',array(
                    'type' => 'date',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Date'),
                    'validation' => 'required'
                ))
                ->add_field('text',array(
                    'type' => 'textarea',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Date'),
                    'validation' => 'required'
                ))
                ->add_submit(array(
                    'label' => $this->translate->t('Save'),
                    'css_class' => 'btn btn-primary btn-large'
                ));
    }
}

