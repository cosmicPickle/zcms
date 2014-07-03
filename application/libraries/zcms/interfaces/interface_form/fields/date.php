<?php

class Date extends Fields {
    
    public function render()
    {
        $this->rendered = '<input type="'.$this->settings['type'].'" 
                                  class="'.$this->settings['css_class'].' datepicker"
                                  id="'.$this->settings['css_id'].'"
                                  name="'.$this->settings['name'].'"
                                  value="'.$this->value.'"
                                        '.$this->settings['disabled'].'/>';
    }
}

