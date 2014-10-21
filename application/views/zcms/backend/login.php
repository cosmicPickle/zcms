<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
?>
<!DOCTYPE HTML>
<html>
    <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title><?php echo $this->translate->t("Z-CMS Administration"); ?></title>

    <!-- Bootstrap core CSS -->
    <link href="<?php echo base_url().ZCMS::CSS_PATH; ?>bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="<?php echo base_url().ZCMS::ASSETS_PATH; ?>font-awesome/css/font-awesome.css" rel="stylesheet" />
        
    <!-- Custom styles for this template -->
    <link href="<?php echo base_url().ZCMS::CSS_PATH; ?>style.css" rel="stylesheet">
    <link href="<?php echo base_url().ZCMS::CSS_PATH; ?>style-responsive.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
    <body>
        <div id="login-page">
            <div class="container">
                <form class="form-login" action="" method="POST">
                    <h2 class="form-login-heading"><?php echo $this->zcms->translate->t("sign in now"); ?></h2>
                    <div class="login-wrap">
                        <?php
                            $this->logs->render_logs();
                        ?>
                        <input type="text" name="username" class="form-control" placeholder="User ID" autofocus>
                        <br>
                        <input type="password" name="password" class="form-control" placeholder="Password">
                        <br>
                        <button class="btn btn-theme btn-block" type="submit"><i class="fa fa-lock"></i> SIGN IN</button>
		        <hr>
                    </div>
                </form>
            </div>
        </div> 
        <script type="text/javascript" src="<?php echo base_url().ZCMS::JS_PATH; ?>jquery.js"></script>
        <script type="text/javascript" src="<?php echo base_url().ZCMS::JS_PATH; ?>jquery-ui.js"></script>
        <script type="text/javascript" src="<?php echo base_url().ZCMS::JS_PATH; ?>bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="<?php echo base_url().ZCMS::JS_PATH; ?>jquery.backstretch.min.js"></script>
        <script>
            $.backstretch("<?php echo base_url().ZCMS::ASSETS_PATH; ?>img/background.png", {speed: 500});
        </script>
    </body>
</html>
