<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed'); 

//If its not the default interface sets the caller object
$obj = !$caller ? $this->zcms->interface->list : $this->zcms->interface->list->{$caller};

$settings = $obj->fetch_settings();

if($this->zcms->auth->session_info()->level < 2)
{
?>
    <ul class="nav nav-list span3 well">
        <li class="nav-header"><?php echo $this->zcms->translate->t('Developer menu'); ?></li>
        <li class="divider"></li>
        
        <li class="nav-header"><?php echo $this->zcms->translate->t('Column options'); ?></li>
        <li>
            <a class="zcms-ajax" href="<?php echo $this->zcms->backend().'developer/intf/list/'.$settings->link.'/add_column/'; ?>">
                <i class="icon-plus"></i><?php echo $this->zcms->translate->t('Add column'); ?>
            </a>
        </li>
        <li>
            <a class="zcms-ajax" href="<?php echo $this->zcms->backend().'developer/intf/list/'.$settings->link.'/remove_column/'; ?>">
                <i class="icon-trash"></i><?php echo $this->zcms->translate->t('Remove column'); ?>
            </a>
        </li>
        <li><a href="#"><i class="icon-edit"></i><?php echo $this->zcms->translate->t('Edit columns'); ?></a></li>
        
        <li class="nav-header"><?php echo $this->zcms->translate->t('Action options'); ?></li>
        <li><a href="#"><i class="icon-edit"></i><?php echo $this->zcms->translate->t('Global action'); ?></a></li>
        <li><a href="#"><i class="icon-plus"></i><?php echo $this->zcms->translate->t('Add action'); ?></a></li>
        <li><a href="#"><i class="icon-trash"></i><?php echo $this->zcms->translate->t('Remove action'); ?></a></li>
        <li><a href="#"><i class="icon-edit"></i><?php echo $this->zcms->translate->t('Edit actions'); ?></a></li>
        
        <li class="nav-header"><?php echo $this->zcms->translate->t('Pagination and search'); ?></li>
        <li><a href="#"><i class="icon-edit"></i><?php echo $this->zcms->translate->t('Pagination options'); ?></a></li>
        <li><a href="#"><i class="icon-edit"></i><?php echo $this->zcms->translate->t('Search options'); ?></a></li>
        
    </ul>
<?php
}
?>
<div <?php echo ($this->zcms->auth->session_info()->level < 2) ? 'class="offset3"' : NULL?>>
    <div class="page-header">
        <h1>
            <?php echo $this->zcms->translate->t("Listing"); ?>
        </h1>
    </div>

    <blockquote>
        <?php echo $this->zcms->logs->render_logs(); ?>
    </blockquote>
    <?php 
        if($settings && $data)
        {
            echo $obj->pagination(); 
    ?>

    <form class="form-search span4 pagination">
        <input type="text" class="input-medium search-query" name="s" placeholder="<?php echo $this->translate->t('Search'); ?>" value="<?php echo isset($_GET['s']) ? $_GET['s'] : NULL ?>">
        <button type="submit" class="btn"><?php echo $this->translate->t('Search'); ?></button>
    </form>

    <table class="table table-striped table-bordered">
        <thead>
            <tr>
            <?php
                if(isset($data->rows))
                    foreach($data->rows[0] as $key => $title)
                    {
                        $icon = NULL;
                        $direction = "asc";

                        if(isset($data->titles[$key]) && $settings->ord_by == $data->titles[$key])
                        {
                            if($settings->ord_dir == 'asc') 
                            {   
                                $icon = '<i class="icon-chevron-down" style="margin-left:10px"></i>';
                                $direction = "desc";
                            }
                            else
                            {    
                                $icon = '<i class="icon-chevron-up"  style="margin-left:10px"></i>';
                                $direction = "asc";
                            }
                        }

                        $link = NULL;
                        if(isset($data->titles[$key]))
                            $link = $obj->get_link(array('ord_by' => $data->titles[$key], 'ord_dir' => $direction));


                        if(($key == count($data->rows[0]) - 1) && $settings->global_action)
                            $title = "<a href='".$this->zcms->backend().$settings->global_action."' class='btn btn-primary'>".$this->zcms->translate->t('Add New')."</a>";

                        echo "<th>
                                 <a href='".$link."'>".$title.$icon."</a>
                             </th>";
                    }
            ?>
            </tr>
        </thead>
        <tbody>
            <?php
             if(isset($data->rows))
                foreach($data->rows as $rkey => $row)
                {    
                    if(!$rkey)
                        continue;

                    echo "<tr>";
                    foreach($row as $key => $item)
                    {
                        echo "<td class='span4'>";

                        if($key == 998)
                        {
                            foreach($item as $lbl)
                                if($lbl->cond)
                                    echo '<span class="label label-'.$lbl->type.'">'.$lbl->text.'</span>';

                            echo "&nbsp;";
                        }
                        elseif($key == 999)
                        {
                            if($item && is_array($item))
                            {    
                                echo '<div class="btn-group">
                                        <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#">'.
                                            $this->zcms->translate->t('Actions').
                                            '<span class="caret"></span>
                                        </a>
                                        <ul class="dropdown-menu">';

                                    foreach($item as $action)
                                        echo "<li><a href='".$this->zcms->backend().$action->link."'>".$action->lbl."</a></li>";

                                    echo    '</ul>
                                         </div>';
                             }    
                             else
                             {
                                 echo "&nbsp;";
                             }
                        }
                        else
                        {
                            echo $item;
                        }

                        echo "</td>";
                    }
                    echo "</tr>";
                }   
            ?>
        </tbody>
    </table>

    <?php 
            echo $obj->pagination();    
        }
    ?>
</div>