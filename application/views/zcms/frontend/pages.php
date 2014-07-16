<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="keywords" content="<?php echo $page->get_keywords(); ?>">
        <meta name="description" content="<?php echo $page->get_description(); ?>">
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    </head>
    <body>
        <?php 
            if($page->get_main_menu())
            {
                $this->load->library(ZCMS::MODULES_PATH.'menus/menus_main_menu.php');
                $menu = new Menus_Main_Menu();
                $menu->render($page->get_main_menu());
                
                echo $menu->get_html();
            }
        ?>
        <?php echo $page->get_html(); ?>
    </body>
</html>