<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
?>

<!-- js placed at the end of the document so the pages load faster -->
<script src="<?php echo $this->zcms->asset('js', 'jquery-1.8.3.min.js'); ?>"></script>
<script src="<?php echo $this->zcms->asset('js', 'jquery-ui/jquery-ui.js'); ?>"></script>
<script src="<?php echo $this->zcms->asset('js', 'fancybox/jquery.fancybox.js'); ?>"></script>   
<script src="<?php echo $this->zcms->asset('js', 'bootstrap.min.js'); ?>"></script>
<script src="<?php echo $this->zcms->asset('js', 'bootstrap-datepicker/js/bootstrap-datepicker.js'); ?>"></script>
<script class="include" type="text/javascript" src="<?php echo $this->zcms->asset('js', 'jquery.dcjqaccordion.2.7.js'); ?>"></script>
<script src="<?php echo $this->zcms->asset('js', 'jquery.scrollTo.min.js'); ?>"></script>
<script src="<?php echo $this->zcms->asset('js', 'jquery.nicescroll.js'); ?>" type="text/javascript"></script>
<script src="<?php echo $this->zcms->asset('js', 'jquery.sparkline.js'); ?>"></script>


<!--common script for all pages-->
<script src="<?php echo $this->zcms->asset('js', 'common-scripts.js'); ?>"></script>
<script type="text/javascript" src="<?php echo $this->zcms->asset('js', 'gritter/js/jquery.gritter.js'); ?>"></script>
<script type="text/javascript" src="<?php echo $this->zcms->asset('js', 'gritter-conf.js'); ?>"></script>

<script type="text/javascript" src="<?php echo $this->zcms->asset('js', 'tinymce/jquery.tinymce.min.js'); ?>"></script>
<script type="text/javascript">

$(document).ready(function() {
    $("a.fancybox").fancybox();
    
    var tinymceInit = function() {
            //TinyMCE generation
       $('textarea.tiny_mce').each(function(){
           var _this = $(this);
           $(this).tinymce({
                script_url : '<?php echo $this->zcms->asset('js', 'tinymce/tinymce.min.js') ?>',
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
                convert_urls: false,
                verify_html : false,
                force_p_newlines : true,
                forced_root_block : '',
                file_browser_callback : function(field_name, url, type, win) {
                    var path = btoa(_this.data('elfinder-root'));
                    elFinderBrowser (field_name, url, type, win, path);
                }
            });
        });

        //TinyMCE Elfinder Generation
        function elFinderBrowser (field_name, url, type, win, path) {
            console.log('<?php echo $this->zcms->backend()."elf/index/1/" ?>' + path);
            tinymce.activeEditor.windowManager.open({
              file: '<?php echo $this->zcms->backend()."elf/index/1/" ?>' + path ,// use an absolute path!
              title: '<?php echo $this->translate->t('ZCMS: File Upload'); ?>',
              width: 900,  
              height: 450,
              resizable: 'yes'
            }, {
              setUrl: function (url) {
                win.document.getElementById(field_name).value = url;
              }
            });
            return false;
        }
    };
   
   //DatePicker Generation
    var datepickerInit = function() {
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
   };
   
   var groupInit = function() {
       $('.grp-add').on('click', function(e){
            e.preventDefault();
            var control = $(this).siblings('.grp-control');
            var next = parseInt(control.attr('data-next'));
            var last = next - 1;
            var next_name = control.data('name') + '[' + next + ']';
            var last_name = new RegExp(control.data('name') + '\[[0-9]*\]');
            var new_row = $(this).siblings('.form-group').last().clone();

            new_row.children().children().each(function(){
                var name = $(this).attr('name');
                if(name)
                {
                    $(this).attr('name', name.replace(last_name, next_name));
                    $(this).val('');
                }
            });
            
            control.attr('data-next', next + 1);
            $(this).last().siblings('.form-group').last().after(new_row);
            datepickerInit();
        });
        
        $('.grp-close').each(function(){
            $(this).parent().css({position : 'relative'});
            $(this).css({
                position : 'absolute',
                top :0,
                right:'20px',
            });
        });
        
        $(document).on('click', '.grp-close', function(e){
            e.preventDefault();
            var cont = $(this).parent();
            var siblings = cont.siblings().length - 3;
            if(siblings)
                $(this).parent().remove();
        });
   };
   
   tinymceInit();
   datepickerInit();
   groupInit();
});
</script>
