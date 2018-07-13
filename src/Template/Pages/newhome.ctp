<section class="home_b">
    <div class="home_tabs">
        <div class="home_tabs_body upd">

			<?php 
				if ($banners && count($banners) > 0) { ?>
					<div class="home_t_slider home_tab_body_item active">
						<div class="owl-carousel home_slider_owl">
							<?php 
							foreach ($banners as $bk => $bv) { ?>
								<div class="item">
									<img src="<?= NH.$bv->source; ?>" alt="Slide" />
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
											<a class="btn_1" href="#" data-toggle="modal" data-target="#visit_modal" onclick="ga('send', 'event', 'Кнопка', 'Записаться на просмотр');">
												Записаться на просмотр
											</a>
											<a class="btn_2" href="javascript:void(0);" onclick="upd.scroll_to('#objects');">
												Выбрать объект
											</a>
										</div>
									</div>
								</div>
							<?php }
							?>
						</div>
					</div>
				<?php }
			?>
			
			<?php 
				if ($common && ($common->nh_lat > 0 && $common->nh_lng > 0)) { ?>
					<div class="home_t_map home_tab_body_item">
						<div id="hs_map" data-lat="<?= $common->nh_lat; ?>" data-lng="<?= $common->nh_lng; ?>"></div>
					</div>
				<?php }
			?>

			<?php 
				if ($common && $common->genplan) { ?>
					<div class="home_t_plan home_tab_body_item">
						<a href="<?= NH.$common->genplan; ?>" class="fancybox">
							<img src="<?= NH.$common->genplan; ?>" alt="Genplan" />
						</a>
					</div>
				<?php }
			?>
            
        </div>
        <div class="home_tabs_new_nav">
            <ul>
				<?php 
				if ($banners && count($banners) > 0) { ?>
					<li><a href="javascript:void(0);" class="home_tab_nav_item objects_ active" data-target="home_t_slider" onclick="home.handle_slider_section(this);"><span>Объекты</span></a></li>
				<?php }
				?>

				<?php 
				if ($common && ($common->nh_lat > 0 && $common->nh_lng > 0)) { ?>
					<li><a href="javascript:void(0);" class="home_tab_nav_item map_" data-target="home_t_map" onclick="home.handle_slider_section(this);"><span>На карте</span></a></li>
				<?php }
				?>

				<?php 
				if ($common && $common->genplan) { ?>
					<li><a href="javascript:void(0);" class="home_tab_nav_item genplan_" data-target="home_t_plan" onclick="home.handle_slider_section(this);"><span>Генплан</span></a></li>
				<?php }
				?>

            </ul>
		</div>
    </div>  
</section>
<div class="clear"></div>
<div class="home_objects" id="objects">
	<div class="container">
		<div class="col-xs-12">
			<div class="caption">Выберите <br/>объект</div>
		</div>
		<div class="col-lg-4 col-md-4 col-md-4 col-xs-4 item">
			<a href="<?= RS.'flats/'; ?>">
				<img src="<?= RS.'img/ob1.jpg'; ?>" alt="Flats" />
				<span class="object_name" >Квартиры</span>
			</a>
		</div>

		<div class="col-lg-4 col-md-4 col-md-4 col-xs-4 item">
			<a href="<?= RS.'townhouses/'; ?>">
				<img src="<?= RS.'img/ob2.JPG'; ?>" alt="Townhouses" />
				<span class="object_name" >Экохаусы</span>
			</a>
		</div>

		<div class="col-lg-4 col-md-4 col-md-4 col-xs-4 item">
			<a href="<?= RS.'cottages/'; ?>">
				<img src="<?= RS.'img/ob3.JPG'; ?>" alt="Cottages" />
				<span class="object_name" >Коттеджи</span>
			</a>
		</div>

		
	</div>
</div>


