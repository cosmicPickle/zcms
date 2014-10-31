<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed'); 

//If its not the default interface sets the caller object
$obj = !$caller ? $this->zcms->interface->list : $this->zcms->interface->list->{$caller};

$settings = $obj->get_setting();

?>

    <h3><i class="fa fa-angle-right"></i><?php echo $this->zcms->translate->t("Listing"); ?></h3>

    <blockquote>
        <?php echo $this->zcms->logs->render_logs(); ?>
    </blockquote>
    <?php 
        if($settings && $data)
        {
    ?>
    <div class="row">
        <div class="col-md-12">
            <div class="content-panel">                
                <?php if(!$obj->get_setting('parent_column')) : ?>
                    <form class="form-search form-inline" style="margin-left:10px;">
                        <div class="form-group">
                            <input type="text" class="form-control search-query" name="search" placeholder="<?php echo $this->translate->t('Search'); ?>" value="<?php echo $this->input->get('search')?>">
                            <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                        </div>
                    </form>
                <?php endif; ?>
                <table class="table table-striped table-advance table-hover">   
                    <hr>
                    <thead>
                    <tr>
                        <?php
                        if(isset($data->rows))
                            foreach($data->rows[0] as $key => $title)
                            {
                                $icon = NULL;
                                $direction = "asc";

                                if(isset($data->titles[$key]) && $settings->order_column == $data->titles[$key])
                                {
                                    if($settings->order_direction == 'asc') 
                                    {   
                                        $icon = '<i class="fa fa-chevron-up" style="margin-left:10px"></i>';
                                        $direction = "desc";
                                    }
                                    else
                                    {    
                                        $icon = '<i class="fa fa-chevron-down"  style="margin-left:10px"></i>';
                                        $direction = "asc";
                                    }
                                }

                                $link = NULL;
                                if(isset($data->titles[$key]))
                                    $link = $obj->get_link(array('ord_by' => $data->titles[$key], 'ord_dir' => $direction));


                                if(($key == count($data->rows[0]) - 1) && $obj->get_global_action())
                                    $title = "<a href='".$this->zcms->backend().$obj->get_global_action()."' class='btn btn-xs btn-primary'>".$this->zcms->translate->t('Add New')."</a>";

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
                                   echo "<td>";

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
                                                   <a class="btn btn-xs btn-primary dropdown-toggle" data-toggle="dropdown" href="#">'.
                                                       $this->zcms->translate->t('Actions').
                                                       '<span class="caret"></span>
                                                   </a>
                                                   <ul class="dropdown-menu">';

                                               foreach($item as $action)
                                                   echo "<li><a href='".$this->zcms->backend().$action->link."'>".$action->label."</a></li>";

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
                <?php echo $obj->pagination();     ?>
            </div><!-- /content-panel -->
        </div><!-- /col-md-12 -->
    </div><!-- /row -->
    <?php 
            
        }
    ?>