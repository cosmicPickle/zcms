<?php
if($module->get_config()->show_header->value):
?>
<h1 class="page-header">
    <?php echo $this->translate->t($module->get_config()->header_text->value) . " : "
               . urldecode($module->get_config()->s->value); ?>
</h1>
<?php
endif;
?>

<?php
if($sresults) :
    foreach($sresults as $sresult) :
?>
          
    <?php
    if($module->get_config()->show_title->value):
    ?>
    <h2>
        <a href="<?php echo $sresult->link ?>"><?php echo $sresult->title; ?></a>
    </h2>
    <?php
    endif;
    ?>

    <hr>

    <p>
    <?php echo $sresult->content; ?>
    </p>
    
    <?php
    if($module->get_config()->show_see_more->value) :
    ?>
        <a class="btn btn-primary" href="<?php echo $sresult->link ?>">
        <?php echo $this->translate->t($module->get_config()->see_more_text->value) ?>
        <i class="fa fa-angle-right"></i>
        </a>
    <?php
    endif;
    ?>
    <hr> 
    
   
<?php 
    endforeach;
else:
    echo $this->translate->t($module->get_config()->no_results_text->value);
endif;
?>