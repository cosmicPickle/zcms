<nav>
<?php
    $level = $menu->get_menu()->sublevel;
    $i = 1;
    
    foreach($level as $item) :
?>
<div class="dropdown">
    <button id="dropdownMenu<?php echo $i;?>" class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">
        <?php echo mb_strtoupper($item->label); ?>
    </button>
    <ul class="dropdown-menu">
        <?php
            foreach($item->sublevel as $subitem) :
        ?>
        
        <?php if(!isset($subitem->sublevel) || !$subitem->sublevel) : ?>
        <li><a href='<?php echo $this->zcms->frontend().$subitem->page_id.$subitem->params; ?>'> <?php echo $subitem->label; ?></a></li>
        <?php
            else :
        ?>
        <li class="dropdown-submenu">
            <a href='<?php echo $this->zcms->frontend().$subitem->page_id.$subitem->params; ?>'><?php echo $subitem->label; ?></a>
            <ul class="dropdown-menu">
                <?php 
                    foreach($subitem->sublevel as $ssubitem) :
                ?>
                <li><a href='<?php echo $this->zcms->frontend().$ssubitem->page_id.$ssubitem->params; ?>'> <?php echo $ssubitem->label; ?></a></li>
                <?php
                    endforeach;
                ?>
            </ul>
        </li>
        <?php
            endif;
            endforeach;
        ?>
    </ul>
</div>
<?php
        $i++;
    endforeach;
?>
</nav>