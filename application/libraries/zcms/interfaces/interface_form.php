<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');


/*
 * Form Interface class
 * 
 * @author Teodor Klissarov
 * @created 15.04.2013
 * 
 * This class will interface the database and handle creating, modifing and viewing forms.
 * 
 */

class Interface_form extends Interface_base {
    
    //Any libraries that are needed for the Form interface to work will be in this folder
    const INCLUDES_FOLDER = "interface_form/";
    //The folder which contains the form setup classes
    const FORMS_FOLDER = "interface_form/forms/";
    //The default view that is used for rendering forms
    const FORM_DEFAULT_VIEW = "zforms";
    
    //The form interfaces can upload images, this constant shows where the image thumbnails will be 
    //saved relative to the upload path
    const THUMBS_PATH = "thumbs/";
    //The form interface creates one system thumb, that is displayed in the field layout. This is its prefix 
    //(also dictates the thumb's dimentions) 
    const SYS_TB_PREF = "125x90";
    
    //The table affix which is used to create the names of all the system tables used by the form interface
    protected $table_affix = "zcms_form";
    //The table with basic settings
    protected $table_basic;
    //Advanced settings include visibility on add/update as well as form validation
    protected $table_advanced;
    //The table with field specific options. Does not include files and images
    protected $table_fspec;
    //This one does. The files and images folder
    protected $table_fi;
    //The language folder for any setting that requires translation
    protected $table_lang;
    //This variable saves the insert id on insert or the update id on update
    protected $modify_id;
    
    //An array containing the generated fields' names for keys and their settings for values
    protected $fields;
    //The submit field of the form
    protected $submit;
    //The url to which the page will redirect once the form is esecuted
    protected $redirect;
    //This flag shows if the form has received any $_POST and modified the table
    protected $modified = FALSE;
    
    //The form interface has the ability to parse certain patterns into environmental variables, this variable shows
    //which settings should be parsed
    protected $meta_parse_for      = array("script", "opt_val_pairs", "link_table", "link_query", "link_opt_column", "link_val_column");
    //These are the templates that are looked up in every of the above settings
    protected $meta_lang_templates = array('field_value' => '/{@(\w*)}/', 
                                         'class_constant' => '/{c@(\w*::[A-Z_]*)}/', 
                                         'init_params' => '/{#(\w*)}|{#(\w*)->(\w*)\[\'?\"?(\w*)\'?\"?\]}/');

/*
 * __construct()
 * 
 * The constructor initializes the table names. It also loads libraries needed for the form interface to work.
 * 
 */
    public function __construct()
    {
        parent::__construct();
        
        $this->table_basic = $this->table_affix."_basic";
        $this->table_advanced = $this->table_affix."_advanced";
        $this->table_fspec = $this->table_affix."_fspec";
        $this->table_fi = $this->table_affix."_fi";
        
        if($this->translate->get_table_sufix())
            $this->table_lang = $this->table_affix.$this->translate->get_table_sufix();
        else
            $this->table_lang = NULL;
        
        $this->load->helper('form');
        $this->load->library('upload');
        
        //This one contains the fields class
        $this->load->library(self::INTERFACE_FOLDER.self::INCLUDES_FOLDER."fields");
        
        //This one is responsible for image manipulation
        $this->load->library(self::INTERFACE_FOLDER.self::INCLUDES_FOLDER."image_moo");
    }
    
/*
 * init()
 * 
 * This function overloads the parent::init()
 *  
 */
    public function init($data_table = NULL, $interface_ca = NULL, $fetch_data = TRUE)
    {
        parent::init($data_table, $interface_ca, NULL, $fetch_data);
        
        //Loading the form setup class
        $this->fetcher->interface_file('interface_form','forms',$data_table);
        
        $this->event->trigger('interface_form_setup_before', $this->{$data_table});
        //Running the setup
        $this->{$data_table}->setup($this);
        $this->event->trigger('interface_form_setup_after', $this);
        
        //Parsing the settings on the fields
        $this->_parse_meta_lang();
        
        //Checking for disabled input
        $this->_disable();
       
        //Loading field values if data has been loaded
        if($this->raw_data)
            $this->_set_field_values();
        
        return $this; 
    }
 
