<ul>
<?php
    foreach($listing->get_listing() as $product) :
?>
    <li>
        <?php echo $product->title; ?>
        <?php
            $main_image = isset($product->main_image->file) ? $product->main_image->file : "no-image.png";
        ?>
        <img src="<?php echo base_url().'public/uploads/products/images/thumbs/75x75_'.$main_image; ?>"
             title="<?php isset($product->main_image->title) ? $product->main_image->title : $product->title; ?>"
             title="<?php isset($product->main_image->alt) ? $product->main_image->alt : $product->title; ?>">
    </li>
<?php
    endforeach;
?>
</ul>

