<?php


    $level = $menu->get_menu()->sublevel;
    
    foreach($level as $item) :
?>

<div class="dropdown">
    <button id="dropdownMenu1" class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">
        <?php echo $item->label; ?>
    </button>
    <ul class="dropdown-menu">
        <?php
            foreach($item->sublevel as $subitem) :
        ?>
        <li>
            <a href='<?php echo $this->zcms->frontend().'pages/index/'.$subitem->page_id ?>'> <?php echo $subitem->label; ?></a>
        </li>
        <?php
            endforeach;
        ?>
    </ul>
</div>
<?php
    endforeach;