<!-- Navigation -->
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only"><?php echo $this->translate->t("Toggle navigation"); ?></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="<?php echo $this->zcms->frontend(); ?>"><?php echo $this->translate->t("Site logo"); ?></a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <form class="navbar-form navbar-right" role="search" method="GET" action="<?php echo $this->zcms->frontend().'search' ?>">
                <div class="form-group">
                    <input type="text" name="s" class="form-control" placeholder="Search">
                </div>
                <button type="submit" class="btn btn-default">Submit</button>
            </form>
            <ul class="nav navbar-nav navbar-right">
            <?php 
                $items = $menu->sublevel;
                foreach($items as $item) :
            ?>    
                <?php
                if(!isset($item->sublevel) || !$item->sublevel) :
                ?>
                <li> 
                    <a href="<?php echo $this->zcms->page->link($item->page_id, $item->params); ?>">
                        <?php echo $item->label; ?>
                    </a>
                <?php
                else :
                ?>
                <li class="dropdown"> 
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <?php echo $item->label; ?><b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                    <?php
                    foreach($item->sublevel as $sitem) :
                    ?>
                        <li><a href="<?php echo $this->zcms->page->link($sitem->page_id, $sitem->params); ?>">
                            <?php echo $sitem->label; ?>
                        </a></li>
                    <?php
                    endforeach;
                    ?>
                    </ul>
                <?php
                endif;
                ?>
                </li>
            <?php
                endforeach;
            ?>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>
