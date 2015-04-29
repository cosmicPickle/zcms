<li>
    <a href="<?php echo $this->page->link(NULL, array('category' => $category->alias), TRUE)?>"
       <?php if($module->get_config()->category->value == $category->alias) echo 'class="active"'?>>
        
    <?php echo $category->category; ?>
    </a>
    <?php if($category->subcategories) : ?>
        <ul>
        <?php
                foreach($category->subcategories as $cat) {
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
    <?php endif; ?>
</li>
