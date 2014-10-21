<?php

class Product_Products extends Interface_form{
    
    public function setup($form)
    {
        return $form->add_field('code',array(
                    'type' => 'text',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Code'),
                    'validation' => 'required'
                ))
                ->add_field('title',array(
                    'type' => 'text',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Title'),
                    'validation' => 'required'
                ))
                ->add_field('top_offer',array(
                    'type' => 'checkbox',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Deals'),
                    'validation' => ''
                ))
                ->add_field('images',array(
                    'type' => 'image',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Images'),
                    'path' => 'products/images/',
                    'link_table' => 'product_images',
                    'thumbs' => array("249x180","249x364" , "116x87", "85x120"),
                    'crop' => TRUE,
                    'size_limit' => 10,
                    'count_limit' => 10,
                    'ext_limit' => 'png|jpg|jpeg',
                    'edit_action' => 'pdimages/edit/{@id}',
                    'delete_action' => 'pdimages/delete/{@id}/{#id}',
                    'validation' => ''
                ))
                ->add_field('docs',array(
                    'type' => 'file',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Documents'),
                    'path' => 'products/docs/',
                    'link_table' => 'product_docs',
                    'size_limit' => 10,
                    'count_limit' => 1,
                    'ext_limit' => 'doc|docx|xls|xlsx|pdf',
                    'edit_action' => 'pddocs/edit/{@id}',
                    'delete_action' => 'pddocs/delete/{@id}/{#id}',
                    'validation' => ''
                ))
                ->add_field('description',array(
                    'type' => 'textarea',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Description'),
                    'validation' => ''
                ))
                ->add_submit(array(
                    'label' => $this->translate->t('Save'),
                    'css_class' => 'btn btn-primary btn-large'
                ));
    }
}

