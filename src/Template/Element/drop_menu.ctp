<div class="drop_menu animated2">
	<div class="top_part">
		<a href="javascript:void(0);" class="appointment_btn custom_pointer" data-toggle="modal" data-target="#visit_modal">Записаться на просмотр</a>
		<a href="javascript:void(0);" class="drop_down_btn close_drop_down animated2"></a>
		<div class="clear"></div>
		<div class="menu_list">
			<ul class="m_top_menu">
				<?php if (isset($menu) && $menu): ?>
					<ul>
						<?php foreach ($menu as $menu_i => $menu_v): ?>
							<?php if ($menu_v["type"] == 1): ?>
								<li class="<?= $menu_v->alias == FA ? 'active' : ''; ?>"><a href="<?= RS.$menu_v["alias"].'/' ?>" <?= $menu_v->target ? "target='_blank'" : ""; ?>><?= $menu_v["name"]; ?></a></li>
							<?php endif ?>
						<?php endforeach ?>
					</ul>
				<?php endif ?>
			</ul>
			<ul class="m_bot_menu">
				<?php if (isset($menu) && $menu): ?>
					<ul>
						<?php foreach ($menu as $menu_i => $menu_v): ?>
							<?php if ($menu_v["type"] != 1): ?>
								<li class="<?= $menu_v->alias == FA ? 'active' : ''; ?>"><a href="<?= RS.$menu_v["alias"].'/' ?>" <?= $menu_v->target ? "target='_blank'" : ""; ?>><?= $menu_v["name"]; ?></a></li>
							<?php endif ?>
						<?php endforeach ?>
					</ul>
				<?php endif ?>
			</ul>
		</div>
	</div>
</div>