<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed'); 
?>
<div class="well">
<?php
echo form_open_multipart('', array("class" => "form-horizontal"));
?>

            <div class="page-header">
                <h1>
                    <?php echo $this->zcms->translate->t("Edit/Insert"); ?>
                </h1>
            </div>
    
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
               echo '<div class="control-group">
                        <label class="control-label" for="'.$field->setting('name').'">'.$field->label().':</label>
                        <div class="controls">'
                            .$field->render()."
                            <span class='help-block' style='text-align:justify'>
                            ".$field->setting('description')."</span>
                        </div>
                     </div>"; 
        ?>
    
        <div class="form-actions">
                <?php echo ($submit ? $submit->render() : NULL) ?>
        </div>
</form>
</div>


