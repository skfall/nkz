<?php if ($banner): ?>

<?php 

/*

// OLD BANNER


<section class="cottages_sect_1" style="background: #333 url('<?= ($banner['filename'] ? COTTAGES_PATH.$banner['filename'] : ''); ?>') center no-repeat; background-size: cover; -webkit-background-size: cover; -moz-background-size: cover; -ms-background-size: cover; -o-background-size: cover;">
	<div class="container">
		<div class="text col-lg-6 col-md-6 col-sm-12 col-xs-12">
			<h2 class="slide_caption"><?= ($banner['caption'] ? $banner['caption'] : ''); ?></h2>
			<h3 class="slide_sub_caption"><?= ($banner['sub_caption'] ? $banner['sub_caption'] : ''); ?></h3>
			<hr class="heading_und" />
			<p class="slide_desc"><?= ($banner['details'] ? $banner['details'] : ''); ?></p>
		</div>
	</div>
</section>
*/

?>

<section class="home_b">
    <div class="home_tabs">
        <div class="home_tabs_body upd">
			<div class="item por">
				<img src="<?= ($banner['filename'] ? COTTAGES_PATH.$banner['filename'] : ''); ?>" class="ct_new_slide" alt="Slide" />
				<?php 
					$formatted_caption = str_replace("\n", '<br/>', $banner['caption'] ? $banner['caption'] : '');
					$formatted_sub_1 = str_replace("\n", '<br/>', $banner['sub_caption'] ? $banner['sub_caption'] : '');
					$formatted_sub_2 = str_replace("\n", '<br/>', $banner['details'] ? $banner['details'] : '');
				?>
				<div class="banner_text">
					<div class="slide_text"><?= $formatted_caption ?: "" ?></div>
					<div class="upd_sub_caption_1"><?= $formatted_sub_1 ?: "" ?></div>
					<div class="upd_sub_caption_2"><?= $formatted_sub_2 ?: "" ?></div>

					<div class="slide_btns">
						<a class="btn_2" href="javascript:void(0);" onclick="upd.scroll_to('#objects');" style="margin-right:20px;">
							Посмотреть планировки
						</a>
						<a class="btn_1" href="#" data-toggle="modal" data-target="#visit_modal" onclick="ga('send', 'event', 'Кнопка', 'Записаться на просмотр');" style="margin-right:0;">
							Записаться на просмотр
						</a>
					</div>
				</div>
			</div>
		</div> 
    </div>  
</section>
<?php endif ?>


<?php if ($reasons): ?>
	<section class="cottages_reasons por">
		<div class="container">
			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 reasons_holder">
				<div class="reasons_top">
					<div class="left fll aos-init aos-animate" data-aos="fade-up">5</div>
					<div class="right fll aos-init aos-animate" data-aos="fade-up">
						<p class="frow">Причин</p>
						<p>выбрать коттедж в жк "Новая Конча-заспа"</p>
					</div>
					<div class="clear"></div>
					<hr class="reasons_und" />
				</div>
				<ul class="reasons_btns">
					<?php foreach ($reasons as $key => $value): ?>
						<?php $index = $key + 1; ?>
						<li class="<?= ($index == 1 ? 'active' : ''); ?> aos-init aos-animate" data-aos="fade-up">
							<span><?= $index; ?></span>
							<input type="hidden" name="image_name" value="<?= ($value['filename'] ? COTTAGES_PATH.$value['filename'] : ''); ?>" />
						</li>
					<?php endforeach ?>
				</ul>
				<div class="reasons_desc">
					<?php foreach ($reasons as $key => $value): ?>
						<?php $index = $key + 1; ?>
						<div class="reason<?= $index; ?> <?= ($index == 1 ? 'active' : ''); ?> reason_holder">
							<div class="capt"><?= ($value['caption'] ? $value['caption'] : ''); ?></div>
							<div class="desc"><?= ($value['details'] ? $value['details'] : ''); ?></div>
						</div>
					<?php endforeach ?>
				</div>
				<div class="clear"></div>
			</div>
			<div class="col-lg-6 col-md-6 col-sm-6 hidden-xs reasons_preview" style="background: url('<?= ($reasons[0]['filename'] ? COTTAGES_PATH.$reasons[0]['filename'] : ''); ?>') center no-repeat; background-size: cover; -webkit-background-size: cover; -moz-background-size: cover; -ms-background-size: cover; -o-background-size: cover;"></div>
			<div class="clear"></div>
		</div>
	</section>
