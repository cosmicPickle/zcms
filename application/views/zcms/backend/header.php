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

    <title><?php echo $this->translate->t("Z-CMS Administration"); ?></title>

    <!-- Bootstrap core CSS -->
    <link href="<?php echo base_url().ZCMS::CSS_PATH; ?>bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="<?php echo base_url().ZCMS::ASSETS_PATH; ?>font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="<?php echo base_url().ZCMS::JS_PATH; ?>fancybox/jquery.fancybox.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="<?php echo base_url().ZCMS::CSS_PATH; ?>zabuto_calendar.css">
    <link rel="stylesheet" type="text/css" href="<?php echo base_url().ZCMS::JS_PATH; ?>bootstrap-datepicker/css/datepicker.css" />
    <link rel="stylesheet" type="text/css" href="<?php echo base_url().ZCMS::JS_PATH; ?>gritter/css/jquery.gritter.css" />
    <link rel="stylesheet" type="text/css" href="<?php echo base_url().ZCMS::ASSETS_PATH; ?>lineicons/style.css">    
    
    <!-- Custom styles for this template -->
    <link href="<?php echo base_url().ZCMS::CSS_PATH; ?>style.css" rel="stylesheet">
    <link href="<?php echo base_url().ZCMS::CSS_PATH; ?>style-responsive.css" rel="stylesheet">

    <script src="<?php echo base_url().ZCMS::JS_PATH; ?>chart-master/Chart.js"></script>
    
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
            <a href="index.html" class="logo"><b><?php echo $this->translate->t("Z-CMS Administration"); ?></b></a>
            <!--logo end-->
            <div class="nav notify-row" id="top_menu">
                <!--  notification start -->
                <ul class="nav top-menu">
                    <!-- settings start -->
                    <li class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="index.html#">
                            <i class="fa fa-tasks"></i>
                        </a>
                        <ul class="dropdown-menu extended tasks-bar">
                            <div class="notify-arrow notify-arrow-green"></div>
                            <li>
                                <p class="green"><?php echo $this->translate->t('Change Language') ?></p>
                            </li>
                            <?php 
                                if($this->zcms->languages) : 
                                     foreach($this->zcms->languages as $lang) :
                             ?>
                                <li>
                                    <div class="task-info">
                                        <div class="desc">
                                            <a href="<?php echo $this->zcms->backend()."dashboard?lang=".$lang->lang_code; ?>">
                                                <?php echo $lang->language; ?>
                                            </a>
                                        </div>
                                    </div>  
                                </li>
                                <?php
                                    endforeach;
                                endif;
                            ?>
                        </ul>
                    </li>
                    <!-- settings end -->
                    <!-- inbox dropdown start-->
                </ul>
                <!--  notification end -->
            </div>
            <div class="top-menu">
            	<ul class="nav pull-right top-menu">
                    <li><a class="logout" href="<?php echo $this->zcms->backend()."authenticate/logout" ?>">Logout</a></li>
            	</ul>
            </div>
        </header>
        
        <!-- **********************************************************************************************************************************************************
      MAIN SIDEBAR MENU
      *********************************************************************************************************************************************************** -->
      <!--sidebar start-->
      <aside>
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu" id="nav-accordion">
              
                  <p class="centered"><img src="<?php echo base_url().ZCMS::UPLOADS_PATH ?>admins/images/<?php echo $this->zcms->auth->session_info()->image; ?>" class="img-circle" width="60"></p>
              	  <h5 class="centered"><?php echo $this->zcms->auth->session_info()->user; ?></h5>
              	  
                  <?php $this->zcms->menu->render_menu(); ?>
                  
              </ul>
              <!-- sidebar menu end-->
          </div>
      </aside>
      <!--sidebar end-->
      
      <section id="main-content">
          <section class="wrapper"> 
            <div class="modal hide fade" id="zcms-ajax-modal">
            </div>
                