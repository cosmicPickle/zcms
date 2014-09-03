<?php

class Product_Filter extends Module_base {
    
    protected $filters;
    protected $section_filter;
    protected $filter_vals;
    
    protected $filters_table = "product_filters";
    protected $filters_table_lang;
    
    protected $filter_vals_table = "product_filter_values";
    protected $filter_vals_table_lang;
   
    public function render()
    {
        $this->load_filters();
        
        //Setting filters in order to render correctly set variables
        if($this->input->post('filters'))
            $this->session->set_userdata('filters',$this->input->post('filters'));
        
        $this->_load_view('products_filters', array('filter' => $this));
    }
    
    protected function load_filters()
    {
         $this->filters_table_lang = $this->filters_table.$this->translate->get_table_sufix();
         $this->filter_vals_table_lang = $this->filter_vals_table.$this->translate->get_table_sufix();
         
         $this->db->from($this->filters_table." as t1");
         $this->sql->add_lang_table($this->filters_table_lang);
         

         $this->event->trigger("product_filters_load_before");
         
         $filters = $this->db->get()->result();
         
         $this->event->trigger("product_filters_load_after");
         
         foreach($filters as $filter)
         {
             if($filter->name == 'section')
                 $this->section_filter = $filter;
             else
                 $this->filters[$filter->active_for][] = $filter;
         }
         
         //Loading filter values
         $this->db->from($this->filter_vals_table." as t1");
         $this->sql->add_lang_table($this->filter_vals_table_lang);
         $filter_vals = $this->db->get()->result();
         
         foreach($filter_vals as $val)
             $this->filter_vals[$val->filter_id][] = $val;
    }
}
