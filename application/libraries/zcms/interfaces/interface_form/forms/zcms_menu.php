<?php

class Zcms_Menu extends Interface_form{
    
    public function setup($form)
    {
        return $form->add_field('label',array(
                    'type' => 'text',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Label'),
                    'validation' => 'required'
                ))
                ->add_field('controller',array(
                    'type' => 'text',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Controller'),
                    'validation' => ''
                ))
                ->add_field('method',array(
                    'type' => 'text',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Method'),
                    'validation' => ''
                ))
                ->add_field('tail',array(
                    'type' => 'text',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Tail'),
                    'validation' => ''
                ))
                ->add_field('access',array(
                    'type' => 'text',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('access'),
                    'validation' => 'required'
                ))
                ->add_field('parent',array(
                    'type' => 'select',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Parent'),
                    'link_table' => 'zcms_menu',
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
                ->add_field('icon',array(
                    'type' => 'text',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Icon'),
                    'validation' => ''
                ))
                ->add_submit(array(
                    'label' => $this->translate->t('Save'),
                    'css_class' => 'btn btn-primary btn-large'
                ));
    }
}


