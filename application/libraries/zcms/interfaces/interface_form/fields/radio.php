<?php

class Radio extends Fields {
    
    public function render()
    {
        $this->settings["opt_val_pairs"] = $this->settings["opt_val_pairs"] 
                                           ? $this->settings["opt_val_pairs"] 
                                           : $this->_get_select_pairs();
        
        if($this->settings["opt_val_pairs"])
        {
            $this->settings["opt_val_pairs"] = json_decode($this->settings["opt_val_pairs"]);
            
            foreach($this->settings["opt_val_pairs"] as $opt => $val)
            {    
                $selected = ($this->value == $val) ? "checked" : NULL;
                $this->rendered .= '<input type="radio" 
                                          class="'.$this->settings['css_class'].'"
                                          id="'.$this->settings['css_id'].'"
                                          name="'.$this->settings['name'].'"
                                          value="'.$val.'"
                                                 '.$this->settings['disabled'].'
                                                 '.$selected.'>'.$opt;
            }
        }
    }
}

