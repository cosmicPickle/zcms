<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

include_once dirname(__FILE__).DIRECTORY_SEPARATOR.'elfinder/elFinderConnector.class.php';
include_once dirname(__FILE__).DIRECTORY_SEPARATOR.'elfinder/elFinder.class.php';
include_once dirname(__FILE__).DIRECTORY_SEPARATOR.'elfinder/elFinderVolumeDriver.class.php';
include_once dirname(__FILE__).DIRECTORY_SEPARATOR.'elfinder/elFinderVolumeLocalFileSystem.class.php';

class Elfinder_Lib
{
  public function __construct($opts) 
  {
    date_default_timezone_set(@date_default_timezone_get());
    $connector = new elFinderConnector(new elFinder($opts));
    $connector->run();
  }
}