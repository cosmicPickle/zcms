<?php

class Product_Filter_Values extends Interface_form{
    
    public function setup($form)
    {
        return $form->add_field('filter_id',array(
                    'type' => 'select',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Filter'),
                    'link_table' => 'product_filters',
                    'link_opt_column' => 'name',
                    'link_val_column' => 'label',
                    'validation' => 'required'
                ))
                ->add_field('value',array(
                    'type' => 'text',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Value'),
                    'validation' => 'required'
                ))
                ->add_submit(array(
                    'label' => $this->translate->t('Save'),
                    'css_class' => 'btn btn-primary btn-large'
                ));
    }
}

