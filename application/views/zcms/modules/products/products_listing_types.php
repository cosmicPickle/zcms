<ul class="categories">
<?php 
    $types = $listing->get_types_list();
    foreach($types as $type) :
?>
    <li>
        <a href="<?php echo $this->zcms->frontend()
                           .$this->zcms->page->get_page_id()
                           .'?collection='.$type->id_; ?>"
           <?php echo (($listing->get_type() && $type->id_ == $listing->get_type()->id_) ? "class='active'" : NULL); ?>>
               <?php echo $type->type; ?>
        </a> 
    </li>
<?php 
    endforeach; 
?>
</ul>
<?php
    if($type = $listing->get_type()) :
        if($type->image)
        {
            $type->image = json_decode($type->image);
            $type->image = $type->image[0];
        }
?>
<div class="productlist container">
    <img class="cover" src="<?php echo base_url(); ?>public/uploads/products/types/<?php echo ($type->image) ? $type->image : "no-image-cover.png"; ?>"/>
</div>
<section class="section-dark" data-animation="fadeInUp">
    <div class="title-accent">
      <h2>
        <?php echo $type->type; ?>
      </h2>
    </div>
    <div class="prev-next-holder text-right">
      <a class="prev-btn" id="carousel-prev">
        <i class="fa fa-angle-left">
        </i>
      </a>
      <a class="next-btn" id="carousel-next">
        <i class="fa fa-angle-right">
        </i>
      </a>
    </div>
    <div class="row">
      <div id="owl-carousel" class="owl-carousel">
        <?php 
            foreach($listing->get_listing() as $product) :
        ?>
        <div class="project-item">
          <div class="project-item-inner">
            <figure class="alignnone project-img">
              <?php
                
                if($product->type == 9 || $product->type == 10) 
                    $img = '249x364_'.$product->main_image->file;
                else    
                    $img = '249x180_'.$product->main_image->file;
                
                if(file_exists("public/uploads/products/images/thumbs/".$img)) :
              ?>
              <img src="<?php echo base_url()."public/uploads/products/images/thumbs/".$img; ?>" alt="" />
              <?php 
                endif;
              ?>
              <div class="overlay">
                <a href="<?php echo $this->zcms->frontend().'product_collection?code='.$product->code; ?>" class="dlink">
                  <i class="fa fa-link">
                  </i>
                </a>
                <a href="<?php echo base_url()."public/uploads/products/images/".$product->main_image->file; ?>" class="popup-link zoom">
                  <i class="fa fa-search-plus">
                  </i>
                </a>
              </div>
            </figure>
            <div class="project-desc">
              <h4 class="title">
                <a href="<?php echo $this->zcms->frontend().'product_collection?code='.$product->code; ?>">
                  <?php echo $product->title; ?>
                </a>
              </h4>
              <a href="<?php echo $this->zcms->frontend().'collections?collection='.$type->id_; ?>" class="desc">
                <?php echo $type->type; ?>
              </a>
            </div>
          </div>
        </div>
        <?php
            endforeach;
        ?>


      </div>
    </div>
</section>
<?php
    endif;
?>