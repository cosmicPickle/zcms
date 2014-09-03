<div class="col-md-9 productinfo">
    <div class="tab-content" style="min-height: 0;">
        <div id="home" class="tab-pane fade active in">
<?php 
    if($listing->get_category()) :
?>
<h4><?php echo  $listing->get_category()->category; ?></h4>
<p>
    <?php echo  $listing->get_category()->text; ?>
</p>
<?php
    endif;
?>
<ul class="product-listing">
<?php
    foreach($listing->get_listing() as $product) :
?>
    <li>
        <a href="<?php echo $this->zcms->frontend()
                            .$listing->get_product_render_page()
                            ."?id=".$product->id_; ?>">
            <p><?php echo $product->title; ?></p>
        <?php
            $main_image = isset($product->main_image->file) ? $product->main_image->file : "no-image.png";
        ?>
        <img src="<?php echo base_url().'public/uploads/products/images/thumbs/75x75_'.$main_image; ?>"
             title="<?php echo (isset($product->main_image->title) ? $product->main_image->title : $product->title); ?>"
             alt="<?php echo (isset($product->main_image->alt) ? $product->main_image->alt : $product->title); ?>">
        </a>
    </li>
<?php
    endforeach;
?>
</ul>

        </div>
    </div>
</div>

