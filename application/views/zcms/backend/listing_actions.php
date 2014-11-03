<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

    $this->load->helper('form');
    
    switch($action)
    {
        case 'add_column':
        {
?>
        <?php echo form_open('', array("class" => "form-horizontal zcms-ajax-form", 'style' => "margin-bottom: 0"));?>
         <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h3><?php echo $this->zcms->translate->t("Add Column"); ?></h3>
        </div>
        <?php $this->zcms->logs->render_logs(); ?>
        <div class="modal-body">
            <div class="control-group">
                <label class="control-label" for="column"><?php echo $this->zcms->translate->t("Column Id"); ?>:</label>
                <div class="controls">
                  <select name="column" id="column">
                      <?php 
                        foreach($columns as $col)
                        {
                            echo "<option value='".$col."'>".$col."</option>";
                        }
                      ?>
                  </select>
                </div>
             </div>
            <div class="control-group">
                <label class="control-label" for="label"><?php echo $this->zcms->translate->t("Column Label"); ?>:</label>
                <div class="controls">
                  <input type="text" name="label" id="label">
                </div>
             </div>
        </div>
        <div class="modal-footer">
            <a href="#" class="btn" data-dismiss="modal" aria-hidden="true"><?php echo $this->zcms->translate->t("Close"); ?></a>
            <a href="#" class="btn btn-warning zcms-ajax-refresh"><i class="icon-refresh icon-white"></i> <?php echo $this->zcms->translate->t("Refresh page"); ?></a> 
            <input type="submit" name="submit" value="<?php echo $this->zcms->translate->t("Add"); ?>" class="btn btn-primary">
        </div>
<?php
        }break;
        case 'remove_column':
        {
?>
        <?php echo form_open('', array("class" => "form-horizontal zcms-ajax-form", 'style' => "margin-bottom: 0"));?>
         <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h3><?php echo $this->zcms->translate->t("Remove Column"); ?></h3>
        </div>
        <?php $this->zcms->logs->render_logs(); ?>
        <div class="modal-body">
            <div class="control-group">
                <label class="control-label" for="column"><?php echo $this->zcms->translate->t("Column Id"); ?>:</label>
                <div class="controls">
                  <select name="column" id="column">
                      <?php 
                        foreach($columns as $col => $label)
                        {
                            echo "<option value='".$col."'>".$label."</option>";
                        }
                      ?>
                  </select>
                </div>
             </div>
        </div>
        <div class="modal-footer">
            <a href="#" class="btn" data-dismiss="modal" aria-hidden="true"><?php echo $this->zcms->translate->t("Close"); ?></a>
            <a href="#" class="btn btn-warning zcms-ajax-refresh"><i class="icon-refresh icon-white"></i> <?php echo $this->zcms->translate->t("Refresh page"); ?></a> 
            <input type="submit" name="submit" value="<?php echo $this->zcms->translate->t("Remove"); ?>" class="btn btn-primary">
        </div>
<?php
        }break;
    }
?>

