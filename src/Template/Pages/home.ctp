<?php if (isset($ban) && $ban): ?>	
	<section class="home_top_tabs hidden-sm hidden-xs">
		<div class="scene">
			<?php if ($ban->panorama || true): ?>
				<div class="panorama_tab home_tab active" style="height: auto; overflow: hidden;">
					<div class="panorama_header">
						<h4 class="panoram_header" style="color: #fff; text-shadow: 0 0 25px #333;"><?= $ban->pan_caption ? $ban->pan_caption : ""; ?></h4>
						<p style="color: #fff; text-shadow: 0 0 25px #333;"><?= $ban->pan_sub_caption ? $ban->pan_sub_caption : ""; ?></p>
					</div>
					<img src="<?= RS.'img/main_pano_1.jpg'; ?>" alt="Panorama" style="width: 100%; height: auto;">
					<?php 
						/* <?= $ban->panorama ? $ban->panorama : ""; ?> */
					?>
				</div>
			<?php endif ?>
			
			<div class="map_tab home_tab">
				<div class="home_gmap" id="home_gmap" data-lat="50.2764" data-lng="30.5315"></div>
			</div>
			<?php if ($ban->genplan): ?>
				<div class="genplan_tab home_tab">
					<a href="<?= IMG_PATH.$ban->genplan; ?>" class="fancybox">
						<img src="<?= IMG_PATH.$ban->genplan; ?>" alt="Genplan">
						<!-- <div class="gen_pan_bg" style="background-image: url('<?= IMG_PATH.$ban->genplan; ?>');"></div> -->
					</a>
				</div>
			<?php endif ?>
			<?php if ($last_bp_entries): ?>
				<?php 
					/*
					<?= !$ban->panorama ? "active" : ""; ?>
					*/
				?>
				<div class="building_prog_tab home_tab">
					<div class="b_carousel container animated">
						<div class="owl-carousel">
							<?php foreach ($last_bp_entries as $key => $bp): ?>
								<?php
									$bgal = $bp->gal ?: array();
									$period = date("d.m.Y", strtotime($bp->created));
								?>
								<?php if ($bgal && count($bgal) > 0): ?>
									<div class="item">
										<?php foreach ($bgal as $ikey => $g): ?>
											<?php if ($ikey > 0): ?>
												<a href="<?= BP.$g->source; ?>" class="dn" data-fancybox="bpg_<?= $key; ?>"></a>
											<?php else: ?>
												<?php continue; ?>
											<?php endif ?>
										<?php endforeach ?>
										<a href="<?= BP.$bgal->first()->source; ?>" class="b_prog_item fancybox" data-fancybox="bpg_<?= $key; ?>">
											<div class="preview" style="background-image: url(<?= BP.'crop/500x500_'.$bgal->first()->source; ?>);"></div>
											<p class="bprog_header"><?= $period ?: ""; ?></p>
											<span class="bprog_desc" style="max-height: 35px; text-overflow: ellipsis; overflow: hidden; display: block;"><?= $bp->caption ?: ""; ?></span>
										</a>
									</div>
								<?php else: ?>
									<?php continue; ?>
								<?php endif ?>
							<?php endforeach ?>
						</div>
					</div>
				</div>
			<?php endif ?>
		</div>
		<div class="controls">
			<ul class="home_tabs_nav">
				<?php if ($ban->panorama || true): ?>
					<li class="active">
						<a href="javascript:void(0);" data-target=".panorama_tab" class="panorama_nav">
							<span class="icon mf-1panorama"></span>
							<span class="text">Объекты</span>
						</a>
					</li>
				<?php endif ?>
				
				<li>
					<a href="javascript:void(0);" data-target=".map_tab" class="map_nav">
						<span class="icon mf-map"></span>
						<span class="text">На карте</span>
					</a>
				</li>
				<?php if ($ban->genplan): ?>
					<li>
						<a href="javascript:void(0);" data-target=".genplan_tab" class="genplan_nav">
							<span class="icon mf-genplan"></span>
							<span class="text">Генеральный план</span>
						</a>
					</li>
				<?php endif ?>

				<?php if (/*!$ban->panorama*/ false): ?>
					<script type="text/javascript">
						function init_bp_owl(){
							setTimeout(function(){
								$('.building_prog_tab .b_carousel').addClass('fadeIn');
							}, 100);
						}
						document.addEventListener("DOMContentLoaded", init_bp_owl);
					</script>
				<?php endif ?>
				<?php 
					/*<?= !$ban->panorama ? "active" : ""; ?> */
				 ?>
				<li class="">
					<a href="javascript:void(0);" data-target=".building_prog_tab" class="b_prog_nav">
						<span class="icon mf-wall-prepare"></span>
						<span class="text">Ход строительства</span>
					</a>
				</li>
			</ul>
		</div>
	</section>
<?php endif ?>