<?php 
if ($intro) { ?>
	<section class="home_intro">
		<div class="left_shbg"></div> 
		<div class="right_shbg"></div>

		<div class="container">
			<div class="col-lg-7 col-md-6 col-sm-12 col-xs-12 left_side">
				<div class="caption"><?= $intro->caption ?: "" ?></div>
				<div class="separator"></div>
				<div class="content_target">
					<?= $intro->content ?: "" ?>
				</div>
			</div>
			<div class="col-lg-5 col-md-6 hidden-sm hidden-xs right_side">
				<?php 
				if ($intro->image) { ?>
					<img src="<?= NH.$intro->image; ?>" alt="Intro image" />
				<?php }
				?>
			</div>

			<div class="clear"></div>
			<div class="new_opportunities">
				<div class="caption">Ваши новые возможности</div>
				<a href="#" data-toggle="modal" data-target="#visit_modal" onclick="ga('send', 'event', 'Кнопка', 'Записаться на просмотр');">Узнай больше</a>
			</div>
			<div class="clear"></div>

			<?php 
				if ($grid && count($grid) > 0) { ?>
					<div class="home_new_grid hidden-xs">
						<?php 
							foreach ($grid as $gk => $gv) { ?>
								<!-- ITEM -->
								<div class="col-lg-4 col-md-4 col-sm-6 hidden-xs">
									<div class="item" style="background-image: url('<?= NH.'crop/500x500_'.$gv->source; ?>');">
										<div class="hover"></div>
										<div class="text">
											<div class="title"><?= $gv->caption ?: "" ?></div>
											<div class="content"><?= $gv->description ?: "" ?></div>
										</div>
									</div>
								</div>
							<?php }
						?>
					</div>
					<!-- MOBILE -->
					<div class="home_new_grid_mob hidden-lg hidden-md hidden-sm">
						<div class="owl-carousel home_mob_owl_grid">
						<?php 
							foreach ($grid as $gk => $gv) { ?>
								<div class="item">
									<img src="<?= NH.'crop/500x500_'.$gv->source; ?>" alt="Image" />
									<div class="text">
										<div class="title"><?= $gv->caption ?: "" ?></div>
										<div class="content"><?= $gv->description ?: "" ?></div>
									</div>
								</div>
							<?php }
						?>
						</div>
					</div>
				<?php }
			?>

		</div>
	</section>
<?php }
?>

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

				<div class="grid">

					<?php 
						if ($traffic->time1 > 0 && $traffic->ob1_lat > 0 && $traffic->ob1_lng > 0 && $traffic->dest1) { ?>

							<?php 
								$exp = explode('.', $traffic->ob1_lat);
								if ($exp[1] && mb_strlen($exp[1]) <= 3) {
									$exp[1] = $exp[1]."1";
									$traffic->ob1_lat = implode('.', $exp);

								}
								$exp2 = explode('.', $traffic->ob1_lng);
								if ($exp2[1] && mb_strlen($exp2[1]) <= 3) {
									$exp2[1] = $exp2[1]."1";
									$traffic->ob1_lng = implode('.', $exp2);
								}
							?>

							<div class="item">
								<div class="time"><span class="value"><?= $traffic->time1; ?></span> мин до</div>
								<div class="destination"><span class="value"><?= $traffic->dest1; ?></span></div>
								<a href="javascript:void(0);" class="route new_map_trigger" data-nlat="<?= number_format($traffic->ob1_lat, 4); ?>" data-lat="50.2764" data-lng="30.5315" data-nlng="<?= number_format($traffic->ob1_lng, 4); ?>" data-from="vidubichi">маршрут</a>
							</div>
						<?php }

						if ($traffic->time2 > 0 && $traffic->ob2_lat > 0 && $traffic->ob2_lng > 0 && $traffic->dest2) { ?>

							<?php 
								$exp = explode('.', $traffic->ob2_lat);
								if ($exp[1] && mb_strlen($exp[1]) <= 3) {
									$exp[1] = $exp[1]."1";
									$traffic->ob2_lat = implode('.', $exp);

								}
								$exp2 = explode('.', $traffic->ob2_lng);
								if ($exp2[1] && mb_strlen($exp2[1]) <= 3) {
									$exp2[1] = $exp2[1]."1";
									$traffic->ob2_lng = implode('.', $exp2);
								}
							?>
							<div class="item">
								<div class="time"><span class="value"><?= $traffic->time2; ?></span> мин до</div>
								<div class="destination"><span class="value"><?= $traffic->dest2; ?></span></div>
								<a href="javascript:void(0);" class="route new_map_trigger" data-nlat="<?= number_format($traffic->ob2_lat, 4); ?>" data-lat="50.2764" data-lng="30.5315" data-nlng="<?= number_format($traffic->ob2_lng, 4); ?>" data-from="teremky">маршрут</a>
							</div>
						<?php }

						if ($traffic->time3 > 0 && $traffic->ob3_lat > 0 && $traffic->ob3_lng > 0 && $traffic->dest3) { ?>

							<?php 
								$exp = explode('.', $traffic->ob3_lat);
								if ($exp[1] && mb_strlen($exp[1]) <= 3) {
									$exp[1] = $exp[1]."1";
									$traffic->ob3_lat = implode('.', $exp);

								}
								$exp2 = explode('.', $traffic->ob3_lng);
								if ($exp2[1] && mb_strlen($exp2[1]) <= 3) {
									$exp2[1] = $exp2[1]."1";
									$traffic->ob3_lng = implode('.', $exp2);
								}
							?>
							<div class="item">
								<div class="time"><span class="value"><?= $traffic->time3; ?></span> мин до</div>
								<div class="destination"><span class="value"><?= $traffic->dest3; ?></span></div>
								<a href="javascript:void(0);" class="route new_map_trigger" data-nlat="<?= number_format($traffic->ob3_lat, 4); ?>" data-lat="50.2764" data-lng="30.5315" data-nlng="<?= number_format($traffic->ob3_lng, 4); ?>" data-from="pecherska">маршрут</a>
							</div>
						<?php }
					?>

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


