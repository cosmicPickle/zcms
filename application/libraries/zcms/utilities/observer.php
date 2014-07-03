<?php

class Observer extends ZCMS {
    
    protected $observers;
    protected $event_data;
    
    public function load_observers()
    {
        $this->observers = $this->fetcher->load_observers();
    }
    
    public function propagate(& $event)
    {
        $cought = FALSE;
        foreach($this->observers as $observer)
            if($observer->observes($event))
            {
                $observer->run($event);
                $cought = TRUE;
            }
            
       return $cought;
    }
    
    public function observes(& $event)
    {
        return method_exists($this, $event->name);
    }
    
    public function run(& $event)
    {
        
        $observer = new Observer();
        $observer->set_data($event);
        
        $this->{$event->name}($observer);
    }
    
    public function set_data(& $event)
    {
        $this->event_data = $event->params;
    }
    
    public function get_data()
    {
        return $this->event_data;
    }
}

