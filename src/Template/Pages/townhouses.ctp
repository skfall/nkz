<section class="home_top_tabs">
	<div class="scene">
		
		<?php if ($th_page->banner): ?>
			<div class="th_tab home_tab active">
				<div class="item" style="background-image: url('<?= TH.$th_page->banner; ?>');">
					<div class="th_tab_header">
						<p><?= $th_page->banner_caption ? $th_page->banner_caption : ""; ?></p>
					</div>
				</div>
			</div>	
		<?php endif ?>
		

		<?php if ($th_page->panorama): ?>
			<div class="panorama_tab home_tab hidden-sm hidden-xs <?= !$th_page->banner ? "active" : "" ; ?>">
				<?= $th_page->panorama; ?>
			</div>
		<?php endif ?>
		
	</div>
	<?php 
		/*
		<div class="controls hidden-sm hidden-xs">
			<ul class="home_tabs_nav">
				<?php if ($th_page->banner): ?>
					<li class="active">
						<a href="javascript:void(0);" data-target=".th_tab" class="map_nav">
							<span class="icon mf2-bn-tounhouses"></span>
							<span class="text">Таунхаусы</span>
						</a>
					</li>
				<?php endif ?>
				
				<?php if ($th_page->panorama): ?>
					<li class="<?= !$th_page->banner ? "active" : "" ; ?>">
						<a href="javascript:void(0);" data-target=".panorama_tab" class="panorama_nav">
							<span class="icon mf-1panorama"></span>
							<span class="text">Панорама</span>
						</a>
					</li>
				<?php endif ?>
				
			</ul>
		</div>
		*/
	?>
	
</section>

<section class="about_complex_s">
	<div class="container pn">
		<div class="col-lg-12">
			<p class="caption">Про Экохаусы</p>
		</div>
		<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
			<div class="content_target">
				<p>Это статусное жилье, это - экомир!  Ценность  не только в архитектуре,  сколько в социальной  значимости объекта. Безопасность, успех и благополучие УЖЕ гарантированы  социальным  окружением. «Чужих»  тут нет, рядом только свои!</p>
				<p>Какие дополнительные преимущества в покупке наших Экохаусов:</p>
				<p>В  этом месте нужно жить – это исторически успешное направление. Вся элита здесь. Рядом Печерск, правительственный квартал, столичное шоссе. В этом направление самое модное и продвинутое и все самое дорогое.  Заповедно-санаторная зона - рядом "Голосеевский национальный природный парк", лесопарковая зона "Конча-Заспа", Голубое озеро. </p>

				<?php 
					/*
						<p>Комплекс Экохаусов "Новая Конча-Заспа" располагается в Ходосеевке, в 6 км от Киева. Уникальное расположение в нескольких минутах езды от Печерска, гарантирует безупречное транспортное сообщение с любой точкой Киева.</p>
						<p>Почему "Экохаус"? При разработке концепции, главной задачей проектировщиков было использование только натуральных строительных материалов. Во внешней отделке мы используем высококачественные дорогие пластичные цветные наружные штукатурки, клинкерные плитки и различные варианты природного камня.</p>
						<p>Благодаря этому, наши Экохаусы отличаются индивидуальным стилем, выраженным в уютных пастельных тонах, большими и светлыми окнами, мансардными потолками и продуманными планировками.</p>
						<p>Комплекс состоит из 25 домов, сформированных в 3 линии (Амстердам, Будапешт, Прага) с разной архитектурой и стилем фасада. У каждого Экохауса будет свой личный дворик, где можно отдохнуть от бешеного ритма мегаполиса слушая пение птиц и наблюдая за парящими в небе аистами.</p>
					*/
				?>
				
			</div>
		</div>

		<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 list">
			<div class="content_target">			
				<p>Потребности каждого члена семьи  будут удовлетворены УЖЕ!  Рядом расположен комплекс услуг, развлечений,  досуга:  поликлиника, рестораны, школа, детский сад, Мегамаркет, кинотеатры, шоппинг, занятие спортом, библиотеки, параглайдинг, конный спорт.</p>
				<p>Также,  очень важная выгода – это время! Каждый день вы пользуетесь трассой - без пробок! Перспектива "Без пробок" сохранится навсегда, т.к.  это -  скоростная "правительственная" трасса.</p>
				<p>ДОСТОЙНОЕ предложениe, чтобы изменить собственную жизнь и жизнь своей семьи!</p>
			</div>
			<?php 

			/*
				<p class="sub_caption">
					Если суммировать достоинства, то получится такой перечень:
				</p>
				<ul>
					<li>Ваш собственный Экохаус в нескольких минутах езды от Печерска - без пробок и светофоров;</li>
					<li>Шикарная инфраструктура - аутлет-городок Мануфактура, Мегамаркет, фитнес-клуб "Дельтаплан", конные клубы, рыбалка, кинотеатр и боулинг;</li>
					<li>Премиальное окружение, добрососедская атмосфера, закрытая территория для прогулок и отдыха всей семьи;</li>
					<li>Самый безопасный вариант для жизни круглый год. Круглосуточная охрана и видеонаблюдение 24/7;</li>
					<li>Статусные и благополучные соседи. Большинство проживающих - топ-менеджеры или собственники успешного бизнеса;</li>
					<li>Обслуживание дома и участка не потребует вашего времени. Любую работу выполнит обслуживающая компания - будь-то уборка в доме или стрижка газона;</li>
				</ul>
			*/

			?>
		</div>
		<div class="clear"></div>
		<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 c">
			<div class="h">Красиво</div>
			<div class="d">как в Голландии</div>
		</div>
		<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 c">
			<div class="h">Чисто</div>
			<div class="d">как в Германии</div>
		</div>
		<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 c">
			<div class="h">Безопасно</div>
			<div class="d">как в Швейцарии</div>
		</div>
		<div class="col-lg-12 fw">
			<hr />
			<p class="f">Воплощаем европейские ценности!</p>
		</div>
	</div>
