<?php

class Textarea extends Fields {
    
    public function render()
    {
        $this->rendered = '<textarea class="'.$this->settings['css_class'].' '.($this->settings['tiny_mce'] ? 'tiny_mce' : NULL).'"
                                     id="'.$this->settings['css_id'].'"
                                     name="'.$this->settings['name'].'"
                                           '.$this->settings['disabled'].'>' . $this->value . '</textarea>';
    }
}

