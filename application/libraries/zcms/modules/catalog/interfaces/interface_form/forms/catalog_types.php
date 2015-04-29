<?php

class Catalog_Types extends Interface_form{
    
    public function setup($form)
    {
        return $form->add_field('alias',array(
                    'type' => 'text',
                    'disabled_on_update' => TRUE,
                    'label' => $this->translate->t('Alias'),
                    'validation' => 'required'
                ))
                ->add_field('label',array(
                    'type' => 'text',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Type'),
                    'validation' => ''
                ))
                ->add_field('attributes',array(
                    'type' => 'group',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Atributes'),
                    'validation' => '',
                    'group_columns' => array(
                        array(
                            'name' => 'alias',
                            'type' => 'text',
                            'disabled_on_update' => FALSE,
                            'label' => $this->translate->t('Attribute alias')
                        ),
                        array(
                            'name' => 'label',
                            'type' => 'text',
                            'disabled_on_update' => FALSE,
                            'label' => $this->translate->t('Attribute label')
                        ),
                    ),
                    'group_column_open' => "<div class='col-md-6'>",
                    'group_column_close' => "</div>",
                    'group_open' => '<div class="form-group">',
                    'group_close' => '</div>'
                ))
 
                ->add_submit(array(
                    'label' => $this->translate->t('Save'),
                    'css_class' => 'btn btn-primary btn-large'
                ));
    }
}

