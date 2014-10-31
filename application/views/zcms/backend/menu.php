<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>


    <?php
        foreach($menu as $ord => $item)
            if($item->access >= $this->zcms->auth->session_info()->level)
            {
                $class = NULL;
                if(base_url()."index.php/".uri_string() == trim($item->link, "/"))
                     $class = "class='active'";
                
                if(!$item->sub)
                    echo "<li>"
                            . "<a ".$class." href='".$item->link."' data-order='".$ord."'>"
                            . "<i class='fa ".((isset($item->icon) && $item->icon) ? $item->icon : NULL)."'></i>"
                            .$item->label
                            ."</a>"
                         ."</li>";
                else
                {
                    echo '<li class="sub-menu">
                            <a href="javascript:;" >
                                <i class="fa '.((isset($item->icon) && $item->icon) ? $item->icon : NULL).'"></i>
                                <span>'.$item->label.'</span>
                            </a>
                            <ul class="sub">';
                    
                    foreach($item->sub as $sitem)
                    {
                        echo "<li><a href='".$sitem->link."' data-order='".$ord."'>"
                                .'<i class="fa '.((isset($sitem->icon) && $sitem->icon) ? $sitem->icon : NULL).'"></i>'
                                .$sitem->label
                                ."</a></li>";
                    }
                    
                    echo  '</ul></li>';
                }
                    
            }
    ?>
