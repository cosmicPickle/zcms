<?php

class Content_Search extends Module_Base {
    
    var $searches_path;
    var $searches_folder = "searches";
    var $results = array();
    
    public function fetch()
    {
        if($this->input->get('s'))
            $this->config->s->value = $this->input->get('s');
        
        if(!$this->config->s->value)
            return NULL;
        
        $this->searches_path = realpath(__DIR__.'/'.$this->searches_folder);
        
        $handle = opendir($this->searches_path);
        while($file = readdir($handle))
        {
            if($file == "." || $file == "..")
                continue;
            
            $class = explode(".", $file);
            $class = $class[0];
            $this->load->library(ZCMS::MODULES_PATH.'content/'.$this->searches_folder."/".$class);
            
            if(method_exists($class, 'search'))
            {
               $this->{$class}->config = & $this->config;
               $results = $this->{$class}->search();
               if($results)
                   $this->results = array_merge($this->results, $results);
            } 
        }
        
        $this->view_data = array('sresults' => $this->results);
    }
    
    public function render()
    {
        if(!$this->config->s->value)
            return NULL;
        
        parent::render();
    }
    
    public function highlight_search($val) 
    {
        if(!$this->config->highlight_search->value)
           return $val;
        
        $s = urldecode($this->config->s->value);
        $replace = sprintf($this->config->highlighter->value, $s);
        $val = str_ireplace($s, $replace, $val);
        
        return $val;
    }
    
    public function trim_search($val)
    {
        if(!$this->config->trim_search->value || $this->config->max_search_content->value == 0)
           return $val;
        
        //The value is too short to trim
        if(mb_strlen($val) < $this->config->max_search_content->value)
            return $val;
        
        $s = urldecode($this->config->s->value);
        
        //If there is no match in this text trim directly
        if(mb_stripos($val, $s) === FALSE)
        {
            $cut_at = $this->config->max_search_content->value;
            while($val[$cut_at] != ' ')
                $cut_at ++;
            
            $val = mb_strcut($val,0,$cut_at). " ...";
        }
        else
        {
            //Cutting with search in the middle
            $strlen = mb_strlen($s);
            $val_strlen = mb_strlen($val);
            $offset = $this->config->max_search_content->value - $strlen;
            $spos = (int) ceil(mb_stripos($val, $s) - $offset/2);
            
            //If the starting position turns out to be below zero we set it to zero
            if($spos < 0)
                $spos = 0;
            
            $cut_at = $spos + $this->config->max_search_content->value;
            
            //We don't want to end up trying to cut after the string's length
            if($cut_at >= $val_strlen)
                $cut_at = mb_strlen($val);
            else
            {
                while($val[$cut_at] != ' ' && $spos + $cut_at < $val_strlen)
                {
                    
                    $cut_at ++;
                }
            }
            
            $val = mb_strcut($val,$spos,$cut_at);
            if($spos != 0)
                $val = "... " . $val;
            
            if($cut_at != $val_strlen)
                $val = $val . "...";   
        }
        
        $this->purifier->init();
        $this->purifier->create();
        if($this->config->purifier_allowed_tags->value)
                $this->purifier->set("HTML.Allowed", $this->config->purifier_allowed_tags->value);
        
        $val = $this->purifier->clean($val);
        
        return $val;
    }
    
}