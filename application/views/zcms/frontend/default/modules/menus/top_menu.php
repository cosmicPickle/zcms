<ul>
<?php 
    $items = $menu->sublevel;
    foreach($items as $item) :
?>
    <li>
        
    <?php
    if(!isset($item->sublevel) || !$item->sublevel) :
    ?>
        <a href="<?php echo $this->zcms->page->link($item->page_id, $item->params); ?>">
            <?php echo $item->label; ?>
        </a>
    <?php
    else :
    ?>
        <a href="javascript:;">
            <?php echo $item->label; ?>
        </a>
        <ul>
        <?php
        foreach($item->sublevel as $sitem) :
        ?>
            <li><a href="<?php echo $this->zcms->page->link($sitem->page_id, $sitem->params); ?>">
                <?php echo $sitem->label; ?>
            </a></li>
        <?php
        endforeach;
        ?>
        </ul>
    <?php
    endif;
    ?>
    </li>
<?php
    endforeach;
?>
</ul>