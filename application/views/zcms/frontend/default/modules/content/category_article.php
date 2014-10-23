<?php
if($module->get_config()->show_category_as_title->value):
?>
<h3><?php echo $category->label; ?></h3>
<?php
endif;
?>

<?php
if($module->get_config()->pagination->value && $module->get_config()->show_pagination->value && $module->get_config()->show_article_count->value):
?>
<small>
    <?php echo $this->translate->t("Showing ")?>
    <?php echo (($module->get_config()->article_page->value - 1)*$module->get_config()->items_per_page->value + 1)
                . " - "
                .($module->get_config()->article_page->value*$module->get_config()->items_per_page->value);
    ?>
    <?php echo $this->translate->t("of ")?>
    <?php echo $category->article_count;?>
    
</small>
<?php
endif;
?>
<?php
    foreach($category->articles as $article) :
?>
    <?php
    if($module->get_config()->show_title->value):
    ?>
    <h4><?php echo $article->title; ?></h4>
    <?php
    endif;
    ?>

    <?php
    if($module->get_config()->show_category->value):
    ?>
    In: <?php echo $category->label; ?><br>
    <?php
    endif;
    ?>

    <?php
    if($module->get_config()->show_author->value):
    ?>
    By: <?php echo $article->author->name; ?>
    <?php
    endif;
    ?>

    <?php
    if($module->get_config()->show_date->value):
    ?>
    <small><?php echo $article->date; ?></small><br>
    <?php
    endif;
    ?>

    <?php echo $module->preview_content($article->content); ?>
    <br>
    
    <?php
    if($module->get_config()->show_see_more->value && $module->preview_content($article->content) != $article->content) :
    ?>
    <small>
        <a href="<?php echo $this->zcms->page->link(
                    $module->get_config()->single_article_page->value,
                    array('article' => $article->alias),
                    TRUE
                 ); ?>">
        <?php echo $this->translate->t($module->get_config()->see_more_text->value) ?>
        </a>
    </small><br>
    <?php
    endif;
    ?>
    
<?php 
    endforeach;
    if($module->get_config()->pagination->value && $module->get_config()->show_pagination->value) :
?>

<ul>
    <li>
        <a href="<?php echo $this->page->link("",array("article_page" => 1)); ?>">
            <?php echo $this->translate->t("First") ?>
        </a>
    </li>
<?php
    $pages = ceil($category->article_count/$module->get_config()->items_per_page->value);
    for($i = 1; $i <= $pages; $i++):
?>  
    <li>
        <a href="<?php echo $this->page->link("",array("article_page" => $i)); ?>">
            <?php echo $i; ?>
        </a>
    </li>
<?php endfor; ?>
    <li>
        <a href="<?php echo $this->page->link("",array("article_page" => $pages)); ?>">
            <?php echo $this->translate->t("Last") ?>
        </a>
    </li>
</ul>
<?php
    endif;
?>
