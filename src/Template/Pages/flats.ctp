<section class="flats_houses page_section">
	<div class="container">
		<div class="upd_caption">Квартиры от застройщика в престижном пригороде</div>	
		<span class="upd_location map_trigger" data-lat="50.2764" data-lng="30.5315">7 км от Киева без пробок по Новообуховской трассе</span>
	</div>

	<?php if (isset($houses) && $houses): ?>
		<div class="upd_houses_list">
			<div class="container pn">
				<?php foreach ($houses as $key => $house): ?>
					<div class="upd_house_item  <?= $key == 0 ? 'first' : ''; ?>">
						<div class="col-lg-5 col-md-5 col-sm-12 col-xs-12 right">
							<?php 
								$available_flat = "#";
								$tmp_room = null;
								$tmp_room = $house->rooms->first();
								if ($tmp_room) {
									$available_flat = RS.'flats/'.$house->alias.'/'.$tmp_room->alias.'/';
								}
							?>
							<a href="<?= $available_flat; ?>" class="upd_house_name"><?= $house->name ? $house->name : ''; ?></a>
							<div class="upd_underline"></div>

							<?php if($house->mid_flats_price){ ?>
								<div class="upd_price upd_unit">
									<p>Цена квартиры от</p>
									<p><span class="value"><?= $house->mid_flats_price; ?></span> грн/м<sup>2</sup></p>
								</div>
							<?php } ?>
							
							<?php if($house->mid_flats_area){ ?>
								<div class="upd_area upd_unit">
									<p>Площадь квартир</p>
									<p><span class="value"><?= $house->mid_flats_area; ?></span> м<sup>2</sup></p>
								</div>
							<?php } ?>


							<?php 
								$properties = array(); 
								if (isset($house->properties) && $house->properties) $properties = explode(';', $house->properties);
							?>

							<?php if($properties){ ?>
								<div class="upd_properties upd_unit">
									<?php if ($properties): ?>
										<ul>
											<?php foreach ($properties as $key => $property): ?>
												<li><?= $property; ?></li>
											<?php endforeach ?>
										</ul>
									<?php endif ?>
								</div>
							<?php } ?>

							<?php
								$progress = isset($house->progress) && $house->progress ? $house->progress : "";
								$finish = isset($house->finish) && $house->finish ? $house->finish : "";
								if ($finish) $finish = date('m.Y', strtotime($finish));
							?>

							<div class="prog upd_unit">
								<?php if ($progress): ?>
									<p>Готовность <strong><?= $progress; ?>%</strong></p>
								<?php endif ?>
								<?php if ($finish): ?>
									<p>Срок сдачи <strong><?= $finish; ?></strong></p>
								<?php endif ?>
							</div>


							<p class="upd_s_text">Посмотрите планировки квартир</p>
							<?php if (isset($house->rooms) && $house->rooms): ?>
								<div class="rooms_count upd_unit">
									<?php if (count($house->rooms)): ?>
										<p class="upd_rooms_count_title">Количество комнат</p>
									<?php endif ?>
									<?php foreach ($house->rooms as $key => $room): ?>
										<a href="<?= RS.'flats/'.$house->alias.'/'.$room->alias.'/';; ?>">
											<button type="button" class="<?= $room->alias == 'rn' ? 'mult' : ''?>" data-target="<?= RS.'flats/'.$house->alias.'/'.$room->alias.'/'; ?>"><?= $room->short_name; ?></button>
										</a>
									<?php endforeach ?>
								</div>	
							<?php endif ?>
							<p class="upd_s_text">или получите консультацию по проекту:</p>
							<a href="#" class="upd_consult_btn" data-toggle="modal" data-target="#nrc">Получить консультацию</a>
							

						</div>
						<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 left pn">
							<?php if (isset($house->slides) && $house->slides): ?>
								<div class="upd_house_owl_primary owl-carousel" data-thumbs="<?= 'thumbs_'.$key; ?>">
									<?php foreach ($house->slides as $slide): ?>
										<?php
											$source = $slide->source ? HOUSE_SLIDES_PATH.$slide->source : IMG_PATH.'def_logo.jpg'; 
										?>
										<div class="item">
											<a href="<?= $source; ?>" class="fancybox" data-fancybox="house_<?= $house->id ?>">
												<img src="<?= $source; ?>" alt="Image" />
											</a>
										</div>
									<?php endforeach ?>
									
								</div>

								<div class="upd_house_owl_secondary owl-carousel thumbs_<?= $key ?>">
									<?php foreach ($house->slides as $slide): ?>
										<?php
											$source = $slide->source ? HOUSE_SLIDES_PATH.'crop/500x350_'.$slide->source : IMG_PATH.'def_logo.jpg'; 
										?>
										<div class="item">
											<img src="<?= $source; ?>" alt="Image" />
										</div>
									<?php endforeach ?>
								</div>
							<?php endif ?>
						</div>

						<div class="clear"></div>
					</div>
					<div class="clear"></div>
				<?php endforeach ?>
			</div>
		</div>
	<?php endif ?>








	<?php 
		/*
			OLD VERSION
		*/

		/*
								<div class="space200"></div>
		<div class="container">
			<div class="page_caption">Квартиры <span class="location map_trigger" data-lat="50.2764" data-lng="30.5315">7 км от Киева без пробок по Новообуховской трассе</span></div>
		</div>
		
		<?php if (isset($houses) && $houses): ?>
			<?php foreach ($houses as $key => $house): ?>
				<!-- HOUSE ITEM -->
				<div class="house_item <?= $key == 0 ? 'first' : ''; ?>">
					<div class="caption_wrapper">
						<div class="container">
							<p class="caption"><?= $house->name ? $house->name : ''; ?></p>
						</div>
					</div>
					<div class="container">
						<?php if (isset($house->slides) && $house->slides): ?>
							<div class="photos">
								<div class="owl-carousel">
									<?php foreach ($house->slides as $key => $slide): ?>
										<?php
											$source = $slide->source ? HOUSE_SLIDES_PATH.$slide->source : IMG_PATH.'def_logo.jpg'; 
										?>
										<div class="item">
											<div class="image" style="background-image: url('<?= $source; ?>');"></div>
										</div>
									<?php endforeach ?>
								</div>
							</div>
						<?php endif ?>
						<div class="properties">
							<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 left">
								<?php 
									$properties = array(); 
									if (isset($house->properties) && $house->properties) {
										$properties = explode(';', $house->properties);
									}
								?>
								<?php if ($properties): ?>
									<ul>
										<?php foreach ($properties as $key => $property): ?>
											<li><?= $property; ?></li>
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
								
								<?php 
									$area = isset($house->mid_flats_area) && $house->mid_flats_area ? $house->mid_flats_area : "";
									$price = isset($house->mid_flats_price) && $house->mid_flats_price ? $house->mid_flats_price : "";	
								?>
								<div class="area">
									<?php if ($area): ?>
										<p>Площадь квартир <span><?= $area; ?> м<sup>2</sup></span> от <span><?= $price; ?> грн/м<sup>2</sup></span></p>	
									<?php endif ?>
								</div>
							</div>

							<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 right">
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

								<?php 
								
									$first_room_alias = "r1";

									if ($house->rooms->count()) {
										$first_room_alias = $house->rooms->first()->alias;

										?>
											<a href="<?= RS.'flats/'.$house->alias.'/'.$first_room_alias.'/'; ?>" class="show_layouts">Показать планировки</a>
										<?php
									}
									
									
									?>
			
								
									<?php endif ?>
	
									
								</div>
							</div>
						</div>
					</div>
	
					<!-- HOUSE ITEM END -->
				<?php endforeach ?>
			<?php endif ?>
		*/
	?>

</section>

<?= $this->element('manager'); ?>