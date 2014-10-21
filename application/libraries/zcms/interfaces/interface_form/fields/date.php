<?php

class Date extends Fields {
    
    public function render()
    {
        $this->rendered = '<input type="'.$this->settings['type'].'" 
                                  class="'.(($this->settings['css_class']) ? $this->settings['css_class'] : 'form-control').' datepicker"
                                  id="'.$this->settings['css_id'].'"
                                  name="'.$this->settings['name'].'"
                                  value="'.$this->value.'"
                                  data-disable-past="'.$this->settings['disable_past'].'"
                                        '.$this->settings['disabled'].'/>';
    }
}