<?php if (isset($gal) && $gal && count($gal) > 0): ?>
	<section class="home_betterment home_section new_home_gal hidden-sm hidden-xs" id="home_betterment">
		<div class="home_betterment_toggle_h hidden-lg hidden-md mobile_toogle_h" data-target=".home_betterment_toggle_c">
			Благоустройство
			<div class="border"></div>
		</div>
		<div class="home_betterment_toggle_c home_toggle_c animated2">
			<div class="container">
				<div class="section_header"><?= $common->bett_capt ?: ""; ?></div>

				<div class="container pn">
					<?php 
						$cnt = 0;

						foreach ($gal as $key => $g) {
							if ($cnt == 0) {
								?>
									<div class="row double">
										<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 p1">
								<?php
							}

							if ($cnt == 1) {
								?>
									<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 p1">
								<?php
							}

							if ($cnt == 2) {
								?>
									<div class="row tripple">
										<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 p1">
								<?php
							}

							if ($cnt == 3) {
								?>
									<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 p1">
								<?php
							}

							if ($cnt == 4) {
								?>
									<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 p1">
								<?php
							}


							?>
								<a href="<?= $g->source ? IMG_PATH.$g->source : IMG_PATH."def_logo.jpg" ?>" class="fancybox item" style="background-image: url('<?= $g->source ? IMG_PATH.'crop/630x500_'.$g->source : IMG_PATH."def_logo.jpg" ?>');" data-fancybox="home__gal">
									<p class="b_header"><?= $g->caption ? $g->caption : ""; ?></p>
									<?php 
										$features = explode(';', $g->features);
									?>
									<?php if ($features): ?>
										<ul>
											<?php foreach ($features as $key => $value): ?>
												<li><?= $value; ?></li>
											<?php endforeach ?>
										</ul>
									<?php endif ?>
									<div class="hover_element"></div>
								</a>
							<?php

							if ($cnt == 0) {
								?>
									</div>
								<?php
							}

							if ($cnt == 1) {
								?>
										</div>
									</div>
								<?php
							}

							if ($cnt == 2) {
								?>
									</div>
								<?php
							}

							if ($cnt == 3) {
								?>
									</div>
								<?php
							}

							if ($cnt == 4) {
								?>
										</div>
									</div>
								<?php
							}

							$cnt++;
							if ($cnt == 5) {
								$cnt = 0;
							}

						}
					?>

				</div>
			</div>
		</div>	
	</section>
