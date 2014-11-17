<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

include_once dirname(__FILE__).DIRECTORY_SEPARATOR.'htmlpurifier/HTMLPurifier.auto.php';

class HtmlPurifier_lib
{
    var $config;
    var $purifier;
    
    public function init()
    {
        $this->config = HTMLPurifier_Config::createDefault();
    }
    
    public function set($key, $value)
    {
        $this->config->set($key, $value);
    }
    
    public function create()
    {
        $this->purifier = new HTMLPurifier($this->config);
    }
    
    public function clean($html)
    {
        return $this->purifier->purify($html);
    }
}