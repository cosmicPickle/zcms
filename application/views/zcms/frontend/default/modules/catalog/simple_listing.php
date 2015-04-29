<?php $top = $module->get_top(); ?>
<?php 
if(!$top) :
?>
<h1 class="page-header">
    <?php echo $this->translate->t("An error occured"); ?>
</h1>
<div class="alert alert-danger alert-dismissable">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <?php echo $this->translate->t("You are trying to access a category that does not exist."); ?>
</div>
<?php
else :
?>
<?php if($module->get_config()->show_category_title->value):?>
<h1 class="page-header"><?php echo $top->category; ?></h1>
<?php endif; ?>

<?php if($module->get_config()->show_category_desc->value):?>
<?php echo $top->description; ?>
<?php endif; ?>

<?php if($module->get_config()->show_category_video->value && $top->video):?>
<div class="embed-responsive embed-responsive-16by9">
    <iframe class="embed-responsive-item spacer" src="https://www.youtube.com/embed/Eg8a6PHJP50" frameborder="0" allowfullscreen></iframe>
</div>
<?php endif; ?>


<?php if($module->get_config()->show_child_categories->value && $top->categories): ?>
<div class="row">
<h3 class="page-header"><?php echo $this->translate->t("Sub-categories")?></h3>
<?php foreach($top->categories as $cat) : ?>
<div class="col-md-2">
    <a href="<?php echo $this->page->link(NULL, array('category' => $cat->alias), TRUE) ?>">
    <?php 
        $img = json_decode($cat->image);
        
        if(!$img)
            $img = "no-image.png";
        else
            $img = "thumbs/150x150_".$img[0]
    ?>
    <h4 class="text-center"><?php echo $cat->category ?></h4>
    <img class="img-responsive" src="<?php echo base_url()?>public/uploads/catalog/categories/images/<?php echo $img ?>">
    </a>
</div>
<?php endforeach; ?>
</div>
<?php endif; ?>


<?php if($module->get_config()->show_pds_in_parent->value || 
           !$module->get_config()->show_pds_in_parent->value && !$top->categories): ?>
    <div class="row">
    <?php if($top->products) : ?>
        <h3 class="page-header"><?php echo $this->translate->t("Products")?></h3>
        <?php foreach($top->products as $pd) : ?>
            <div class="col-md-2">
                <a href="<?php echo $this->page->link($module->get_config()->product_view_page->value, 
                                                     array('product' => $pd->alias), TRUE) ?>">
                <?php 
                    $img = isset($top->product_images[$pd->id_]) ? $top->product_images[$pd->id_] : NULL;
                    if(!$img)
                    {
                        $img = (object)array(
                            'file' => 'no-image.png',
                            'alt' => '',
                            'title' => ''
                        );
                        $img_name = $img->file;
                    }
                    else
                        $img_name = $img->file;
                ?>
                <h4 class="text-center"><?php echo $pd->title ?></h4>
                <img class="img-responsive" src="<?php echo base_url()?>public/uploads/catalog/products/images/<?php echo $img_name; ?>">
                </a>
            </div>
        <?php endforeach; ?>
    <?php else :?>
        <div class="alert alert-warning alert-dismissable">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <?php echo $this->translate->t("There are no products in this category.")?>
        </div>
    <?php endif;?>
    </div>
    <?php 
        if($module->get_config()->pagination->value && $top->products):
            $page = $module->get_config()->page->value;
            $ipp = $module->get_config()->items_per_page->value;
            $pages = ceil($top->product_count/$ipp);

            $min = ($page - 3 < 1) ? 1 : $page - 3;
            $max = ($page + 3 > $pages) ? $pages : $page + 3; 
    ?>
    <div class="row">
        <div class="btn-group" role="group">
            <a class="btn btn-default <?php if($page == 1) echo 'disabled'; ?>" 
               href="<?php echo $this->page->link(NULL, array('page' => 1)); ?>">
                <?php echo $this->translate->t('First') ?>
            </a>
            <a class="btn btn-default <?php if($page == 1) echo 'disabled'; ?>" 
               href="<?php echo $this->page->link(NULL, array('page' => ($page - 1 < 1) ? $page - 1 : 1)); ?>">
                <?php echo $this->translate->t('Prev') ?>
            </a>
            <?php 
                for($i = $min; $i <= $max; $i ++) :
            ?>
            <a class="btn btn-default <?php if($i == $page) echo 'disabled'; ?>" 
               href="<?php echo $this->page->link(NULL, array('page' => $i)); ?>">
                <?php echo $i; ?>
            </a>
            <?php
                endfor;
            ?>
            <a class="btn btn-default <?php if($page == $pages) echo 'disabled'; ?>" 
               href="<?php echo $this->page->link(NULL, array('page' => ($page + 1 > $pages) ? $pages : $page + 1)); ?>">
                <?php echo $this->translate->t('Next') ?>
            </a>
            <a class="btn btn-default <?php if($page == $pages) echo 'disabled'; ?>" 
               href="<?php echo $this->page->link(NULL, array('page' => $pages)); ?>">
                <?php echo $this->translate->t('Last') ?>
            </a>
        </div>
    </div>
    <?php 
        endif;
    ?>
<?php endif; 
endif;
?>
