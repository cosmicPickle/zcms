<div class="panel panel-default" style="margin-top:10px;">
    <?php if($module->get_config()->show_title->value) : ?>
    <div class="panel-heading">
        <h4><?php echo $widget->title; ?></h4>
    </div>
    <?php 
    endif;
    ?>
    <div class="panel-body">
        <?php echo $widget->content; ?>
        <?php if($module->get_config()->show_link->value) : ?>
        <a href="<?php echo $widget->link; ?>" class="btn btn-default">
            <?php echo $this->translate->t($module->get_config()->link_text->value); ?>
        </a>
        <?php 
        endif;
        ?>
    </div>
</div>