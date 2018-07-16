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
                                        <?php if (isset($townhouses_layouts) && $townhouses_layouts && count($townhouses_layouts) > 0): ?>
                                            <a class="btn_2" href="javascript:void(0);" onclick="upd.scroll_to('#townhouses_layouts');" style="margin-right:20px;">
                                                Посмотреть планировки
                                            </a>
                                        <?php endif ?>
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
                                <?php 
                                    /* 
                                        // LINK TO ITEM
                                        <?= RS.'townhouses/'.$th->id.'/'; ?> 
                                    */
                                ?>
								<a href="javascript:void(0);" class="upd_cottage_name"><?= $th->caption ?: "" ?></a>
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

<?php 
    if ($info1) { ?>
        <section class="th_info_block_1">
            <div class="row">
                <div class="container">
                    <div class="col col-lg-8 col-md-12 col-sm-12 col-xs-12 left_side">
                        <?php 
                            $info_capt = str_replace("\n", "<br/>", $info1->caption);
                        ?>
                        <div class="caption"><?= $info_capt ?></div>
                        <div class="separator"></div>
                        <div class="content_target">
                            <?= $info1->content ?>
                            <p></p>
                        </div>

                        <?php 
                            $icons = $info1->items;
                            if ($icons && count($icons) > 0) { ?>
                                <div class="icons">
                                    <table>
                                        <tbody>
                                            <?php 
                                                $cnt = 0;
                                                foreach ($icons as $ik => $iv) {
                                                    if ($cnt == 0) {
                                                        ?>
                                                            <tr>
                                                        <?php
                                                    }

                                                    ?>
                                                        <td><span class="bg" style="background-image: url('<?= NTH.$iv->icon; ?>');"></span><span class="text"><?= $iv->name ?></span></td>
                                                    <?php
                                                    
                                                    $cnt++;
                                                    if ($cnt == 2) {
                                                        ?>
                                                            </tr>
                                                        <?php
                                                        $cnt = 0;
                                                    }
                                                    
                                                }
                                            ?>
                                            
                                        </tbody>
                                    </table>
                                </div>
                            <?php }
                        ?>
                    
                        
                    </div>
                </div>
            </div>
            <div class="clear"></div>
        </section>
    <?php }
?>

<?php if (isset($env) && $env && count($env) > 0): ?>
	<section class="new_home_environment home_environment home_section hidden-sm hidden-xs" id="home_environment">
		<div class="home_environment_toggle_h hidden-lg hidden-md mobile_toogle_h" data-target=".home_environment_toggle_c">
			Все рядом
			<div class="border"></div>
		</div>
		<div class="home_environment_toggle_c home_toggle_c animated2">
			<div class="container">
				<div class="section_header hidden-sm hidden-xs"><?= $common->env_capt ?: ""; ?></div>
				<div class="trick_master">
					<div class="env_nav">
						<ul>
							<?php foreach ($env as $key => $e): ?>
								<?php
									$class = "";
									$target = "";
									$icon = "";
									switch ($e->alias) {
									 	case 'children':
									 		$class = "children_g";
									 		$target = ".children_g_c";
									 		$icon = "mf-inf-cg2";
									 		break;
									 	case 'schools':
									 		$class = "school";
									 		$target = ".school_g_c";
									 		$icon = "mf-inf-school2";
									 		break;
									 	case 'health':
									 		$class = "hospital";
									 		$target = ".health_g_c";
									 		$icon = "mf-inf-hospital2";
									 		break;
									 	case 'goods_and_services':
									 		$class = "health";
									 		$target = ".goods_g_c";
									 		$icon = "mf-inf-shops2";
									 		break;
									 	case 'restoraunts':
									 		$class = "rest";
									 		$target = ".rest_g_c";
									 		$icon = "mf-inf-cafe2";
									 		break;
									 	default:
									 		break;
									 } 
								?>
								<li class="<?= $class; ?> <?= $key == 0 ? "active" : ""; ?>" data-target="<?= '.env'.$e->alias; ?>">
									<?php if ($e->icon): ?>
										<span class="icon" style="background-image: url('<?= IMG_PATH.$e->icon; ?>');"></span>
									<?php endif ?>
									<span><?= $e->name ?: ""; ?></span>
								</li>
							<?php endforeach ?>
						</ul>
					</div>
					<div class="hide_scroll_bar"></div>
				</div>

				<?php foreach ($env as $key => $e): ?>

					<div class="env_c <?= 'env'.$e->alias; ?> <?= $key == 0 ? "active" : ""; ?>">
						<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
							<?php if ($e->env_list && count($e->env_list) > 0): ?>
								<ul>

									<?php foreach ($e->env_list as $key => $item): ?>
										<li>
											<?php if ($item->time_walk): ?>
												<span class="time_mark"><span class="value"><?= $item->time_walk; ?></span><br>мин</span>
											<?php endif ?>
											<span class="point_name"><?= $item->caption ? $item->caption : ""; ?></span> <span class="path_time"><?= $item->time_car ? $item->time_car : ""; ?></span><hr />
										</li>

									<?php endforeach ?>
								</ul>
							<?php endif ?>
						</div>
						<div class="col-lg-4 col-md-4 hidden-sm hidden-xs">
							<div class="icon_area">
								<?php if ($e->image): ?>
									<img src="<?= IMG_PATH.$e->image; ?>" alt="Icon" >
								<?php endif ?>
								
							</div>
						</div>
					</div>
				<?php endforeach ?>
				
			</div>
		</div>	
	</section>