 /**
  * add_field
  * 
  * Creates a new field in the form
  * 
  * @param type $name of the field
  * @param type $settings - more on them in the Fields class
  * @return \Interface_form
  */
    public function add_field($name, $settings) {
        
        $this->fields[$name] = new Fields();
        $this->fields[$name]->settings = array_merge($this->fields[$name]->settings, $settings);
        $this->fields[$name]->setting('name', $name);
        
        //Setting data tables, raw data etc.
        $this->fields[$name]->data_table = $this->data_table;
        $this->fields[$name]->data_table_lang = $this->data_table_lang;
        $this->fields[$name]->caller = $this->caller;
        $this->fields[$name]->raw_data = $this->raw_data;

        return $this;
    }
  
 /**
  * add_submit
  * 
  * Creates a submit button for the form
  * 
  * @param type $settings
  * @return \Interface_form
  */
    public function add_submit($settings) {
        
        $this->submit = new Fields();
        $this->submit->settings = array_merge($this->submit->settings, $settings);
        $this->submit->setting('type', 'submit');
        $this->submit->setting('name', 'submit');
        
        return $this;
    }  
    
/*
 * modify()
 * 
 * This function calls form validation and two methods that process any post data and upload any files that are present.
 * 
 */
    public function modify()
    {
        if($this->_validate() && $this->_modify_data())
        {
            $this->_update_files_data($this->_upload_files());
            $this->modified = TRUE;
        }
        
        return $this;
    }
    
  /**
   * Sets the redirect url
   * 
   * @param type $url
   * @return \Interface_form
   */  
    
    public function set_redirect($url = NULL) 
    {
        $this->redirect = (!$url) ? $this->_generate_url() : $url;
        return $this;
    }
    
    
/*
 * render()
 * 
 *  The render function displays the form interface.  The override view is ... well to override the default view
 *  If $return is set to true, the view will be returned instead of rendered.
 */
    public function render($oview = NULL, $return = FALSE)
    {
        $this->event->trigger('interface_form_render_before', $this);
        //We don't have any fields
        if(!$this->fields)
            $this->logs->log("NO_FORM");
 
        //Have we modified -> redirect
        if($this->modified && !$this->zcms->logs->check_log())
        {
            //Setting success message
            $this->session->set_flashdata("form_msg", "MODIFY_SUCCESS");
            
            //refreshing the page
            if(!$this->redirect)
                $this->set_redirect();
            
            redirect($this->redirect, 'location');
        }
        
        //Loading any msg from flash data
        $msg = $this->session->flashdata("form_msg");
        if($msg)
            $this->logs->log($msg);
        
        //Do we have a view set in the settings object of the base_interface class? If yes does it exist?
        //If not the default view is loaded
        $view = isset($oview) && file_exists(self::VIEWS_BACKEND.$oview)
                ? self::VIEWS_BACKEND.$oview : self::VIEWS_BACKEND.self::FORM_DEFAULT_VIEW;
        
        $this->loaded_view = $this->load->view($view,array('fields' => $this->fields, 'submit' => $this->submit), $return);
        $this->event->trigger('interface_form_render_after', $this);
        return $this->loaded_view;
    }

/**
 * delete
 * 
 * Deletes a database entry based on the currently loaded form. The parameter 
 * should be in the form of an array that can be used in a where clause.
 * 
 * ex. array('column' => 'value');
 * 
 * @param type array
 */
    
