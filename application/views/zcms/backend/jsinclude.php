<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
?>

<script type="text/javascript" src="<?php echo base_url().ZCMS::JS_PATH; ?>jquery.js"></script>
<script type="text/javascript" src="<?php echo base_url().ZCMS::JS_PATH; ?>jquery-ui.js"></script>
<script type="text/javascript" src="<?php echo base_url().ZCMS::JS_PATH; ?>zcms-utils.js"></script>
<script type="text/javascript" src="<?php echo base_url().ZCMS::JS_PATH; ?>zcms-ajax.js"></script>
<script type="text/javascript" src="<?php echo base_url().ZCMS::JS_PATH; ?>bootstrap.min.js"></script>
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
   
   $( ".datepicker" ).datepicker({ dateFormat: 'yy-mm-dd' });
});
</script>
