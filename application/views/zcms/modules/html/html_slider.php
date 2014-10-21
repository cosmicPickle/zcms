<div class="slider">
<?php
    $i = 0;
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
    <div class="slide" id="slide-<?php echo $i; ?>" style="background: url('<?php echo base_url()."/public/uploads/html/slider/".$slide->image; ?>') no-repeat;<?php if($i) echo 'display:none;'; ?>">
        <a href="<?php echo $slide->url; ?>"><?php echo $slide->title; ?></a>
    </div>
<?php
        $i++;
    endforeach;
?>
    <ul class="slider-ui">
<?php
    $i = 0;
    foreach($slider as $slide) :
?>
        <li>
            <a href="" id="slider-ui-<?php echo $i; ?>" <?php if(!$i) echo 'class="current"'; ?> data-to="<?php echo $i; ?>"></a>
        </li>
<?php
        $i++;
    endforeach;
?>
    </ul>
</div>

<script type="text/javascript">
    $(document).ready(function(){
       var changeTime = 5000;
       var animationSpeed = 500;
       var currentSlide = 0;
       var numberSlides = $(".slide").length;
       
       //The function that changes the slide
       var changeSlide = function(toSlide) {
           
           $("#slide-" + currentSlide).fadeOut(animationSpeed);
           $("#slider-ui-" + currentSlide).removeClass("current");
           
           if(typeof toSlide != "undefined")
               currentSlide = toSlide;
           else
           {
               currentSlide++;
               if(currentSlide > numberSlides - 1)
                   currentSlide = 0;
           }
           
           $("#slide-" + currentSlide).fadeIn(animationSpeed);
           $("#slider-ui-" + currentSlide).addClass("current");
       };
       
       var timeout = setInterval(changeSlide, changeTime);
       
       $(".slider-ui li a").click(function(e){
           e.preventDefault();
           
           var toSlide = $(this).data("to");
           
           clearInterval(timeout);
           changeSlide(toSlide);
           timeout = setInterval(changeSlide, changeTime);
       });
    });
</script>
