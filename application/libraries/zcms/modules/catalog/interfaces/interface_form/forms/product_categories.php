<?php

class Product_Categories extends Interface_form{
    
    public function setup($form)
    {
        return $form->add_field('alias',array(
                    'type' => 'text',
                    'disabled_on_update' => TRUE,
                    'label' => $this->translate->t('Alias'),
                    'validation' => 'required'
                ))
                ->add_field('category',array(
                    'type' => 'text',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Category'),
                    'validation' => ''
                ))
/*               ->add_field('type',array(
                    'type' => 'select',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Type'),
                    'opt_val_pairs' => array(
                        "office" => $this->translate->t('Office'),
                        "public" => $this->translate->t('Public')
                    ),
                    'parent_column' => 'parent_id',
                    'validation' => ''
                ))
 */
                ->add_submit(array(
                    'label' => $this->translate->t('Save'),
                    'css_class' => 'btn btn-primary btn-large'
                ));
    }
}