<?php endif ?>

<?php if ($dev): ?>
	<section class="new_home_guarant home_guarantees home_section" id="home_guarantees">
		<!-- <div class="home_guarantees_toggle_h hidden-lg hidden-md mobile_toogle_h" data-target=".home_guarantees_toggle_c">
			Гарантии застройщика
			<div class="border"></div>
		</div> -->
		<div class="home_guarantees_toggle_c home_toggle_c animated2">
			<div class="container">
				<div class="section_header"><?= $dev->caption ? $dev->caption : ""; ?></div>

				<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pn">
					<div class="content_target">
						<?= $dev->details ? $dev->details : ""; ?>
					</div>

					<div class="developer_logo">
						<a href="<?= RS.'about/'; ?>"><img src="<?= RS.'img/avm_logo.png'; ?>" alt="Developer logo"></a>
					</div>
					<div class="contacts">
						<p class="name">AVM development group</p>
						<?php if ($config->office_address): ?>
							<p class="addr"><span class="map_trigger" data-lat="50.4702" data-lng="30.3576"><?= $config->office_address; ?></span></p>
						<?php endif ?>
					</div>
					<div class="clear"></div>
				</div>

				<div class="col-lg-5 col-md-5 col-sm-12 col-xs-12 pn stat">

					<?php
						$stats = explode(';', $dev->stat);
						if ($stats[count($stats) - 1] == '') array_pop($stats); 
					?>

					<?php if ($stats): ?>
						<?php foreach ($stats as $key => $stat): ?>
							<?php
								$stat_row = explode('*', $stat);
								$f_stat = str_replace('м2', 'м<sup>2</sup>', $stat_row[0]);
								$s_stat = str_replace('м2', 'м<sup>2</sup>', $stat_row[1]);
							?>
							<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
								<p class="caption"><?= $f_stat ? $f_stat : ""; ?></p>
								<p class="sub_caption"><?= $s_stat ? $s_stat : ""; ?></p>
							</div>
						<?php endforeach ?>
					<?php endif ?>

				</div>

				<div class="clear"></div>

				
				<?php if (isset($projects) && $projects): ?>
					
					<div class="projects">
						<div class="section_sub_header">Проекты застройщика</div>
						<div class="col-lg-4 col-md-4 hidden-sm hidden-xs pn left_part">
							<div class="space60"></div>
							<img src="<?= RS.'img/nkz_logo_big.png'; ?>" alt="NKZ logo">
							<p>Киевская обл. с. Ходосовка</p>
						</div>

						<div class="col-lg-8 col-md-8 hidden-sm hidden-xs pn desktop right_part">
							<div class="space15"></div>
							<?php foreach ($projects as $key => $proj): ?>
								<?php
									$target = $proj->target ? "target='_blank'" : "";
									$href = $proj->link ? $proj->link : "javascript:void(0);"; 
								?>

								<?php if (($key + 1) % 4 == 0): ?>
									<div class="clear"></div>
								<?php endif ?>
								<div class="col-lg-4 col-md-4 hidden-sm hidden-xs">
									<a href="<?= $href; ?>" <?= $target; ?>><img src="<?= PROJECTS.$proj->logo; ?>" alt="Project logo" /></a>
									<p class="caption"><?= $proj->location ? $proj->location : ""; ?></p>
								</div>
							<?php endforeach ?>
						</div>

						<div class="hidden-lg hidden-md col-sm-12 col-xs-12 mobile">
							<div class="owl-carousel">
								<?php foreach ($projects as $key => $proj): ?>
									<?php
										$target = $proj->target ? "target='_blank'" : "";
										$href = $proj->link ? $proj->link : "javascript:void(0);"; 
									?>
									<div class="item"><a href="<?= $href; ?>" <?= $target; ?>><img src="<?= PROJECTS.$proj->logo; ?>" alt="Project logo" /></a></div>
								<?php endforeach ?>
							</div>
							<div class="space50"></div>
						</div>
					</div>

				<?php endif ?>

			</div>
		</div>	
	</section>
<?php endif ?>