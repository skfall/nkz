<?= $this->element('breadcrumbs') ?>
<div class="space50 hidden-sm hidden-xs"></div>
<?php if ($infrastructure && count($infrastructure) > 0): ?>
	<section class="home_infrastructure home_section" id="home_infrastructure">
		<div class="home_infrastructure_toggle_h hidden-lg hidden-md mobile_toogle_h" data-target=".home_infrastructure_toggle_c">
			Инфраструктура
			<div class="border"></div>
		</div>
		<div class="home_infrastructure_toggle_c home_toggle_c animated2">
			<div class="container">
				<div class="section_header"><?= $common->infr_capt ?: ""; ?></span></div>

				<div class="infra_tabs">
					<?php foreach ($infrastructure as $key => $infr): ?>
						<?php
							$class = "";
							$icon_class = "";
							$target = "";

							switch ($infr->alias) {
								case 'megamarket':
									$class = "megamarket";
									$target = '.'.$infr->alias;
									$icon_class = "mf-inf-shops2";
									break;
								case 'manufacture':
									$class = "manufacture";
									$target = '.'.$infr->alias;
									$icon_class = "mf-benefits-2manufacture";
									break;
								case 'health':
									$class = "medical";
									$target = '.'.$infr->alias;
									$icon_class = "mf-benefits-3hospital";
									break;
								case 'fitness':
									$class = "fitness";
									$target = '.'.$infr->alias;
									$icon_class = "mf-benefits-4sport";
									break;
								case 'lake':
									$class = "lake";
									$target = '.'.$infr->alias;
									$icon_class = "mf-benefits-5lake";
									break;
								default:
									break;
							}
						?>

						<div class="tab_item <?= $class; ?> <?= $key == 0 ? "active" : ""; ?>" data-target="<?= '.'.$infr->alias; ?>">
							<div class="home_tab_icon_w" style="background-image: url('<?= IMG_PATH.$infr->icon; ?>'); "></div>
							<p class="tab_name"><span><?= $infr->name ? $infr->name : ""; ?></span></p>
							<p class="desc"><?= $infr->sub_caption ? $infr->sub_caption : ""; ?></p>
							<div class="clear"></div>
						</div>	
					<?php endforeach ?>

					<div class="clear"></div>
				</div>

				<div class="infra_content_blocks hidden-sm hidden-xs">
					<?php foreach ($infrastructure as $key => $infr): ?>

						<div class="infra_c_item <?= $infr->alias; ?> <?= $key == 0 ? "active" : ""; ?>">
							<div class="preview">
								<div class="right_corner"></div>
								<?php
									$source = $infr->image ? IMG_PATH.'crop/800x500_'.$infr->image : IMG_PATH."def_logo.jpg";
								?>
								<div class="image" style="background-image: url('<?= $source; ?>');"></div>
							</div>
							
							<div class="text_area content_target">
								<?= $infr->details ? $infr->details : ""; ?>
							</div>
							<div class="clear"></div>
						</div>	
					<?php endforeach ?>
					

					
				</div>
				<div class="clear"></div>
			</div>
		</div>	
	</section>
<?php endif ?>