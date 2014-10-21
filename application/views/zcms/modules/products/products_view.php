<?php
$pd = $product->get_product();
$categories = $product->get_categories_list();
$is_vertical = in_array($pd->type, $product->get_vertical_gallery_collections());
  
$main_image = NULL;
foreach($pd->images as $key => $img)
    if($img->main == 1)
        $main_image = $img;
    
?>
<ul class="categories<?php if($is_vertical) echo " vertical-gallery-categories" ?>">
    <?php 
        foreach($categories as $cat) :
    ?>
    <li>
        <a <?php if(in_array($cat->alias, json_decode($pd->categories))) echo "class='active'"; ?> href="<?php echo $this->zcms->frontend().'categories?category='.$cat->alias; ?>">
        <?php echo $cat->category; ?>
        </a>
    </li>
    <?php 
        endforeach;
    ?>
</ul>

<div class="productslider col-md-10<?php if($is_vertical) echo " vertical-gallery-productslider" ?>">
        <div id="wowslider-container3">
          <div class="ws_images">
            <ul>
              <?php 
                $i = 0;
                foreach($pd->images as $img) :
              ?>  
                <li>
                  <img src="<?php echo base_url(); ?>public/uploads/products/images/<?php echo $img->file; ?>" alt="<?php echo $img->alt; ?>" title="<?php echo $img->title; ?>" id="wows3_<?php echo $i; ?>"/>
                </li>
              <?php
                    $i++;
                endforeach;
              ?>
            </ul>
      </div>
      <div class="ws_thumbs">
        <div>
            <?php 
              $i = 0;
              foreach($pd->images as $img) :
            ?>  
              <a href="#wows3_<?php echo $i;?>" title="<?php echo $img->title; ?>">
                <img src="<?php echo base_url(); ?>public/uploads/products/images/thumbs/<?php echo (!$is_vertical) ? '116x87' : '85x120' ?>_<?php echo $img->file; ?>" alt="<?php echo $img->alt; ?>"/>
              </a>
            <?php
                  $i++;
              endforeach;
            ?>
        </div>
      </div>
    </div>
</div>

 <div class="col-md-2 title<?php if($is_vertical) echo " vertical-gallery-title" ?>">
      <h2>
          <?php echo $pd->title; ?>
      </h2>
  </div>
  
  
<?php if($pd->description) :  ?>
  <div class="col-md-12 description<?php if($is_vertical) echo " vertical-gallery-description" ?>">
    <p>
        <?php echo $pd->description ?>
    </p>
  </div>
<?php endif; ?>
  
  <div class=" col-md-5 buttons<?php if($is_vertical) echo " vertical-gallery-buttons" ?>">
    <a href="<?php echo $this->zcms->frontend().'contacts?code='.$pd->code; ?>">
      <i class="fa fa-caret-right">
      </i>
      Make an Enquiry 
    </a>
    <?php
        $pdf = isset($pd->files[0]->file) ? $pd->files[0]->file : NULL;
    ?>
      <a class="catalog" href="<?php if($pdf) echo base_url().'public/uploads/products/docs/'.$pdf; ?>">
      Download Catalogue
    </a>
    
  </div>
