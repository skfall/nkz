<?= $this->element('breadcrumbs') ?>
<?php if (isset($about_page) && $about_page): ?>
	<section class="about_dev">
		<div class="container">
			<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 pn">
				<p class="caption"><?= $about_page->caption ? $about_page->caption : ""; ?></p>
				<div class="desc content_target">
					<?= $about_page->dev_desc ? $about_page->dev_desc : ""; ?>
				</div>
			</div>
			<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 tac pn">
				<img src="<?= RS.'img/avm_logo_big.png'; ?>" alt="Devepoler logo" class="dev_logo"/>
			</div>

			<div class="clear"></div>
		</div>
	</section>
<?php endif ?>

<?php if (isset($projects) && $projects): ?>
	

	<section class="about_projects">
		<div class="container">
			<p class="caption">Наши проекты</p>
			<div class="about_tabs hidden-sm hidden-xs">
				<div class="tabs_nav">
					<?php foreach ($projects as $key => $proj): ?>

						<div class="<?= $key == 0 ? "active" : ""; ?> tab tac" data-target=".about_tabs <?= ".".$proj->alias; ?>">
							<a href="javascript:void(0);">
								<?php if ($proj->logo): ?>
									<img src="<?= PROJECTS.$proj->logo;?>" alt="Project logo" />
								<?php endif ?>
								<p><span><?= $proj->location; ?></span></p>
							</a>
						</div>
					<?php endforeach ?>


					
					<div class="clear"></div>

					<div class="tabs_cont">
						<?php foreach ($projects as $key => $proj): ?>
							<div class="item1 item <?= $key == 0 ? "active" : ""; ?> <?= $proj->alias; ?>">
								<div class="image" style="background-image: url('<?= PROJECTS.$proj->source;?>');"></div>
								<?php if ($proj->features): ?>
									<?php
										$features = explode(';', $proj->features);
										if ($features[count($features) - 1] == '') array_pop($features);
									?>
									<div class="features">
										<?php
											$cnt = 0;
											foreach ($features as $key => $f) {
												if ($cnt == 0) {
													?>
														<ul>
													<?php
												}
												?>
													<li><?= $f ? $f : ""; ?></li>
												<?php
												if ($cnt == 3) {
													?>
														</ul>
													<?php
												}

												$cnt++;
												if ($cnt == 4) {
													$cnt = 0;
												}
											} 
										?>
										
									</div>
								<?php endif ?>
							</div>
						<?php endforeach ?>
						<div class="clear"></div>
					</div>
				</div>
			</div>

			<div class="about_tab_m hidden-lg hidden-md">
				<?php if (isset($projects) && $projects): ?>
					<?php foreach ($projects as $key => $proj): ?>
						<div class="tab_h">
							<table>
								<tbody>
									<tr>
										<td class="image_container"><img src="<?= PROJECTS.$proj->logo; ?>" alt="Project logo" /></td>
										<td class="loc_text"><span><?= $proj->location ? $proj->location : ""; ?></span></td>
									</tr>
								</tbody>
							</table>
					
							<div class="clear"></div>
							<div class="tab_c">
								<div class="image" style="background-image: url('<?= PROJECTS.$proj->source;?>');"></div>
								<div class="features_mob">
									<?php
										$features = explode(';', $proj->features);
										if ($features[count($features) - 1] == '') array_pop($features);
									?>
									<?php if ($features): ?>
										<ul>
										<?php foreach ($features as $key => $f): ?>
											<li><?= $f ? $f : ""; ?></li>
										<?php endforeach ?>
										</ul>
									<?php endif ?>

								</div>
							</div>
						</div>
					<?php endforeach ?>
				<?php endif ?>
				

			</div>

		</div>
	</section>

<?php endif ?>

<?php if ($about_page): ?>
	<section class="about_stat">
		<div class="container">
			<p class="caption"><?= $about_page->projects_caption ? $about_page->projects_caption : ""; ?></p>
			<div class="content_target">
				<?= $about_page->projects_desc ? $about_page->projects_desc : ""; ?>
			</div>

			<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pln about_map_holder">
				<?php if ($about_page->map): ?>
					<div class="map">
						<img src="<?= PROJECTS.$about_page->map; ?>" alt="Map" />
					</div>
				<?php endif ?>
			</div>

			<div class="col-lg-5 col-md-5 col-sm-12 col-xs-12 pn">
				<?php
					$stats = explode(';', $about_page->stat);
					if ($stats[count($stats) - 1] == '') array_pop($stats); 
				?>

				<?php if ($stats): ?>
					<?php foreach ($stats as $key => $stat): ?>
						<?php
							$stat_row = explode('*', $stat);
							$f_stat = str_replace('м2', 'м<sup>2</sup>', $stat_row[0]);
							$s_stat = str_replace('м2', 'м<sup>2</sup>', $stat_row[1]);
						?>

						<div class="desc_item">
							<p class="head"><?= $f_stat ? $f_stat : ""; ?></p>
							<p class="desc"><?= $s_stat ? $s_stat : ""; ?></p>
						</div>
					<?php endforeach ?>
				<?php endif ?>
			</div>
		</div>
	</section>
<?php endif ?>
<section class="about_contacts">
	<div class="container">
		<p class="caption">Приезжайте к нам</p>
		<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 pn addr">
			<?php if ($config->office_address): ?>
				<p>Центральный офис AVM Development Group: </p>
				<p><a href="javascript:void(0);" class="map_trigger" data-lat="50.4702" data-lng="30.3576"><?= $config->office_address; ?></a></p>
			<?php endif ?>
		</div>
		<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 pn">
			<div class="text">
				<?php
					$pattern = "/[-()\s\t_]/";
					$hotline_phone = isset($config->hotline_phone) && $config->hotline_phone ? $config->hotline_phone : ""; 
					$hotline_phone_replaced = preg_replace($pattern, '', $hotline_phone);
				?>
				<a href="tel:<?= $hotline_phone_replaced; ?>" class="phone"><?= $hotline_phone; ?></a>
				<a href="mailto:<?= isset($config->support_email) && $config->support_email ? $config->support_email : ""; ?>" class="email"><?= isset($config->support_email) && $config->support_email ? $config->support_email : ""; ?></a>
			</div>
		</div>
	</div>
</section>