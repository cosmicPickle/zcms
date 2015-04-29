<?php

class Catalog_Products extends Interface_form{
    
    public function setup($form)
    {
        $form->add_field('code',array(
                    'type' => 'text',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Code'),
                    'validation' => 'required'
                ))
                ->add_field('keywords',array(
                    'type' => 'text',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Meta Keywords'),
                    'validation' => ''
                ))
                ->add_field('meta_description',array(
                    'type' => 'text',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Meta Description'),
                    'validation' => ''
                ))
                ->add_field('categories',array(
                    'type' => 'select',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Categories'),
                    'link_table' => 'catalog_categories',
                    'link_opt_column' => 'id',
                    'link_val_column' => 'category',
                    'opt_val_pairs' => array(
                        '0' => $this->translate->t("Top")
                    ),
                    'parent_column' => 'parent',
                    'multiple' => TRUE,
                    'validation' => ''
                ))
                ->add_field('type',array(
                    'type' => 'select',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Type'),
                    'link_table' => 'catalog_types',
                    'link_opt_column' => 'id',
                    'link_val_column' => 'label',
                    'opt_val_pairs' => array(
                        '0' => $this->translate->t("Default")
                    ),
                    'description' => $this->translate->t('Please save in order to view/modify the new type\'s attributes'),
                    'validation' => ''
                ));
        
    $form_data = $form->get_raw_data();
    if($form_data && $form_data[0]->type)
    {
        $this->db->where('t1.id',$form_data[0]->type)
                 ->from('catalog_types as t1');
        $type = $this->zcms->sql->add_lang_table('catalog_types_lang') 
                                ->get()
                                ->row();
        
        if(json_decode($type->attributes))
            foreach(json_decode($type->attributes) as $attr)
            {
                if($attr->alias && $attr->label)
                    $form->add_field('attributes['.$attr->alias.']',array(
                        'type' => 'text',
                        'disabled_on_update' => FALSE,
                        'label' => $attr->label,
                        'validation' => ''
                    ));
            }
    }
    
    $form->add_field('title',array(
                    'type' => 'text',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Title'),
                    'validation' => 'required'
                ))
                ->add_field('images',array(
                    'type' => 'image',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Images'),
                    'path' => 'catalog/products/images/',
                    'link_table' => 'catalog_product_images',
                    'thumbs' => array("150x150"),
                    'crop' => TRUE,
                    'size_limit' => 10,
                    'count_limit' => 10,
                    'ext_limit' => 'png|jpg|jpeg',
                    'edit_action' => 'catalog/product_image_edit/{@id}',
                    'delete_action' => 'catalog/product_image_delete/{@id}/{#id}',
                    'validation' => ''
                ))
                ->add_field('docs',array(
                    'type' => 'file',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Documents'),
                    'path' => 'catalog/products/docs/',
                    'link_table' => 'catalog_product_docs',
                    'size_limit' => 10,
                    'count_limit' => 1,
                    'ext_limit' => 'doc|docx|xls|xlsx|pdf',
                    'edit_action' => 'catalog/product_doc_edit/{@id}',
                    'delete_action' => 'catalog/product_doc_delete/{@id}/{#id}',
                    'validation' => ''
                ))
                ->add_field('video',array(
                    'type' => 'text',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Video'),
                    'validation' => ''
                ))
                ->add_field('description',array(
                    'type' => 'textarea',
                    'disabled_on_update' => FALSE,
                    'label' => $this->translate->t('Description'),
                    'validation' => ''
                ));
    
    
    return $form->add_submit(array(
                    'label' => $this->translate->t('Save'),
                    'css_class' => 'btn btn-primary btn-large'
                ));
    }
}

