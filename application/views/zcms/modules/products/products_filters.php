<div class="col-md-3 sidebar">
<?php
$section = $filter->get_section_filter();
$filter_values = $filter->get_filter_vals();
$current_filters = $this->session->userdata('filters');

?>
<form action='<?php echo $this->zcms->frontend()."mmotors_fans_filter"; ?>' method='POST'>
<button type='submit' class="btn btn-default btn-lg">
<span class="glyphicon glyphicon glyphicon-tasks"></span> 
<?php echo $this->translate->t('ФИЛТРИРАНЕ') ?>
</button>
<input type='hidden' name='add_filters' value='1'>
<h2><?php echo $section->label ?></h2>
<select class="form-control" name="<?php echo "filters[".$section->name."]" ?>" id="<?php echo $section->name; ?>">
      <option value=""><?php echo $this->translate->t("Choose"); ?></option>
<?php
    foreach($filter_values[$section->name] as $option) :
?>
        <option <?php echo ((isset($current_filters[$section->name]) && $current_filters[$section->name] == $option->id_) ? "selected='selected'" : NULL); ?> 
                value="<?php echo $option->id_ ?>">
                    <?php echo $option->value; ?>
        </option>
<?php
    endforeach;  
?>     
</select> <br />

<?php
foreach($filter->get_filters() as $group_key => $group) :
?>
<div class='filter-group' id="filter-group-<?php echo $group_key; ?>" <?php echo (($group_key) ? 'style="display:none"' : NULL) ?>>
<?php
    foreach($group as $filter) :
        if($filter->type == 'checkbox') :
?>
    <div class="checkbox">
        <label>
            <input type="hidden" name="<?php echo "filters[".$filter->name."]" ?>" value="0" <?php echo (($group_key) ? 'disabled="true"' : NULL) ?>>
            <input type="checkbox" name="<?php echo "filters[".$filter->name."]" ?>" 
                                   value="1" 
                                   <?php echo (($group_key) ? 'disabled="true"' : NULL) ?>
                                   <?php echo ((isset($current_filters[$filter->name]) && $current_filters[$filter->name]) ? "checked='checked'" : NULL)?>>
            <?php echo $filter->label; ?> 
        </label>
    </div>
<?php
       elseif($filter->type == 'select') :
?>
    <h3><?php echo $filter->label ?></h3>
    <select class="form-control" name="<?php echo "filters[".$filter->name."]"; ?>" <?php echo (($group_key) ? 'disabled="true"' : NULL) ?>>
        <option value=""><?php echo $this->translate->t("Choose"); ?></option>
<?php
    foreach($filter_values[$filter->name] as $option) :
?>
        <option <?php echo ((isset($current_filters[$filter->name]) && $current_filters[$filter->name] == $option->id_) ? "selected='selected'" : NULL); ?> 
            value="<?php echo $option->id_ ?>">
            <?php echo $option->value; ?>
        </option>
<?php
    endforeach;  
?>
    </select><br />
<?php
       endif;
    endforeach;
?>
</div>
<?php
endforeach;
?>
<button type='submit' class="btn btn-default btn-lg">
    <span class="glyphicon glyphicon glyphicon-tasks"></span> 
    <?php echo $this->translate->t('ФИЛТРИРАНЕ') ?>
</button>
</form>
<script type="text/javascript">
    $(document).ready(function(){
        
        var change_section = function(section) {
            $('.filter-group').each(function(){
                var group_id = parseInt($(this).attr('id').split('-')[2]);
                if(group_id == parseInt(section.val()))
                {
                    $(this).find("input, select").each(function(){
                        $(this).attr('disabled', false);
                    });
                    $(this).slideDown(500);
                }
                if(group_id != parseInt(section.val()) && group_id != 0)
                {
                    $(this).find("input, select").each(function(){
                        $(this).attr('disabled', true);
                    });
                    $(this).slideUp(500);  
                }
            });
        }
        
        change_section($("#<?php echo $section->name; ?>"));
        $("#<?php echo $section->name; ?>").change(function(){
            
            var section = $(this);
            change_section(section);
        });
    });
</script>
</div>
