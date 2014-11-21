<!DOCTYPE html>
<html>
    <head></head>
    <body>
        <table>
            <thead>
                <tr>
                    <?php 
                        foreach($form->fields as $field) :
                            if($field->alias != 'query') :
                    ?>
                    <th><?php echo $field->label; ?></th>
                    <?php
                            endif;
                        endforeach;
                    ?>
                </tr>
            </thead>
            <tbody>
                <?php 
                        $query_field = NULL;
                        foreach($form->fields as $field) :
                            if($field->alias != 'query') :
                ?>
                <td><?php if(isset($content->{$field->alias})) echo $content->{$field->alias}; ?></td>
                <?php
                            else:
                                $query_field = $field;
                            endif;
                        endforeach;
                        if($query_field) :
                ?>
                <tr>
                    <th><?php echo $query_field->label; ?></th>
                    <td colspan="<?php echo (count($form->fields) - 2) ?>">
                        <?php echo $content->{$query_field->alias}; ?>
                    </td>
                </tr>
                <?php
                        endif;
                ?>
            </tbody>
        </table>
    </body>
</html>