<section class="home_anchor_nav hidden-sm hidden-xs">
	<div class="container">
		<div class="home_middle_nav">
			<ul>
				<li class="primary flats active">
					<a href="javascript:void();">
						<span class="icon mf-menu-flats"></span>
						<span class="text">Квартиры</span>
					</a>
				</li>
				<li class="primary townhouses">
					<a href="<?= RS.'townhouses/'; ?>">
						<span class="icon mf-menu-townhouses"></span>
						<span class="text">Экохаусы</span>
					</a>
				</li>
				<li class="primary cottages">
					<a href="<?= RS.'cottages/'; ?>">
						<span class="icon mf-menu-cottages"></span>
						<span class="text">Коттеджи</span>
					</a>
				</li>
				<li class="separator"></li>
				<li class="secondary"><a href="#home_transport"><span class="text">Транспорт</span></a></li>
				<li class="secondary"><a href="<?= RS.'infrastructure/'; ?>"><span class="text">Инфраструктура</span></a></li>
				<li class="secondary"><a href="#home_betterment"><span class="text">Благоустройство</span></a></li>
				<li class="secondary"><a href="#home_docs"><span class="text">Документы</span></a></li>
				<li class="secondary"><a href="#home_guarantees"><span class="text">Гарантии застройщика</span></a></li>
			</ul>
		</div>
	</div>
</section>

