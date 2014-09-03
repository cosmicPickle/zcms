<div class="col-md-12 breadcrumbs">
    <ul>
        <li>
            <a href="<?php echo $this->zcms->frontend() ?>"><?php echo $this->translate->t("Начало") ?></a>
        </li>

        <?php 
            foreach($path->get_pathway() as $breadcrumb) :
        ?>
        <li>
            <a href="<?php echo $breadcrumb->url; ?>"><?php echo $breadcrumb->title ?></a>
        </li>
        <?php
            endforeach;
        ?>
    </ul>
</div><!--end breadcrumbs-->
