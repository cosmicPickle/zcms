<?php
    $menu_obj = $menu->get_menu();
    
?>
<div class="col-sm-6 col-md-3">
<!-- Widget :: Custom Menu -->
<div class="widget_nav_menu widget widget__footer">
  <h3 class="widget-title">
    <?php echo $menu_obj->label; ?>
  </h3>
  <div class="widget-content">
    <ul>
      <?php 
        foreach($menu_obj->sublevel as $item) :
      ?>
      <li>
        <a href="<?php echo $this->zcms->frontend().$item->page_id.$item->params; ?>">
            <?php echo $item->label; ?>
        </a>
      </li>
      <?php
        endforeach;
      ?>
    </ul>
  </div>
</div>
<!-- /Widget :: Custom Menu -->
</div>

<div class="clearfix visible-sm">
</div>

