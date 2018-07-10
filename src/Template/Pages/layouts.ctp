<?= $this->element('breadcrumbs'); ?>





<?php 
/*
	<section>
		<div class="layouts_page_caption">
			<div class="container">
				<p>Квартиры в престижном классическом пригороде</p>
			</div>
		</div>
	</section>
*/
?>

<?php if (isset($house) && $house && false): ?>
	<section class="layouts_house">
		<div class="house_item first">
			<div class="container">
				<?php if (isset($house->slides) && $house->slides): ?>
					<div class="photos">
						<div class="owl-carousel primary">
							<?php foreach ($house->slides as $key => $slide): ?>
								<?php if ($slide->type == 1): ?>
									<?php
										$source = $slide->source ? HOUSE_SLIDES_PATH.$slide->source : IMG_PATH.'def_logo.jpg'; 
									?>
									<div class="item">
										<div class="image" style="background-image: url('<?= $source; ?>');"></div>
									</div>
								<?php elseif($slide->type == 2 || $slide->type == 3): ?>
									<?php
										$source = $slide->source; 
									?>
									<div class="item">
										<div class="image" style="">
											<?= $source; ?>
										</div>
									</div>
								<?php endif ?>
							<?php endforeach ?>
							
							<div class="item">
								<div class="image" style="background-image: url('<?= RS.'img/manufacture.jpg'; ?>');"></div>
							</div>
						</div>

						<div class="custom_dots">
							<div class="owl-carousel secondary">
								<?php foreach ($house->slides as $key => $dot): ?>
									<?php if ($dot->type == 1): ?>
										<?php
											$source = $dot->source ? HOUSE_SLIDES_PATH.'crop/500x350_'.$dot->source : IMG_PATH.'def_logo.jpg'; 
										?>
										<div class="item">
											<div class="inner">
												<div class="image" style="background-image: url('<?= $source ?>');"></div>
											</div>
										</div>
									<?php elseif($dot->type == 2): ?>
										<div class="item video">
											<div class="inner">
												<div class="image" style="background-image: url('<?= RS.'img/dot_flat.jpg'; ?>');"></div>
											</div>
										</div>
									<?php elseif($dot->type == 3): ?>
										<div class="item panorama">
											<div class="inner">
												<div class="image" style="background-image: url('<?= RS.'img/dot_flat.jpg'; ?>');"></div>
											</div>
										</div>
									<?php endif ?>
								<?php endforeach ?>

							</div>
							<div class="clear"></div>
						</div>
					</div>
				<?php endif ?>
				<div class="house_caption">
					<h5><?= isset($house->sub_name) && $house->sub_name ? $house->sub_name : ""; ?> <span class="location hidden-sm hidden-xs map_trigger" data-lat="50.2764" data-lng="30.5315">7 км от Киева без пробок по Новообуховской трассе</span><span class="mob_location hidden-lg hidden-md map_trigger" data-lat="50.2764" data-lng="30.5315">Как добраться</span></h5>
				</div>
				<div class="properties">

					<?php 
						$properties = array(); 
						if (isset($house->properties) && $house->properties) {
							$properties = explode(';', $house->properties);
						}
					?>
					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 left">
						<?php if ($properties): ?>
							<ul>
								<?php foreach ($properties as $key => $prop): ?>
									<li><?= $prop ? $prop : ""; ?></li>
								<?php endforeach ?>
							</ul>
						<?php endif ?>
					</div>

					<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 middle">
						<?php
							$progress = isset($house->progress) && $house->progress ? $house->progress : "";
							$finish = isset($house->finish) && $house->finish ? $house->finish : "";
							if ($finish) {
								$finish = date('m.Y', strtotime($finish));
							}
						?>
						<div class="prog">
							<?php if ($progress): ?>
								<p>Готовность <strong><?= $progress; ?>%</strong></p>
							<?php endif ?>
							<?php if ($finish): ?>
								<p>Срок сдачи <strong><?= $finish; ?></strong></p>
							<?php endif ?>
						</div>

						<div class="area">
							<p><a href="<?= RS.'building-progress/'.$house->alias.'/'; ?>">Ход строительства</a></p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
<?php endif ?>

