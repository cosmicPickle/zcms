<div class="col-md-9 productinfo">
    <div class="tab-content" style="min-height: 0;">
        <div id="home" class="tab-pane fade active in">
            <h4><?php echo $this->translate->t("Запитване") . (($query->get_product()) ? (" : ". $query->get_product()->code) : NULL); ?></h4>
            <?php echo $this->zcms->logs->render_logs(); ?>
            <form action="<?php echo current_url() . (($query->get_product()) ? ("?id=".$query->get_product()->id_) : NULL); ?>" role="form" method="POST">
                <div class="form-group">
                  <label for="email"><?php echo $this->translate->t("Имейл"); ?></label>
                  <input type="text" class="form-control" id="email" name="email" placeholder="<?php echo $this->translate->t("Въведете имейл"); ?>">
                </div>
                <div class="form-group">
                  <label for="phone"><?php echo $this->translate->t("Телефон"); ?></label>
                  <input type="text" class="form-control" id="phone" name="phone" placeholder="<?php echo $this->translate->t("Въведете вашия телефон"); ?>">
                </div>
                <div class="form-group">
                  <label for="name"><?php echo $this->translate->t("Име"); ?></label>
                  <input type="text" class="form-control" id="name" name="name" placeholder="<?php echo $this->translate->t("Въведете вашето име"); ?>">
                </div>
                <div class="form-group">
                  <label for="query"><?php echo $this->translate->t("Вашето запитване"); ?></label>
                  <textarea class="form-control" id="query" name="query"></textarea>
                </div>
                <button type="submit" class="btn btn-default"><?php echo $this->translate->t("Изпрати"); ?></button>
            </form>
        </div>
    </div>
</div>