</section>

<section class="home_anchor_nav">
	<div class="container">
		<div class="home_middle_nav th">
			<ul>
				<li class="primary flats active">
					<a href="#th_lifestyle">
						<span class="icon mf2-style"></span>
						<span class="text">Стиль жизни</span>
					</a>
				</li>
				<li class="primary townhouses">
					<a href="#th_pers_space">
						<span class="icon mf-menu-townhouses"></span>
						<span class="text">Генплан Экохаусов</span>
					</a>
				</li>
				<li class="separator"></li>
				<li class="secondary"><a href="#anchor_interiors"><span class="text">Интерьерные решения</span></a></li>
				<li class="secondary"><a href="<?= RS.'infrastructure/'; ?>"><span class="text">Инфраструктура</span></a></li>
				<li class="secondary"><a href="#anchor_equip"><span class="text">Комплектация</span></a></li>
				<li class="secondary"><a href="#ahchor_dev"><span class="text">О застройщике</span></a></li>
			</ul>
		</div>
	</div>
</section>

<section class="th_lifestyle" id="th_lifestyle">
	<div class="container">
		<?php
			$points_image = $th_page->points_image ? TH.$th_page->points_image : ""; 
		?>
		<div class="point_image hidden-sm hidden-xs" style="background-image: url('<?= $points_image; ?>');">
			<?php if ($th_page->point1): ?>
				<div class="point point_mark1" data-target=".point1"></div>
				<div class="point_c point1">
					<div class="white_bg">
						<i class="mf-benefits-5lake"></i>
						<p><?= $th_page->point1; ?></p>
					</div>
				</div>
			<?php endif ?>

			<?php if ($th_page->point2): ?>
				<div class="point point_mark2" data-target=".point2"></div>
				<div class="point_c point2 down">
					<div class="white_bg">
						<i class="mf2-car dn"></i>
						<p><?= $th_page->point2; ?></p>
					</div>
				</div>
			<?php endif ?>
			
			<?php if ($th_page->point3): ?>
				<div class="point point_mark3" data-target=".point3"></div>
				<div class="point_c point3">
					<div class="white_bg">
						<i class="mf2-car dn"></i>
						<p><?= $th_page->point3; ?></p>
					</div>
				</div>
			<?php endif ?>

			<?php if ($th_page->point4): ?>
				<div class="point point_mark4" data-target=".point4"></div>
				<div class="point_c point4 down">
					<div class="white_bg">
						<i class="mf2-car dn"></i>
						<p><?= $th_page->point4; ?></p>
					</div>
				</div>
			<?php endif ?>
		</div>

		<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 pn">
			<?php if ($th_page->smart_image): ?>
				<div class="image" style="background-image: url('<?= TH.$th_page->smart_image; ?>')"></div>
			<?php endif ?>
		</div>

		
		<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
			<div class="right">
				<p class="caption"><?= $th_page->smart_caption ? $th_page->smart_caption : ""; ?></p>

				<?php if ($th_page->smart1): ?>
					<?php 
						$smart1 = explode(';', $th_page->smart1);
						if ($smart1[count($smart1) - 1] == '') array_pop($smart1);
					?>
					<div class="list_item fst">
						<ul>
							<?php foreach ($smart1 as $key => $s1): ?>
								<li><?= $s1; ?></li>
							<?php endforeach ?>
						</ul>
					</div>
				<?php endif ?>
				
				<?php if ($th_page->smart2): ?>
					<div class="list_item sec">
						<?php 
							$smart2 = explode(';', $th_page->smart2);
							if ($smart2[count($smart2) - 1] == '') array_pop($smart2);
						?>
						<ul>
							<?php foreach ($smart2 as $key => $s2): ?>
								<li><?= $s2; ?></li>
							<?php endforeach ?>
						</ul>
					</div>
				<?php endif ?>
				
				<?php if ($th_page->smart3): ?>
					<div class="list_item thd">
						<?php 
							$smart3 = explode(';', $th_page->smart3);
							if ($smart3[count($smart3) - 1] == '') array_pop($smart3);
						?>
						<ul>
							<?php foreach ($smart3 as $key => $s3): ?>
								<li><?= $s3; ?></li>
							<?php endforeach ?>
						</ul>
					</div>
				<?php endif ?>
				
			</div>
		</div>
	</div>
