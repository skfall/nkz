<footer>
	<div class="footer_triangle"></div>
	<div class="container">
		<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 left">
			<ul class="top_menu">
				<?php if (isset($menu) && $menu): ?>
					<ul>
						<?php foreach ($menu as $menu_i => $menu_v): ?>
							<?php if ($menu_v["type"] == 1): ?>
								<li class="<?= $menu_v->alias == FA ? 'active' : ''; ?>"><a href="<?= RS.$menu_v["alias"].'/' ?>" <?= $menu_v->target ? "target='_blank'" : ""; ?>><span><?= $menu_v["name"]; ?></span></a></li>
							<?php endif ?>
						<?php endforeach ?>
					</ul>
				<?php endif ?>
			</ul>

			<style>
				@media(min-width: 994px){
					footer .top_menu li:last-child a {padding-left: 0 !important;}
				}	
			</style>

			<div class="clear"></div>
			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pn">
				<?php if (isset($menu) && $menu): ?>
					<ul class="bot_menu">
						<?php foreach ($menu as $menu_i => $menu_v): ?>
							<?php if ($menu_v["type"] != 1 && $menu_v["is_left"] == 1): ?>
								<li class="<?= $menu_v->alias == FA ? 'active' : ''; ?>"><a href="<?= RS.$menu_v["alias"].'/' ?>" <?= $menu_v->target ? "target='_blank'" : ""; ?>><?= $menu_v["name"]; ?></a></li>
							<?php endif ?>
						<?php endforeach ?>
					</ul>
				<?php endif ?>
			</div>
			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pn">
				<?php if (isset($menu) && $menu): ?>
					<ul class="bot_menu">
						<?php foreach ($menu as $menu_i => $menu_v): ?>
							<?php if ($menu_v["type"] != 1 && $menu_v["is_right"] == 1): ?>
								<li class="<?= $menu_v->alias == FA ? 'active' : ''; ?>"><a href="<?= RS.$menu_v["alias"].'/' ?>" <?= $menu_v->target ? "target='_blank'" : ""; ?>><?= $menu_v["name"]; ?></a></li>
							<?php endif ?>
						<?php endforeach ?>
					</ul>
				<?php endif ?>
			</div>
			<div class="clear"></div>
			<div class="site_dev">
				<a href="https://kaminskiy-design.com.ua/" rel="me" target="_blank" title="Создание сайтов в Киеве - веб студия KAM STUDIO">Создание сайтов в Киеве</a>
			</div>
		</div>
		<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 middle">
			<p class="department">Отдел продаж ЖК "Новая-Конча-Заспа"</p>
			<ul class="phones">


				<?php 
					$phone1 = isset($config["phone_number"]) && $config["phone_number"] ? $config["phone_number"] : "";
					$phone2 = isset($config["phone_number2"]) && $config["phone_number2"] ? $config["phone_number2"] : "";
					$partnership_phone = isset($config["partnership_phone"]) && $config["partnership_phone"] ? $config["partnership_phone"] : "";
					$hotline_phone = isset($config["hotline_phone"]) && $config["hotline_phone"] ? $config["hotline_phone"] : "";

					$reg_exp_pattern = "/[-()\s\t_]/";
					$phone1_replaced = preg_replace($reg_exp_pattern, '', $phone1);
					$phone2_replaced = preg_replace($reg_exp_pattern, '', $phone2);
					$partnership_phone_replaced = preg_replace($reg_exp_pattern, '', $partnership_phone);
					$hotline_phone_replaced = preg_replace($reg_exp_pattern, '', $hotline_phone);
				?>
				<li><a href="tel:<?= $phone1_replaced; ?>"><?= $phone1; ?></a></li>
				<li><a href="tel:<?= $phone2_replaced; ?>"><?= $phone2; ?></a></li>

			</ul>
			<p class="work_time"><?= isset($config["work_time"]) && $config["work_time"] ? $config["work_time"] : ""; ?></p>
			<p class="addr map_trigger" data-lat="50.2764" data-lng="30.5315"><?= isset($config["address"]) && $config["address"] ? $config["address"] : ""; ?></p>
			<?php if (isset($config["fb_link"]) && $config["fb_link"]): ?>
				<a href="<?= $config["fb_link"]; ?>" target="_blank" class="fb">Мы всегда на связи</a>				
			<?php endif ?>
		</div>
		<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 right">
			<img src="<?= RS.'img/avm_logo_wbg.png'; ?>" alt="AVM Logo">
			<p class="dev_name">AVM development group</p>
			<p class="dev_addr"><span class="map_trigger" data-lat="50.4702" data-lng="30.3576"><?= isset($config["office_address"]) && $config["office_address"] ? $config["office_address"] : ""; ?></span></p>

			<div class="clear space20"></div>

			<div class="desktop hidden-sm hidden-xs">
				<p class="questions">По вопросам сотрудничества <a href="mailto:<?= isset($config["support_email"]) && $config["support_email"] ? $config["support_email"] : ""; ?>"><?= isset($config["support_email"]) && $config["support_email"] ? $config["support_email"] : ""; ?></a></p>
				<p class="agr_dep">Отдел по работе с риэлторами и АН <a href="tel:<?= $partnership_phone_replaced; ?>"><?= $partnership_phone; ?></a></p>
				<p class="hotline">"Горячая линия" для инвесторов <a href="tel:<?= $hotline_phone_replaced; ?>"><?= $hotline_phone; ?></a></p>
			</div>

			<div class="mobile hidden-lg hidden-md">
				<a href="mailto:<?= isset($config["support_email"]) && $config["support_email"] ? $config["support_email"] : ""; ?>" class="m_mail">По вопросам сотрудничества</a>
				<a href="tel:<?= $partnership_phone_replaced; ?>" class="m_agr_dep">Отдел по работе с риэлторами и АН</a>
				<a href="tel:<?= $hotline_phone_replaced; ?>" class="m_hotline">"Горячая линия" для инвесторов</a>
			</div>
		</div>
	</div>
</footer>