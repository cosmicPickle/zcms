$(document).ready(function(){
    $('.pd-gallery-tb').click(function(){
       var src = $(this).attr('src');
       $(".pd-gallery-main").fadeOut(200, function(){
           $(".pd-gallery-main").attr('src',src);
           $(".pd-gallery-main").fadeIn(200);
       });
       
    });
});