</section>

<div class="clear"></div>


<?php if (isset($gal1) && $gal1 && count($gal1) > 0): ?>
	<section class="th_gallery" id="">
		<div class="container">
			<div class="owl-carousel">
				<?php foreach ($gal1 as $key => $g): ?>
					<div class="item">
						<div class="image" style="background-image: url('<?= TH.$g->source; ?>');"></div>
						<div class="text">
							<p class="capt"><?= $g->caption ? $g->caption : ""; ?></p>
							<p class="desc" style="background-image: url('<?= TH.$g->icon; ?>');"><?= $g->sub_caption ? $g->sub_caption : ""; ?></p>
						</div>
					</div>
				<?php endforeach ?>
			</div>
		</div>
	</section>
<?php endif ?>

<?php if (/*isset($tabs) && $tabs && count($tabs) > 0*/false): ?>
	<section class="th_environment hidden-sm hidden-xs" id="anchor_infr">
		<div class="container">
			<p class="caption"><?= $th_page->infra_capt ? $th_page->infra_capt : ""; ?></p>

			<div class="th_env_tabs">
				<div class="nav_scroll">
					<div class="nav" data-simplebar>

						<?php foreach ($tabs as $key => $t): ?>
							<div class="nav_item <?= $key == 0 ? "active" : ""; ?>" data-target=".item<?= $key; ?>">
								<div class="inner">
									<div class="icon" style="background-image: url('<?= TH.$t->icon; ?>');"></div>
									<p class="nav_name"><?= $t->tab_caption ? $t->tab_caption : ""; ?></p>
									<div class="path"><?= $t->tab_sub_caption ? $t->tab_sub_caption : ""; ?></div>
								</div>
							</div>
						<?php endforeach ?>

					</div>
				</div>

				<div class="content">
					<?php foreach ($tabs as $key => $t): ?>
						<div class="item<?= $key; ?> item <?= $key == 0 ? "active" : ""; ?>">
							<?php if ($t->image): ?>
								<div class="image" style="background-image: url('<?= TH.$t->image; ?>');"></div>
							<?php endif ?>
							<div class="right_text">
								<ul class="th_tab_select">
									<li class="active" data-target='.sub_desc'><a href="javascript:void(0);"><i class="mf2-info"></i><span>Описание</span></a></li>
									<li data-target='.th_item_map' data-lat="<?= $t->lat; ?>" data-lng="<?= $t->lng; ?>"><a href="javascript:void(0);"><i class="mf-map"></i><span>Карта</span></a></a></li>
								</ul>

								<div class="clear"></div>

								<div class="sub_caption"><?= $t->caption ? $t->caption : ""; ?></div>
								<div class="sub_desc content_target th_miny_tab">
									<?= $t->details ? $t->details : ""; ?>
								</div>
								<div class="item_map th_item_map th_miny_tab">
									
								</div>
							</div>
							<div class="clear"></div>
						</div>
					<?php endforeach ?>

				</div>
			</div>

		</div>
	</section>




	<section class="th_mob_env hidden-lg hidden-md">
		<div class="container">
			<p class="caption">Уютное место для досуга и отдыха</p>
		</div>
		<?php foreach ($tabs as $key => $t): ?>
			<div class="th_env_item">
				<div class="hidden-lg hidden-md th_mobile_toogle_h">
					<a href="javascript:void(0);">
						<div class="border"></div>
						<span class="clear"></span>
						<!-- <i class="mf-inf-shops2 mr5 nav_ico"></i> -->
						<p class="name"><?= $t->tab_caption ? $t->tab_caption : ""; ?></p>
						<span class="clear"></span>
						<p class="sub"><?= $t->tab_sub_caption ? $t->tab_sub_caption : ""; ?></p>
			
					</a>
				</div>

				<div class="th_env_content">
					<div class="right_text">
						<div class="container">
							<ul class="th_tab_select">
								<li class="active" data-target='.sub_desc'><a href="javascript:void(0);"><i class="mf2-info"></i><span>Описание</span></a></li>
								<li data-target='.th_item_map' data-lat="<?= $t->lat; ?>" data-lng="<?= $t->lng; ?>"><a href="javascript:void(0);"><i class="mf-map"></i><span>Карта</span></a></a></li>
							</ul>
						</div>
						
						<?php if ($t->image): ?>
							<div class="image hd_targ" style="background-image: url('<?= TH.$t->image; ?>');"></div>
						<?php endif ?>

						
						<div class="clear"></div>
						<div class="container hd_targ">
							<div class="sub_caption"><?= $t->caption ? $t->caption : ""; ?></div>
							<div class="sub_desc content_target th_miny_tab">
								<?= $t->details ? $t->details : ""; ?>
							</div>
						</div>

						<div class="item_map th_item_map th_miny_tab"></div>
					</div>
					<div class="clear"></div>
				</div>
			</div>
		<?php endforeach ?>
		</div>
	</section>
