<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
?>
<!DOCTYPE HTML>
<html>
    <head>
        <meta charset='utf-8' />
        <link rel="stylesheet" type="text/css" href="<?php echo base_url().ZCMS::CSS_PATH; ?>backend.css" media="screen"/>
        <link rel="stylesheet" type="text/css" href="<?php echo base_url().ZCMS::CSS_PATH; ?>jquery-ui/jquery-ui.css" media="screen"/>
        <link rel="stylesheet" type="text/css" href="<?php echo base_url().ZCMS::CSS_PATH; ?>bootstrap/bootstrap.css" media="screen"/>
    </head>
    <body>
        <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="navbar-inner" style="padding:0 10px">
                    <a class="brand" href="#"><?php echo $this->translate->t("Z-CMS Administration"); ?></a>
                    <ul class="nav">
                       <?php $this->zcms->menu->render_menu(); ?>
                    </ul>
                    <a href="javascript:history.back();" class="btn pull-right"><?php echo $this->translate->t("Back"); ?></a>
            </div>
        </div>
        <div class="modal hide fade" id="zcms-ajax-modal">
        </div>
        <div class="container-fluid">
            <div class="row-fluid">
                