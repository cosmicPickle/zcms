<div class="col-md-12 news">
        <?php
            foreach($news->get_news() as $ns) :
        ?>
        <div class="col-md-<?php echo (!$news->get_news_id()) ? "6" : "12" ?> news-content">
            <h4>
                <?php
                    echo $ns->title;
                ?>
            </h4>
            <small class="pull-right"><?php echo $ns->date; ?></small>

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
        ?>
        </div>
        <?php
            endforeach;
        ?>
</div>