<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title><?php echo $page->get_title(); ?></title>
    <meta name="keywords" content="<?php echo $page->get_keywords(); ?>">
    <meta name="description" content="<?php echo $page->get_description(); ?>">
  </head>
  <body>

      <?php echo $page->get_html(); ?>
    
  </body>
</html>
