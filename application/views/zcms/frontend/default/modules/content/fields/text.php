<input type="text" 
       name="<?php echo $field->alias ?>" 
       class="form-control"
       id="<?php echo $field->alias ?>" 
       <?php 
            if($module->get_config()->show_label_in_field) :
       ?>
       placeholder="<?php echo $field->label; ?>"
       value="<?php echo set_value($field->alias) ?>"
       <?php 
            endif;
       ?>>

<?php echo form_error($field->alias, '<p class="help-block">', '</p>'); ?>
