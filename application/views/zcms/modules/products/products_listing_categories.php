<ul class="categories">
<?php 
    $categories = $listing->get_categories_list();
    foreach($categories as $cat) :
?>
    <li>
        <a href="<?php echo $this->zcms->frontend()
                           .$this->zcms->page->get_page_id()
                           .'?category='.$cat->alias; ?>"
           <?php echo (($listing->get_category() && $cat->id_ == $listing->get_category()->id_) ? "class='active'" : NULL); ?>>
               <?php echo $cat->category ?>
        </a> 
    </li>
<?php 
    endforeach; 
?>
</ul>
<div class="productlist container">
    <img class="cover" src="<?php echo base_url(); ?>public/images/cover.jpg"/>
<?php  
    if($listing->get_category()) :
    $types = $listing->get_types_list();
    $i = 1;
    foreach($types as $type) :
?>
<div class="col-md-3 singlecat cat<?php echo $i; ?>">
    <h2><?php echo $type->type; ?></h2>
    <ul>
<?php
        if($listing->get_listing())
            foreach($listing->get_listing() as $pd) :
                if($pd->type == $type->id_) :
?>
        <li>
            <a href="<?php echo $this->zcms->frontend(); ?>product?code=<?php echo $pd->code; ?>" 
               data-img="<?php echo base_url(); ?>public/uploads/products/images/thumbs/249x180_<?php echo $pd->main_image->file; ?>" 
               data-container="body"  
               data-html="true" 
               data-toggle="popover" 
               data-placement="<?php echo ($i % 4 == 0) ? 'left' : 'right' ?>">
                   <?php echo $pd->title; ?>
            </a>
        </li>
<?php
                endif;
            endforeach;
?>
    </ul>
</div>
<?php
        $i++;
    endforeach;
    endif;
?>
</div>
