<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

    foreach($logs as $l)
    {
?>
    <div class='alert alert-<?php echo $l->type; ?>'>
          <strong> <?php echo $l->type; ?>: </strong> <?php echo $l->text; ?>
    </div>
<?php
    }
?>