<?php endif ?>


<section class="th_pers_space" id="th_pers_space">
	<div class="container">
		<p class="caption">Личное пространство</p>
		<p class="sub_caption">для каждого члена семьи и собственный земельный участок</p>

		<div class="th_genplan_holder">
			<div class="left">
				<img src="<?= RS.'img/townhouses_genplan_final.jpg'; ?>" alt="Genplan" />
				<?= $this->element("townhouses_svg"); ?>
			</div>
			<div class="right">
				<div class="gp_item">
					<p class="line">Линия</p>
					<p class="linename">Прага</p>
					<table>
						<tr>
							<td><button type="button" data-target="praha_town" class="praha_btn">Экохаусы</button></td>
							<td style="padding: 0 20px;"><button type="button" data-target="praha_house" class="praha_btn">Дом</button></td>
						</tr>
					</table>
				</div>
				<div class="gp_item">
					<p class="line">Линия</p>
					<p class="linename">Амстердам</p>
					<table>
						<tr>
							<td><button type="button" data-target="amst_town" class="amst_btn">Экохаусы</button></td>
							<td style="padding: 0 20px;"><button type="button" data-target="amst_house" class="amst_btn">Дом</button></td>
						</tr>
					</table>
				</div>
				<div class="gp_item">
					<p class="line">Линия</p>
					<p class="linename">Будапешт</p>
					<table>
						<tr>
							<td><button type="button" data-target="bud_town" class="bud_btn">Экохаусы</button></td>
							<td style="padding: 0 20px;"><button type="button" data-target="bud_house" class="bud_btn">Дом</button></td>
						</tr>
					</table>
				</div>
				

				<div class="prog">
					<p>Готовность <strong>25%</strong></p>
					<p>Срок сдачи <strong>авг 2018</strong></p>
				</div>
			</div>
			<div class="clear"></div>
		</div>
	</div>
