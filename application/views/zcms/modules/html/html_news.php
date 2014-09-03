<div class="col-md-9 productinfo">
    <div class="tab-content" style="min-height: 0;">
        <div id="home" class="tab-pane fade active in">
            
            <?php
                foreach($news->get_news() as $ns) :
            ?>
            <h4>
                <?php
                    echo $ns->title;
                ?>
            </h4>
            <small class="pull-right"><?php echo $ns->date; ?></small>
            <br>
            <br>
            <p class="clearfix">
                <?php 
                    if(!$news->get_news_id() && mb_strlen($ns->text) > 220)
                        $ns->text = mb_strcut($ns->text, 0, 220);
                    
                    echo $ns->text;
                ?>
            </p>
            
            <?php
                if(!$news->get_news_id()) :
            ?>
            <a href="<?php echo $this->zcms->frontend()."". $news->get_news_page(). "?id=". $ns->id_ ?>" class="pull-right">
                ... <?php echo $this->translate->t("повече") ?>
            </a>
            <?php 
                endif;
                endforeach;
            ?>
            
        </div>
    </div>
</div>