    public function delete($where, $redirect)
    { 
        
        //Lets fetch an the row we are deleting
        $row = $this->db->where($where)
                    ->get($this->data_table)
                    ->row();
        
        if(!$row)
            return FALSE;

        $this->event->trigger('interface_form_delete_before', $row);
        
        if($this->data_table_lang)
        {
            //We have a language table lets delete that entry first
            $this->db->where(array('id_' => $row->id))
                     ->delete($this->data_table_lang);
        }
        
        //Deleting the main entry
        $this->db->where(array('id' => $row->id))
                 ->delete($this->data_table);
        
        //Checking the fields to see if there is any files/images to delete
        foreach($this->fields as $field)
        {
            //If this is not an image/file field we don't care
            if($field->setting('type') != 'image' && $field->setting('type') != 'file')
                continue;
            
            //This will be used later to determine where are the entries for the files
            $link_table = $field->setting('link_table');
            //Path to main images
            $path = Interface_form::UPLOADS_PATH.$field->setting('path');
            //Path to thumbs
            $tpath = Interface_form::UPLOADS_PATH.$field->setting('path').Interface_form::THUMBS_PATH;
            
            //If we have a linked table to this field the images/files are in it
            if($link_table)
            {
                //We get the files so that we can remove them from the file system
                $files = $this->db->select('file')
                                  ->where('rel_id', $row->id)
                                  ->get($link_table)
                                  ->result();
                
                //We delete the entries from the database
                $this->db->where('rel_id', $row->id)
                         ->delete($link_table);
            }   
            //Otherwise we already have the files in the $row variable
            else
            {
                
                $files_arr = json_decode($row->{$field->setting("name")});
                
                if($row->{$field->setting("name")} && !$files_arr)
                {
                    $files_arr = array();
                    $files_arr[] = $row->{$field->setting("name")};
                }
                
                $files = array();
                
                //Creating the files array so that it mimics the one returned 
                //when a linked table is present
                if($files_arr)
                    foreach($files_arr as $f)
                    {
                        $index = count($files);
                        $files[$index] = new stdClass();
                        $files[$index]->file = $f;
                    }
            }
            
            foreach($files as $file)
            {
                //Deleting the main file
                if(file_exists($path.$file->file))
                    @unlink($path.$file->file);
                
                //If this is an image we have thumbs
                if($field->setting('type') == 'image')
                {
                    //Check for a system thumb
                    if(file_exists($tpath.Interface_form::SYS_TB_PREF."_".$file->file))
                    {
                        @unlink($tpath.Interface_form::SYS_TB_PREF."_".$file->file);
                        clearstatcache();
                    }
                    
                    //Loop throgh the thumbs if there are any ...
                    if($thumbs = $field->setting('thumbs'))
                        foreach($thumbs as $thumb)
                            //... and delete them
                            if(file_exists($tpath.$thumb."_".$file->file))
                            {
                                @unlink($tpath.$thumb."_".$file->file);
                                clearstatcache();
                            }        
                }
            }
        }
        
        $this->event->trigger('interface_form_delete_after', $row);
        
        //Redirecting if redirect is set
        if($redirect)
            header ("location: ".$redirect);
    }
    
    public function copy()
    {
        if(!$this->raw_data)
            return NULL;
        
        //Backing up data to restore it afterward
        $data_backup = $this->raw_data[0];
        
        //Setting the data_override for the _modify function
        $data_override = $this->raw_data[0];
        
        //Unseting ids and files
        unset($data_override->id);
        unset($data_override->id_);
        
        foreach($this->fields as $fname => $field)
        {
            if(($field->setting('type') == 'file' 
                || $field->setting('type') == 'image')
                && isset($data_override->{$fname}))
                unset($data_override->{$fname});
                
        }
        //Nullifing the raw data
        $this->raw_data = NULL;
        $this->fetch_data = FALSE;
        
        $this->_modify_data($data_override);
        
        //Restoring data
        $this->raw_data = $data_backup;
        $this->fetch_data = TRUE;
    }
    
/*
 * get_field()
 * 
 * This function returns the field of the current form with a name identical to the parameter
 * 
 */

