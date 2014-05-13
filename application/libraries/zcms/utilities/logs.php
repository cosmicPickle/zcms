<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');


/*
 * Logs class
 * 
 * @author Teodor Klissarov
 * @created 07.04.2013
 * 
 * The error reporting class will handle errors in the following way: 
 * 
 * When a known error/information log should be handled a function will be called with a parameter indicating which error/log 
 * should be taken out of the database. The error text/severity is then saved in an array to be rendered later by an error 
 * rendering function.
 * 
 */

class Logs extends ZCMS {
        
       //The array which will hold all logs, errors etc
       private $logs = array();
        
       //The MySQL table in which the logs' descriptions are stored
       private $logs_table = "zcms_logs";
        
       //Same as before only for languages different than the default (EN)
       private $logs_table_lang;
        
       //In the database the type of error is indicated with a number this array maps
       //those numbers with a more "human" values.
       private $types = array(2 => 'error', 3 => "warning", 4 => "info", 5 => "ok");
        
/*
 * __construct()
 * 
 * Checks the language and properly sets the language table for the logs
 * 
 */
       public function __construct()
       {
           parent::__construct();
           if($this->translate->get_table_sufix())
               $this->logs_table_lang = $this->logs_table.$this->translate->get_table_sufix();
           else
               $this->logs_table_lang = NULL;
       }
       
/*
 * get_logs_table()
 * 
 * This one is too hard to explain ...
 * 
 */
        public function get_logs_table()
        {
            return $this->logs_table;
        }
        
/*
 * get_logs_table_lang()
 * 
 * ... so is this
 * 
 */
        public function get_logs_table_lang()
        {
            return $this->logs_table_lang;
        }
        
/*
 * log($log_name, $subst = NULL, $brake_on_critical = TRUE)
 * 
 * This is the function that does the magic. It gets its data from the appropriate MySQL folders
 * and stores the new log in the logs array.
 * 
 * @param $log_name          -> the short name for the log
 * 
 * @param $substr            -> the logs support string substitution with (ex. %s, %d etc.). This can be a 
 *                              string or an array of strings
 * 
 * @param $brake_on_critical -> when a critical error is occured the user is redirected to the 
 *                              "critical error page". This param set to false disables that 
 *                              function (we don't want endless recurtion in the "critical error 
 *                              page")
 */
        
        public function log($log_name, $subst = NULL, $brake_on_critical = TRUE)
        {
            if($this->logs_table_lang)
                $log = $this->db->select("t1.name, t1.type, t2.id_, t2.lang_id, IFNULL(t2.text, t1.text) as text", FALSE)
                                ->from($this->logs_table . " as t1")
                                ->join($this->logs_table_lang . " as t2","t1.id = t2.id_","left")
                                ->where("(t2.lang_id = '" . $this->translate->get_lang() . "' OR t2.lang_id IS NULL) 
                                         AND t1.name ='".$log_name."'")
                                ->get()->row();
            else
                $log = $this->db->select("name, type, text")
                                ->where("name",$log_name)
                                ->get($this->logs_table)->row();
            
            if(!$log)
                return FALSE;
            else
            {
                if($log->type == 1 && $brake_on_critical)
                     $this->_resolve_critcal_error($log_name);
                
                
                $index = count($this->logs);
                $this->logs[$index] = $log;
                
                $this->logs[$index]->type = $this->types[$this->logs[$index]->type];
                $this->_parse_log($this->logs[$index]->text, $subst);
                
                return TRUE;
            }
        }
        
/*
 * _parse_log($log, $subst)
 * 
 * The string substitution that I mentioned above ... it happens here
 * 
 */
        private function _parse_log(&$log, $subst)
        {
            if(!$log || !$subst)
                return FALSE;
            
            if(is_string($subst))
            {    
                $log = sprintf ($log, $subst);
                return TRUE;
            }
            
            if(is_array($subst))
            {    
                $log = vsprintf ($log, $subst);
                return TRUE;
            }
            return FALSE;
        }
        
/*
 * _resolve_critcal_error($log_name)
 * 
 * Redirection to the "critical error page"
 * 
 */
        private function _resolve_critcal_error($log_name)
        {
            header('location: '.$this->backend."cerrors/critical/".$log_name);
        }
        
/*
 * render_logs()
 * 
 * Shows the logs.(Or store them in a variable if the $return parameter is true)
 * 
 */
        public function render_logs($return = FALSE)
        {
            if($this->check_log())
                return $this->load->view(self::VIEWS_BACKEND."logs", array('logs' => $this->logs), $return);
            
            $this->_clear_log();
        }
        
/*
 * render_critical()
 * 
 * Shows the critical error log.
 * 
 */
        public function render_critical()
        {
            $this->load->view(self::VIEWS_BACKEND."critical", array('critical' => $this->logs));
            $this->_clear_log();
        }
/*
 * check_log()
 * 
 * Checks if there are any logs present
 * 
 */
        public function check_log()
        {
            return $this->logs != NULL; 
        }
        
/*
 * _clear_log()
 * 
 * Clears all logs
 * 
 */
        private function _clear_log()
        {
            $this->logs = NULL;
        }
 
}

/* End of file logs.php */
/* Location: ./application/libraries/zcms/utilities/logs.php */
