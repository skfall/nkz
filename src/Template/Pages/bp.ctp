<?= $this->element('breadcrumbs') ?>

<section class="bp_prog">
	<div class="container">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<p class="caption">Ход строительства</p>
		</div>

		<div class="clear"></div>

		<div class="filter">
			<div class="col-lg-8 col-md-8 col-sm-6 col-xs-6">
				<ul class="hidden-sm hidden-xs">
					<li class="<?= $curr_cat == null ? "active" : ""; ?>"><a href="<?= RS.'building-progress/'; ?>">Общее</a></li>
					<?php if ($all_cats): ?>
						<?php foreach ($all_cats as $key => $cat): ?>
							<?php if ($cat->count_entries <= 0) continue; ?>
							<li class="<?= $curr_cat != null && $curr_cat->alias == $cat->alias ? "active" : ""; ?>"><a href="<?= RS.'building-progress/?cat='.$cat->alias; ?>"><?= $cat->name ?: ""; ?></a></li>
						<?php endforeach ?>
					<?php endif ?>

				</ul>

				<form action="#" method="POST" id="mob_bp_cat_select_form" class="hidden-lg hidden-md">
					<p class="hidden-md hidden-lg mob_house_label">Выберите дом</p>
					<select name="bp_cat_select" class="bp_cat_select">
						<option value="<?= RS.'building-progress/'; ?>" <?= $curr_cat == null ? "selected" : ""; ?>>Общее</option>
						<?php if ($all_cats): ?>
							<?php foreach ($all_cats as $key => $cat): ?>
								<?php if ($cat->count_entries <= 0) continue; ?>
								<option value="<?= RS.'building-progress/?cat='.$cat->alias; ?>" <?= $curr_cat && $curr_cat->alias == $cat->alias ? "selected" : "" ;?>><?= $cat->name ?: ""; ?></option>
							<?php endforeach ?>
						<?php endif ?>
						
					</select>
				</form>

				<div class="clear"></div>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-6 col-xs-6 bf_period_wrap">
				<form action="#" method="POST" id="bp_period_form">
					<?php if ($final_dates): ?>
						<p class="hidden-md hidden-lg">Период</p>
						<select name="bp_period" id="periods" data-curr_cat="<?= $curr_cat && $curr_cat->alias ? $curr_cat->alias : ""; ?>">
							<?php foreach ($final_dates as $key => $period_date): ?>
								<?php 
									$date_val = $period_date["value"];
									$date_name = $period_date["name"];
								?>
								<option value="<?= $date_val; ?>" <?= $curr_period && $date_val == $curr_period ? "selected" : "" ;?> ><?= $date_name ?: ""; ?></option>
							<?php endforeach ?>
						</select>
						<p class="hidden-sm hidden-xs">Период</p>
					<?php endif ?>
					
				</form>
			</div>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<hr />
			</div>
			
			<div class="clear"></div>
			<div class="bp_target">
				<?php if ($entries): ?>
					<?php foreach ($entries as $mkey => $entry): ?>
						<?php
							$type = 1;
							$count_images = 0;
							if ($entry->gal) {
							 	$count_images = count($entry->gal);
							}
							if ($count_images == 2) {
								$type = 2;
							}elseif($count_images >= 3){
								$type = 3;
							}
						?>
						<div class="item type<?= $type; ?>">
							<?php 
								
							?>
							<div class="col-lg-12 info_row">
								<p><span class="date"><?= date("d-m-Y", strtotime($entry->created)); ?></span> <a href="<?= RS.'building-progress/?cat='.$entry->cat_alias; ?>" class="cat"><?= $entry->cat_name ?: ""; ?></a></p>

								<p class="item_name"><?= $entry->caption ?: ""; ?></p>

								<div class="item_desc content_target">
									<div id="bp_inner_height">
										<?= $entry->description ?: ""; ?>
									</div>
								</div>