    public function get_field($name)
    {
        return $this->fields[$name];
    }
/*
 * return_table($affix)
 * 
 * This function returns the name of system table with the chosen affix
 * 
 */
    
    public function return_table($affix)
    {
        $tname = "table_".$affix;
        return $this->{$tname};
    }

/**
 * _generate_url
 * 
 * Generates a redirect url
 */
    public function _generate_url()
    {
        return $this->backend()
                    .$this->router->fetch_class()."/"
                    .$this->router->fetch_method()."/"
                    .$this->modify_id;
    }
/*
 * _validate()
 * 
 * This method validates the form. It implements similar methods to thos of Code Igniter, however does not use the 
 * Code Igniter built in form validation in order to make the validation easier to use with the cms base classes
 * 
 */
    protected function _validate()
    {
        $post = $this->input->post();
        if(!$post) return NULL;
        
        $valid = TRUE;

        $this->event->trigger('interface_form_validate_before', $this);
        
        foreach($post as $fname => $inp)
        {
            if(!isset($this->fields[$fname]))
                continue;
            
            $fsettings = $this->fields[$fname];
            $rules = explode('|', $fsettings->setting('validation'));
            $param = NULL;
            
            if(!$rules)
                continue;
            
            foreach($rules as $rule)
            {
                if($rule == "required")
                {
                    if(!strlen($inp))
                    {
                        $this->logs->log("INP_REQUIRED", $fsettings->setting('label'));
                        $valid = FALSE;
                    }
                }
                if($rule == "alphanumeric")
                    if(!preg_match("/^[a-zA-Z0-9]*$/",$inp))
                    {
                        $this->logs->log("INP_ALPHANUM", $fsettings->setting('label'));
                        $valid = FALSE;
                    }
                
                if($rule == "word")
                {
                    if(!preg_match("/^\w*$/",$inp))
                    {
                        $this->logs->log("INP_WORD", $fsettings->setting('label'));
                        $valid = FALSE;
                    }
                }
                 
                if($rule == "email")
                    if(!preg_match("/^([\w-\.]+)@((?:[\w]+\.)+)([a-zA-Z]{2,4})$/",$inp))
                    {
                        $this->logs->log("INP_EMAIL", $fsettings->setting('label'));
                        $valid = FALSE;
                    }
                    
                 if(preg_match("/^min_size\[([0-9]+)\]$/", $rule, $param))
                 {
                     $param = $param[1];
                     if(strlen($inp) < $param)
                     {
                         $this->logs->log("INP_MINSIZE", array($fsettings->setting('label'), $param));
                         $valid = FALSE;
                     }
                 }
                 
                 if(preg_match("/^max_size\[([0-9]+)\]$/", $rule, $param))
                 {
                     $param = $param[1];
                     if(strlen($inp) > $param)
                     {
                         $this->logs->log("INP_MAXSIZE", array($fsettings->setting('label'), $param));
                         $valid = FALSE;
                     }
                 }
                 
                 if(preg_match("/^matches\[(\w+)\]$/", $rule, $param))
                 {
                     $param = $param[1];
                     if(!isset($post[$param]))
                         continue;
                     
                     if($inp != $post[$param])
                     {
                         $this->logs->log("INP_MATCH", array($fsettings->setting('label'), $this->fields[$param]->setting('label')));
                         $valid = FALSE;
                     }
                 }
                 
                 if($rule == "is_unique")
                 { 
                       if(!$this->data_table_lang)
                           $table = $this->data_table;
                       else
                           $table = in_array($fname, $this->db->list_fields($this->data_table_lang)) ? $this->data_table_lang : $this->data_table;
                       
                       
                       $col = $fname;
                       $check = $this->db->select('id')
                                         ->from($table)
                                         ->where($col,$inp)
                                         ->get()
                                         ->row();
                       
                       if($check)
                       {
                           $this->logs->log("INP_UNIQUE", array($fsettings->setting('label'), $table));
                           $valid = FALSE;
                       }
                 }
            }
        }       

        $this->event->trigger('interface_form_validate_after', $this);
        return $valid;
    }
    
/*
 * _modify_data()
 * 
 * This function returns NULL if there is no $_POST. Otherwise it processes it and uploads the data in the respective
 * tables in the database
 * 
 */
    
