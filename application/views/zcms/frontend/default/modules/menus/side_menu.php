<!-- Navigation -->
<h1 class="page-header"> <?php echo $menu->label; ?></h1>
<div class="well">
    <ul>
    <?php 
        $items = $menu->sublevel;
        foreach($items as $item) :
    ?>    
        <?php
        if(!isset($item->sublevel) || !$item->sublevel) :
        ?>
        <li> 
            <a href="<?php echo ($item->type != 'static') ? $this->zcms->page->link($item->page_id, $item->params)
                                                                  : $item->url; ?>" target="<?php echo $item->target; ?>">
                <?php echo $item->label; ?>
            </a>
        <?php
        else :
        ?>
        <li class="dropdown"> 
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                <?php echo $item->label; ?><b class="caret"></b>
            </a>
            <ul class="dropdown-menu">
            <?php
            foreach($item->sublevel as $sitem) :
            ?>
                <li><a href="<?php echo ($sitem->type != 'static') ? $this->zcms->page->link($sitem->page_id, $sitem->params)
                                                                  : $sitem->url; ?>" target="<?php echo $sitem->target; ?>">
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
</div>
