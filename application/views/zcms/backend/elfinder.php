<!DOCTYPE html>
<html>
    <head>
        <title> <?php echo $this->translate->t("ZCMS: File Upload") ?></title>
        <link href="<?php echo $this->zcms->asset('js', 'jquery-ui/jquery-ui.css'); ?>" rel="stylesheet" />
        <link href="<?php echo $this->zcms->asset('js', 'jquery-ui/theme.css'); ?>" rel="stylesheet" />
        <link href="<?php echo $this->zcms->asset('js', 'elfinder/css/elfinder.min.css'); ?>" rel="stylesheet" />
        <link href="<?php echo $this->zcms->asset('js', 'elfinder/css/theme.css'); ?>" rel="stylesheet" />
    </head>
    <body>
        <div id="elfinder"></div>
        <script src="<?php echo $this->zcms->asset('js', 'jquery-1.8.3.min.js'); ?>"></script>
        <script src="<?php echo $this->zcms->asset('js', 'jquery-ui/jquery-ui.js'); ?>"></script>
        <script src="<?php echo $this->zcms->asset('js', 'elfinder/elfinder.min.js'); ?>"></script>
        <?php 
                    if($tiny_mce) :
        ?>
        <script type="text/javascript" charset="utf-8">
            $().ready(function() {
                var FileBrowserDialogue = {
                    init: function() {
                      // Here goes your code for setting your custom things onLoad.
                    },
                    mySubmit: function (URL) {
                      // pass selected file path to TinyMCE
                      parent.tinymce.activeEditor.windowManager.getParams().setUrl(URL);

                      // close popup window
                      parent.tinymce.activeEditor.windowManager.close();
                    }
                }
                
                var elf = $('#elfinder').elfinder({
                    
                    url : '<?php echo $this->zcms->backend()."elf/init/".$path ?>',  // connector URL (REQUIRED)
                    getFileCallback: function(file) { // editor callback
                        FileBrowserDialogue.mySubmit(file.url); // pass selected file path to TinyMCE 
                    }
                    
                }).elfinder('instance');            
            });
        </script>
        <?php 
            else:
        ?>
        <script type="text/javascript" charset="utf-8">
            $().ready(function() {
                var elf = $('#elfinder').elfinder({
                    
                    url : '<?php echo $this->zcms->backend()."elf/init/".$path ?>',  // connector URL (REQUIRED)
                    
                }).elfinder('instance');            
            });
        </script>
        <?php 
            endif;
        ?>
        
    </body>
</html>

