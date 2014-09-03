<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta content="IE=edge" http-equiv="X-UA-Compatible">
        <meta content="width=device-width, initial-scale=1" name="viewport">

        <title><?php echo $page->get_title(); ?></title>
        <meta name="keywords" content="<?php echo $page->get_keywords(); ?>">
        <meta name="description" content="<?php echo $page->get_description(); ?>">
        
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="<?php echo base_url(); ?>public/js/bootstrap.min.js"></script>
        <meta content="MMotors" name="description"><!-- CSS -->
        <link href="<?php echo base_url(); ?>public/css/bootstrap.min.css" rel="stylesheet">
        <link href="<?php echo base_url(); ?>public/css/style.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Ubuntu:400,700&subset=latin,cyrillic' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Ubuntu+Condensed&subset=latin,cyrillic' rel='stylesheet' type='text/css'>
        <link href="<?php echo base_url(); ?>public/css/font-awesome.min.css" rel="stylesheet">
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
        <header>
        <div class="container header">

            <div class="col-md-8 navigation">
                <?php 
                    if($page->get_main_menu())
                    {
                        $this->load->library(ZCMS::MODULES_PATH.'menus/menus_recursive_simple.php');
                        $menu = new Menus_Recursive_Simple();
                        $menu->render($page->get_main_menu());

                        echo $menu->get_html();
                    }
                ?>
                </div>
            </div><!--end navigation -->
            <!--end headercontainer -->
        </header>
        
        <div class="container content">
            <?php
                $this->load->library(ZCMS::MODULES_PATH.'menus/menus_recursive_simple.php');
                $menu = new Menus_Recursive_Simple();
                $menu->render(18,"menus_menu_firm");

                echo $menu->get_html();
            ?>
            <div class="col-md-9 productinfo">
                <div class="tab-content" style="min-height: 0;">
                    <div id="home" class="tab-pane fade active in">
                        <h4><?php echo $page->get_title(); ?></h4>
                        <?php echo $page->get_html(); ?>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>