</section>

<?php if (isset($first_block) && $first_block): ?>
	<section class="th_blocks">
		<div class="blocks_holder">
			<div class="th_block">
				<div class="container">
					<h5 class="caption"><?= $first_block->name ? $first_block->name : ""; ?></h5>
					<?php if (isset($first_block->gal) && $first_block->gal && count($first_block->gal) > 0): ?>
						<div class="block_slider owl-carousel">
							<?php foreach ($first_block->gal as $key => $g): ?>
								<?php if ($g->source): ?>
									<div class="item">
										<div class="image" style="background-image: url('<?= TH.$g->source; ?>');"></div>
									</div>
								<?php endif ?>
							<?php endforeach ?>
						</div>
					<?php endif ?>
				</div>
				<div class="block_info">
					<div class="container">
						<div class="col-lg-5 col-md-5 col-sm-12 col-xs-12 features">
							<?php if ($first_block->features): ?>
								<?php 
									$block_features = explode(';', $first_block->features);
									if ($block_features[count($block_features) - 1] == "") array_pop($block_features);
								?>
								<?php if ($block_features): ?>
									<p class="col_header">Особенности</p>
									<ul>
										<?php foreach ($block_features as $key => $f): ?>
											<li><span><?= $f; ?></span></li>
										<?php endforeach ?>
									</ul>
								<?php endif ?>
							<?php endif ?>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 properties">
							<?php if ($first_block->stats): ?>
								<?php 
									$block_stats = explode(';', $first_block->stats);
									if ($block_stats[count($block_stats) - 1] == "") array_pop($block_stats);
								?>
								<?php if ($block_stats): ?>
									<table>
										<tbody>
											<?php foreach ($block_stats as $key => $s): ?>
												<?php
													$b_stat_row = explode('*', $s);
													$fb_stat = str_replace('м2', 'м<sup>2</sup>', $b_stat_row[0]);
													$sb_stat = str_replace('м2', 'м<sup>2</sup>', $b_stat_row[1]);
												?>
												<tr>
													<td><?= $fb_stat; ?></td>
													<td><strong><?= $sb_stat; ?></strong></td>
												</tr>
											<?php endforeach ?>
										</tbody>
									</table>
								<?php endif ?>
							<?php endif ?>
							
						</div>
						<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 mobile_th_layouts_btn_wrap">
							<a href="javascript:void(0);" class="show_th_layouts_btn" data-block="<?= $first_block->id; ?>"><span>Показать планировки</span></a>
						</div>
						
						<div class="clear"></div>
						
					</div>
				</div>
				
				<div class="container">
					<?php if (isset($first_floors) && $first_floors && count($first_floors) > 0): ?>
                        <div class="floors_select">
                            <ul>
                                <?php foreach ($first_floors as $key => $floor): ?>
                                    <li class="<?= $key == 0 ? "active" : ""; ?>" data-block="<?= $first_block->id; ?>" data-floor="<?= $floor->id; ?>"><a href="javascript:void(0);"><span><?= $floor->name ? $floor->name : ($key + 1); ?></span></a></li>
                                <?php endforeach ?>
                            </ul>
                        </div>
                    <?php endif ?>

					<div class="th_layouts_target" id="th_layouts_target">

					</div>
				</div>
			</div>
		</div>
	</section>
