<div class="upd_ct_intro layouts_area">
	<div class="container">
		<div class="upd_page_caption">Коттеджи от застройщика в ЖК "Новая Конча-Заспа"</div>

		<div class="filter">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<?php if (isset($upd_cottages_list) && $upd_cottages_list && count($upd_cottages_list) > 0): ?>
					<p>Выберите коттедж</p>
					<ul>
						<?php foreach ($upd_cottages_list as $i => $h): ?>

							<?php if ($h->id == $curr_cottage->id): ?>
								<li><a href="javascript:void(0);" class="active"><?= $h->caption; ?></a></li>	
							<?php else: ?>
								<li><a href="<?= RS.'cottages/'.$h->id.'/'; ?>"><?= $h->caption; ?> </a></li>
							<?php endif ?>
							
						<?php endforeach ?>
					</ul>
					<div class="clear"></div>
				<?php endif ?>
			</div>
			
			<div class="clear"></div>

		</div>
	</div>
</div>

<section class="layouts_area ct_layouts_list upd_ct_inner_item" id="cottages_layouts">
	<div class="container">
		<!-- LAYOUT ITEM -->
		<div class="layout_item">
					
			<div class="col-lg-5 col-md-5 col-sm-12 col-xs-12 properties">
				<div class="text">
					<?php $cottage = $curr_cottage; ?>
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
									<div class="space20"></div>
								</a>
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
	</div>
</section>

<section class="cottages_genplan" id="cottages_genplan">
	<div class="bg"></div>
	<div class="bg2"></div>
	<div class="container por">
		<div class="cgp_caption">
			<h2 class="sect_caption2 aos-init aos-animate" data-aos="fade-up">Генплан городка</h2>
			<hr class="heading_und2 aos-init aos-animate" data-aos="fade-up">
		</div>
	</div>
	<img src="<?= RS.'img/cottages_genplan.jpg'; ?>" alt="Cottages genplan" />
	<?= $this->element('cottages_genplan'); ?>

	<div class="cot_gen_plan_dialog available" id="cot_gen_plan_dialog">
		<div class="holder">
			<div class="capt">участок в наличии</div>
			<div class="clear"></div>
			<div class="desc">Участок 2,3 сотки под застройку. Стоимость участка $9000</div>
		</div>
	</div>
</section>

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
<?= $this->element("manager"); ?>