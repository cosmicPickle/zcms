<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>


    <?php
        foreach($menu as $ord => $item)
            if($item->access >= $this->zcms->auth->session_info()->level)
            {
                $class = NULL;
                if(base_url()."index.php/".uri_string() == trim($item->link, "/"))
                     $class = "class='active'";
                
                echo "<li ".$class."><a href='".$item->link."' data-order='".$ord."'>".$item->label."</a></li>";
            }
    ?>