<?php endif ?>

<?php if (isset($gal2) && $gal2 && count($gal2) > 0): ?>
	<section class="th_gallery bottom_gal" id="anchor_interiors">
		<div class="container">
			<div class="owl-carousel">
				<?php foreach ($gal2 as $key => $g): ?>
					<div class="item">
						<div class="image" style="background-image: url('<?= TH.$g->source; ?>');"></div>
						<div class="text">
							<p class="capt"><?= $g->caption ? $g->caption : ""; ?></p>
							<p class="desc" style="background-image: url('<?= TH.$g->icon; ?>');"><?= $g->sub_caption ? $g->sub_caption : ""; ?></p>
						</div>
					</div>
				<?php endforeach ?>
			</div>
		</div>
	</section>
<?php endif ?>


<section class="th_communications" id="anchor_equip">
	<div class="container">


		<div class="communications_box mob_l_box">
			<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pn">
				<div class="caption">Все подведено</div>
				<div class="clear"></div>

				<div class="item">
					<div class="image_wrap">
						<img src="<?= RS.'img/icons/stove.svg'; ?>" alt="Icon">
					</div>
					<p>Газ</p>
				</div>
				<div class="item">
					<div class="image_wrap">
						<img src="<?= RS.'img/icons/light1.svg'; ?>" alt="Icon">
					</div>
					<p>Электричество</p>
				</div>
				<div class="item">
					<div class="image_wrap">
						<img src="<?= RS.'img/icons/water.svg'; ?>" alt="Icon">
					</div>
					<p>Вода</p>
				</div>
				<div class="item">
					<div class="image_wrap">
						<img src="<?= RS.'img/icons/warm.svg'; ?>" alt="Icon">
					</div>
					<p>Отопление</p>
				</div>
			</div>

			<div class="col-lg-5 col-md-5 col-sm-12 col-xs-12 th_additionals">
				<div class="caption">Дополнительно</div>
				
				<?php if ($th_page->eq1): ?>
					<?php 
						$eq1 = explode(';', $th_page->eq1);
						if ($eq1[count($eq1) - 1] == '') array_pop($eq1);
					?>
					<div class="item_list" style="background-image: url('<?= RS.'img/icons/radiator.svg'; ?>');">
						<?php foreach ($eq1 as $key => $e1): ?>
							<p><?= $e1; ?></p>
						<?php endforeach ?>
					</div>
				<?php endif ?>
				
				<?php if ($th_page->eq2): ?>
					<?php 
						$eq2 = explode(';', $th_page->eq2);
						if ($eq2[count($eq2) - 1] == '') array_pop($eq2);
					?>
					<div class="item_list" style="background-image: url('<?= RS.'img/icons/plan.svg'; ?>');">
						<?php foreach ($eq2 as $key => $e2): ?>
							<p><?= $e2; ?></p>
						<?php endforeach ?>
					</div>
				<?php endif ?>
				
				<?php if ($th_page->eq3): ?>
					<?php 
						$eq3 = explode(';', $th_page->eq3);
						if ($eq3[count($eq3) - 1] == '') array_pop($eq3);
					?>
					<div class="item_list" style="background-image: url('<?= RS.'img/icons/safety.svg'; ?>');">
						<?php foreach ($eq3 as $key => $e3): ?>
							<p><?= $e3; ?></p>
						<?php endforeach ?>
					</div>
				<?php endif ?>	
			</div>

			
			
		</div>
		<div class="clear"></div>
	</div>
</section>


