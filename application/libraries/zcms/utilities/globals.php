<?php

class Globals extends ZCMS {
    
    protected $globals;
    
    public function get($gb)
    {
        if(!$this->has($gb))
          return NULL;
        
        return $this->globals[$gb];
    }
    
    public function set($gb, $val)
    {
        $this->globals[$gb] = $val;
    }
    
    public function has($gb)
    {
        return isset($this->globals[$gb]);
    }
}