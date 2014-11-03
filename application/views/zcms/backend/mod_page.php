<div class="tabbable">
    <ul class="nav nav-tabs">
        <li <?php echo $tab == 'basic' ? 'class="active"' : NULL; ?>>
            <a href="#basic" data-toggle="tab"><?php echo $this->zcms->translate->t('Basic'); ?></a>
        </li>
        <li <?php echo $tab == 'modules' ? 'class="active"' : NULL; ?>>
            <a href="#modules" data-toggle="tab"><?php echo $this->zcms->translate->t('Modules'); ?></a>
        </li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane <?php echo $tab == 'basic' ? 'active' : NULL; ?>" id="basic">
            <?php echo $basic; ?>
        </div>
        <div class="tab-pane  <?php echo $tab == 'modules' ? 'active' : NULL; ?>" id="modules">
            <?php echo $modules; ?>
        </div>
    </div>
</div>