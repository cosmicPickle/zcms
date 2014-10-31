<?php

class Textarea extends Fields {
    
    public function render()
    {
        $this->rendered = '<textarea class="'.$this->settings['css_class'].' tiny_mce"
                                     id="'.$this->settings['css_id'].'"
                                     name="'.$this->settings['name'].'"
                                           '.$this->settings['disabled'].'>
                                 ' . $this->value . '
                           </textarea>';
    }
}

