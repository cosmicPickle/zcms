<?php

class Html_Query extends Module_base {
    
    protected $admin_mail = NULL;
    protected $view = "html_query";
    protected $product_id;
    protected $product;
    
    protected $product_table = "product_products";
    protected $product_table_lang;
    
    public function render($view = NULL, $admin_mail = NULL) {
        
        $this->admin_mail = $admin_mail;
        
        if($view)
            $this->view = $view;
        
        $this->product_id = $this->input->get("code");
        
        $this->_load_product(); 
        if($this->input->post())
            $this->_send_query();
        
        $this->_load_view($this->view, array("query" => $this));
    }
    
    protected function _load_product()
    {
        if(!$this->product_id)
        {    
            $this->product = NULL;
            return NULL;
        }   
        $this->product_table_lang = $this->product_table.$this->translate->get_table_sufix();
        
        $this->db->from($this->product_table." as t1");
        $this->sql->add_lang_table($this->product_table_lang);
        $this->db->where('t1.code', $this->product_id);
        $this->product = $this->db->get()->row();
    }
    
    protected function _send_query()
    {
        if(!$this->admin_mail)
            return NULL;
        
        $has_errs = FALSE;
        if(!$this->input->post("name"))
        {
            $this->logs->log("INP_REQUIRED",$this->translate->t("Име"));
            $has_errs = TRUE;
        }
        if(!$this->input->post("phone"))
        {
            $this->logs->log("INP_REQUIRED",$this->translate->t("Телефон"));
            $has_errs = TRUE;
        }
        if(!$this->input->post("email"))
        {
            $this->logs->log("INP_REQUIRED",$this->translate->t("Имейл"));
            $has_errs = TRUE;
        }
        if(!$this->input->post("query"))
        {
            $this->logs->log("INP_REQUIRED",$this->translate->t("Вашето запитване"));
            $has_errs = TRUE;
        }
        
        if($has_errs)
            return NULL;
        
        ini_set('date.timezone', 'Europe/London');
        $this->load->library('email');
        $config['mailtype'] = 'html';
        
        $this->email->initialize($config);
        $this->email->from('no-reply@mmotors.bg', 'Administrator');
        $this->email->to($this->admin_mail); 
        
        $this->email->subject($this->translate->t('Потребителско Заптване'));
        $this->email->message($this->load->view(self::VIEWS_MODULES."html/emails/query", array('query' => $this), TRUE));
        
        
        if($this->email->send())
            $this->logs->log("MAIL_SUCCESS");
        else
            $this->logs->log("MAIL_ERROR");
        
        //echo $this->email->print_debugger();
    }
}
