<?php

$pd = $module->get_product();
if(!$pd) :
?>
<h1 class="page-header">
    <?php echo $this->translate->t("An error occured"); ?>
</h1>
<div class="alert alert-danger alert-dismissable">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <?php echo $this->translate->t("You are trying to access a product that does not exist."); ?>
</div>
<?php
else :
?>
<h1 class="page-header">
    <?php echo $pd->title; ?>
</h1>
<?php
    $images = $pd->images;
    if($images) {
        $main_img = NULL;
        foreach($images as $img)
            if($img->main)
                $main_img = $img;

        if(!$main_img)
            $main_img = $images[0];
        
    }
    else
        $main_img = (object)array(
                            'file' => 'no-image.png',
                            'alt' => '',
                            'title' => ''
                        );
?>
<div class="col-md-6">
    <img class="img-responsive pd-gallery-main" src="<?php echo base_url()?>public/uploads/catalog/products/images/<?php echo $main_img->file; ?>">
    <div class="row">
    <?php 
        if($images) :
            foreach($images as $img) :
    ?>
    <div class="col-md-3 spacer">
        <img class="img-responsive pd-gallery-tb" src="<?php echo base_url()?>public/uploads/catalog/products/images/<?php echo $img->file; ?>"
             alt="<?php if($img->alt) echo $img->alt; ?>"
             title="<?php if($img->alt) echo $img->title; ?>">
    </div>
    <?php
            endforeach;
        endif;
    ?>
    </div>
    <div class="embed-responsive embed-responsive-16by9">
        <iframe class="embed-responsive-item spacer" src="<?php echo $pd->video; ?>" frameborder="0" allowfullscreen></iframe>
    </div>
</div>
<div class="col-md-6">
    <?php echo $pd->description; ?>
    <?php if($module->get_config()->show_categories->value) :?>
    <h4><?php echo $this->translate->t('Categories')?></h4>
    <div class="breadcrumb">
        <?php 
            if($pd->categories) :
                foreach($pd->categories as $cat):
        ?>
            <a href="<?php echo $this->page->link($module->get_config()->category_page->value, array('category' => $cat->alias), TRUE)?>">
                <?php echo $cat->category; ?>
            </a> | 
        <?php 
                endforeach;
            endif; 
        ?>
    </div>
    <?php endif;?>
    
    <?php if($pd->attributes) : ?>
    <h4><?php echo $this->translate->t('Additional Info')?></h4>
    <table class="table table-bordered table-condensed">
        <?php foreach($pd->attributes as $key => $attr) : ?>
        <tr>
            <th><?php echo $pd->attr_labels[$key]?></th>
            <td><?php echo $attr; ?></td>
        </tr>
        <?php endforeach;?>
    </table>
    <?php endif;?>
    
    <?php if($pd->docs) : ?>
    <h4><?php echo $this->translate->t('Documents')?></h4>
    <ul>
        <?php foreach($pd->docs as $doc) : ?>
        <li>
            <a href="<?php echo base_url()?>public/uploads/catalog/products/docs/<?php echo $doc->file; ?>" target="_blank">
                <?php echo ($doc->title) ? $doc->title : $this->translate->t('Document');?>
            </a>
        </li>
        <?php endforeach; ?>
    </ul>
    <?php endif; ?>
</div>

<?php   
endif;