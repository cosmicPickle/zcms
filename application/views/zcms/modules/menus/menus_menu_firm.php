<div class="col-md-3 sidebar">

    <h2><?php echo $menu->get_menu()->label ?></h2>
    <ul>
    <?php
        $level1 = $menu->get_menu()->sublevel;
        foreach($level1 as $item) :
    ?>
        <li>
            <a href='<?php echo $this->zcms->frontend().''.$item->page_id ?>'> <?php echo $item->label; ?></a>
        </li>
    <?php
        endforeach;
    ?>
    </ul>
</div>