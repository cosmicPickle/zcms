<!DOCTYPE html>
<html lang="en">
  <head>
   <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Bootstrap Core CSS -->
    <link href="<?php echo $this->zcms->asset('css', 'bootstrap.min.css'); ?>" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="<?php echo $this->zcms->asset('css', 'modern-business.css'); ?>" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="<?php echo $this->zcms->asset('', 'font-awesome-4.1.0/css/font-awesome.min.css'); ?>" rel="stylesheet" type="text/css">
    
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <title><?php echo $page->get_title(); ?></title>
    <meta name="keywords" content="<?php echo $page->get_keywords(); ?>">
    <meta name="description" content="<?php echo $page->get_description(); ?>">
  </head>
  <body>

      <?php echo $page->get_html(); ?>
    
      <!-- jQuery Version 1.11.0 -->
      <script src="<?php echo $this->zcms->asset('js', 'jquery-1.11.0.js'); ?>"></script>

      <!-- Bootstrap Core JavaScript -->
      <script src="<?php echo $this->zcms->asset('js', 'bootstrap.min.js'); ?>"></script>

      <!-- Script to Activate the Carousel -->
      <script>
      $('.carousel').carousel({
          interval: 5000 //changes the speed
      })
      </script>
  </body>
</html>
