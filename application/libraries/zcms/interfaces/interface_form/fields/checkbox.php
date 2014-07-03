<?php

class Checkbox extends Fields {
    
    public function render()
    {
        if($this->settings['checked'] === NULL)
            $this->settings['checked'] = 1;
        
        $checked = ($this->settings['checked'] == $this->value) ? 'checked' : NULL;
        $this->rendered = '<input type="hidden" name="'.$this->settings['name'].'" value="0" />';
        $this->rendered .= '<input type="checkbox"
                                  name="'.$this->settings['name'].'"
                                  class="'.$this->settings['css_class'].'"
                                  id="'.$this->settings['css_id'].'"
                                  value="'.$this->settings['checked'].'"
                                         '.$checked.'>';
    }
}

