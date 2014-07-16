<div class="slider">
<?php
    foreach($slider as $slide) :
?>
    <?php
        $slimg = $slide->image;
        $slide->image = json_decode($slide->image);
        
        if(!$slide->image)
            $slide->image = $slimg;
        else
            $slide->image = $slide->image[0];
    ?>
    <div class="slide" style="background: url('<?php echo base_url()."/public/uploads/html/slider/".$slide->image; ?>') no-repeat;">
        <a href="<?php echo $slide->url; ?>"><?php echo $slide->title; ?></a>
    </div>
<?php
    endforeach;
?>
</div>