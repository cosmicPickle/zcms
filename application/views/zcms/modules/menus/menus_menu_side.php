<div class="col-md-3 sidebar">
    <a class="btn btn-default btn-lg" type="button" href="<?php echo $this->zcms->frontend().'mmotors_fans_filter'?>">
        <span class="glyphicon glyphicon glyphicon-tasks"></span> 
            <?php echo mb_strtoupper($this->translate->t("Филтриране")); ?>
    </a>
    
    <h2><?php echo $this->translate->t("Categories") ?></h2>
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