<?php endif ?>

<?php 
if ($traffic) { ?>
	<section class="traffic hidden-sm hidden-xs">
		<div class="container">
			<div class="col-lg-5 col-md-5 hidden-sm hidden-xs"></div>
			<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12">
				<div class="caption"><?= $traffic->caption ?: ""; ?></div>
				<div class="sub_caption"><?= $traffic->sub_caption ?: ""; ?></div>

				<div class="description">
					<?= $traffic->description ?: ""; ?>
				</div>

				<?php 
					if ($traffic->notification) { ?>
						<div class="notification">
							<div class="text"><?= $traffic->notification; ?></div>
						</div>
					<?php }
				?>
				
			</div>
		</div>
	</section>

	<section class="home_transport home_section hidden-lg hidden-md" id="home_transport">
		<!-- <div class="home_transport_toggle_h hidden-lg hidden-md mobile_toogle_h" data-target=".home_transport_toggle_c">
			Транспорт
			<div class="border"></div>
		</div> -->
		<div class="home_transport_toggle_c home_toggle_c animated2" style="display: block;">
			<div class="container">
				<div class="section_header"><?= $traffic->caption ?: ""; ?></div>

				<div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
					<ul class="subway">
						<?php 
							if ($traffic->time1 > 0 && $traffic->ob1_lat > 0 && $traffic->ob1_lng > 0 && $traffic->dest1) { ?>
								<li>
									<img src="<?= RS.'img/icons/Metro.svg'; ?>" alt="Metro" class="metro_icon">
									<span><?= $traffic->time1; ?> минут до м. <?= $traffic->dest1; ?> <a href="javascript:void(0);" class="new_map_trigger" data-nlat="<?= number_format($traffic->ob1_lat, 4); ?>" data-nlng="<?= number_format($traffic->ob1_lng, 4); ?>" data-from="vidubichi">Показать маршрут</a></span>
									
								</li>
							<?php }

							if ($traffic->time2 > 0 && $traffic->ob2_lat > 0 && $traffic->ob2_lng > 0 && $traffic->dest2) { ?>
								<li>
									<img src="<?= RS.'img/icons/Metro.svg'; ?>" alt="Metro" class="metro_icon">
									<span><?= $traffic->time2; ?> минут до м. <?= $traffic->dest2; ?> <a href="javascript:void(0);" class="new_map_trigger" data-nlat="<?= number_format($traffic->ob2_lat, 4); ?>" data-nlng="<?= number_format($traffic->ob2_lng, 4); ?>" data-from="vidubichi">Показать маршрут</a></span>
									
								</li>
							<?php }

							if ($traffic->time3 > 0 && $traffic->ob3_lat > 0 && $traffic->ob3_lng > 0 && $traffic->dest3) { ?>
								<li>
									<img src="<?= RS.'img/icons/Metro.svg'; ?>" alt="Metro" class="metro_icon">
									<span><?= $traffic->time3; ?> минут до м. <?= $traffic->dest3; ?> <a href="javascript:void(0);" class="new_map_trigger" data-nlat="<?= number_format($traffic->ob3_lat, 4); ?>" data-nlng="<?= number_format($traffic->ob3_lng, 4); ?>" data-from="vidubichi">Показать маршрут</a></span>
									
								</li>
							<?php }
						?>
						
					</ul>
				</div>

				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<div class="transport_text">
						<img src="<?= RS.'img/icons/Minibus.svg'; ?>" alt="Icon">
						<p><?= $traffic->notification ?: ""; ?></p>
					</div>
				</div>
			</div>
		</div>	
	</section>
<?php }
?>


