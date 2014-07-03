<?php

class Product_Categories extends Interface_form{
    
    public function setup($form)
    {
        return $form->add_field('category',array(
                    'type' => 'text',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Category'),
                    'validation' => 'required'
                ))
                ->add_field('parent_id',array(
                    'type' => 'select',
                    'disabled_on_update' => FALSE,
                    'label' => 'Parent Id',
                    'link_table' => 'product_categories',
                    'link_opt_column' => 'id',
                    'link_val_column' => 'category',
                    'parent_column' => 'parent_id',
                    'validation' => ''
                ))
                ->add_submit(array(
                    'label' => $this->translate->t('Save'),
                    'css_class' => 'btn btn-primary btn-large'
                ));
    }
}