<section class="layouts_area">
	<div class="container">

		<div class="col-lg-9 col-md-9 col-sm-8 col-xs-12">
			<div class="upd_caption_box">
				<p class="upd_flat_caption">Квартиры от застройщика</p>
				<p class="upd_sub_caption">в ЖК "Новая Конча-Заспа"</p>
			</div>
		</div>
		<div class="col-lg-3 col-md-3 col-sm-4 col-xs-12 layouts_house">
			<?php
				if (isset($house) && $house) { 
					$progress = isset($house->progress) && $house->progress ? $house->progress : "";
					$finish = isset($house->finish) && $house->finish ? $house->finish : "";
					if ($finish) {
						$finish = date('m.Y', strtotime($finish));
					}
					
					?>
						<div class="prog">
							<?php if ($progress): ?>
								<p>Готовность <strong><?= $progress; ?>%</strong></p>
							<?php endif ?>
							<?php if ($finish): ?>
								<p>Срок сдачи <strong><?= $finish; ?></strong></p>
							<?php endif ?>
						</div>
				<?php } 
			?>
		</div>

		<div class="clear"></div>

		<div class="filter">
			<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12">
				<?php if (isset($houses_list) && $houses_list): ?>
					<p>Выберите дом</p>
					<ul>
						<?php foreach ($houses_list as $i => $h): ?>
							<?php 
								$tooltip = "";
								if (isset($h->short_desc) && $h->short_desc) {
									$short_desc = str_replace('"', "`", str_replace("'", "`", $h->short_desc));
									$tooltip = "data-tooltip='".$short_desc."'";
								}
								$first_room = "r1";
								if ($h->first_room) {
									$first_room = $h->first_room->alias;
								}
							?>
							<?php if ($h->alias == $house->alias): ?>
								<li><a href="javascript:void(0);" class="active"><?= $h->name; ?> <span class="tooltip_mark" <?= $tooltip; ?>></span></a></li>	
							<?php else: ?>
								<li><a href="<?= RS.'flats/'.$h->alias.'/'.$first_room.'/' ?>"><?= $h->name; ?> <span class="tooltip_mark" <?= $tooltip; ?>></span></a></li>
							<?php endif ?>
							
						<?php endforeach ?>
					</ul>
				<?php endif ?>
			</div>
			<div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
				<?php if (isset($rooms_list) && $rooms_list): ?>
					<p>Выберите количество комнат</p>
					<ul>
						<?php foreach ($rooms_list as $i => $r): ?>
							<?php 
								$mult = "";
								if ($r->alias == 'rn') $mult = "mult";
							?>
							<?php if ($r->alias == $room->alias): ?>
								<li><a href="javascript:void(0);" class="active <?= $mult; ?>"><?= $r->short_name; ?></a></li>							
							<?php else: ?>	
								<li><a href="<?= RS.'flats/'.$house->alias.'/'.$r->alias.'/'; ?>" class="<?= $mult; ?>"><?= $r->short_name; ?></a></li>	
							<?php endif ?>
						<?php endforeach ?>
					</ul>	
				<?php endif ?>
			</div>
			<div class="clear"></div>

			<div class="house_tooltip">
				<p></p>
			</div>
		</div>

		<p class="rooms_caption"><?= isset($room->caption) && $room->caption ? $room->caption : ""; ?></p>


		<?php // LAYOUTS START ?>
		<?php if (isset($flats) && $flats && count($flats) > 0): ?>
			
			<?php foreach ($flats as $key => $flat): ?>
				<?php 
					$event_mark_class = isset($flat->events) && $flat->events ? "event_layout" : "";
					$event = isset($flat->events) && $flat->events ? $flat->events : "";

				?>

				

				<!-- LAYOUT ITEM -->
				<div class="layout_item <?= $event_mark_class; ?>">
					<?php if ($event): ?>
						<?php $timer_val = strtotime($event['finish']); ?>

						<div class="event timer" data-time_val="<?= $timer_val;?>">
							<div class="event_mark">Акция</div>
							<div class="name"><?= isset($event->caption) && $event->caption ? $event->caption : ""; ?></div>
							<div class="time_left">
								<div class="days"><span class="b"></span> <span class="sm">д.</span></div>
								<div class="separator"> : </div>
								<div class="hours"><span class="b"></span> <span class="sm">ч.</span></div>
								<div class="separator"> : </div>
								<div class="minutes"><span class="b"></span> <span class="sm">м.</span></div>
								<div class="time_left_text">до конца акции</div>
							</div>
						</div>
					<?php endif ?>
					
					
					<div class="col-lg-5 col-md-5 col-sm-12 col-xs-12 properties">
						<div class="text">
							<?php if (isset($flat->properties) && $flat->properties): ?>
								<?php
									$properties = explode(';', $flat->properties);
									if ($properties[count($properties) - 1] == '') array_pop($properties);

								?>

								<div class="upd_top_flat_box hidden-sm hidden-xs">
									<?php if ($event): ?>
										<a href="javascript:void(0);" class="order_btn upd" data-toggle="modal" data-target="#visit_modal">Воспользоваться случаем</a>
									<?php else: ?>
										<a href="javascript:void(0);" class="order_btn bggreen upd" data-toggle="modal" data-target="#visit_modal">Записаться на просмотр</a>
									<?php endif ?>

									<p class="upd_consult_text">или получите консультацию по телефону</p>
									<a href="tel:0443948819" class="upd_consult_phone">044 394 88 19</a>

									<?php if ($flat->price || $flat->area) { ?>
										<div class="upd_flat_underline"></div>
									<?php }?>
									<?php if ($flat->price) { ?>
										<div class="left">
											<p>Цена квартиры от</p>
											<p><span class="value"><?= $flat->price; ?></span> грн/м<sup>2</sup></p>
										</div>
									<?php }?>

									<?php if ($flat->area) { ?>
										<div class="right">
											<p>Площадь квартиры</p>
											<p><span class="value"><?= $flat->area; ?></span> м<sup>2</sup></p>
										</div>
									<?php }?>
									<div class="clear"></div>
									<?php if ($flat->price || $flat->area) { ?>
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
								/*
									<p>
										<?php 
											$feature_presence = false;
										?>
										<?php if (isset($flat->features) && $flat->features): ?>
											<a href="javascript:void(0);" data-target=".features_c" class="active">В стоимость входит</a> 
											<?php $feature_presence = true; ?>
										<?php endif ?>
										<?php if (isset($flat->flat_desc) && $flat->flat_desc): ?>
											<?php $flat_desc_active = !$feature_presence ? "active" : ""; ?>
											<a href="javascript:void(0);" class="<?= $flat_desc_active; ?>" data-target=".desc_c">Описание</a>
										<?php endif ?>
									</p>
									<?php if (isset($flat->features) && $flat->features): ?>
										<?php $features = explode(';', $flat->features); ?>
										<div class="features_c features_tab active">
											<ul>
												<?php foreach ($features as $key => $feature): ?>
													<li><?= $feature; ?></li>
												<?php endforeach ?>
											</ul>	
										</div>
									<?php endif ?>

								 */
								?>

								<?php 
									$features = explode(';', $flat->features);
									if (count($features) > 0 && $flat->features) { ?>
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
						<?php if (isset($flat->layouts) && $flat->layouts): ?>
							<div class="owl-carousel primary">
								<?php foreach ($flat->layouts as $key => $layout): ?>
									<?php 
										$source = $layout->filename ? LAYOUTS.$layout->filename : IMG_PATH.'def_logo.jpg'; 
									?>
									<div class="item" style="overflow:hidden;">
										<img src="<?= $source; ?>" alt="Layout" style="width:auto;height:auto;max-width:70%;margin:0 auto;display:block;" />
										<?php /* <div class="image" style="background-image: url('<?= $source; ?>');"></div> */ ?>
									</div>
								<?php endforeach ?>
							</div>
							<div class="owl-carousel secondary">
								<?php foreach ($flat->layouts as $key => $dot): ?>
									<?php 
										$source = $dot->filename ? LAYOUTS.'crop/500x350_'.$dot->filename : IMG_PATH.'def_logo.jpg'; 
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

						<?php if ($flat->flat_desc) { ?>
							<div class="upd_about_proj_box">
								<a href="javascript:void(0);" class="active upd_about_proj">О проекте</a>
								<div class="space10"></div>
								
								<?php if (isset($flat->flat_desc) && $flat->flat_desc): ?>
								<div class="desc_c features_tab active <?= $flat_desc_active; ?>">
										<?= $flat->flat_desc; ?>
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
								<?php if (isset($flat->features) && $flat->features): ?>
									<a href="javascript:void(0);" data-target=".features_c" class="active">Особенности</a> 
									<?php $feature_presence = true; ?>
								<?php endif ?>
								<?php if (isset($flat->flat_desc) && $flat->flat_desc): ?>
									<?php $flat_desc_active = !$feature_presence ? "active" : ""; ?>
									<a href="javascript:void(0);" class="<?= $flat_desc_active; ?>" data-target=".desc_c">Описание</a>
								<?php endif ?>

							</p>

							<?php if (isset($flat->features) && $flat->features): ?>
								<?php $features = explode(';', $flat->features); ?>
								<div class="features_c features_tab active">
									<ul>
										<?php foreach ($features as $key => $feature): ?>
											<li><?= $feature; ?></li>
										<?php endforeach ?>
									</ul>	
								</div>
							<?php endif ?>

							<?php if (isset($flat->flat_desc) && $flat->flat_desc): ?>
								<div class="desc_c features_tab <?= $flat_desc_active; ?>">
									<?= $flat->flat_desc; ?>
								</div>
							<?php endif ?>


							
							<div class="clear"></div>
							
							<?php if ($event): ?>
								<a href="#" class="order_btn" data-toggle="modal" data-target="#visit_modal">Воспользоваться случаем</a>
							<?php else: ?>
								<a href="#" class="order_btn bggreen" data-toggle="modal" data-target="#visit_modal">Записаться на просмотр</a>
							<?php endif ?>
						</div>
					</div>
					
					<div class="clear"></div>
				</div>
				<!-- LAYOUT ITEM END -->
			<?php endforeach ?>
		<?php else: ?>
			<p>Список пуст</p>
		<?php endif ?>

	</div>
</section>

<?php if (isset($house->coords) && $house->coords): ?>
	<section class="layouts_placement">
		<div class="container">
			<p class="caption">Размещение</p>
			<div class="map_container">
				<div class="maps">
					<?php foreach ($house->coords as $key => $loc): ?>
						<div class="item <?= $key == 0 ? "active" : ""; ?> item<?= ($key + 1); ?>" data-lat="<?= $loc->lat; ?>" data-lng="<?= $loc->lng; ?>"></div>
					<?php endforeach ?>
				</div>
				<div class="nav">
					<ul>
						<?php foreach ($house->coords as $key => $loc): ?>
							<div class="item <?= $key == 0 ? "active" : ""; ?> item<?= $key; ?>" data-lat="<?= $loc->lat; ?>" data-lng="<?= $loc->lng; ?>"></div>
						<?php endforeach ?>
						<li class="children_g active" data-target=".maps .item1"><i class="mf-inf-cg2"></i><span>Детские сады</span></li>
						<li class="school" data-target=".maps .item2"><i class="mf-inf-school2"></i><span>Школы</span></li>
						<li class="hospital" data-target=".maps .item3"><i class="mf-inf-hospital2"></i><span>Здоровье</span></li>
						<li class="health" data-target=".maps .item4"><i class="mf-inf-shops2"></i><span>Товары и услуги</span></li>
						<li class="rest" data-target=".maps .item5"><i class="mf-inf-cafe2"></i><span>Рестораны и клубы отдыха</span></li>
					</ul>
				</div>
			</div>
			<div class="l_mobile_header hidden-lg hidden-md active" data-target=".transport_box"><a href="javascript:void(0);">Транспорт</a><div class="border"></div></div>

			<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 active home_transport transport_box mob_l_box">
				

				<p class="box_caption hidden-sm hidden-xs">Транспортная доступность</p>
				<p class="transport_mob_caption hidden-lg hidden-md">До Киева без пробок</p>
				<ul class="subway">
					<li>
						<img src="<?= RS; ?>img/icons/Metro.svg" alt="Metro" class="metro_icon">
						<span>15 минут до м. Выдубичи <a href="javascript:void(0);" class="map_trigger" data-lat="50.2764" data-lng="30.5315" data-from="vidubichi">Показать маршрут</a></span>
						
					</li>
					<li>
						<img src="<?= RS; ?>img/icons/Metro.svg" alt="Metro" class="metro_icon">
						<span>20 минут до м. Теремки <a href="javascript:void(0);" class="map_trigger" data-lat="50.2764" data-lng="30.5315" data-from="teremky">Показать маршрут</a></span>
						<div class="clear"></div>
					</li>
					<li>
						<img src="<?= RS; ?>img/icons/Metro.svg" alt="Metro" class="metro_icon">
						<span>25 минут до м. Печерская <a href="javascript:void(0);" class="map_trigger" data-lat="50.2764" data-lng="30.5315" data-from="pecherska">Показать маршрут</a></span>
						<div class="clear"></div>
					</li>
				</ul>
				<div class="clear"></div>
				<div class="transport_text">
					<img src="<?= RS.'img/icons/Minibus.svg'; ?>">
					<p>Ежедневно ходят маршрутки от метро Выдубичи до Мегамаркета каждые 20 мин с 6:00 до 23:00</p>
				</div>
			</div>
			
			<div class="l_mobile_header hidden-lg hidden-md" data-target=".documents_box"><a href="javascript:void(0);">Документы в порядке</a><div class="border"></div></div>
			<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 documents_box mob_l_box">
				<?php if (isset($doc_cats) && $doc_cats): ?>
					<p class="box_caption hidden-sm hidden-xs">Документы в порядке</p>
					<ul class="docs">
						<?php foreach ($doc_cats as $key => $cat): ?>
							<?php if ($cat->docs): ?>
								<li><a href="<?= DOCS.$cat->docs[0]->source; ?>" class="fancybox" data-fancybox="<?= $cat->alias; ?>"><?= $cat->name; ?></a></li>
								<?php foreach ($cat->docs as $doc_key => $doc): ?>
									<?php if($doc_key == 0) continue; ?>
									<a href="<?= DOCS.$doc->source; ?>" class="fancybox dn" data-fancybox="<?= $cat->alias; ?>"></a>
								<?php endforeach ?>
							<?php endif ?>
						<?php endforeach ?>
					</ul>
				<?php endif ?>
				<div class="clear"></div>
			</div>
			<div class="l_mobile_header hidden-lg hidden-md" data-target=".credit_box"><a href="javascript:void(0);">Расстрочка</a><div class="border"></div></div>
			<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 credit credit_box mob_l_box">
				<?php if (isset($house->house_flat_info) && $house->house_flat_info): ?>
					<p class="box_caption hidden-sm hidden-xs"><?= $house->house_flat_col_caption ? $house->house_flat_col_caption : ""; ?></p>
					<div class="text">
						<?= $house->house_flat_info; ?>
					</div>
					<div class="clear"></div>
				<?php endif ?>
			</div>
		</div>
	</section>
<?php endif ?>

<section class="layouts_communications">
	<div class="container">
		<div class="l_mobile_header hidden-lg hidden-md" data-target=".communications_box"><a href="javascript:void(0);">Все подведено</a><div class="border"></div></div>

		<div class="communications_box mob_l_box">
			<div class="caption hidden-sm hidden-xs">Все подведено</div>
			<div class="item">
				<img src="<?= RS.'img/com_item1.png'; ?>" alt="Icon" />
				<p>Газ</p>
			</div>
			<div class="item">
				<img src="<?= RS.'img/com_item2.png'; ?>" alt="Icon" />
				<p>Электричество</p>
			</div>
			<div class="item">
				<img src="<?= RS.'img/com_item3.png'; ?>" alt="Icon" />
				<p>Вода</p>
			</div>
			<div class="item">
				<img src="<?= RS.'img/com_item4.png'; ?>" alt="Icon" />
				<p>Отопление</p>
			</div>
		</div>
		<div class="clear"></div>
	</div>
</section>

<?php if (isset($house->gal) && $house->gal): ?>
	<section class="layouts_gallery">
		<div class="container">
			<div class="caption">Что меня ждет</div>
			
			<?php 
				$cnt = 0;
				foreach ($house->gal as $item) {
					if ($cnt == 0) {
						?>
							<div class="grid_row sm_right">
								<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12">
						<?php
					}

					if ($cnt == 1) {
						?>
							<div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
						<?php
					}

					if ($cnt == 2) {
						?>
							<div class="grid_row sm_left">
								<div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
						<?php
					}

					if ($cnt == 3) {
						?>
							<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12">
						<?php
					}


							?>
								<div class="image" style="background-image: url('<?= ($item->source ? HOUSE_GAL.$item->source : IMG_PATH."def_logo.jpg"); ?>');"></div>
								<div class="text">
									<p class="top"><?= $item->caption ? $item->caption : ""; ?></p>
									<p class="bot"><?= $item->sub_caption ? $item->sub_caption : ""; ?></p>
								</div>
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
							<div class="clear"></div>
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
							</div>
							<div class="clear"></div>
						<?php

					}

					$cnt++;

					if ($cnt == 4) {
						$cnt = 0;
					}
				}
			?>
			
		</div>
	</section>
<?php endif ?>

<?= $this->element('manager'); ?>