<?php
if($module->get_config()->show_category_as_title->value):
?>
<h1 class="page-header"><?php echo $category->label; ?></h1>
<?php
endif;
?>

<?php
if($module->get_config()->pagination->value && $module->get_config()->show_pagination->value && $module->get_config()->show_article_count->value):
?>
<div class="breadcrumb">
    <?php echo $this->translate->t("Showing ")?>
    <?php echo (($module->get_config()->article_page->value - 1)*$module->get_config()->items_per_page->value + 1)
                . " - "
                .($module->get_config()->article_page->value*$module->get_config()->items_per_page->value);
    ?>
    <?php echo $this->translate->t("of ")?>
    <?php echo $category->article_count;?>
    
</div>
<?php
endif;
?>

<?php
    foreach($category->articles as $article) :
?>
          
    <?php
    if($module->get_config()->show_title->value):
    ?>
    <h2>
        <a href="<?php echo $this->zcms->page->link(
                    $module->get_config()->single_article_page->value,
                    array('article' => $article->alias),
                    TRUE
                 ); ?>"><?php echo $article->title; ?></a>
    </h2>
    <?php
    endif;
    ?>
    
    <?php
    if($module->get_config()->show_author->value):
    ?>
    <p class="lead">
        <?php echo $this->translate->t("by")." ".$article->author->name; ?>
    </p>
    <?php
    endif;
    ?>
    
    <?php
    if($module->get_config()->show_category->value || $module->get_config()->show_date->value):
    ?>
    <p>
        <?php
        if($module->get_config()->show_date->value):
        ?>
        <i class="fa fa-clock-o"></i> <?php echo $article->date; ?>
        <?php
        endif;
        ?>
        
        <?php
        if($module->get_config()->show_category->value):
        ?>
        <?php echo $this->translate->t("in")." ".$category->label; ?>
        <?php
        endif;
        ?>
    </p>

    <?php
    endif;
    ?>
    <hr>

    <p>
    <?php echo $module->preview_content($article->content); ?>
    </p>
    
    <?php
    if($module->get_config()->show_see_more->value && $module->preview_content($article->content) != $article->content) :
    ?>
        <a class="btn btn-primary" href="<?php echo $this->zcms->page->link(
                    $module->get_config()->single_article_page->value,
                    array('article' => $article->alias),
                    TRUE
                 ); ?>">
        <?php echo $this->translate->t($module->get_config()->see_more_text->value) ?>
        <i class="fa fa-angle-right"></i>
        </a>
    <?php
    endif;
    ?>
    <hr> 
<?php 
    endforeach;
    if($module->get_config()->pagination->value && $module->get_config()->show_pagination->value) :
?>

<div class="btn-group">
        <a class="btn btn-default" href="<?php echo $this->page->link("",array("article_page" => 1)); ?>">
            <?php echo $this->translate->t("First") ?>
        </a>
<?php
    $pages = ceil($category->article_count/$module->get_config()->items_per_page->value);
    for($i = 1; $i <= $pages; $i++):
        $active = $module->get_config()->article_page->value == $i ? " active" : NULL;
?>      
        <a class="btn btn-default<?php echo $active; ?>" href="<?php echo $this->page->link("",array("article_page" => $i)); ?>">
            <?php echo $i; ?>
        </a>
<?php endfor; ?>
        <a class="btn btn-default" href="<?php echo $this->page->link("",array("article_page" => $pages)); ?>">
            <?php echo $this->translate->t("Last") ?>
        </a>
</div>
<?php
    endif;
?>
