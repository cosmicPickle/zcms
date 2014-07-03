<?php

class Core_Observer extends Observer {

    /**
     * This observer sets the value for all passwords fields to 0000000000
     * so that when the form is send the modify_before observer can distinguish
     * a modified from an unmodified password
     * 
     * @param type $observer
     * @return null
     */
    public function interface_form_field_render_before($observer) {
        
        $field = $observer->get_data();
        if($field->setting('type') != 'password')
            return NULL;
        
        $field->value("0000000000");
    }
    
    /**
     * This observer ignores password variables if they are the default value,
     * applies md5 otherwise
     * 
     * @param type $observer
     */
    public function interface_form_modify_before($observer) {
        
        $data = $observer->get_data();
        if(isset($data->password))
        {
            if($data->password == '0000000000')
                unset($data->password);
            else
                $data->password = $this->auth->enc($data->password);
        }
    }
}

