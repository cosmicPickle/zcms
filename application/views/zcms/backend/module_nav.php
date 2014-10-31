<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed'); 
?>
        <ul class="nav nav-tabs">
            <li <?php echo $this->uri->segment(3) == 'basic' ? "class='active'" : NULL; ?>>
                <a href="<?php echo $this->zcms->backend().'modules/basic/'.$this->uri->segment(4); ?>">
                    <?php echo $this->zcms->translate->t("Basic") ?>
                </a>
            </li>
            <li <?php echo $this->uri->segment(3) == 'advanced' ? "class='active'" : NULL; ?>>
                <a href="<?php echo $this->zcms->backend().'modules/advanced/'.$this->uri->segment(4); ?>">
                    <?php echo $this->zcms->translate->t("Advanced") ?>
                </a>
            </li>
            <li <?php echo $this->uri->segment(3) == 'data' ? "class='active'" : NULL; ?>>
                <a href="<?php echo $this->zcms->backend().'modules/data/'.$this->uri->segment(4); ?>">
                    <?php echo $this->zcms->translate->t("Data") ?>
                </a>
            </li>
        </ul>