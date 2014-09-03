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
                <div class="pull-left">
                    <div class="btn-group pull-left" style="margin-right:5px;">
                        <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
                            <?php echo $this->translate->t("Languages") ?>
                            <span class="caret"></span>
                        </a>
                        <?php 
                            if($this->zcms->languages) : 
                        ?>
                        <ul class="dropdown-menu">
                            <?php 
                                 foreach($this->zcms->languages as $lang) :
                            ?>
                            <li>
                                <a href="<?php echo $this->zcms->backend()."dashboard?lang=".$lang->lang_code; ?>"><?php echo $lang->language; ?></a>
                            </li>
                            <?php
                                endforeach;
                            ?>
                        </ul>
                        <?php
                            endif;
                        ?>
                    </div>
                    <a href="javascript:history.back();" class="btn pull-left"><?php echo $this->translate->t("Back"); ?></a></li>
                </div>
                <ul class="nav pull-left">
                    <?php $this->zcms->menu->render_menu(); ?>
                </ul>
            </div>
        </div>
        <div class="modal hide fade" id="zcms-ajax-modal">
        </div>
        <div class="container-fluid">
            <div class="row-fluid">
                