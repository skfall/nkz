<?php if ($banner): ?>

<?php 

/*

// OLD BANNER


<section class="cottages_sect_1" style="background: #333 url('<?= ($banner['filename'] ? COTTAGES_PATH.$banner['filename'] : ''); ?>') center no-repeat; background-size: cover; -webkit-background-size: cover; -moz-background-size: cover; -ms-background-size: cover; -o-background-size: cover;">
	<div class="container">
		<div class="text col-lg-6 col-md-6 col-sm-12 col-xs-12">
			<h2 class="slide_caption"><?= ($banner['caption'] ? $banner['caption'] : ''); ?></h2>
			<h3 class="slide_sub_caption"><?= ($banner['sub_caption'] ? $banner['sub_caption'] : ''); ?></h3>
			<hr class="heading_und" />
			<p class="slide_desc"><?= ($banner['details'] ? $banner['details'] : ''); ?></p>
		</div>
	</div>
</section>
*/

?>

<section class="home_b">
    <div class="home_tabs">
        <div class="home_tabs_body upd">
			<div class="item por">
				<img src="<?= ($banner['filename'] ? COTTAGES_PATH.$banner['filename'] : ''); ?>" class="ct_new_slide" alt="Slide" />
				<?php 
					$formatted_caption = str_replace("\n", '<br/>', $banner['caption'] ? $banner['caption'] : '');
					$formatted_sub_1 = str_replace("\n", '<br/>', $banner['sub_caption'] ? $banner['sub_caption'] : '');
					$formatted_sub_2 = str_replace("\n", '<br/>', $banner['details'] ? $banner['details'] : '');
				?>
				<div class="banner_text">
					<div class="slide_text"><?= $formatted_caption ?: "" ?></div>
					<div class="upd_sub_caption_1"><?= $formatted_sub_1 ?: "" ?></div>
					<div class="upd_sub_caption_2"><?= $formatted_sub_2 ?: "" ?></div>

					<div class="slide_btns">
						<a class="btn_2" href="javascript:void(0);" onclick="upd.scroll_to('#cottages_layouts');" style="margin-right:20px;">
							Посмотреть планировки
						</a>
						<a class="btn_1" href="#" data-toggle="modal" data-target="#visit_modal" onclick="ga('send', 'event', 'Кнопка', 'Записаться на просмотр');" style="margin-right:0;">
							Записаться на просмотр
						</a>
					</div>
				</div>
			</div>
		</div> 
    </div>  
</section>
<?php endif ?>


<?php if ($reasons): ?>
	<section class="cottages_reasons por">
		<div class="container">
			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 reasons_holder">
				<div class="reasons_top">
					<div class="left fll aos-init aos-animate" data-aos="fade-up">5</div>
					<div class="right fll aos-init aos-animate" data-aos="fade-up">
						<p class="frow">Причин</p>
						<p>выбрать коттедж в жк "Новая Конча-заспа"</p>
					</div>
					<div class="clear"></div>
					<hr class="reasons_und" />
				</div>
				<ul class="reasons_btns">
					<?php foreach ($reasons as $key => $value): ?>
						<?php $index = $key + 1; ?>
						<li class="<?= ($index == 1 ? 'active' : ''); ?> aos-init aos-animate" data-aos="fade-up">
							<span><?= $index; ?></span>
							<input type="hidden" name="image_name" value="<?= ($value['filename'] ? COTTAGES_PATH.$value['filename'] : ''); ?>" />
						</li>
					<?php endforeach ?>
				</ul>
				<div class="reasons_desc">
					<?php foreach ($reasons as $key => $value): ?>
						<?php $index = $key + 1; ?>
						<div class="reason<?= $index; ?> <?= ($index == 1 ? 'active' : ''); ?> reason_holder">
							<div class="capt"><?= ($value['caption'] ? $value['caption'] : ''); ?></div>
							<div class="desc"><?= ($value['details'] ? $value['details'] : ''); ?></div>
						</div>
					<?php endforeach ?>
				</div>
				<div class="clear"></div>
			</div>
			<div class="col-lg-6 col-md-6 col-sm-6 hidden-xs reasons_preview" style="background: url('<?= ($reasons[0]['filename'] ? COTTAGES_PATH.$reasons[0]['filename'] : ''); ?>') center no-repeat; background-size: cover; -webkit-background-size: cover; -moz-background-size: cover; -ms-background-size: cover; -o-background-size: cover;"></div>
			<div class="clear"></div>
		</div>
	</section>
<?php endif ?>

