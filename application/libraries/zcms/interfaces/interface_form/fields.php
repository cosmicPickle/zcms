<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');


/*
 * Fields class
 * 
 * @author Teodor Klissarov
 * @created 16.04.2013
 * 
 * This class will handle rendering of all the types of fields that will be supported by the Interface_form class
 * 
 */

class Fields extends Interface_form{
    
    protected $settings = array();
    protected $value = NULL;
    protected $rendered = NULL;
    
    public function __set($name, $value)
    {
        $this->settings[$name] = $value;
    }
 
    public function setting($setting, $value = NULL)
    {
        if(!$value) return $this->settings[$setting];
        else
            $this->settings[$setting] = $value;
    }
    
    public function value($val = NULL)
    {
        if(!$val) return $this->value;
        else
            $this->value = $val;
    }
    
    public function label()
    {
        return $this->settings['label'];
    }
    public function render()
    {
        $method = "_".$this->settings['type'];
        (method_exists($this, $method)) ? $this->{$method}() : NULL;
        $this->_add_script();
        
        return $this->rendered;
    }
    
    private function _add_script()
    {
        if($this->settings['script'])
        {    
            $this->rendered .= '<script type="text/javascript">';
            $this->rendered .= $this->settings['script'];
            $this->rendered .= '</script>';
        }           
    }
    
    private function _text()
    {
        $this->rendered = '<input type="'.$this->settings['type'].'" 
                                  class="'.$this->settings['css_class'].'"
                                  id="'.$this->settings['css_id'].'"
                                  name="'.$this->settings['name'].'"
                                  value="'.  htmlspecialchars($this->value, ENT_QUOTES).'"
                                        '.$this->settings['disabled'].'/>';
    }
    
    private function _password()
    {
        $this->_text();
    }
    
    private function _select()
    {
        $this->settings["opt_val_pairs"] = $this->settings["opt_val_pairs"] 
                                           ? $this->settings["opt_val_pairs"] 
                                           : $this->_get_select_pairs();
        
        if($this->settings["opt_val_pairs"])
        {
            //If this is a multiple select we need to change the name to an array
            //and decode the json values into another array and set the appropriate 
            $multiple = NULL;
            if($this->settings['multiple'])
            {
                $multiple = "multiple";
                $this->settings['name'] .= '[]';
                $this->value = json_decode($this->value);
                
            }
            
            //If the select is multiple and nothing is selected the corresponding POST variable
            //will be empty. That's why we set up a backup hidden field
            $this->rendered = "<input type='hidden' name='".$this->settings['name']."' value=''>";
            $this->rendered .= '<select '.$multiple.' class="'.$this->settings['css_class'].'"
                                   id="'.$this->settings['css_id'].'"
                                   name="'.$this->settings['name'].'"
                                        '.$this->settings['disabled'].'>';
            
            $this->settings["opt_val_pairs"] = json_decode($this->settings["opt_val_pairs"]);
            
            foreach($this->settings["opt_val_pairs"] as $opt => $val)
            {   
                //If it is a multiple select the selected flag needs to be determined by searching the 
                //array of values
                if($this->settings['multiple'] && is_array($this->value))
                    $selected = in_array($opt, $this->value) ? "selected" : NULL;
                else
                    $selected = ($this->value == $opt) ? "selected" : NULL;

                $this->rendered .= '<option value="'.$opt.'" ' . $selected . '> '.$val.' </option>';
            }
            
            $this->rendered .= "</select>";
        }
    }
    
    private function _radio()
    {
        $this->settings["opt_val_pairs"] = $this->settings["opt_val_pairs"] 
                                           ? $this->settings["opt_val_pairs"] 
                                           : $this->_get_select_pairs();
        
        if($this->settings["opt_val_pairs"])
        {
            $this->settings["opt_val_pairs"] = json_decode($this->settings["opt_val_pairs"]);
            
            foreach($this->settings["opt_val_pairs"] as $opt => $val)
            {    
                $selected = ($this->value == $val) ? "checked" : NULL;
                $this->rendered .= '<input type="radio" 
                                          class="'.$this->settings['css_class'].'"
                                          id="'.$this->settings['css_id'].'"
                                          name="'.$this->settings['name'].'"
                                          value="'.$val.'"
                                                 '.$this->settings['disabled'].'
                                                 '.$selected.'>'.$opt;
            }
        }
    }
    
    private function _get_select_pairs()
    {
        if(!$this->settings['link_table'] || !$this->settings['link_opt_column'] || !$this->settings['link_val_column'])
            return NULL;
       
        $link_table = $this->settings['link_table'];
        $link_oc = $this->settings['link_opt_column'];
        $link_vc = $this->settings['link_val_column'];
        
        $link_table_lang = $this->translate->get_table_sufix() 
                           ? $link_table.$this->translate->get_table_sufix()
                           : NULL;
        
        if($link_table_lang)
            $pairs_raw = $this->db->select("t1." . $link_oc . ", IFNULL(t2." . $link_vc . ", t1." . $link_vc . ") as " . $link_vc,FALSE)
                              ->from($link_table." as t1")
                              ->join($link_table_lang." as t2", "t1.id = t2.id_", "left")
                              ->where("t2.lang_id = '" . $this->translate->get_lang() . "' OR t2.lang_id IS NULL")
                              ->get()
                              ->result();
        else
            $pairs_raw = $this->db->select("t1." . $link_oc . ", t1." . $link_vc)
                              ->from($link_table." as t1")
                              ->get()
                              ->result();
        
        $pairs = array();
        foreach($pairs_raw as $p)
            $pairs[$p->$link_oc] = $p->{$link_vc};
            
        return json_encode($pairs);
    }
    
