<header class="header_min">
	<div class="row">
		<div class="col-lg-5 col-md-5 hidden-sm hidden-xs">
			<a href="<?= RS; ?>" class="logo">
				<img src="<?= RS.'img/nkz_red.png'; ?>" style="max-width: 191px; max-height: 64px;" alt="Logo">
			</a>
		</div>
		<div class="col-lg-7 col-md-7 hidden-sm hidden-xs">
			<a href="javascript:void(0);" class="appointment" data-toggle="modal" data-target="#visit_modal" onclick="ga('send', 'event', 'Кнопка', 'Записаться на просмотр');">Записаться на просмотр</a>
			<div class="header_addr">
				<ul class="phones">
					<li><a href="tel:0443948819">044 394-88-19</a></li>
					<li><a href="tel:0443948819">044 394-88-19</a></li>
				</ul>
				<p>с. Ходосовка, Новообуховское шоссе, 1</p>
			</div>
		</div>
		<div class="clear"></div>
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
				<a href="tel:0937088566" class="appointment_btn custom_pointer tac"><i class="mf-header-phone"></i>Позвонить</a>
			</div>
			<div class="col-sm-3 col-xs-3">
				<button type="button" class="drop_down_btn open_drop_down"></button>
				<div class="clear"></div>
			</div>
		</div>
	</div>

	<?= $this->element('drop_menu'); ?>
</header>