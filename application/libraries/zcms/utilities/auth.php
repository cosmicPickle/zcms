<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');


/*
 * Auth class
 * 
 * @author Teodor Klissarov
 * @created 08.04.2013
 * 
 * The authentication class will as the name suggests take care of login/logout operation, 
 * as well as authentication levels checks to restrict developer only content.
 * 
 */

class Auth extends ZCMS {
    
    const AUTH_CONTROLLER = "authenticate";
    const PROTECTED_DIRECTORY = "backend/";
    const SALT = "6k62ioOtapJQXVlxMz6a";
    
    private $protected_controllers = "*";
    private $excluded_controllers = array();
    private $session_info;
    
    public function __construct()
    {
        parent::__construct();
        if($this->router->fetch_class() == self::AUTH_CONTROLLER)
        {
            if($this->_check_session() && $this->router->fetch_method() == "login")
                header("location: " . $this->backend . "dashboard");
            else
            {
               $action =  "_".$this->router->fetch_method();
               $this->{$action}();
            }
        }
        elseif($this->router->fetch_class() != self::AUTH_CONTROLLER)
        {
            if(!$this->_check_session() && $this->_is_protected($this->router->fetch_class()))
            {  
                $this->session->set_flashdata("zcms_back", $this->router->fetch_class());
                header("location: " . $this->backend . self::AUTH_CONTROLLER . "/login/");
            }
            
            $this->session_info = new stdClass();
                    
            $this->session_info->user = $this->session->userdata("zcms_user");
            $this->session_info->level = $this->session->userdata("zcms_user_lvl");
        }
    }
    
    public function session_info()
    {
        return $this->session_info;
    }
    
    public function enc($password)
    {
        return $this->_enc($password);
    }
    
    private function _is_protected($controller)
    {
        if($this->router->fetch_directory() != self::PROTECTED_DIRECTORY)
            return FALSE;
        if((!is_array($this->protected_controllers) && $this->protected_controllers == "*") || in_array($controller, $this->protected_controllers))
            return !in_array($controller, $this->excluded_controllers);
        else
            return FALSE;
    }
    
    private function _check_session()
    {
        if($this->session->userdata("zcms_auth"))
            return TRUE;
        
        return FALSE;
    }
    
    private function _set_session($sess)
    {
        $this->session->set_userdata("zcms_auth", 1);
        $this->session->set_userdata("zcms_user", $sess->username);
        $this->session->set_userdata("zcms_user_lvl", $sess->level);
        
        if($this->session->flashdata("zcms_back"))
            header("location: " . $this->backend . $this->session->flashdata("zcms_back"));
        else
            header("location: " . $this->backend . "dashboard");
    }
    
    private function _login()
    {
        if($this->input->post())
        {
            $post = $this->input->post();
            
            if(!$post["username"])
                $this->logs->log("INP_REQUIRED", "Username");
            if(!$post["password"])
                $this->logs->log("INP_REQUIRED", "Password");
            
            if($post["username"] && $post["password"])
            {
                $post["password"] = $this->_enc($post["password"]);
                $check = $this->db->where($post)->get("zcms_admins")->row();
                
                if(!$check)
                    $this->logs->log("INVALID_LOGIN");
                else
                    $this->_set_session($check);
            }
        }
        
        $this->load->view(self::VIEWS_BACKEND.'login');
    }
    
    private function _enc($password)
    {
        $hash = md5(base64_encode(sha1($password.self::SALT,true).self::SALT));
        return $hash;
    }
    
    private function _logout()
    {
        $this->session->unset_userdata("zcms_auth");
        $this->session->unset_userdata("zcms_user");
        $this->session->unset_userdata("zcms_user_lvl");
        
        header("location: " . $this->backend . self::AUTH_CONTROLLER . "/login/");
    }
}

/* End of file auth.php */
/* Location: ./application/libraries/zcms/utilities/auth.php */
