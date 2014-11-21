<?php

class Content_Forms extends Module_Base {

    protected $forms_table = "content_forms";
    protected $form;
    
    public function fetch()
    {
        if(!$this->config->form->value)
            return NULL;
        
        $this->db->from($this->forms_table." as t1");
        $this->sql->add_lang_table($this->forms_table.$this->translate->get_table_sufix());
        $this->db->where('alias', $this->config->form->value);
        $this->form = $this->db->get()->row();
        
        if($this->form)
        {
            $this->db->from($this->forms_table." as t1");
            $this->sql->add_lang_table($this->forms_table.$this->translate->get_table_sufix());
            $this->db->where('parent_id', $this->form->id_);
            $this->db->order_by("order", "asc");
        
            $this->form->fields = $this->db->get()->result();
        }
        $this->view_data = array('form' => $this->form);
    }
    
    public function action()
    {
        $this->load->library('form_validation');
        
        if(!$this->input->post())
            return NULL;
        
        if(!$this->_validate())
            return NULL;
        
        $this->config->success->value = $this->_send();  
    }
    
    public function render()
    {
        if(!$this->config->form->value)
            return NULL;
        
        parent::render();
    }
    
    private function _validate() {
        
        $this->form_validation->set_message('required', $this->translate->t('The field %s is required.'));
        
        foreach($this->form->fields as $field)
        {
            if($field->required)
                $this->form_validation->set_rules($field->alias, $field->label, 'required');
        }
        
        return $this->form_validation->run();
    }
    
    private function _send()
    {
        $this->load->library('email');
        $config['charset'] = $this->config->email_charset->value;
        $config['mailtype'] = 'html';
                
        $this->email->initialize($config);

        $this->email->from($this->config->email_from->value);
        $this->email->to($this->config->email_to->value);

        $this->email->subject($this->form->label);
        $this->email->message($this->load->view(
            self::VIEWS_FRONTEND . 
            $this->zcms->zcms_config("theme")."/".
            self::VIEWS_MODULES.
            "content/emails/".
            $this->config->email_template->value,
        array('form' => $this->form, 'content' => (object)$this->input->post()), TRUE));

        $result = @$this->email->send();
        return $result;
    }
}