<section class="th_genplan hidden-sm hidden-xs">
    <div class="floating">
        <div class="item_type"></div>
        <div class="item_name"></div>
        <div class="separator"></div>
        <div class="area">площадь дома <span><span class="val"></span> <sup>м<sup>2</sup></sup></span></div>
        <div class="add_area">+ цоколь <span><span class="val"></span> <sup>м<sup>2</sup></sup></span></div>
        <div class="add_area2">+ участок <span><span class="val"></span> <sup>м<sup>2</sup></sup></span></div>
        <div class="price">цена <span><span class="val"></span> <sup>у.е.</sup></span></div>
    </div>
    <img src="<?= RS.'img/genplan_bg.jpg'; ?>" id="genplan_image" alt="Genplan" />
    <?= $this->element('genplan'); ?>
</section>

<?php 
    if ($video) { ?>

        <section class="video hidden-sm hidden-xs">
            <div class="row">
                <div class="container">
                    <?php 
                        $video_capt = str_replace("\n", "<br />", $video->caption);
                    ?>
                    <div class="caption"><?= $video_capt ?></div>
                </div>
                <div class="video_holder">
                    <video poster="<?= NTH.$video->poster ?>" class="th_video" id="th_video">
                        <source src="<?= NTH.$video->video ?>" type="video/webm; codecs=&quot;vp8, vorbis&quot;">
                        <source src="<?= NTH.$video->video ?>" type="video/mp4; codecs=&quot;avc1.42E01E, mp4a.40.2&quot;">
                        <source src="<?= NTH.$video->video ?>" type="video/ogg; codecs=&quot;theora, vorbis&quot;">
                    </video>

                    <div class="controls">
                        <div class="sound_switcher" onclick="app.mute_video(this);"></div>
                        <div class="tracker">
                            <?= $this->element('tracker'); ?>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    <?php }
?>

<?php 
    if ($gal && count($gal) > 0) { ?>
        <section class="th_gal_owl" >
            <div class="container">
                <div class="th_gal_top owl-carousel">
                    <?php 
                        foreach ($gal as $gk => $gv) { ?>
                            <div class="item">
                                <div class="title"><?= $gv->caption ?></div>
                                <a href="<?= NTH.$gv->image; ?>" class="fancybox" data-fancybox="th_page_gal">
                                    <img src="<?= NTH."crop/1120x620_".$gv->image; ?>" alt="Image" />
                                </a>
                                <div class="curr_image"><span><?= $gk + 1; ?> / <?= count($gal); ?></span></div>
                            </div>
                        <?php }
                    ?>
                </div>
                <div class="th_gal_bot owl-carousel">
                    <?php 
                        foreach ($gal as $gk => $gv) { ?>
                            <div class="item">
                                <img src="<?= NTH."crop/1120x620_".$gv->image; ?>" alt="Image" />
                            </div>
                        <?php }
                    ?>
                </div>
            </div>
        </section>
    <?php }
?>

<?php 
    if ($info2) { ?>
        <section class="th_info_block_2">
            <div class="row">
                <div class="container">

                    <div class="col col-lg-9 col-md-9 col-sm-9 col-xs-12">
                        <div class="outer_item">
                            <div class="inner_item">
                                <?php 
                                    $info_capt2 = str_replace("\n", "<br/>", $info2->caption);
                                ?>
                                <div class="caption"><?= $info_capt2 ?></div>
                                <div class="separator"></div>
                                
                                <div class="icon_table_set">
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <div class="bg" style="background-image: url('<?= RS.'img/lamp.png'; ?>');"></div>
                                                    <div class="text">Свет</div>
                                                </td>
                                                <td>
                                                    <div class="bg" style="background-image: url('<?= RS.'img/oven.png'; ?>');"></div>
                                                    <div class="text">Газ</div>
                                                </td>
                                                <td>
                                                    <div class="bg" style="background-image: url('<?= RS.'img/pipe.png'; ?>');"></div>
                                                    <div class="text">Вода</div>
                                                </td>
                                                <td>
                                                    <div class="bg" style="background-image: url('<?= RS.'img/radiator2.png'; ?>');"></div>
                                                    <div class="text">Отопление</div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>

                                <?php 
                                    $props = $info2->props;
                                    $info2_list = explode("\n", $props);
                                    if ($info2_list) { ?>
                                        <div class="additional">
                                            <p class="title">Дополнительно</p>
                                            <ul>
                                                <?php 
                                                    foreach ($info2_list as $lk => $lv) { ?>
                                                        <li><span><?= $lv ?></span></li>                                                        
                                                    <?php }
                                                ?>
                                            </ul>
                                        </div>
                                    <?php }
                                ?>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>    
    <?php }
?>

<?= $this->element('manager'); ?>