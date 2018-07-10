<?= $this->element('breadcrumbs') ?>

<section class="news_items_sect">
	<div class="container">

		<div class="col-lg-12">
			<p class="caption"><?= $news_item->caption ?: ""; ?></p>
			<p class="status">
				<span class="date"><?= date("d.m.Y", strtotime($news_item->dateCreate)); ?></span> 

				<?php if ($news_item->cat_alias): ?>
					<a href="<?= RS.'news/?cat='.$news_item->cat_alias; ?>"><?= $news_item->cat_name ?: ""; ?></a>
				<?php endif ?>

			</p>


			<div class="content_target">
				<?= $news_item->details ?: ""; ?>
			</div>

			<?php if ($news_item->gal): ?>
				<div class="news_item_owl_main owl-carousel">
					<?php foreach ($news_item->gal as $key => $ig): ?>
						<div class="item">
							<a href="<?= NEWS_GAL.$ig->file; ?>" class="fancybox" data-fancybox="gal-<?= $news_item->id; ?>">
								<div class="news_item_slide" style="background-image: url('<?= NEWS_GAL.'crop/500x350_'.$ig->file; ?>');"></div>
							</a>
						</div>
					<?php endforeach ?>
				</div>
			<?php endif ?>
		</div>
	</div>
	

	<?php if ($news_item->tags): ?>
		<?php 
			$tags = explode(';', $news_item->tags);
			if ($tags[count($tags) - 1] == '') array_pop($tags);
		?>

		<?php if ($tags): ?>
			
			<div class="hashtags">
				<div class="container">
					<p>В этой публикации</p>
					<ul>
						<?php foreach ($tags as $key => $tag): ?>
							<li><a href="javascript:void(0);"><?= $tag ?: ""; ?></a></li>
						<?php endforeach ?>
					</ul>
				</div>	
			</div>
		<?php endif ?>
	<?php endif ?>
</section>

<?php if ($news_item->neighbors): ?>
	<section class="same_cats">
		<div class="container">
			<p class="sect_caption">Также по теме</p>

			<div class="cats_owl">
				<div class="owl-carousel">
					<?php foreach ($news_item->neighbors as $key => $neighbor): ?>
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 item">
							<div class="shadow_wrap">
								<a href="<?= RS.'news/'.$neighbor->id.'/'; ?>">
									<div class="preview" style="background-image: url('<?= $neighbor->preview ? NEWS.$neighbor->preview : RS."img/def_logo.jpg"; ?>')"></div>
								</a>
								<div class="inner">
									<div class="news_inf">
										<p>
											<?php if ($neighbor->cat_alias): ?>
												<a href="<?= RS.'news/?cat='.$neighbor->cat_alias; ?>"><?= $neighbor->cat_name ?: ""; ?></a>
											<?php endif ?>
											<span class="date"><?= $neighbor->dateCreate ? date("d.m.Y", strtotime($neighbor->dateCreate)): ""; ?></span>
										</p>
									</div>
									<div class="news_desc"><p><?= $neighbor->caption ?: ""; ?></p></div>
								</div>
							</div>
						</div>
					<?php endforeach ?>
				</div>
			</div>
		</div>
	</section>
<?php endif ?>


<section class="other_cats">
	<div class="container">
		<p class="sect_caption">Рубрики</p>
		<ul>
			<li><a href="<?= RS.'news/'; ?>">Все рубрики</a></li>
			<?php if ($all_cats): ?>
				<?php foreach ($all_cats as $key => $cat): ?>
					<li><a href="<?= RS.'news/?cat='.$cat->alias; ?>"><?= $cat->name ?: ""; ?></a></li>
				<?php endforeach ?>
			<?php endif ?>
		</ul>
	</div>
</section>



<div class="clear space50 mb-3"></div>