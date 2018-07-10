<header>
	<div class="container hidden-sm hidden-xs">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 top_menu">
				<?php if (isset($menu) && $menu): ?>
					<ul>
						<?php foreach ($menu as $menu_i => $menu_v): ?>
							<?php if ($menu_v["type"] != 1): ?>
								<li class="<?= $menu_v->alias == FA ? 'active' : ''; ?>"><a href="<?= RS.$menu_v->alias.'/' ?>" <?= $menu_v->target ? "target='_blank'" : ""; ?>><?= $menu_v->name; ?></a></li>
							<?php endif ?>
						<?php endforeach ?>
					</ul>
				<?php endif ?>
			</div>
			<div class="clear"></div>

			<div class="col-lg-2 col-md-2 col-sm-1 col-xs-1">
				<div class="logo_wrapper">
					<a href="<?= RS; ?>">
						<img src="<?= RS.'img/logo.png'; ?>" alt="Logo">
					</a>
				</div>
			</div>

			<div class="col-lg-10 col-md-10 header_right">

				<div class="bot_menu col-lg-5 col-md-5" style="padding-top: 20px; padding-left: 0; padding-right: 0;">
					<?php if (isset($menu) && $menu): ?>
						<ul>
							<?php foreach ($menu as $menu_i => $menu_v): ?>
								<?php if ($menu_v["type"] == 1): ?>
									<li class="<?= $menu_v->alias == FA ? 'active' : ''; ?>" style="margin-right:10px;"><a href="<?= RS.$menu_v->alias.'/' ?>" <?= $menu_v->target ? "target='_blank'" : ""; ?> style="font-size: 20px;"><?= $menu_v->name; ?></a></li>
								<?php endif ?>
							<?php endforeach ?>
						</ul>
					<?php endif ?>

					<style>
					@media(max-width: 1250px){
						header .bot_menu ul li a {font-size: 18px !important;}
						header .bot_menu ul li {margin-right: 7px !important;}
						
					}
					@media(max-width: 1150px){
						header .bot_menu ul li:last-child {margin-right: 0px !important;}
						header .header_right {padding-left: 10px !important;}
						header .bot_menu ul li a {font-size: 17px !important;}

					}
					</style>
				</div>
				<div class="header_contacts col-lg-4 col-md-4" style="padding-top: 12px; padding-left: 0; padding-right: 0;">
					<ul class="phones">
						<li class="icon mf-header-phone"></li>
						<?php 
							$phone1 = isset($config["phone_number"]) && $config["phone_number"] ? $config["phone_number"] : "";
							$phone2 = isset($config["phone_number2"]) && $config["phone_number2"] ? $config["phone_number2"] : "";

							$reg_exp_pattern = "/[-()\s\t_]/";
							$phone1_replaced = preg_replace($reg_exp_pattern, '', $phone1);
							$phone2_replaced = preg_replace($reg_exp_pattern, '', $phone2);
						?>
						<li><a href="tel:<?= $phone1_replaced; ?>"><?= $phone1; ?></a></li>
						<li><a href="tel:<?= $phone2_replaced; ?>"><?= $phone2; ?></a></li>
					</ul>
					<p class="header_address"><?= isset($config["address"]) && $config["address"] ? $config["address"] : ""; ?></p>
				</div>
				<div class="appointment col-lg-3 col-md-3" style="padding-top: 22px;">
					<a href="#" class="appointment_btn desktop upd" data-toggle="modal" data-target="#nrc">
						<span class="bg_l"></span>
						<span class="bg_r"></span>
						<span class="text">Обратный звонок</span>
					</a>
				</div>
			</div>
		</div>
	</div>

	
	<div class="container hidden-lg hidden-md">
		<div class="row">
			<div class="col-sm-3 col-xs-3">
				<div class="logo_wrapper">
					<a href="<?= RS; ?>">
						<img src="<?= RS.'img/mobile_logo.png'; ?>" alt="Logo">
					</a>
				</div>
			</div>
			<div class="col-sm-6 col-xs-6">
				<a href="tel:0678255018" class="appointment_btn custom_pointer tac"><i class="mf-header-phone"></i>Позвонить</a>
			</div>
			<div class="col-sm-3 col-xs-3">
				<button type="button" class="drop_down_btn open_drop_down"></button>
				<div class="clear"></div>
			</div>
		</div>
	</div>

	<?= $this->element('drop_menu'); ?>
</header>