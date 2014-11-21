 <h3><?php echo $form->label ?></h3>
 <div class="text-danger">
     <?php if($module->get_config()->success->value == 0)  echo $module->get_config()->error_msg->value; ?>
 </div>
 <div class="text-success">
     <?php if($module->get_config()->success->value == 1)  echo $module->get_config()->success_msg->value; ?>
 </div>
 <form name="<?php echo $form->alias ?>" id="<?php echo $form->alias ?>" method="POST" novalidate>
 <?php 
    foreach($form->fields as $field) : 
        if($field->enabled) :
 ?>
      <div class="control-group form-group <?php if(form_error($field->alias)) echo "has-error"; ?>">
            <div class="controls">
                <?php if($module->get_config()->show_label_out_field->value) : ?>
                <label class="control-label">
                    <?php echo $field->label; ?>
                    <?php if($field->required):?>
                    <span style="color:#f00;">*</span>
                    <?php endif;?>
                </label>
                <?php endif; ?>
                
                <?php 
                    $field_view = ZCMS::VIEWS_FRONTEND . 
                                  $this->zcms->zcms_config("theme")."/".
                                  ZCMS::VIEWS_MODULES.
                                  "content/fields/".
                                  $field->type;

                    $this->load->view($field_view, array("field" => $field));
                ?>
            </div>
      </div>
 <?php 
    endif;
 endforeach; 
 ?>
   <button type="submit" class="btn btn-primary"><?php echo $module->get_config()->submit_btn_msg->value ?></button>
 </form>



