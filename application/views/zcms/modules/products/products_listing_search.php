<section class="section-dark" data-animation="fadeInUp">
    <div class="title-accent">
      <h2>
        <?php echo $this->translate->t('Product search for') . ": " . $this->input->get('search'); ?>
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
              <img src="<?php echo base_url()."public/uploads/products/images/thumbs/249x180_".$product->main_image->file; ?>" alt="" />
              <div class="overlay">
                <a href="<?php echo $this->zcms->frontend().'product?code='.$product->code; ?>" class="dlink">
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
                <a href="<?php echo $this->zcms->frontend().'product?code='.$product->code; ?>">
                  <?php echo $product->title; ?>
                </a>
              </h4>
              <a href="<?php echo $this->zcms->frontend().'collections?collection='.$product->type->id_; ?>" class="desc">
                <?php echo $product->type->type; ?>
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