<?php

class Product_Filters extends Interface_form{
    
    public function setup($form)
    {
        return $form->add_field('name',array(
                    'type' => 'text',
                    'disabled_on_update' => TRUE,
                    'description' => $this->translate->t("This is a system field. It cannot be changed."),
                    'label' => $this->translate->t('Name'),
                    'validation' => 'required|word'
                ))
                ->add_field('label',array(
                    'type' => 'text',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Label'),
                    'validation' => 'required'
                ))
                ->add_field('active_for',array(
                    'type' => 'select',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Active for'),
                    'opt_val_pairs' => array(
                        '0' => $this->translate->t("All")
                    ),
                    'link_table' => 'product_filter_values',
                    'link_opt_column' => 'id',
                    'link_val_column' => 'value',
                    'link_query' => "t1.filter_id = 'section'",
                    'validation' => ''
                ))
                ->add_field('type',array(
                    'type' => 'select',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Type'),
                    'opt_val_pairs' => array(
                        'select' => $this->translate->t("Select"),
                        'checkbox' => $this->translate->t("Checkbox"),
                    ),
                    'validation' => ''
                ))
                ->add_submit(array(
                    'label' => $this->translate->t('Save'),
                    'css_class' => 'btn btn-primary btn-large'
                ));
    }
}