    protected function _modify_data($data_override = NULL)
    {
        
        //Is there any post?
        $post = (object)$this->input->post();
        if(!$post && !$data_override)
            return NULL;
        
        if($data_override)
            $post = $data_override;
        
        $this->event->trigger('interface_form_modify_before', $post);
        
        $post = (array) $post;
        
        //We don't need this
        unset($post[$this->submit->setting('name')]);
        
        //Lets check for arrays in the post first...
        foreach($post as &$val)
           if(is_array($val))
               //...and turn it to JSON
               $val = json_encode($val);
           
        //The data that goes in the data_table
        $data = array();
        //And the data that goes in the language table
        $data_lang = array();
        
        //Is there a language table defined. (If not we are either default language or the language table is missing)
        if($this->data_table_lang)
        {   
            
            //We need to load the fields of both the data table and the language one
            $cols = $this->db->list_fields($this->data_table);
            $lcols = $this->db->list_fields($this->data_table_lang);
            
            //This determines which field should be saved in the language table...
            foreach($lcols as $lcol)
                if(isset($post[$lcol]))
                    $data_lang[$lcol] = $post[$lcol];
                
            //...and which in the regular one
            foreach($cols as $col)
                if(!in_array($col, $lcols) && isset($post[$col]))
                    $data[$col] = $post[$col];
                
        }
        else
            //No language table - no worries
            $data = $post;
        
        //If there is no data we don't have to insert anything
        if($data)
        {  
            //We will update/insert the regular data first
            $this->db->set($data);
            if($data && $this->fetch_data && $this->raw_data)
            { 

                //We have fetched data which means we need to update it (if raw_data
                //is NULL it means nothing was fetched we also need to insert)
                $this->modify_id = $this->raw_data[0]->id;
                $this->db->where('id',$this->modify_id)
                         ->update($this->data_table);

            }
            else
            {
                //We need to insert a new row
                $this->db->insert($this->data_table);
                $this->modify_id = $this->db->insert_id();
            }
        }
        else
            //Just make sure to add a modify id
            $this->modify_id = $this->raw_data[0]->id;
        
        if($this->data_table_lang)
        {
            
            //Checking if an entry exists in the language table
            $lang_exists = $this->db->where(array(
                "id_" => $this->modify_id,
                "lang_id" => $this->translate->get_lang()
                ))->count_all_results($this->data_table_lang);
            
            
            if($lang_exists)
            {    
                $this->db->where(array(
                                    'id_' => $this->modify_id,
                                    'lang_id' => $this->translate->get_lang()
                                 ))
                         ->set($data_lang)
                         ->update($this->data_table_lang); 
                
            }
            else
            {
                //Setting the lang_id and id_ 
                $data_lang['id_'] = $this->modify_id;  
                $data_lang['lang_id'] = $this->translate->get_lang();
                
                $this->db->set($data_lang)->insert($this->data_table_lang);
            }
            
            
            //Now lets see if there is an entry for the default language
            //If there isn't one we will create one out of the current language
            if($this->translate->get_lang() != $this->translate->get_default_lang())
            {
                //The check query
                $default_lang_exists = $this->db->where(array(
                    "id_" => $this->modify_id,
                    "lang_id" => $this->translate->get_default_lang()
                ))->count_all_results($this->data_table_lang);
                
                if(!$default_lang_exists)
                {
                    if(!isset($data_lang['id_']))
                    {
                        $data_lang['id_'] = $this->modify_id;  
                    }
                    
                    $data_lang['lang_id'] = $this->translate->get_default_lang();
                    $this->db->set($data_lang)->insert($this->data_table_lang);
                }
            }
        }
        
        $this->event->trigger('interface_form_modify_after', $this);
        //We have processed the data on to the next step
        return TRUE;
    }
    
/*
 * _upload_files()
 * 
 * This function handles verification and upload of incoming files. If the said file is an 
 * image it is then processed to create thumbs. Then the data in the database concerning those
 * files is updated.
 * 
 */
    protected function _upload_files()
    {
        //Array of uploaded files. We will use this to update the database information after
        //we complete the uploading
        $uploaded_files = array();
        
        $this->event->trigger('interface_form_upload_before', $_FILES);
        
        
        foreach($_FILES as $fname => $files)
        {
            
            //Number of files uploaded through each field (we have multiple uploads enabled)
            $fcount = count($_FILES[$fname]['name']);
            
            //There might be no files uploaded through this field. Go to the next
            if(!$_FILES[$fname]['name'][0])
                continue;
            
            //CodeIgniter upload library configuration
            $config['upload_path'] = self::UPLOADS_PATH.$this->fields[$fname]->setting("path");
            $config['allowed_types'] = $this->fields[$fname]->setting("ext_limit");
            $config['max_size'] = $this->fields[$fname]->setting("size_limit")*1024;
            
            //if the upload dir is missing make it
            if(!is_dir($config['upload_path']))
                 mkdir($config['upload_path']);

            //Next we check if the number of files along with the previously uploaded files exceeds the file limit
            $val = ($this->fields[$fname]->value()) ? count(json_decode ($this->fields[$fname]->value())) : 0;
            if($this->fields[$fname]->setting("count_limit") && $val + $fcount > $this->fields[$fname]->setting("count_limit"))
            {    
                //Too many files. Next field
                $this->logs->log('UPLOAD_COUNT');
                continue;
            }    
            
            //Each file from one field is processed individually
            for($i = 0; $i < $fcount; $i++)
            {
                $ext = explode('.', $files['name'][$i]);
                $ext = strtolower($ext[count($ext)-1]);
                
                //Here we check whether the extension is valid. (Code igniter library does that too, but we need an error
                //that can be processed through the Logs class)
                if(!in_array($ext, explode('|', $config['allowed_types'])))
                {
                    $this->logs->log('UPLOAD_TYPE');
                    break;
                }
                
                //Now the size limit
                if($files['size'][$i]/1024 > $config['max_size'])
                {
                    $this->logs->log('UPLOAD_SIZE');
                    break;
                }
                
                //We need to change the values in the $_FILES array for each file to make Code Igniter's library work for multiple upload
                $_FILES[$fname]['name']= $files['name'][$i];
                $_FILES[$fname]['type']= $files['type'][$i];
                $_FILES[$fname]['tmp_name']= $files['tmp_name'][$i];
                $_FILES[$fname]['error']= $files['error'][$i];
                $_FILES[$fname]['size']= $files['size'][$i];    
                
                //Initializing the upload library
                $this->upload->initialize($config);
                
                //If there is a error we didn't cover it will show up here
                if(!$this->upload->do_upload($fname))
                     $this->zcms->logs->log("UPLOAD_ERROR");
                else
                {
                    //We get the upload data
                    $upl_data = $this->upload->data();
                    $upl_data['field_src'] = $fname;
                    
                    //If the file is an image we need to create thumbs
                    if($upl_data['is_image'])
                        $this->_process_image($upl_data);
                    
                    //The data is addet to the uploaded_files array
                    $uploaded_files[$fname][] = $upl_data['file_name'];
                }   
            }
            if(isset($uploaded_files[$fname]))
            {   
                //Now we need to create a json containing the new and the old files  to insert in the database
                //$old_files = json_decode($this->fields[$fname]->value());
                //$old_files = $old_files ? $old_files : array();
                
                //$uploaded_files[$fname] = array_merge($uploaded_files[$fname], $old_files);
                $uploaded_files[$fname] = json_encode($uploaded_files[$fname]);
            }
        }
        $this->event->trigger('interface_form_upload_after', $uploaded_files);
        return $uploaded_files;
    }
/*
 * _process_image($data)
 * 
 * This function creates thumbs for any images that are being uploaded
 */    
    protected function _process_image($data)
    {
        //The field name. It is set to help us recover field related data
        $fname = $data['field_src'];
        
        //The array with thumb sizes
        $thumbs = $this->fields[$fname]->setting('thumbs');
        
        //The upload path
        $path = $data['file_path'];
        
        //And the thumb path
        $td = $path.self::THUMBS_PATH;
        
        //The width of the file being thumbified (Thumbified is now a valid word!)
        $width = $data['image_width'];
        
        //And its height
        $height = $data['image_height'];
        
        //This array will contain the valid sizes for each thumb after we extract them from the string
        $matches = array();

        //If we don't have the directory we will make it
        if(!is_dir($td))
            mkdir($td);
        
        //Checking if the system thumbnail is already in the thumbs array
        //If it is nothing to do here it will be handled with the others
        if(!$thumbs || !in_array(self::SYS_TB_PREF, $thumbs))
        {
            //Extracting the thumb sizes
            preg_match('/^([0-9_]*)x([0-9_]*)/', self::SYS_TB_PREF, $matches);
            
            $new_width =  (float)$matches[1];
            $new_height = (float)$matches[2];
            
            //The magic image_moo library at work
            $this->image_moo->load($path.$data['file_name'])
                            ->resize_crop($new_width,$new_height)
                            ->save($td.self::SYS_TB_PREF."_".$data['file_name']);
        }
        
        //No thumbs - nothing to do
        if(!$thumbs)
            return NULL;
        
        foreach($thumbs as $thumb)
        {
            preg_match('/^([0-9_]*)x([0-9_]*)/', $thumb, $matches);
            
            $new_width =  (float)$matches[1];
            $new_height = (float)$matches[2];

            //This checks replaces underscopes with value that changes the underscoped dimension
            //with the same ratio as the non underscoped one. If both are underscoped the administrator
            //is an idiot so we continue to the nest one
            if($new_height == '_' && $new_width == '_')
                continue;
            elseif($new_height == '_' && $new_width != '_')
                $new_height = $height/($width/$new_width);
            elseif($new_height != '_' && $new_width == '_')
                $new_width = $width/($height/$new_height);
            
            
            if($this->fields[$fname]->setting('crop'))
            {
                //Do we need to crop the image?
                $this->image_moo->load($path.$data['file_name'])
                                ->resize_crop($new_width,$new_height)
                                ->save($td.$thumb."_".$data['file_name']);
            }
            else
            {
                //Ok. Then we will just shrink it
                $this->image_moo->load($path.$data['file_name'])
                                ->set_background_colour($this->fields[$fname]->setting('padding_color'))
                                ->resize($new_width,$new_height, $this->fields[$fname]->setting('padding'))
                                ->save($td.$thumb."_".$data['file_name']);
            }
                
        }
    }
    
/*
 * _update_files_data($files)
 * 
 * Well it updates the files data ... 
 * 
 */    
    protected function _update_files_data($files)
    {
        if(!$files)
            return FALSE;
        
        foreach($files as $fname => $fs)
        {
            if(!$this->fields[$fname]->setting('link_table'))
            {
                $old_files = json_decode($this->fields[$fname]->value());
                $old_files = $old_files ? $old_files : array();
                
                $fs = json_encode(array_merge(json_decode($fs), $old_files));
                
                $this->db->set(array($fname => $fs))
                         ->where("id", $this->modify_id)
                         ->update($this->data_table);
            }
            else
            {
                $insert = array();
                $fs = json_decode($fs);
                
                foreach($fs as $file)
                {
                    $insert[] = array(
                        'rel_id' => $this->modify_id,
                        'file' => $file
                    );
                }
                
                $this->db->insert_batch($this->fields[$fname]->setting('link_table'), $insert);
            }
        }
        
        return TRUE;
    }

/*
 * _disable()
 * 
 * This checks if any of the fields need to be disabled for the input/update of data
 * 
 */
    protected function _disable()
    {
        foreach ($this->fields as $field)
            if((!$this->fetch_data && $field->setting('disabled_on_insert'))
               || ($this->fetch_data && $field->setting('disabled_on_update')))
               $field->disabled = 'disabled';
            else
               $field->disabled = NULL; 
    }
 
/*
 * _set_field_values()
 * 
 * The fields' values are filled with the raw data
 * 
 */
    protected function _set_field_values()
    {
        foreach($this->fields as $field)
        {
            if(preg_match('#^([a-zA-Z0-9_]+)\[([a-zA-Z0-9_]*)\]$#',$field->setting('name'), $matches))
            {
                //We have an array of fields that go in the same db column
                $field_name = $matches[1];
                $subfield_name = $matches[2];
                
                if(isset($this->raw_data[0]->{$field_name}) && ($data = json_decode($this->raw_data[0]->{$field_name})))
                {
                    //We have valid json in the DB
                    //Lets check if we have the value for this field
                    if(isset($data->{$subfield_name}))
                        $field->value($data->{$subfield_name});
                }
            }
            else 
            {
                //Normal field
                if(isset($this->raw_data[0]->{$field->setting('name')}))
                {
                    $field->value($this->raw_data[0]->{$field->setting('name')});
                }
            }  
            
        }
    }
 
/*
 * _parse_meta_lang()
 * 
 * This parses the settings that can contain variable meta language references.
 * 
 */
    