<?php endif ?>

<?php if ($equip): ?>
	<section class="cottage_equip por">
		<div class="container">
			<div class="text col-lg-6 col-md-6 col-sm-12 col-xs-12 eq_cont">
				<?php
					if ($equip['caption']) {
						$exp_equip = explode(' ', trim($equip['caption']));
						if (count($exp_equip) == 2) {
						 	$first_row = $exp_equip[0];
						 	$second_row = $exp_equip[1];
						}else{
							$first_row = $equip['caption'];
							$second_row = "";
						}
					}else{
						$first_row = ""; $second_row = "";
					} 
				?>
				<h2 class="sect_caption2 aos-init aos-animate" data-aos="fade-up"><?= $first_row; ?> <br /><?= $second_row; ?></h2>
				<hr class="heading_und2 aos-init aos-animate" data-aos="fade-up">
			</div>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 eq_cont">
				<div class="owl-carousel cottage_equip_owl aos-init aos-animate" data-aos="fade-up">
					<?php foreach ($equip['items'] as $key => $value): ?>
						<div class="item" style="background: url('<?= ($value['file'] ? COTTAGES_PATH.$value['file'] : ''); ?>') center no-repeat; background-size: cover; -webkit-background-size: cover; -moz-background-size: cover; -ms-background-size: cover; -o-background-size: cover;">
							<div class="hover"></div>
							<div class="hover_text">
								<p class="grid_caption"><?= ($value['caption'] ? $value['caption'] : ''); ?></p>
							</div>
						</div>
					<?php endforeach ?>
				</div>
			</div>
			<div class="clear"></div>
		</div>
		<div class="tri_left parallax_triangles parallax_move aos-init aos-animate" data-aos="fade-up" data-offset="20"></div>
		<div class="tri_right parallax_triangles parallax_move aos-init aos-animate" data-aos="fade-up" data-offset="20"></div>
	</section>
<?php endif ?>

<div class="clear"></div>

<?php if ($gallery): ?>
	<section class="cottages_gallery">
		<div class="container por">
			<h2 class="sect_caption2 aos-init aos-animate" data-aos="fade-up"><?= ($gallery['caption'] ? $gallery['caption'] : ''); ?></h2>
			<hr class="heading_und2 aos-init aos-animate" data-aos="fade-up">

			<div class="owl-carousel slider">
				<?php foreach ($gallery['items'] as $key => $value): ?>
					<?php if ($value['filename']): ?>
						<div class="item" style="background: url('<?= COTTAGES_PATH.'crop/370x250_'.$value['filename']; ?>') center no-repeat; background-size: cover; -webkit-background-size: cover; -moz-background-size: cover; -ms-background-size: cover; -o-background-size: cover;">
							<a href="<?= COTTAGES_PATH.$value['filename']; ?>" class="fancybox" data-fancybox="cottages_gallery" title="<?= ($value['file_desc'] ? $value['file_desc'] : ''); ?>"></a>
						</div>
					<?php endif ?>
					
				<?php endforeach ?>
				
			</div>
			<?php 
				$items_count = count($gallery['items']);
			?>
			<?php if ($items_count > 3): ?>
				<div class="count hidden-sm hidden-xs">+<?= $items_count - 3; ?></div>
			<?php endif ?>
		</div>
	</section>
<?php endif ?>




<?php 
/*
<section class="cottages_map">
	<div id="cottages_map"></div>
</section>
*/
?>
