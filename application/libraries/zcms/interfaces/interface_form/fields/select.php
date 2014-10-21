<?php

class Select extends Fields {
    
    public function render()
    {
        $db_pairs = json_decode(!$this->settings['parent_column'] ? $this->_get_select_pairs() :
                                                        $this->_get_select_pairs_recursive());
        
        if($db_pairs)
            foreach($db_pairs as $opt => $val)
                 $this->settings["opt_val_pairs"][$opt] = $val;
        
        if($this->settings["opt_val_pairs"])
        {
            //If this is a multiple select we need to change the name to an array
            //and decode the json values into another array and set the appropriate 
            $multiple = NULL;
            if($this->settings['multiple'])
            {
                $multiple = "multiple";
                $this->settings['name'] .= '[]';
                $this->value = json_decode($this->value);
                
            }
            
            //If the select is multiple and nothing is selected the corresponding POST variable
            //will be empty. That's why we set up a backup hidden field
            $this->rendered = "<input type='hidden' name='".$this->settings['name']."' value=''>";
            $this->rendered .= '<select '.$multiple.' class="'.(($this->settings['css_class']) ? $this->settings['css_class'] : 'form-control').'"
                                   id="'.$this->settings['css_id'].'"
                                   name="'.$this->settings['name'].'"
                                        '.$this->settings['disabled'].'>';
            
            if(is_string($this->settings["opt_val_pairs"]))
                $this->settings["opt_val_pairs"] = json_decode($this->settings["opt_val_pairs"]);
            
            foreach($this->settings["opt_val_pairs"] as $opt => $val)
            {   
                //If it is a multiple select the selected flag needs to be determined by searching the 
                //array of values
                if($this->settings['multiple'] && is_array($this->value))
                    $selected = in_array($opt, $this->value) ? "selected" : NULL;
                else
                    $selected = ($this->value == $opt) ? "selected" : NULL;

                $this->rendered .= '<option value="'.$opt.'" ' . $selected . '> '.$val.' </option>';
            }
            
            $this->rendered .= "</select>";
        }
    }
    
    protected function _get_select_pairs_recursive($parent = 0, $level = 0, & $pairs = array())
    {
        if(!$this->settings['link_table'] || !$this->settings['link_opt_column'] || !$this->settings['link_val_column'])
            return NULL;
       
        $link_table = $this->settings['link_table'];
        $link_oc = $this->settings['link_opt_column'];
        $link_vc = $this->settings['link_val_column'];
        if(count(explode('.',$link_vc)) == 1)
            $link_vc_full = "t2.".$link_vc;
        else
        {
            $link_vc_full = $link_vc;
            $link_vc = explode('.',$link_vc);
            $link_vc = $link_vc[1];
        }
        
        $link_table_lang = $this->translate->get_table_sufix() 
                           ? $link_table.$this->translate->get_table_sufix()
                           : NULL;
        
        if($link_table_lang)
            $pairs_raw = $this->db->select("t1." . $link_oc . ", ". $link_vc_full . ", t1.id ",FALSE)
                              ->from($link_table." as t1")
                              ->join($link_table_lang." as t2", "t1.id = t2.id_", "left")
                              ->where("(t2.lang_id = '" . $this->translate->get_lang() . "' OR t2.lang_id IS NULL)")
                              ->where($this->setting('parent_column')." = '".$parent."'")
                              ->get()
                              ->result();
        else
            $pairs_raw = $this->db->select("t1." . $link_oc . ", t1." . $link_vc.", t1.id")
                              ->from($link_table." as t1")
                              ->where($this->setting('parent_column'), $parent)
                              ->get()
                              ->result();
        
        foreach($pairs_raw as $p)
        {
            $pairs[$p->$link_oc] = str_repeat("&nbsp;", $level*4).$p->{$link_vc};
            $this->_get_select_pairs_recursive($p->id, $level + 1, $pairs);
        }
            
        return json_encode($pairs);
    }
}

