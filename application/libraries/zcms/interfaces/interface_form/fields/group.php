    <?php

class Group extends Fields {
    
    public function render()
    {
        if($this->raw_data[0])
            $this->value = json_decode($this->raw_data[0]->{$this->setting('name')});
        
        $key = 0;
        if($this->value)
        {
            
            
            foreach($this->value as $key => $line)
            {
                $this->rendered .= $this->setting("group_open");
                foreach($this->settings['group_columns'] as $column)
                {
                    $field = new Fields();
                    $field->settings = array_merge($field->settings, $column);
                    if(isset($line->{$field->setting('name')}))
                        $field->value($line->{$field->setting('name')});
                    $field->setting('name', $this->setting('name')."[".$key."][".$field->setting('name')."]");

                    //Setting data tables, raw data etc.
                    $field->data_table = $this->data_table;
                    $field->data_table_lang = $this->data_table_lang;
                    $field->caller = $this->caller;
                    $field->raw_data = $this->raw_data;

                    $this->rendered .= $this->setting("group_column_open");
                    $this->rendered .= "<label>".$field->setting('label')."</label>";
                    $this->rendered .= $field->render().$this->setting("group_column_close");
                }
                $this->rendered .= '<button type="button" class="close grp-close" aria-label="Close"><span aria-hidden="true">&times;</span></button>';
                $this->rendered .= $this->setting("group_close");
            }
            $key++;
        }
        
        if($key == 0)
        {
            $this->rendered .= $this->setting("group_open");
            foreach($this->settings['group_columns'] as $column)
            {
                $field = new Fields();
                $field->settings = array_merge($field->settings, $column);
                $field->setting('name', $this->setting('name')."[".$key."][".$field->setting('name')."]");
                //Setting data tables, raw data etc.
                $field->data_table = $this->data_table;
                $field->data_table_lang = $this->data_table_lang;
                $field->caller = $this->caller;
                $field->raw_data = $this->raw_data;
                $field->settings['css_class'] .= (($field->settings['css_class']) ? " grp-column" : " form-control grp-column");
                $this->rendered .= $this->setting("group_column_open");
                $this->rendered .= "<label>".$field->setting('label')."</label>";
                $this->rendered .= $field->render().$this->setting("group_column_close");
            }
            $key ++;
            $this->rendered .= '<button type="button" class="close grp-close" aria-label="Close"><span aria-hidden="true">&times;</span></button>';
            $this->rendered .= $this->setting("group_close");
        }
        
        $this->rendered .= "<input type='hidden' class='grp-control' data-next='".$key."' data-name='".$this->setting('name')."'>";
        $this->rendered .= "<button class='grp-add btn btn-primary'>".$this->translate->t('Add')."</button>";
    } 
}
