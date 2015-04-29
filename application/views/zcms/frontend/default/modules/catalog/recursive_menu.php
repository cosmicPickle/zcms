<h1 class="page-header">
    <?php echo $this->translate->t("Navigation");?>
</h1>
<div class="well">
<?php
    $cats = $module->get_categories();
    if($cats) :
?>
<ul>
<?php
        foreach($cats as $cat) {
            $this->load->view(ZCMS::VIEWS_FRONTEND
                              .$this->zcms->zcms_config('theme')."/"
                              .ZCMS::VIEWS_MODULES.'catalog/recursive_menu_body', 
                              array(
                                'category' => $cat,
                                'module' => $module
                              ));
        }
?>
</ul>
<?php
    endif;
?>
</div>