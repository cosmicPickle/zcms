<div id="myCarousel" class="carousel slide">
    <!-- Indicators -->
    <ol class="carousel-indicators">
    <?php 
        $i = 0;
        if($module->get_config()->show_bullet_nav->value): 
            foreach($slider as $slide) : 
    ?>
        <li data-target="#myCarousel" data-slide-to="<?php echo $i; ?>" <?php if($i == 0) echo 'class="active"'; ?>></li>
    <?php
                $i++;
            endforeach;
        endif;
    ?>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
        <?php 
            $i = 0;
            foreach($slider as $slide) : 
                $slide->image = json_decode($slide->image)
        ?>
        <div class="item <?php if($i == 0) echo "active"; ?>">
            <div class="fill" style="background-image:url('<?php echo base_url().ZCMS::UPLOADS_PATH."slider/images/".$slide->image[0]; ?>')"> </div>
            <div class="carousel-caption">
                <?php if($module->get_config()->show_label->value): ?>
                    <h2><a href="<?php echo $slide->link; ?>"><?php echo $slide->label; ?></a></h2>
                <?php endif; ?>
            </div>
        </div>
        <?php
                $i++;
            endforeach;
        ?>
    </div>

    <?php if($module->get_config()->show_arrows->value): ?>
        <!-- Controls -->
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            <span class="icon-prev"></span>
        </a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <span class="icon-next"></span>
        </a>
    <?php endif; ?>
</div>