<!-- 
								<div class="show_more dni" id="show_more_det_<?= $entry->id; ?>">Детали</div>
 -->
								
							</div>

							<div class="clear"></div>
							<?php if ($entry->gal && count($entry->gal) > 0): ?>
								<div class="images mobile">
									<div class="owl-carousel">
										<?php foreach ($entry->gal as $key => $im): ?>
											<div class="mob_item">
												<a href="<?= BP.$im->source; ?>" data-fancybox="bp_item_mob_<?= $entry->id; ?>" class="fancybox">
													<div class="image" style="background-image: url('<?= BP.'crop/500x500_'.$im->source; ?>');"></div>
												</a>
											</div>
										<?php endforeach ?>
									</div>
								</div>
							<?php endif ?>
							
							<div class="clear"></div>
							<?php if ($entry->gal && count($entry->gal) > 0): ?>
								<div class="images desktop">


									<?php if ($type == 1): ?>
										<?php foreach ($entry->gal as $key => $im): ?>
											<?php if ($key <= 2): ?>
												<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 b_col">
													<a href="<?= BP.$im->source; ?>" data-fancybox="bp_item_<?= $entry->id; ?>" class="fancybox">
														<div class="image_item" style="background-image: url('<?= BP.'crop/500x500_'.$im->source; ?>');">
															<div class="hover"></div>
														</div>
													</a>
												</div>
											<?php else: ?>
												<a href="" class="fancybox dn" data-fancybox="bp_item_<?= $key; ?>"></a>
											<?php endif ?>

										<?php endforeach ?>
										
									<?php elseif($type == 2): ?>

										<?php foreach ($entry->gal as $key => $im): ?>
											<?php if ($key <= 2): ?>
												
												<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 b_col">
													<a href="<?= BP.$im->source; ?>" data-fancybox="bp_item_<?= $entry->id; ?>" class="fancybox">
														<div class="image_item" style="background-image: url('<?= BP.'crop/500x500_'.$im->source; ?>');">
															<div class="hover"></div>
														</div>
													</a>
												</div>
												
											
											<?php else: ?>
												<a href="" class="fancybox dn" data-fancybox="bp_item_<?= $key; ?>"></a>
											<?php endif ?>

										<?php endforeach ?>

									<?php elseif($type == 3): ?>

										<?php foreach ($entry->gal as $key => $im): ?>
											<?php if ($key <= 2): ?>
												
											
												<?php if ($key == 0): ?>
													<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 b_col left">
														<a href="<?= BP.$im->source; ?>" data-fancybox="bp_item_<?= $entry->id; ?>" class="fancybox">
															<div class="image_item" style="background-image: url('<?= BP.'crop/500x500_'.$im->source; ?>');">
																<div class="hover"></div>
															</div>
														</a>
													</div>
												<?php elseif($key == 1): ?>
													<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 b_col right">
														<a href="<?= BP.$im->source; ?>" data-fancybox="bp_item_<?= $entry->id; ?>" class="fancybox">
															<div class="image_item" style="background-image: url('<?= BP.'crop/500x500_'.$im->source; ?>');">
																<div class="hover"></div>
															</div>
														</a>
												<?php elseif($key == 2): ?>
														<a href="<?= BP.$im->source; ?>" data-fancybox="bp_item_<?= $entry->id; ?>" class="fancybox">
															<div class="image_item" style="background-image: url('<?= BP.'crop/500x500_'.$im->source; ?>');">
																<div class="hover"></div>
																<?php if ($count_images > 3): ?>
																	<span class="count_inf"><?= "+".($count_images - 3); ?></span>
																<?php endif ?>
															</div>
														</a>
													</div>
												<?php endif ?>
											
											<?php else: ?>
												<a href="<?= BP.$im->source; ?>" class="fancybox dn" data-fancybox="bp_item_<?= $entry->id; ?>"></a>

											<?php endif ?>
										<?php endforeach ?>
									<?php endif ?>

				
									
									
									<div class="clear"></div>
								</div>
							<?php endif ?>

							
							<div class="bottom_bar">
								<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
									<p>
										<?= $entry->cat_price ?: ""; ?> 
										<a href="<?= $entry->cat_link ?: RS."flats/"; ?>" class="layouts">Показать планировки</a>
									</p>
								</div>
								<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
									<p>
										<a href="javascript:void(0);" class="subscribe" data-cat="<?= $entry->cat_name ?: ""; ?>">Следить за строительством</a>
										<a href="javascript:void(0);" class="question" data-cat="<?= $entry->cat_name ?: ""; ?>">Задать вопрос</a>
									</p>
								</div>

								<div class="clear"></div>
							</div>
						</div>
					<?php endforeach ?>
				<?php else: ?>
					<p class="no_items">Данных по данной категории нет.</p>
				<?php endif ?>
				
				<div class="bp_load_wrapper">
					<div class="more_items_target"></div>
				</div>
				

				<div class="clear"></div>
				<div class="show_btn_targ">
					<div class="load_more_items" id="load_more_items" data-curr_cat="<?= $curr_cat && $curr_cat->alias ? $curr_cat->alias : ""; ?>" data-curr_period="<?= $curr_period ? $curr_period : ""; ?>">Прошлый период</div>
				</div>
				


				<script type="text/javascript">
					function getPrevPeriod(){
						var periods = document.getElementById("periods");
						var options = periods.children;
						var btn = document.getElementById("load_more_items");
						var next_i = 0;
						for(var i in options){
							if (options.length > 1) {
								if (options[i].selected) {
									next_i = Number(i) + 1;
									if (next_i > (options.length - 1)) {
										btn.remove();
									}else{
										var val = options[next_i].value;
										btn.setAttribute("data-curr_period", val);
									}
								}
							}else{
								btn.remove();
							}
						}
					}
					getPrevPeriod();
				</script>

			</div>
		</div>
	</div>
</section>

<?= $this->element('bp_question') ?>
<?= $this->element('bp_subscription') ?>