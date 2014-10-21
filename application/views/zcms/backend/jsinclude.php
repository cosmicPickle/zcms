<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
?>

<!-- js placed at the end of the document so the pages load faster -->
<script src="<?php echo base_url().ZCMS::JS_PATH; ?>jquery.js"></script>
<script src="<?php echo base_url().ZCMS::JS_PATH; ?>jquery-1.8.3.min.js"></script>
<script src="<?php echo base_url().ZCMS::JS_PATH; ?>jquery-ui/jquery-ui.js"></script>
<script src="<?php echo base_url().ZCMS::JS_PATH; ?>fancybox/jquery.fancybox.js"></script>    
<script src="<?php echo base_url().ZCMS::JS_PATH; ?>bootstrap.min.js"></script>
<script src="<?php echo base_url().ZCMS::JS_PATH; ?>bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script class="include" type="text/javascript" src="<?php echo base_url().ZCMS::JS_PATH; ?>jquery.dcjqaccordion.2.7.js"></script>
<script src="<?php echo base_url().ZCMS::JS_PATH; ?>jquery.scrollTo.min.js"></script>
<script src="<?php echo base_url().ZCMS::JS_PATH; ?>jquery.nicescroll.js" type="text/javascript"></script>
<script src="<?php echo base_url().ZCMS::JS_PATH; ?>jquery.sparkline.js"></script>


<!--common script for all pages-->
<script src="<?php echo base_url().ZCMS::JS_PATH; ?>common-scripts.js"></script>
<script type="text/javascript" src="<?php echo base_url().ZCMS::JS_PATH; ?>gritter/js/jquery.gritter.js"></script>
<script type="text/javascript" src="<?php echo base_url().ZCMS::JS_PATH; ?>gritter-conf.js"></script>

<script type="text/javascript" src="<?php echo base_url().ZCMS::JS_PATH; ?>tinymce/jquery.tinymce.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    
   $('textarea.tiny_mce').tinymce({
        script_url : '<?php echo base_url().ZCMS::JS_PATH; ?>tinymce/tinymce.min.js',
        theme: "modern",
        plugins: [
            "advlist autolink lists link image charmap print preview hr anchor pagebreak",
            "searchreplace wordcount visualblocks visualchars code fullscreen",
            "insertdatetime media nonbreaking save table contextmenu directionality",
            "emoticons template paste textcolor colorpicker textpattern"
        ],
        toolbar1: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image",
        toolbar2: "print preview media | forecolor backcolor emoticons",
        image_advtab: true,
        width:"640",
        height:"480",
        convert_urls: false
   });
   
   var nowTemp = new Date();
   var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);
   
   $( ".datepicker" ).each(function(){
       
       var disable_past = $(this).data('disable-past');
       $(this).datepicker({ 
            format: 'yyyy-mm-dd', 
            onRender: function(date) {
                
                    if(!disable_past)
                        return '';
                    
                    return date.valueOf() < now.valueOf() ? 'disabled' : '';
            }
       });
   });

   $(function() {
        jQuery(".fancybox").fancybox();
   });

});
</script>
