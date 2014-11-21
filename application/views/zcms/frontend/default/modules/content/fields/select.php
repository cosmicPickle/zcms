<?php 
    $opts_pattern = "#\{([a-zA-Z0-9а-яА-Я_\-]*):([a-zA-Zа-яА-Я0-9\s]*)\}#u";
?>
<select
       name="<?php echo $field->alias ?>" 
       class="form-control"
       id="<?php echo $field->alias ?>" 
       <?php 
            if($module->get_config()->show_label_in_field) :
       ?>
       placeholder="<?php echo $field->label; ?>"
       <?php 
            endif;
       ?>>
    <?php 
    preg_match_all($opts_pattern, $field->options, $matches);
    foreach($matches[0] as $key => $option) :
    ?>
        <option value="<?php echo $matches[1][$key]; ?>"><?php echo $matches[2][$key]; ?></option>
    <?php    
    endforeach;
?>
</select>
<?php echo form_error($field->alias, '<p class="help-block">', '</p>'); ?>