<?php if ($equip): ?>
	<section class="cottage_equip por">
		<div class="container">
			<div class="text col-lg-6 col-md-6 col-sm-12 col-xs-12 eq_cont">
				<?php
					if ($equip['caption']) {
						$exp_equip = explode(' ', trim($equip['caption']));
						if (count($exp_equip) == 2) {
						 	$first_row = $exp_equip[0];
						 	$second_row = $exp_equip[1];
						}else{
							$first_row = $equip['caption'];
							$second_row = "";
						}
					}else{
						$first_row = ""; $second_row = "";
					} 
				?>
				<h2 class="sect_caption2 aos-init aos-animate" data-aos="fade-up"><?= $first_row; ?> <br /><?= $second_row; ?></h2>
				<hr class="heading_und2 aos-init aos-animate" data-aos="fade-up">
			</div>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 eq_cont">
				<div class="owl-carousel cottage_equip_owl aos-init aos-animate" data-aos="fade-up">
					<?php foreach ($equip['items'] as $key => $value): ?>
						<div class="item" style="background: url('<?= ($value['file'] ? COTTAGES_PATH.$value['file'] : ''); ?>') center no-repeat; background-size: cover; -webkit-background-size: cover; -moz-background-size: cover; -ms-background-size: cover; -o-background-size: cover;">
							<div class="hover"></div>
							<div class="hover_text">
								<p class="grid_caption"><?= ($value['caption'] ? $value['caption'] : ''); ?></p>
							</div>
						</div>
					<?php endforeach ?>
				</div>
			</div>
			<div class="clear"></div>
		</div>
		<div class="tri_left parallax_triangles parallax_move aos-init aos-animate" data-aos="fade-up" data-offset="20"></div>
		<div class="tri_right parallax_triangles parallax_move aos-init aos-animate" data-aos="fade-up" data-offset="20"></div>
	</section>
<?php endif ?>

<div class="clear"></div>

<?php if ($gallery): ?>
	<section class="cottages_gallery">
		<div class="container por">
			<h2 class="sect_caption2 aos-init aos-animate" data-aos="fade-up"><?= ($gallery['caption'] ? $gallery['caption'] : ''); ?></h2>
			<hr class="heading_und2 aos-init aos-animate" data-aos="fade-up">

			<div class="owl-carousel slider">
				<?php foreach ($gallery['items'] as $key => $value): ?>
					<?php if ($value['filename']): ?>
						<div class="item" style="background: url('<?= COTTAGES_PATH.'crop/370x250_'.$value['filename']; ?>') center no-repeat; background-size: cover; -webkit-background-size: cover; -moz-background-size: cover; -ms-background-size: cover; -o-background-size: cover;">
							<a href="<?= COTTAGES_PATH.$value['filename']; ?>" class="fancybox" data-fancybox="cottages_gallery" title="<?= ($value['file_desc'] ? $value['file_desc'] : ''); ?>"></a>
						</div>
					<?php endif ?>
					
				<?php endforeach ?>
				
			</div>
			<?php 
				$items_count = count($gallery['items']);
			?>
			<?php if ($items_count > 3): ?>
				<div class="count hidden-sm hidden-xs">+<?= $items_count - 3; ?></div>
			<?php endif ?>
		</div>
	</section>
<?php endif ?>




<?php 
/*
<section class="cottages_map">
	<div id="cottages_map"></div>
</section>
*/
?>


