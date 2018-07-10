<?php if (isset($manager) && $manager): ?>
	<section class="flats_manager layouts_manager">
		<div class="container">
			<div class="col-lg-3 col-md-3 col-sm-4 col-xs-5 tac manager_photo_wrapper">
				<?php if ($manager->photo): ?>
					<img src="<?= IMG_PATH.$manager->photo; ?>" alt="Manager" />
				<?php endif ?>
			</div>
			<div class="hidden-lg hidden-md col-sm-8 col-xs-7 pl0">
				<p class="caption hidden-lg hidden-md mob_manager_name"><?= $manager->caption ? $manager->caption : ""; ?></p>
			</div>
			<div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">
				<?php 
					$phone = isset($manager->phone) && $manager->phone ? $manager->phone : "";

					$reg_exp = "/[-()\s\t_]/";
					$phone_replaced = preg_replace($reg_exp, '', $manager->phone);
				?>

				<p class="caption hidden-sm hidden-xs"><?= $manager->caption ? $manager->caption : ""; ?></p>
				<p class="phone">
					<a href="tel:<?= $phone_replaced; ?>"><?= $manager->phone ? $manager->phone : ""; ?></a>
					<?php if ($manager->viber): ?>
						<span class="viber"></span> 
					<?php endif ?>
					<?php if ($manager->telegram): ?>
						<span class="telegram"></span>
					<?php endif ?>
				</p>
				<p class="text"><?= $manager->details ? $manager->details : ""; ?></p>
				<a href="javascript:void(0);" class="appointment" data-toggle="modal" data-target="#visit_modal">Записаться на встречу</a>
			</div>

			<div class="clear"></div>

		</div>
	</section>
<?php endif ?>

<?php if (isset($manager_menu) && $manager_menu): ?>
	<section class="flats_bottom_menu layouts_manager">
		<div class="container">
			<div class="col-lg-3 col-md-3 hidden-sm hidden-xs"></div>
			<div class="col-lg-9 col-md-9 col-sm-12 col-xs-12 pn">
				<ul>
					<?php foreach ($manager_menu as $key => $menu_item): ?>
						<li><a href="<?= $menu_item->link ? $menu_item->link : RS; ?>" <?= $menu_item->target ? "target='_blank'" : ""; ?>><?= $menu_item->name ? $menu_item->name : ""; ?></a></li>
					<?php endforeach ?>
				</ul>
			</div>
		</div>	
	</section>	
<?php endif ?>