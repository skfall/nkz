<?php 
    if ($banners) { ?>
        <section class="th_slider">
            <div class="row">
                <div class="sld_holder owl-carousel">
                    <?php 
                        foreach ($banners as $bk => $bv) { ?>
                            <div class="item">
                                <img src="<?= NTH.$bv->image; ?>" alt="Slider" />
                                <div class="slide_caption"><?= $bv->caption; ?></div>
                            </div>      
                        <?php }
                    ?>
                </div>
            </div>
            <div class="clear"></div>
        </section>
    <?php }
?>


<?php 
    if($intro){ ?>
        <section class="intro">
            <div class="row">
                <div class="container">
                    <div class="col col-lg-7 col-md-6 col-sm-12 col-xs-12 left_side">
                        <div class="caption"><?= $intro->caption ?></div>
                        <div class="separator"></div>
                        <div class="content_target"><?= $intro->content ?></div>
                    </div>
                    <div class="col col-lg-5 col-md-6 hidden-sm hidden-xs right_side">
                        <?php 
                            if ($intro->image) { ?>
                                <img src="<?= NTH.$intro->image; ?>" alt="Image" />
                            <?php }
                        ?>
                        
                    </div>
                </div>
            </div>
            <div class="clear"></div>
        </section>
    <?php }
?>




<?php 
    if ($blocks && count($blocks) > 0) { ?>
        <section class="th_lines" >
            <div class="container">
                <div class="caption">Живи в стиле <br>Экохаус</div>

                <div class="clear"></div>
                <div class="lines">
                    <?php 
                        foreach ($blocks as $bk => $bv) { ?>
                            <!-- ITEM START -->
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 lines_outer_item">
                                <div class="item">
                                    <div class="image">
                                        <img src="<?= NTH.$bv->preview; ?>" alt="Image" />
                                    </div>
                                    <div class="desc">
                                        <div class="name">
                                            <p class="line"><?= ($bv->type == 1 ? "Линия" : "Дом") ?></p>
                                            <div class="line_name"><?= $bv->name; ?></div>
                                            <div class="separator"></div>
                                        </div>
                                        <?php 
                                            $row1 = $bv->row_1;
                                            $row2 = $bv->row_2;
                                            $row3 = $bv->row_3;
                                            $row4 = $bv->row_4;

                                            if ($row1) $row1 = explode("*", $row1);
                                            if ($row2) $row2 = explode("*", $row2);
                                            if ($row3) $row3 = explode("*", $row3);
                                            if ($row4) $row4 = explode("*", $row4);

                                        ?>
                                        <ul class="th_props">
                                            <li><?= ($row1[0] ?: ""); ?> <span class="value"><?= ($row1[1] ?: ""); ?> <sup>м<sup>2</sup></sup></span></li>
                                            <li><?= ($row2[0] ?: ""); ?> <span class="value"><?= ($row2[1] ?: ""); ?> <sup>м<sup>2</sup></sup></span></li>
                                            <li><?= ($row3[0] ?: ""); ?> <span class="value"><?= ($row3[1] ?: ""); ?> <sup>м<sup>2</sup></sup></span></li>
                                            <li><?= ($row4[0] ?: ""); ?> <span class="value"><?= ($row4[1] ?: ""); ?> <sup>у.е.</sup></span></li>
                                        </ul>
                                        <div class="th_layouts_btn" onclick="app.load_lines_layouts(<?= $bv->id; ?>, this);" >Планировки</div>
                                    </div>        
                                </div>
                            </div>
                            <!-- ITEM END -->  
                        <?php }
                    ?>
                </div>
            </div>
        </section>

        <section class="th_blocks_layouts_parent">
            <div class="container" id="th_blocks_layouts_target"></div>
        </section>
    <?php }
?>



<?php 
    if ($ready_th && count($ready_th) > 0) { ?>
        <section class="rd_th_layouts">

            <?php 
                $first_th = $ready_th[0];
                $first_layouts = $first_th['layouts'];

            ?>

            <div class="container">
                <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12 rd_th_layouts_holder">
                    <div class="top_owl owl-carousel">
                        <?php 
                            if ($first_layouts && count($first_layouts) > 0) {
                                foreach ($first_layouts as $fk => $fv) { ?>
                                    <div class="item">
                                        <a href="<?= NTH.$fv->source; ?>" class="fancybox" data-fancybox="th_layout_gal_<?= $fk ?>">
                                            <img src="<?= NTH.'crop/435x340_'.$fv->source; ?>" alt="Layout">
                                        </a>
                                    </div>
                                <?php }
                            }
                        ?>
                    </div>
                    <div class="bot_owl owl-carousel">
                        <?php 
                            if ($first_layouts && count($first_layouts) > 0) {
                                foreach ($first_layouts as $fk => $fv) { ?>
                                    <div class="item">
                                        <img src="<?= NTH.'crop/435x340_'.$fv->source; ?>" alt="Layout">
                                    </div>
                                <?php }
                            }
                        ?>
                    </div>
                </div>

                <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 left_side">
                    
                    <div class="caption">Готовые <br>таунхаусы</div>
                    <div class="separator"></div>

                    <div class="layouts_switcher">
                        <p>Метраж м<sup>2</sup></p>
                        <ul>
                            <?php 
                                foreach ($ready_th as $rk => $rv) { 
                                        $active = $rk == 0 ? "active" : "";
                                    ?>
                                    <li onclick="app.load_rd_th(<?= $rv->id ?>, this);" class="<?= $active; ?>"><a href="javascript:void(0);"><?= $rv['area']; ?></a></li>
                                <?php }
                            ?>
                        </ul>
                    </div>

                    <div class="th_name"><?= $first_th['name']; ?></div>
                    <div class="description">
                        <?= $first_th['content']; ?>
                    </div>

                </div>
            </div>
        </section>
    <?php }
?>


<?= $this->element('manager'); ?>