<section class="layouts_area ct_layouts_list" id="cottages_layouts">
	<div class="container">
		<?php // LAYOUTS START ?>
		<?php if (isset($cottages_list) && $cottages_list && count($cottages_list) > 0): ?>
			<?php foreach ($cottages_list as $key => $cottage): ?>
				

				<!-- LAYOUT ITEM -->
				<div class="layout_item">
					
					<div class="col-lg-5 col-md-5 col-sm-12 col-xs-12 properties">
						<div class="text">
							<?php if (isset($cottage->properties) && $cottage->properties): ?>
								<?php
									$properties = explode(';', $cottage->properties);
									if ($properties[count($properties) - 1] == '') array_pop($properties);

								?>

								<a href="<?= RS.'cottages/'.$cottage->id.'/'; ?>" class="upd_cottage_name"><?= $cottage->caption ?: "" ?></a>
								<div class="upd_top_flat_box hidden-sm hidden-xs">

									<a href="javascript:void(0);" class="order_btn bggreen upd" data-toggle="modal" data-target="#visit_modal">Записаться на просмотр</a>

									<p class="upd_consult_text">или получите консультацию по телефону</p>
									<a href="tel:0443948819" class="upd_consult_phone">044 394 88 19</a>

									<?php if ($cottage->price || $cottage->area) { ?>
										<div class="upd_flat_underline"></div>
									<?php }?>
									<?php if ($cottage->price) { ?>
										<div class="left">
											<p>Цена коттеджа</p>
											<p><span class="value"><?= $cottage->price; ?></span> грн/м<sup>2</sup></p>
										</div>
									<?php }?>

									<?php if ($cottage->area) { ?>
										<div class="right">
											<p>Площадь коттеджа</p>
											<p><span class="value"><?= $cottage->area; ?></span> м<sup>2</sup></p>
										</div>
									<?php }?>
									<div class="clear"></div>
									<?php if ($cottage->price || $cottage->area) { ?>
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
									$features = explode(';', $cottage->features);
									if (count($features) > 0 && $cottage->features) { ?>
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
						<?php if (isset($cottage->layouts) && $cottage->layouts): ?>
							<div class="owl-carousel primary">
								<?php foreach ($cottage->layouts as $key => $layout): ?>
									<?php 
										$source = $layout->filename ? COTTAGES_PATH.$layout->filename : IMG_PATH.'def_logo.jpg'; 
									?>
									<div class="item" style="overflow:hidden;">
										<a href="<?= $source; ?>" class="fancybox" data-fancybox="ctl_<?= $cottage->id ?>">
											<img src="<?= $source; ?>" alt="Layout" style="width:auto;height:auto;max-width:70%;margin:0 auto;display:block;" />
										</a>
										<div class="space20"></div>
										<?php /* <div class="image" style="background-image: url('<?= $source; ?>');"></div> */ ?>
									</div>
								<?php endforeach ?>
							</div>
							<div class="owl-carousel secondary">
								<?php foreach ($cottage->layouts as $key => $dot): ?>
									<?php 
										$source = $dot->filename ? COTTAGES_PATH.'crop/500x350_'.$dot->filename : IMG_PATH.'def_logo.jpg'; 
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

						<?php if ($cottage->cottage_desc) { ?>
							<div class="upd_about_proj_box">
								<a href="javascript:void(0);" class="active upd_about_proj">О проекте</a>
								<div class="space10"></div>
								
								<?php if (isset($cottage->cottage_desc) && $cottage->cottage_desc): ?>
								<div class="desc_c features_tab active <?= $cottage_desc_active; ?>">
									<?= $cottage->cottage_desc; ?>
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
								<?php if (isset($cottage->features) && $cottage->features): ?>
									<a href="javascript:void(0);" data-target=".features_c" class="active">Особенности</a> 
									<?php $feature_presence = true; ?>
								<?php endif ?>
								<?php if (isset($cottage->cottage_desc) && $cottage->cottage_desc): ?>
									<?php $cottage_desc_active = !$feature_presence ? "active" : ""; ?>
									<a href="javascript:void(0);" class="<?= $cottage_desc_active; ?>" data-target=".desc_c">Описание</a>
								<?php endif ?>

							</p>

							<?php if (isset($cottage->features) && $cottage->features): ?>
								<?php $features = explode(';', $cottage->features); ?>
								<div class="features_c features_tab active">
									<ul>
										<?php foreach ($features as $key => $feature): ?>
											<li><?= $feature; ?></li>
										<?php endforeach ?>
									</ul>	
								</div>
							<?php endif ?>

							<?php if (isset($cottage->cottage_desc) && $cottage->cottage_desc): ?>
								<div class="desc_c features_tab <?= $cottage_desc_active; ?>">
									<?= $cottage->cottage_desc; ?>
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
	
    if ($ready_ct && count($ready_ct) > 0) { ?>
        <section class="rd_th_layouts">

            <?php 
                $first_ct = $ready_ct[0];
                $first_layouts = $first_ct['layouts'];

            ?>

            <div class="container">

                <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 left_side">
                    
                    <div class="caption">Готовые <br>коттеджи</div>
                    <div class="separator"></div>

                    <div class="layouts_switcher">
                        <p>Метраж м<sup>2</sup></p>
                        <ul>
                            <?php 
                                foreach ($ready_ct as $rk => $rv) { 
                                        $active = $rk == 0 ? "active" : "";
                                    ?>
                                    <li onclick="appct.load_rd_ct(<?= $rv->id ?>, this);" class="<?= $active; ?>"><a href="javascript:void(0);"><?= $rv['area']; ?></a></li>
                                <?php }
                            ?>
                        </ul>
                    </div>

                    <div class="th_name"><?= $first_ct['name']; ?></div>
                    <div class="description">
                        <?= $first_ct['content']; ?>
                    </div>

                </div>

                
                <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12 rd_th_layouts_holder">
                    <div class="top_owl owl-carousel">
                        <?php 
                            if ($first_layouts && count($first_layouts) > 0) {
                                foreach ($first_layouts as $fk => $fv) { ?>
                                    <div class="item">
                                        <a href="<?= COTTAGES_PATH.$fv->source; ?>" class="fancybox" data-fancybox="th_layout_gal_111">
                                            <img src="<?= COTTAGES_PATH.'crop/435x340_'.$fv->source; ?>" alt="Layout">
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
                                        <img src="<?= COTTAGES_PATH.'crop/435x340_'.$fv->source; ?>" alt="Layout">
                                    </div>
                                <?php }
                            }
                        ?>
                    </div>
                </div>

                
            </div>
        </section>
    <?php }
?>


<?= $this->element('manager'); ?>
<div class="space20"></div>