<?php if (isset($docs) && $docs && count($docs) > 0 && false): ?>
	<section class="th_docs">
		<div class="container">
			<p class="caption">Документы</p>

			<div class="docs_target">
				<div class="nav">
					<?php foreach ($docs as $key => $doc): ?>
						<?php
							if (!$doc->docs || count($doc->docs) <= 0) continue; 
						?>
						
						<div class="nav_item <?= $key == 0 ? "active" : ""; ?>" data-target=".item<?= $key; ?>">
							<div class="inner">
								<div class="icon first" style="background-image: url('<?= DOCS.$doc->icon; ?>');"></div>
								<p class="nav_name"><?= $doc->name; ?></p>
							</div>
						</div>
					<?php endforeach ?>
				</div>

				<div class="docs_content">

					<?php foreach ($docs as $key => $doc): ?>
						<div class="item item<?= $key; ?> <?= $key == 0 ? "active" : ""; ?>">
							<div class="owl-carousel">
								<?php if ($doc->docs): ?>
									<?php foreach ($doc->docs as $d_key => $d_item): ?>
										<div class="doc_item">
											<a class="doc fancybox" href="<?= DOCS.$d_item->source; ?>" style="background-image: url('<?= DOCS."crop/350x500_".$d_item->source; ?>');">
												<span class="hover_element"></span>
											</a>
										</div>
									<?php endforeach ?>
								<?php endif ?>
							</div>
						</div>
					<?php endforeach ?>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</section>
<?php endif ?>


<section class="th_stat">
	<div class="th_custom_container container">
		
		<p class="caption"><?= $th_page->capt1 ? $th_page->capt1 : ""; ?></p>
		<div class="credit_desc">
			<?= $th_page->text1 ? $th_page->text1 : ""; ?>
		</div>
		<p class="caption" id="ahchor_dev"><?= $th_page->capt2 ? $th_page->capt2 : ""; ?></p>
		<div class="about_dev_desc">
			<?= $th_page->text2 ? $th_page->text2 : ""; ?>
		</div>
		<a href="<?= RS.'about/'; ?>" class="about_link">Детальнее о застройщике</a>

		<?php if ($th_page->th_stat): ?>

			<div class="table_stats">

				<?php 
					$stats = explode(';', $th_page->th_stat);
					if ($stats[count($stats) - 1] == '') array_pop($stats); 

					if ($stats) {
						$cnt = 0;
						foreach ($stats as $key => $stat) {
							$stat_row = explode('*', $stat);
							$f_stat = str_replace('м2', 'м<sup>2</sup>', $stat_row[0]);
							$s_stat = str_replace('м2', 'м<sup>2</sup>', $stat_row[1]);

							if ($cnt == 0) {
								?>
									<div class="row pn hidden-sm hidden-xs">
								<?php
							}


							?>
								<div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
									<p class="num"><?= $f_stat; ?></p>
									<p class="desc"><?= $s_stat; ?></p>
								</div>
							<?php

							if ($cnt == 2) {
								?>
									</div>
								<?php
							}

							$cnt++;
							if ($cnt == 3) {
								$cnt = 0;
							}
						}
					}
				?>

				<div class="clear"></div>

				<?php if ($stats): ?>
					<?php foreach ($stats as $key => $stat): ?>
						<?php 
							$stat_row = explode('*', $stat);
							$f_stat = str_replace('м2', 'м<sup>2</sup>', $stat_row[0]);
							$s_stat = str_replace('м2', 'м<sup>2</sup>', $stat_row[1]);
							$pad_class = $key % 2 == 0 ? "pl0" : "pr0";
						?>
						<div class="col-lg-4 col-md-4 col-sm-6 col-xs-6 hidden-lg hidden-md th_mod_stat_item <?= $pad_class; ?>">
							<p class="num"><?= $f_stat; ?></p>
							<p class="desc"><?= $s_stat; ?></p>
						</div>
					<?php endforeach ?>
				<?php endif ?>

				
				<div class="clear"></div>
			</div>
		<?php endif ?>

		<?php if ($th_page->benefits): ?>
			<div class="th_stat_list">
				<ul>
					<?php
						$benefits = explode(';', $th_page->benefits);
					?>
					<?php foreach ($benefits as $key => $b): ?>
						<li><span><?= $b; ?></span></li>
					<?php endforeach ?>
				</ul>
			</div>
		<?php endif ?>
	</div>
</section>

<?= $this->element('manager'); ?>