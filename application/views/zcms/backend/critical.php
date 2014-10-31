<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

    foreach($critical as $c)
    {
?>
        <h3>Oops! A Critical Error has occurred.</h3>
        <div>
            Error code: <?php echo $c->name; ?> <br />
            Error text: <?php echo $c->text; ?>
        </div>
<?php
    }
?>