    private function _textarea()
    {
        $this->rendered = '<textarea class="'.$this->settings['css_class'].' tiny_mce"
                                     id="'.$this->settings['css_id'].'"
                                     name="'.$this->settings['name'].'"
                                           '.$this->settings['disabled'].'>
                                 ' . $this->value . '
                           </textarea>';
    }
    
    private function _checkbox()
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
    
    private function _date()
    {
        $this->rendered = '<input type="'.$this->settings['type'].'" 
                                  class="'.$this->settings['css_class'].' datepicker"
                                  id="'.$this->settings['css_id'].'"
                                  name="'.$this->settings['name'].'"
                                  value="'.$this->value.'"
                                        '.$this->settings['disabled'].'/>';
    }
    
    private function _file()
    {
        $this->_basic_file();
        
        if($this->value)
        {    
            $this->rendered .= "<table class='table table-hover span5'>
                                    <tr><th colspan='2'> Filename </th></tr>";
            $this->value = json_decode($this->value);

            foreach($this->value as $file)
                $this->rendered .= "<tr id='zcms-file-". str_replace('.', '', strtolower($file)) ."'>
                                        <td>".$file."</td><td><a href='#' class='btn btn-danger zcms-action zcms-del-file-conf'
                                                                          data-table='".$this->zcms->interface->form->data_table."'
                                                                          data-id='".$this->zcms->interface->form->raw_data[0]->id."'
                                                                          data-file='".$file."'
                                                                          data-field='".$this->settings['name']."'
                                                                          data-conf='" . $this->translate->t("Are you sure you want to delete this file") . "?'>
                                                                    <i class='icon-trash icon-white'></i> " . $this->translate->t("Delete") . " 
                                                              </a>
                                                          </td>
                                                      </tr>";
            $this->rendered .= "</table>";
        }     
    }
    
    private function _image()
    {
        $this->_basic_file();
        
        if($this->value)
        {    
            $this->value = json_decode($this->value);

            $this->rendered .= '<ul class="thumbnails">'; 
            foreach($this->value as $file)
                $this->rendered .= "<li id='zcms-file-". str_replace('.', '', strtolower($file)) ."'>
                                        <div class='thumbnail'>
                                            <a href='".base_url().self::UPLOADS_PATH.$this->settings['path'].$file."'>
                                                <img src='".base_url().self::UPLOADS_PATH.$this->settings['path'].self::THUMBS_PATH.self::SYS_TB_PREF.'_'.$file."' class='img-polaroid' style='margin:0 10px;'>
                                            </a>
                                            <p><a href='#' class='btn btn-block btn-danger zcms-action zcms-del-file-conf'
                                                                          data-table='".$this->zcms->interface->form->data_table."'
                                                                          data-id='".$this->zcms->interface->form->raw_data[0]->id."'
                                                                          data-file='".$file."'
                                                                          data-field='".$this->settings['name']."'
                                                                          data-conf='" . $this->translate->t("Are you sure you want to delete this file") . "?'
                                                                          style='margin:10px 0 0 0;'>
                                                    <i class='icon-trash icon-white'></i> " . $this->translate->t("Delete") . "
                                            </a></p>
                                        </div>
                                    </li>";
            $this->rendered .= '</ul>';
        }   
    }
    
    private function _basic_file()
    {
        $this->rendered = '<input type="file" 
                                  class="'.$this->settings['css_class'].'"
                                  id="'.$this->settings['css_id'].'"
                                  name="'.$this->settings['name'].($this->settings['count_limit'] == 1 ? NULL : '[]').'"
                                        '.$this->settings['disabled'].'
                                        '.($this->settings['count_limit'] == 1 ? NULL : 'multiple').'/>';
        
        $this->rendered .= "<div class='help-block'><small>";
        $this->rendered .= $this->translate->t("You can upload") . ": <strong>".($this->settings['ext_limit'] ? $this->settings['ext_limit'] : 'Any File')."</strong><br/>";
        $this->rendered .= $this->translate->t("Max file size") . ": <strong>".($this->settings['size_limit'] ? $this->settings['size_limit']." MB" : 'Any size')."</strong><br/>";
        $this->rendered .= $this->translate->t("Max files") . ": <strong>".($this->settings['count_limit'] ? $this->settings['count_limit'] : 'Any size')."</strong><br/>";
        $this->rendered .= "</small></div>";
    }
    
    private function _submit()
    {
        $this->rendered = '<input type="'.$this->settings['type'].'" 
                                  class="'.$this->settings['css_class'].'"
                                  id="'.$this->settings['css_id'].'"
                                  name="'.$this->settings['name'].'"
                                  value="'.$this->settings['label'].'"/>';
    }
}

/* End of file fields.php */
/* Location: ./application/libraries/zcms/utilities/fields.php  */
