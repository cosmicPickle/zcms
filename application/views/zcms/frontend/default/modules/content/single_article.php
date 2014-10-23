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
In: <?php echo $article->category->label; ?><br>
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

<?php echo $article->content; ?>