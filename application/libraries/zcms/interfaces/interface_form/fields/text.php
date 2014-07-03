<?php

class Text extends Fields {
    
    public function render()
    {
        $this->rendered = '<input type="'.$this->settings['type'].'" 
                                  class="'.$this->settings['css_class'].'"
                                  id="'.$this->settings['css_id'].'"
                                  name="'.$this->settings['name'].'"
                                  value="'.  htmlspecialchars($this->value, ENT_QUOTES).'"
                                        '.$this->settings['disabled'].'/>';
    }
}

