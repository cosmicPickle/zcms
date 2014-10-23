<?php
if($module->get_config()->show_category_as_title->value):
?>
<h3><?php echo $category->label; ?></h3>
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
        <?php echo $this->translate->t("See More") ?>
        </a>
    </small><br>
    <?php
    endif;
    ?>
    
<?php endforeach; 
?>

