<?php

class Elfinder extends Fields {
    
    public function render() {
        
        $this->rendered .= "<a class='btn btn-info elfinder-init'>".$this->translate->t("File Manager")."</a>";
        return $this->rendered;
    }
}