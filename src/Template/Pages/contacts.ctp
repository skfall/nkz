<?= $this->element('breadcrumbs') ?>

<section class="contacts">
	<div class="container">

		<div class="address col-lg-7 col-md-7 col-sm-12 col-xs-12">
			<p class="caption"><?= $contacts_page->caption ? $contacts_page->caption : ""; ?></p>
			<div class="desc content_target">
				<?= $contacts_page->details ? $contacts_page->details : ""; ?>
			</div>

			<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
				<ul>
					<li class="location">
						Киевская область, Киево-Святошинский р-н, <a href="#" class="map_trigger" data-lat="50.2764" data-lng="30.5315">с. Ходосовка, Новообуховское шоссе, 1</a> <?= $contacts_page->addr_desc ? $contacts_page->addr_desc : ""; ?>
					</li>

					<?php 
						$from = $contacts_page->work_from ? $contacts_page->work_from : 0;
						$to = $contacts_page->work_to ? $contacts_page->work_to : 0;

						$start = number_format($from, 2);
						$finish = number_format($to, 2);

						$start = str_replace('.', ':', $start);
						$finish = str_replace('.', ':', $finish);

						$now = DateTime::createFromFormat('H:i', date('H:i'));
						$start_time = DateTime::createFromFormat('H:i', $start);
						$finish_finish = DateTime::createFromFormat('H:i', $finish);

						$opened = false;

						if ($now > $start_time && $now < $finish_finish) {
						   $opened = true;
						}
					?>

					<li class="work_time">
						<?= $start; ?> - <?= $finish; ?> <?= $contacts_page->holidays ? $contacts_page->holidays : ""; ?>
						<?php if ($opened): ?>
							<p class="status green">Сейчас открыты</p>
						<?php else: ?>
							<p class="status red">Сейчас закрыты</p>
						<?php endif ?>
					</li>
				</ul>
			</div>
		</div>


		<div class="col-lg-5 col-md-5 col-sm-12 col-xs-12 map_location">
			<div class="shadow_wrap">
				<div class="loc_map"></div>
				<!-- <div class="coords">
					<ul>
						<li class="active auto" data-lat="50.2764" data-lng="30.5315"><a href="javascript:void(0);"><span>На авто</span></a></li>
						<li class="bus" data-lat="50.47" data-lng="30.35"><a href="javascript:void(0);"><span>Общественным транспортом</span></a></li>
					</ul>
					<p class="desc">GPS координаты: 50.47 30.35. Есть парковка</p>
					<form action="#" method="POST">
						<input type="text" name="cords_phone" placeholder="Телефон" class="mask" />
						<button type="button">Отправить маршрут</button>
					</form>
					<div class="clear"></div>
				</div> -->
			</div>
		</div>

		
		<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 support">
			<p class="sub_caption">Поддержка клиентов</p>

			<div class="phone shadow_wrap por with_bg">
				<div class="recall_hide">
					<p><span><?= $contacts_page->phone1 ? $contacts_page->phone1 : ""; ?></span> <span><?= $contacts_page->phone2 ? $contacts_page->phone2 : ""; ?></span> <a href="javascript:void(0);" class="show_recall">Заказать звонок</a></p>
				</div>
				<div class="clear"></div>
				<div class="recall_wrap">
					<form action="#" method="POST" id="recall_form">
						<div class="close_recall"></div>
						<input type="hidden" name="action" value="recall" />
						<p class="recall_caption">Заказать звонок</p>
						<input type="text" name="phone" class="mask" />
						<button type="button" class="submit">Перезвоните мне</button>
						<p class="response"></p>
					</form>
					<div class="clear"></div>
				</div>
			</div>

			<p class="sub_caption">Отдел по работе с риэлтерами и АН</p>
			<div class="phone shadow_wrap por with_bg">
				<div>
					<p><span>068 412-98-85</span></p>
				</div>
			</div>

			<div class="contact_form shadow_wrap por">
				<p class="form_caption">Напишите нам</p>

				<div class="form_wrapper">
					
					<form action="#" method="POST" id="contacts_form">
						<input type="hidden" name="action" value="contact_form" />
						<textarea name="message">Здравствуйте. 
Подскажите, пожалуйста </textarea>
						<input type="text" name="name" placeholder="Ваше имя" />
						<div class="clear"></div>
						<span class="phone_i"><input type="text" class="mask" name="phone" placeholder="Ваш телефон" /></span>
						<div class="clear"></div>
						<p class="hidden-lg hidden-md response_t">Если желаете связи с отделом продаж.</p>
						<span class="email_i"><input type="text" name="email" placeholder="E-mail" /></span>
						<p class="hidden-lg hidden-md response_t">Если желаете получить ответ письменно.</p>
						<div class="clear"></div>

						<button type="button" class="submit" onclick="ga('send', 'event', 'Контакты', 'Отправить форму');">Отправить</button>
						<div class="clear"></div>
						<p class="response"></p>
					</form>
				</div>

				<div class="success_div dn">
					<div class="close"></div>	
					<p class="name_rw"><span></span>, мы получили вашу заявку</p>
					<p>Мы свяжемся с вами в течении ближайшего рабочего часа.</p>
					<p>Если вы отправили это сообщение вечером или в выходной день, мы ответим вам на следующий рабочий день</p>
				</div>
			</div>			
		</div>

		<?php if ($contacts_page->filename): ?>
			<div class="col-lg-5 col-md-5 hidden-sm hidden-xs sales">
					<p class="sub_caption tal">Отдел продаж</p>
					<a href="<?= IMG_PATH.$contacts_page->filename; ?>" class="fancybox"><img src="<?= IMG_PATH.'crop/400x350_'.$contacts_page->filename; ?>" alt="Sales dep"></a>
			</div>
		<?php endif ?>


		
	</div>
</section>