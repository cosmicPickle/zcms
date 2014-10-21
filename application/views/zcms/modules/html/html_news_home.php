<?php

foreach($news->get_news() as $ns) :
?>
<h4><?php echo $ns->title; ?><small class="pull-right"><?php echo $ns->date; ?></small></h4>
<?php 
    if(mb_strlen($ns->text) > 220)
        $ns->text = mb_strcut($ns->text, 0, 220);
    echo $ns->text;
?>
<br>
<a href="<?php echo $this->zcms->frontend()."". $news->get_news_page(). "?id=". $ns->id_ ?>" class="pull-right">
    ... <?php echo $this->translate->t("повече") ?>
</a>
<div class="clearfix"></div>
<?php
endforeach;
?>

<a class="btn btn-default btn-sm" href="<?php echo $this->zcms->frontend()."". $news->get_news_page() ?>"
        type="button">
    <span class="glyphicon glyphicon-circle-arrow-right" style="color:#f77a00;margin-right:5px;"></span>
    <?php echo mb_strtoupper($this->translate->t('Всички новини')); ?>
</a>