<?php if ($houses): ?>
	<section class="home_flats home_section">
		<div class="flats_toggle_h hidden-lg hidden-md mobile_toogle_h active" data-target=".flats_toggle_c">
			<i class="mf-menu-flats ml21 mr18"></i>Квартиры
			<div class="border"></div>
		</div>
		<div class="flats_toggle_c home_toggle_c active">
			<div class="container">
				<?php foreach ($houses as $key => $house): ?>
					<!-- FLAT ITEM -->
					<div class="flat_item">
						<div class="b_top"></div>
						<div class="b_bot"></div>
						<div class="preview">
							<div class="left_corner"></div>
							
							<?php if ($house->slides && count($house->slides) > 0): ?>
								<div class="owl-carousel">
									<?php foreach ($house->slides as $key => $slide): ?>
										<?php
											$source = $slide->source ? HOUSE_SLIDES_PATH.$slide->source : IMG_PATH.'def_logo.jpg'; 
										?>
										<div class="item" style="background-image: url('<?= $source; ?>');"></div>
									<?php endforeach ?>
								</div>
							<?php endif ?>
						</div>
						<div class="text_area">
							<?php
								$progress = isset($house->progress) && $house->progress ? $house->progress : "";
								$finish = isset($house->finish) && $house->finish ? $house->finish : "";
								if ($finish) {
									$finish = date('m.Y', strtotime($finish));
								}
								$first_room = "r1";
								if ($house->first_room) {
									$first_room = $house->first_room->alias;
								}
							?>
							<style type="text/css">
								.home_house_name a {color: #333;} .home_house_name a:hover {color: #333; text-decoration: underline;} a:visited {color: #333;} a:link {color: #333;}
							</style>
							<div class="caption home_house_name"><a href="<?= RS.'flats/'.$house->alias.'/'.$first_room.'/' ?>"><?= $house->name ? $house->name : ""; ?></a></div>
							<div class="prog">
								<?php if ($progress): ?>
									<p>Готовность <strong><?= $progress; ?>%</strong></p>
								<?php endif ?>
								<?php if ($finish): ?>
									<p>Срок сдачи <strong><?= $finish; ?></strong></p>
								<?php endif ?>
							</div>
	
							<div class="price">
								<?php 
									$area = isset($house->mid_flats_area) && $house->mid_flats_area ? $house->mid_flats_area : "";
									$price = isset($house->mid_flats_price) && $house->mid_flats_price ? $house->mid_flats_price : "";	
								?>
								<?php if ($price): ?>
									<p>от <strong><?= $price; ?> грн/м<sup>2</sup></strong></p>
								<?php endif ?>
							</div>
							<?php 
								$properties = array(); 
								if (isset($house->properties) && $house->properties) {
									$properties = explode(';', $house->properties);
								}
							?>
							<?php if ($properties): ?>
								<ul class="benefits">
									<?php foreach ($properties as $key => $property): ?>
										<li><?= $property; ?></li>
									<?php endforeach ?>
								</ul>
							<?php endif ?>

							<p class="area">Площадь квартир <strong><?= $area; ?> м<sup>2</sup></strong></p>

							<?php if (isset($house->rooms) && $house->rooms): ?>
								<div class="rooms_count">
									<?php if (count($house->rooms)): ?>
										<span>Комнат</span>
									<?php endif ?>

									<?php foreach ($house->rooms as $key => $room): ?>
										<a href="<?= RS.'flats/'.$house->alias.'/'.$room->alias.'/';; ?>">
											<button type="button" class="<?= $room->alias == 'rn' ? 'mult' : ''?>" data-target="<?= RS.'flats/'.$house->alias.'/'.$room->alias.'/'; ?>"><?= $room->short_name; ?></button>
										</a>
									<?php endforeach ?>

								</div>	
							<?php endif ?>


							<?php 
								/*
								<a href="<?= RS.'flats/'.$house->alias.'/r1/'; ?>" class="show_layouts">Показать планировки</a>
								*/
							?>
						</div>
						<div class="clear"></div>
					</div>
					<!-- FLAT ITEM END -->					
				<?php endforeach ?>
			</div>
		</div>	
	</section>
<?php endif ?>

<section class="home_townhouses home_section" id="home_townhouses">
	<div class="home_transport_toggle_h hidden-lg hidden-md mobile_toogle_h" data-target=".th_ref">
		<a href="<?= RS.'townhouses/'; ?>">
			<i class="mf-menu-townhouses ml5 mr5"></i>Таунхаусы
			<div class="border"></div>
		</a>
	</div>
</section>

<section class="home_cottages home_section" id="home_cottages">
	<div class="home_transport_toggle_h hidden-lg hidden-md mobile_toogle_h" data-target=".ct_ref">
		<a href="<?= RS.'cottages/'; ?>">
			<i class="mf-menu-cottages ml11 mr13"></i>Коттеджи
			<div class="border"></div>
		</a>
	</div>
</section>

<section class="home_transport home_section" id="home_transport">
	<div class="home_transport_toggle_h hidden-lg hidden-md mobile_toogle_h" data-target=".home_transport_toggle_c">
		Транспорт
		<div class="border"></div>
	</div>
	<div class="home_transport_toggle_c home_toggle_c animated2">
		<div class="container">
			<div class="section_header"><?= $common->transport_capt ?: ""; ?></div>

			<div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
				<ul class="subway">
					<li>
						<img src="<?= RS.'img/icons/Metro.svg'; ?>" alt="Metro" class="metro_icon">
						<span>15 минут до м. Выдубичи <a href="javascript:void(0);" class="map_trigger" data-lat="50.2764" data-lng="30.5315" data-from="vidubichi">Показать маршрут</a></span>
						
					</li>
					<li>
						<img src="<?= RS.'img/icons/Metro.svg'; ?>" alt="Metro" class="metro_icon">
						<span>20 минут до м. Теремки <a href="javascript:void(0);" class="map_trigger" data-lat="50.2764" data-lng="30.5315" data-from="teremky">Показать маршрут</a></span>
						<div class="clear"></div>
					</li>
					<li>
						<img src="<?= RS.'img/icons/Metro.svg'; ?>" alt="Metro" class="metro_icon">
						<span>25 минут до м. Печерская <a href="javascript:void(0);" class="map_trigger" data-lat="50.2764" data-lng="30.5315" data-from="pecherska">Показать маршрут</a></span>
						<div class="clear"></div>
					</li>
				</ul>
			</div>

			<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
				<div class="transport_text">
					<img src="<?= RS.'img/icons/Minibus.svg'; ?>" alt="Icon">
					<p><?= $common->transport_text ?: ""; ?></p>
				</div>
			</div>
		</div>
	</div>	
</section>

<?php if (isset($env) && $env && count($env) > 0): ?>
	<section class="home_environment home_section" id="home_environment">
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
	<section class="home_betterment home_section" id="home_betterment">
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

<?php if (isset($docs) && $docs && count($docs) > 0): ?>
	<section class="home_docs home_section" id="home_docs">
		<div class="home_docs_toggle_h hidden-lg hidden-md mobile_toogle_h" data-target=".home_docs_toggle_c">
			Документы
			<div class="border"></div>
		</div>
		<div class="home_docs_toggle_c home_toggle_c animated2">
			<div class="container">
				<div class="section_header hidden-sm hidden-xs">Документы</div>

				<div class="owl-carousel">
					<?php foreach ($docs as $key => $doc): ?>
						<?php if ($doc->source): ?>
							<div class="item">
								<p class="caption"><?= $doc->cat_name ? $doc->cat_name : ""; ?></p>
								<a class="doc fancybox" href="<?= DOCS.$doc->source; ?>" style="background-image: url('<?= DOCS.'crop/350x500_'.$doc->source; ?>');" data-fancybox="home_docs_gal" data-caption="<?= $doc->cat_name ? $doc->cat_name : ""; ?>">
									<span class="hover_element"></span>
								</a>
							</div>
						<?php endif ?>
					<?php endforeach ?>
				</div>
			</div>
		</div>	
	</section>
<?php endif ?>

<?php if ($dev): ?>
	<section class="home_guarantees home_section" id="home_guarantees">
		<div class="home_guarantees_toggle_h hidden-lg hidden-md mobile_toogle_h" data-target=".home_guarantees_toggle_c">
			Гарантии застройщика
			<div class="border"></div>
		</div>
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