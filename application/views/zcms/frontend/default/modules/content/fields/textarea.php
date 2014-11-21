<textarea rows="10" 
          cols="100" 
          name="<?php echo $field->alias ?>" 
          class="form-control" 
          id="<?php echo $field->alias ?>"  
          maxlength="999" 
          style="resize:none"><?php echo set_value($field->alias) ?></textarea>
<?php echo form_error($field->alias, '<p class="help-block">', '</p>'); ?>