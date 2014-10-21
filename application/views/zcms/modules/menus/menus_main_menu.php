<div class="col-md-12 navigation">
    <ul>
<?php
    $level = $menu->get_menu()->sublevel;
    $i = 1;
    
    foreach($level as $item) :
?>

    <li>
        <a href="<?php echo $this->zcms->frontend().$item->page_id.$item->params; ?>">
            <?php echo mb_strtoupper($item->label); ?>
        </a>
    </li>
<?php
        $i++;
    endforeach;
?>
   </ul>
</div>
