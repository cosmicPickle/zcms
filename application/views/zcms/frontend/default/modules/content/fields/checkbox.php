<input type="hidden" name="<?php echo $field->alias ?>" value="0">
<input type="checkbox" 
       name="<?php echo $field->alias ?>" 
       id="<?php echo $field->alias ?>">
<?php echo form_error($field->alias, '<p class="help-block">', '</p>'); ?>
