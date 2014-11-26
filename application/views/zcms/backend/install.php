<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
?>
<!DOCTYPE HTML>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>Z-CMS Administration</title>

    <!-- Bootstrap core CSS -->
    <link href="../../public/assets/backend/default/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="../../public/assets/backend/default/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="../../public/assets/backend/default/js/fancybox/jquery.fancybox.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../public/assets/backend/default/css/zabuto_calendar.css">
    <link rel="stylesheet" type="text/css" href="../../public/assets/backend/default/js/bootstrap-datepicker/css/datepicker.css'); ?>" />
    <link rel="stylesheet" type="text/css" href="../../public/assets/backend/default/js/gritter/css/jquery.gritter.css" />
    <link rel="stylesheet" type="text/css" href="../../public/assets/backend/default/lineicons/style.css">    
    
    <!-- Custom styles for this template -->
    <link href="../../public/assets/backend/default/css/style.css" rel="stylesheet">
    <link href="../../public/assets/backend/default/css/style-responsive.css" rel="stylesheet">

    <script src="../../public/assets/backend/default/js/chart-master/Chart.js"></script>
    
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
    <body>
        <section id="container" >
            <header class="header black-bg">
              <div class="sidebar-toggle-box">
                  <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
              </div>
            <!--logo start-->
            <a href="index.html" class="logo"><b>Z-CMS Administration</b></a>
            <!--logo end-->
        </header>
        
        <!-- **********************************************************************************************************************************************************
        MAIN SIDEBAR MENU
        *********************************************************************************************************************************************************** -->
        <!--sidebar start-->
        <aside>
            <div id="sidebar"  class="nav-collapse ">
                <!-- sidebar menu start-->
                <ul class="sidebar-menu" id="nav-accordion">
                    <li><a class="active" href="">Installation</a></li>
                </ul>
                <!-- sidebar menu end-->
            </div>
        </aside>
        <!--sidebar end-->

        <section id="main-content">
            <section class="wrapper"> 
                <div class="modal hide fade" id="zcms-ajax-modal">
                </div>
                <h3>
                    <i class="fa fa-angle-right"></i>
                    Installation
                </h3>
                <div class="row mt">
                    <div class="col-lg-12">
                        <form action="" method="POST" class="style-form form-horizontal">
                        <div class="form-panel">
                            <?php
                                if($this->zcms->installer->errors) :
                                    foreach($this->zcms->installer->errors as $e) :
                            ?>
                                    <div class="alert alert-danger">
                                        <?php echo $e; ?>
                                    </div>
                            <?php
                                    endforeach;
                                endif;
                            ?>
                            <h4 class="mb"><i class="fa fa-angle-right"></i> General Settings </h4>
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label" for="">Base URL:</label>
                                <div class="col-sm-10">
                                    <input type="text" name="config_base_url" class="form-control">
                                    <span class='help-block' style='text-align:justify'>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="form-panel">
                            <h4 class="mb"><i class="fa fa-angle-right"></i> Database Settings </h4>
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label" for="">Username:</label>
                                <div class="col-sm-10">
                                    <input type="text" name="config_db_username" class="form-control">
                                    <span class='help-block' style='text-align:justify'>
                                    </span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label" for="">Password:</label>
                                <div class="col-sm-10">
                                    <input type="text" name="config_db_password" class="form-control">
                                    <span class='help-block' style='text-align:justify'>
                                    </span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label" for="">Database:</label>
                                <div class="col-sm-10">
                                    <input type="text" name="config_db_database" class="form-control">
                                    <span class='help-block' style='text-align:justify'>
                                    </span>
                                </div>
                            </div>
                            <div class="form-actions">
                            </div>
                        </div>
                        
                        <div class="form-panel">
                            <h4 class="mb"><i class="fa fa-angle-right"></i> ZCMS Settings </h4>
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label" for="">Theme:</label>
                                <div class="col-sm-10">
                                    <input type="text" name="config_zcms_theme" class="form-control" value="default">
                                    <span class='help-block' style='text-align:justify'>
                                    </span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label" for="">Default Language:</label>
                                <div class="col-sm-10">
                                    <input type="text" name="config_zcms_default_lang" class="form-control" value="EN">
                                    <span class='help-block' style='text-align:justify'>
                                    </span>
                                </div>
                            </div>
                            <div class="form-actions">
                                <input type="submit" class="btn btn-theme" value="Install">
                            </div>
                        </div>
                        </form>
                    </div>
                </div>
            </section>
        </section>
      </section>
</body>
</html>