<?php

class Image extends Fields {
    
    //Files loaded from an external folder
    protected $loaded_files;
    
    //These will be used to parse variables in image actions. The first pattern matches
    //{@var_name} and will be parsed to $current_image->var_name. The second one matches
    //{#var_name} and will be parsed to $this->raw_data[0]->var_name
    protected $paterns = array('file_var' => '/\{@(\w*)\}/','data_var' => '/\{#(\w*)\}/');
    
    public function render()
    {
        $this->_basic_file();
        
        if($this->setting('link_table') && $this->raw_data)
        {
            //We have a linked outer table where the images are stored we need to 
            //retrieve the values from that table
            $this->value = array();
            $db_file_entries = $this->db->select("*")
                                        ->where('rel_id', $this->raw_data[0]->id)
                                        ->get($this->setting('link_table'))
                                        ->result();
            
            foreach($db_file_entries as $img)
            {
                $index = count($this->value);
                $this->value[$index] = $img->file;
                $this->loaded_files[$index] = $img;
            }
            
        }
        
        //First we check if the values are already in array
        //We save a backup because even if it's not an array
        //The string might be a single value and not a valid JSON
        //(which is the case on external tables)
        if(($backup_value = $this->value) && !is_array($this->value))
            $this->value = json_decode($this->value);
        
        //If the json was invalid we return the initial value
        if(!$this->value && $backup_value && $backup_value != "[]")
            $this->value = array($backup_value);
        
        //If we still have no value, we have no files to load
        if(!$this->value)
            return NULL;
        
        $this->rendered .= '<div class="row mt">'; 
        $i = 1;
        
        foreach($this->value as $index => $file)
        {
            //If this the images are not loaded from a linked table we need to create 
            //the loaded_files array.
            if(!$this->setting('link_table'))
            {
                $this->loaded_files[$index] = new stdClass();
                $this->loaded_files[$index]->file = $file;
            }
            
            $this->rendered .= '<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 desc">
					<div class="project-wrapper">
                                            <div class="project" style="margin-bottom:3px;">
                                                <div class="photo-wrapper">
                                                    <div class="photo">
                                                        <a class="fancybox" href="'.base_url().self::UPLOADS_PATH.$this->settings['path'].$file.'">
                                                            <img class="img-responsive" src="'.base_url().self::UPLOADS_PATH.$this->settings['path'].self::THUMBS_PATH.self::SYS_TB_PREF.'_'.$file.'" alt=""></a>
                                                    </div>
                                                    <div class="overlay"></div>
                                                </div>
                                            </div>';
            
            
            //Adding the image controls
            if(!$this->setting('link_table'))
            {
                //We do not have a linke table only delete button is added
                if($this->setting('delete_action'))
                    $this->rendered .= "<a href='".$this->_parse_vars ($this->backend().$this->setting('delete_action'), $index)."' class='btn btn-block btn-danger btn-xs'>
                                           <i class='fa fa-trash-o fa-white'></i> " . $this->translate->t("Delete") . "
                                        </a>";
            }
            else
            {
                //We check the settings to see if we need to create Edit and Delete buttons
                if($this->setting('edit_action'))
                    $this->rendered .= "<a href='".$this->_parse_vars($this->backend().$this->setting('edit_action'), $index)."' class='btn btn-block btn-primary btn-xs'>
                                           <i class='fa fa-cog fa-white'></i> " . $this->translate->t("Edit") . "
                                        </a>";
                
                if($this->setting('delete_action'))
                    $this->rendered .= "<a href='".$this->_parse_vars ($this->backend().$this->setting('delete_action'), $index)."' class='btn btn-block btn-danger btn-xs'>
                                           <i class='fa fa-trash-o fa-white'></i> " . $this->translate->t("Delete") . "
                                        </a>";
                
            }
                                        
            $this->rendered .= "</div></div><!-- col-lg-4 -->";
            
            if($i % 6 == 0)
                $this->rendered .= '</div><div class="row mt">';
            
            $i++;
       }
       
       if($i - 1 % 6 != 0)
           $this->rendered .= '</div>'; 
    }

}

