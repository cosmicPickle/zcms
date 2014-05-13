<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
?>
<!DOCTYPE HTML>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="<?php echo base_url().ZCMS::CSS_PATH; ?>jquery-ui/jquery-ui.css"/>
        <link rel="stylesheet" type="text/css" href="<?php echo base_url().ZCMS::CSS_PATH; ?>backend.css"/>
        <link href="<?php echo base_url().ZCMS::CSS_PATH; ?>/bootstrap/bootstrap.css" rel="stylesheet" media="screen"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    </head>
    <body>
        <?php
            $this->logs->render_logs();
        ?>
        <div class="container" style="margin-top:10%;">
            <div class="span4 offset4">
                <form action="" method="POST">
                    <table class="table table-bordered">
                        <tr><td>Username:</td><td><input type="text" name="username" /></td></tr>
                        <tr><td>Password:</td><td><input type="password" name="password" /></td></tr>
                        <tr><td>&nbsp;</td><td><input type="submit" value="login" class="btn btn-primary" style="float: right;"/></td></tr>
                    </table>
                </form>  
            </div>
        </div>
        <script type="text/javascript" src="<?php echo base_url().ZCMS::JS_PATH; ?>jquery.js"></script>
        <script type="text/javascript" src="<?php echo base_url().ZCMS::JS_PATH; ?>jquery-ui.js"></script>
        <script type="text/javascript" src="<?php echo base_url().ZCMS::JS_PATH; ?>bootstrap/js/bootstrap.min.js"></script>
    </body>
</html>