    protected function _parse_meta_lang()
    {
        foreach($this->meta_parse_for as $meta_field_key)
        {    
            foreach($this->fields as $field)
            {
                $value = $field->setting($meta_field_key);
                if(is_array($value))
                    $value = json_encode($value);
                
                $matches = array();
                
                //The first pattern matches {@field_name} and returns the value of the field named field_name
                preg_match($this->meta_lang_templates['field_value'], $value, $matches);
                if(count($matches) > 0)
                {
                    $value = str_replace($matches[0], $this->raw_data[0]->{$matches[1]}, $value);
                    $value_rdy = (@json_decode($value)) ? json_decode($value) : $value;
                    $field->setting($meta_field_key, $value_rdy);
                }
                
                //The second pattern matches {@class_name::constant} and returns the constant from the class used
                preg_match($this->meta_lang_templates['class_constant'], $value, $matches);
                if(count($matches) > 0)
                {
                    $value = str_replace($matches[0], constant($matches[1]), $value);
                    $value_rdy = (@json_decode($value)) ? json_decode($value) : $value;
                    $field->setting($meta_field_key, $value_rdy);
                }
                
                //The final pattern matches {#variable} or {#variable->subvar[0]}. It returns the Interface_form class variables.
                //The second part of the pattern is meant for retriving variables of the control array
                preg_match($this->meta_lang_templates['init_params'], $value, $matches);
                if(count($matches) > 0 && count($matches) <= 2)
                {
                    $value = str_replace($matches[0], $this->{$matches[1]}, $value);
                    $value_rdy = (@json_decode($value)) ? json_decode($value) : $value;
                    $field->setting($meta_field_key, $value_rdy);
                }
                elseif(count($matches) > 4)
                {
                    $value = str_replace($matches[0], $this->{$matches[2]}->{$matches[3]}[$matches[4]], $value);
                    $value_rdy = (@json_decode($value)) ? json_decode($value) : $value;
                    $field->setting($meta_field_key, $value_rdy);
                }
            }
        }      
    }
    
}

/* End of file interface_form.php */
/* Location: ./application/libraries/zcms/utilities/interface_form.php  */