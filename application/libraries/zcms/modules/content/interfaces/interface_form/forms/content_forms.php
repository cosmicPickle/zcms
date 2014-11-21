<?php

class Content_Forms extends Interface_form {
    
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
                        0 => $this->translate->t('New form'),
                    ),
                    'link_table' => 'content_forms',
                    'link_opt_column' => 'id',
                    'link_val_column' => 'label',
                    'parent_column' => 'parent_id',
                    'validation' => ''
                ))
                ->add_field('type',array(
                    'type' => 'select',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Type'),
                    'opt_val_pairs' => array(
                        'form' => $this->translate->t('Form'),
                        'text' => $this->translate->t('Text'),
                        'textarea' => $this->translate->t('Textarea'),
                        'select' => $this->translate->t('Dropdown'),
                        'checkbox' => $this->translate->t('Checkbox'),
                    ),
                    'validation' => ''
                ))
                ->add_field('options',array(
                    'type' => 'textarea',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Options'),
                    'tiny_mce' => FALSE,
                    'css_class' => 'form-control',
                    'validation' => ''
                ))
                ->add_field('required',array(
                    'type' => 'select',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Required'),
                    'opt_val_pairs' => array(
                        0 => $this->translate->t('No'),
                        1 => $this->translate->t('Yes'),
                    ),
                    'validation' => ''
                ))
                ->add_field('enabled',array(
                    'type' => 'select',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Enabled'),
                    'opt_val_pairs' => array(
                        0 => $this->translate->t('No'),
                        1 => $this->translate->t('Yes'),
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
                    "target" => "options",
                    "observed_field" => "type",
                    "value" => "select"
                ))
                ->add_submit(array(
                    'label' => $this->translate->t('Save'),
                    'css_class' => 'btn btn-primary btn-large'
                ));
    }
}


