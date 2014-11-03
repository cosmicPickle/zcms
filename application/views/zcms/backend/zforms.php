<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed'); 
?>
    <h3>
        <i class="fa fa-angle-right"></i>
        <?php echo $this->zcms->translate->t("Edit/Insert"); ?>
    </h3>
    <div class="row mt">
        <div class="col-lg-12">
            <div class="form-panel">
                <?php
                    echo form_open_multipart('', array("class" => "style-form form-horizontal"));
                ?>
                 <?php
                    if($this->zcms->logs->check_log())
                    {
                ?>
                    <?php echo $this->zcms->logs->render_logs();?>
                <?php
                    }
                ?>   
                <?php  
                    foreach($fields as $field)
                       echo '<div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label" for="'.$field->setting('name').'">'.$field->label().':</label>
                                <div class="col-sm-10">'
                                    .$field->render()."
                                    <span class='help-block' style='text-align:justify'>
                                    ".$field->setting('description')."</span>
                                </div>
                             </div>"; 
                ?>
                <div class="form-actions">
                        <?php echo ($submit ? $submit->render() : NULL) ?>
                </div>
                <?php
                    echo form_close();
                ?>
            </div>
        </div>
    </div>





