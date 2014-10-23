<?php
if($module->get_config()->show_title->value):
?>
<h1 class="page-header">
    <?php echo $article->title; ?>
        <?php
        if($module->get_config()->show_author->value):
        ?>
        <small>
            <?php echo $this->translate->t(" by ") . $article->author->name; ?>
        </small>
        <?php
        endif;
        ?>
        <?php
        if($module->get_config()->show_category->value):
        ?>
        <small>
        <?php echo $this->translate->t(" in ") . $article->category->label; ?><br>
        </small>
        <?php
        endif;
        ?>
</h1>
<?php
endif;
?>




<?php
if($module->get_config()->show_date->value):
?>
<hr>
<!-- Date/Time -->
<p><i class="fa fa-clock-o"></i> <?php echo $this->translate->t("Posted on ") . $article->date; ?></p>
<hr>
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