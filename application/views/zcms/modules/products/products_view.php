<?php
$pd = $product->get_product();


$main_image = NULL;
foreach($pd->images as $key => $img)
    if($img->main == 1)
        $main_image = $img;
?>

<div class="col-md-9 productinfo">
    <ul class="nav nav-tabs">
        <li class="active">
            <a data-toggle="tab" href="#home"><?php echo $this->translate->t('Кратко представяне'); ?></a>
        </li>

        <li>
            <a data-toggle="tab" href="#profile"><?php echo $this->translate->t('Повече информация'); ?></a>
        </li>

        <li>
            <a data-toggle="tab" href="#messages"><?php echo $this->translate->t('Технически данни'); ?></a>
        </li>

        <li>
            <a data-toggle="tab" href="#settings"><?php echo $this->translate->t('Документи за теглене'); ?></a>
        </li>
    </ul><!-- Tab panes -->
    
     <div class="tab-content">
            <div class="tab-pane fade in active" id="home">
                <span class="code"><?php echo $this->translate->t('Код').' : '.$pd->code; ?></span>

                <h2><?php echo $pd->title; ?></h2>

                <div class="col-md-6 images">
                    <?php if($main_image) : ?>
                    <img class="main-image" src="<?php echo base_url()."public/uploads/products/images/thumbs/320x320_".$main_image->file?>">
                    <?php endif; ?>
                    <div class="thumbs">
                        <?php
                            foreach($pd->images as $thumb):
                        ?>
                            <img src="<?php echo base_url()."public/uploads/products/images/thumbs/100x100_".$thumb->file?>">
                        <?php
                            endforeach;
                        ?>
                    </div>
                    <!--end thumbs-->
                </div><!--end images-->

                <div class="col-md-6 short-description">
                    <h4><span class="glyphicon glyphicon-info-sign"></span>
                    <?php echo $this->translate->t('Кратко описание'); ?></h4>

                    <p><a href="#"><strong><?php if(isset($pd->category->category)) echo mb_strtoupper($pd->category->category). ";"; ?></strong></a> 
                    <a href="#"><strong><?php echo mb_strtoupper($pd->title); ?></strong></a></p>

                    <?php echo $pd->short_description; ?>

                    <a href="<?php echo $this->zcms->frontend().'query?id='.$pd->id_; ?>" class="btn btn-default btn-lg" 
                            type="button">
                        <span class="glyphicon glyphicon-circle-arrow-right"></span>
                        <?php echo mb_strtoupper($this->translate->t('Изпрати запитване')); ?>
                    </a>
                    
                    <div class="to-shop-btn to-shop-btn-lg">
                        <a href="<?php echo $pd->shop_url; ?>">
                            <?php echo mb_strtoupper($this->translate->t("Buy online")); ?>
                            <img src="http://dildesign-studio.com/dev/mmotors-site/public/images/cart.png">
                        </a>
                    </div>
                </div><!--end short desc-->
            </div><!--end tab pane-->

            <div class="tab-pane fade" id="profile">
                <h2><?php echo $pd->title; ?></h2>

                <?php echo $pd->description; ?>

                    <a href="<?php echo $this->zcms->frontend().'query?id='.$pd->id_; ?>" class="btn btn-default btn-lg pull-left" 
                            type="button">
                        <span class="glyphicon glyphicon-circle-arrow-right"></span>
                        <?php echo mb_strtoupper($this->translate->t('Изпрати запитване')); ?>
                    </a>
                    
                    <div class="to-shop-btn to-shop-btn-lg pull-left" style="margin-left:10px;">
                        <a href="<?php echo $pd->shop_url; ?>">
                            <?php echo mb_strtoupper($this->translate->t("Buy online")); ?>
                            <img src="http://dildesign-studio.com/dev/mmotors-site/public/images/cart.png">
                        </a>
                    </div>
            </div>

            <div class="tab-pane fade" id="messages">
                <h2><?php echo $pd->title; ?></h2>
                <?php
                    if(json_decode($pd->schematic)) :
                ?>
                <img src="<?php echo base_url()."public/uploads/products/schematics/".current(json_decode($pd->schematic)); ?>">
                <?php
                    endif;
                ?>
                
                <?php echo $pd->technical_info; ?>

                    <a href="<?php echo $this->zcms->frontend().'query?id='.$pd->id_; ?>" class="btn btn-default btn-lg pull-left" 
                            type="button">
                        <span class="glyphicon glyphicon-circle-arrow-right"></span>
                        <?php echo mb_strtoupper($this->translate->t('Изпрати запитване')); ?>
                    </a>
                    
                    <div class="to-shop-btn to-shop-btn-lg pull-left" style="margin-left:10px;">
                        <a href="<?php echo $pd->shop_url; ?>">
                            <?php echo mb_strtoupper($this->translate->t("Buy online")); ?>
                            <img src="http://dildesign-studio.com/dev/mmotors-site/public/images/cart.png">
                        </a>
                    </div>
            </div>

            <div class="tab-pane fade" id="settings">
                <h2><?php echo $pd->title; ?></h2>

                <?php 
                    foreach($pd->docs as $doc) :
                ?>
                <a href="<?php echo base_url()."public/uploads/products/docs/".$doc->file; ?>" target="_blank">
                    <h4 style="line-height:70px;"><?php echo $doc->title ?> <i class="fa fa-file-pdf-o fa-3x pull-right" ></i></h4>
                </a>

                <?php 
                    endforeach;
                ?>
                <a href="<?php echo $this->zcms->frontend().'query?id='.$pd->id_; ?>" class="btn btn-default btn-lg pull-left" 
                            type="button">
                        <span class="glyphicon glyphicon-circle-arrow-right"></span>
                        <?php echo mb_strtoupper($this->translate->t('Изпрати запитване')); ?>
                 </a>
                    
                <div class="to-shop-btn to-shop-btn-lg pull-left" style="margin-left:10px;">
                    <a href="<?php echo $pd->shop_url; ?>">
                        <?php echo mb_strtoupper($this->translate->t("Buy online")); ?>
                        <img src="http://dildesign-studio.com/dev/mmotors-site/public/images/cart.png">
                    </a>
                </div>

            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function(){
       $('.thumbs img').click(function(){
           var srcArr = $(this).attr('src').split('100x100_');
           var src = srcArr[0] + "320x320_" + srcArr[1];
           
           $('.main-image').fadeOut(300,function(){
               $('.main-image').attr('src', src);
               $('.main-image').fadeIn(300);
           })
       }) 
    });
</script>

