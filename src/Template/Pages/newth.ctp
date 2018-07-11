<?php 
    if ($banners) { ?>
        <section class="th_slider">
            <div class="row">
                <div class="sld_holder owl-carousel">
                    <?php 
                        foreach ($banners as $bk => $bv) { ?>
                            <div class="item por">
                                <img src="<?= NTH.$bv->image; ?>" alt="Slide" />
                                <?php 
                                    $formatted_caption = str_replace("\n", '<br/>', $bv->caption);
                                    $formatted_sub_1 = str_replace("\n", '<br/>', $bv->sub_1);
                                    $formatted_sub_2 = str_replace("\n", '<br/>', $bv->sub_2);
                                ?>
                                <div class="banner_text">
                                    <div class="slide_text"><?= $formatted_caption ?: "" ?></div>
                                    <div class="upd_sub_caption_1"><?= $formatted_sub_1 ?: "" ?></div>
                                    <div class="upd_sub_caption_2"><?= $formatted_sub_2 ?: "" ?></div>

                                    <div class="slide_btns">
                                        <a class="btn_2" href="javascript:void(0);" onclick="upd.scroll_to('#townhouses_layouts');" style="margin-right:20px;">
                                            Посмотреть планировки
                                        </a>
                                        <a class="btn_1" href="#" data-toggle="modal" data-target="#visit_modal" onclick="ga('send', 'event', 'Кнопка', 'Записаться на просмотр');" style="margin-right:0px;">
                                            Записаться на просмотр
                                        </a>
                                    </div>
                                </div>
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

<section class="layouts_area ct_layouts_list" id="townhouses_layouts">
	<div class="container">
		<?php // LAYOUTS START ?>
        <?php if (isset($townhouses_layouts) && $townhouses_layouts && count($townhouses_layouts) > 0): ?>
        
            <div class="th_layouts_header">
                Дома и планировки
            </div>
            <div class="upd_separator"></div>

			<?php foreach ($townhouses_layouts as $key => $th): ?>
				

				<!-- LAYOUT ITEM -->
				<div class="layout_item">
					
					<div class="col-lg-5 col-md-5 col-sm-12 col-xs-12 properties">
						<div class="text">
							<?php if (isset($th->properties) && $th->properties): ?>
								<?php
									$properties = explode(';', $th->properties);
									if ($properties[count($properties) - 1] == '') array_pop($properties);

								?>

								<a href="<?= RS.'townhouses/'.$th->id.'/'; ?>" class="upd_cottage_name"><?= $th->caption ?: "" ?></a>
								<div class="upd_top_flat_box hidden-sm hidden-xs">

									<a href="javascript:void(0);" class="order_btn bggreen upd" data-toggle="modal" data-target="#visit_modal">Записаться на просмотр</a>

									<p class="upd_consult_text">или получите консультацию по телефону</p>
									<a href="tel:0443948819" class="upd_consult_phone">044 394 88 19</a>

									<?php if ($th->price || $th->area) { ?>
										<div class="upd_flat_underline"></div>
									<?php }?>
									<?php if ($th->price) { ?>
										<div class="left">
											<p>Цена</p>
											<p><span class="value"><?= $th->price; ?></span> грн/м<sup>2</sup></p>
										</div>
									<?php }?>

									<?php if ($th->area) { ?>
										<div class="right">
											<p>Площадь</p>
											<p><span class="value"><?= $th->area; ?></span> м<sup>2</sup></p>
										</div>
									<?php }?>
									<div class="clear"></div>
									<?php if ($th->price || $th->area) { ?>
										<div class="upd_flat_underline"></div>
									<?php }?>
								</div>

								<table class="params">
									<?php foreach ($properties as $key => $prop): ?>
										<?php
											$prop_row = explode('*', $prop);
											$area_name = $prop_row[0];
											$area_value = str_replace('м2', 'м<sup>2</sup>', $prop_row[1]);

										?>

										<tr class="<?= $key == 0 ? "first" : ""; ?>">
											<td><?= $area_name; ?></td>
											<td><?= $area_value; ?></td>
										</tr>
									<?php endforeach ?>
								</table>
							<?php endif ?>
							<!-- DESKTOP FEATURES -->
							<div class="features hidden-sm hidden-xs">
								
								<?php 
									$features = explode(';', $th->features);
									if (count($features) > 0 && $th->features) { ?>
										<p><a href="javascript:void(0);" class="active upd_about_proj">В стоимость входит</a> </p>
										<div class="features_c active">
											<?php 
												
											?>
											<ul>
												<?php foreach ($features as $key => $feature): ?>
													<li><?= $feature; ?></li>
												<?php endforeach ?>
											</ul>	
										</div>
									<?php }
								?>
								
								<div class="clear"></div>
								
								
							</div>
						</div>
					</div>
					<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 images">
						<?php if (isset($th->layouts) && $th->layouts): ?>
							<div class="owl-carousel primary">
								<?php foreach ($th->layouts as $key => $layout): ?>
									<?php 
										$source = $layout->filename ? TH.$layout->filename : IMG_PATH.'def_logo.jpg'; 
									?>
									<div class="item" style="overflow:hidden;">
										<a href="<?= $source; ?>" class="fancybox" data-fancybox="ctl_<?= $th->id ?>">
											<img src="<?= $source; ?>" alt="Layout" style="width:auto;height:auto;max-width:70%;margin:0 auto;display:block;" />
                                            <div class="space20"></div>
										</a>
										<?php /* <div class="image" style="background-image: url('<?= $source; ?>');"></div> */ ?>
									</div>
								<?php endforeach ?>
							</div>
							<div class="owl-carousel secondary">
								<?php foreach ($th->layouts as $key => $dot): ?>
									<?php 
										$source = $dot->filename ? TH.'crop/500x350_'.$dot->filename : IMG_PATH.'def_logo.jpg'; 
									?>
									<div class="item">
										<div class="image" style="background-image: url('<?= $source; ?>');"></div>
									</div>
								<?php endforeach ?>
							</div>
						<?php endif ?>
						

						<div class="clear"></div>

						<style type="text/css">
							.upd_about_proj {font: 18px "RobotoB", Tahoma; color: #333 !important; text-decoration: none !important; cursor: default !important;}
							@media(max-width: 993px){
								.upd_about_proj_box {display: none;}
							}
						</style>

                        <?php if ($th->th_desc) { ?>
                            
							<div class="upd_about_proj_box">
								<a href="javascript:void(0);" class="active upd_about_proj">О проекте</a>
								<div class="space10"></div>
								
								<?php if (isset($th->th_desc) && $th->th_desc): ?>
								<div class="desc_c features_tab active">
									<?= $th->th_desc; ?>
								</div>
								<?php endif ?>
							</div>
						<?php } ?>
						
						
								
						<!-- MOB FEATURES -->
						<div class="features hidden-lg hidden-md">
							<p>
								<?php 
									$feature_presence = false;
								?>
								<?php if (isset($th->features) && $th->features): ?>
									<a href="javascript:void(0);" data-target=".features_c" class="active">Особенности</a> 
									<?php $feature_presence = true; ?>
								<?php endif ?>
								<?php if (isset($th->th_desc) && $th->th_desc): ?>
									<?php $th_desc_active = !$feature_presence ? "active" : ""; ?>
									<a href="javascript:void(0);" class="<?= $th_desc_active; ?>" data-target=".desc_c">Описание</a>
								<?php endif ?>

							</p>

							<?php if (isset($th->features) && $th->features): ?>
								<?php $features = explode(';', $th->features); ?>
								<div class="features_c features_tab active">
									<ul>
										<?php foreach ($features as $key => $feature): ?>
											<li><?= $feature; ?></li>
										<?php endforeach ?>
									</ul>	
								</div>
							<?php endif ?>

							<?php if (isset($th->th_desc) && $th->th_desc): ?>
								<div class="desc_c features_tab <?= $th_desc_active; ?>">
									<?= $th->th_desc; ?>
								</div>
							<?php endif ?>


							
							<div class="clear"></div>
							
							<a href="#" class="order_btn bggreen" data-toggle="modal" data-target="#visit_modal">Записаться на просмотр</a>
						</div>
					</div>
					
					<div class="clear"></div>
				</div>
				<!-- LAYOUT ITEM END -->
			<?php endforeach ?>
		<?php endif ?>

	</div>
</section>


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