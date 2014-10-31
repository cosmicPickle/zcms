<?php

class Event extends ZCMS {
    
    protected $events;
    
    public function trigger($name, & $params = NULL)
    {
        if(!isset($this->events[$name]))
        {
            $this->events[$name] = new stdClass();
            $this->events[$name]->name = $name;
        }
        
        $this->events[$name]->propagated = 0;
        $this->events[$name]->params = $params;
        
        
        
        if($this->observer->propagate($this->events[$name]))
            $this->events[$name]->propagated = 1;
           
    }
}
