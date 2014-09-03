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
    foreach($listing->get_listing() as $category) :
?>
    <li>
        <a href="<?php echo $this->zcms->frontend()
                            .$this->zcms->globals->get("page_id")
                            ."?category=".$category->id; ?>">
            <p><?php echo $category->category; ?></p>
            <?php
                if(json_decode($category->image))
                    $image = current(json_decode($category->image));
                else
                    $image = "no-image.png"
            ?>
            <img src="<?php echo base_url().'public/uploads/products/categories/thumbs/75x75_'.$image; ?>"
                 title="<?php echo $category->category;?>"
                 alt="<?php echo $category->category; ?>">
        </a>
    </li>
<?php
    endforeach;
?>
</ul>
        </div>
    </div>
</div>
