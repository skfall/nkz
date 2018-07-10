<?= $this->element('breadcrumbs') ?>

<section class="news_section">
	<div class="container">

		<div class="col-lg-12 pn">
			<p class="caption">Новости <a href="javascript: void(0);" class="mob_subscr" data-toggle="modal" data-target="#subscr_modal">Следить</a></p>
	

					<?php if ($all_cats): ?>
						<div class="mob_cats">
							<form action="#" method="POST" id="mob_news_cats_form">
								<select name="mob_cats">
									<option value="<?= RS.'news/'; ?>">Все рубрики</option>
									<?php foreach ($all_cats as $key => $cat): ?>
										<option value="<?= RS.'news/?cat='.$cat->alias; ?>" <?= $curr_cat && $cat->alias == $curr_cat->alias ? "selected" : ""; ?>><?= $cat->name ?: ""; ?></option>
									<?php endforeach ?>
								</select>
							</form>
						</div>
					<?php endif ?>
			
		</div>
		
		<?php if (isset($top_news) && $top_news): ?>
			<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pn">
				<div class="top_news shadow_wrap ">
					<a href="<?= RS.'news/'.$top_news->id.'/'; ?>">
						<div class="preview" style="background-image: url('<?= NEWS.$top_news->preview; ?>');">
							<div class="hover"></div>
						</div>
					</a>
					<div class="inner">
						<div class="status_row">
							<p>
								<?php if ($top_news->special_text): ?>
									<span class="top_news_mark"><?= $top_news->special_text ?: ""; ?></span> 
								<?php endif ?>
								<span class="date"><?= $top_news->dateCreate ? date("d.m.Y", strtotime($top_news->dateCreate)): ""; ?></span>
							</p>
						</div>
						<div class="news_caption"><a href="<?= RS.'news/'.$top_news->id.'/'; ?>"><?= $top_news->caption ?: ""; ?></a></div>
					</div>
				</div>
			</div>
		<?php else: ?>
			<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pn">
				<div class="top_news shadow_wrap">
					<a href="javascript:void(0);">
						<div class="preview no_top_news" style="background-image: url('<?= RS.'img/def_logo.jpg'; ?>');"></div>
					</a>
				</div>
			</div>
		<?php endif ?>
		



		
		<div class="col-lg-5 col-md-5 hidden-sm hidden-xs filter_col">
			<div class="filter_box">
				<div class="redactor">
					<?php if ($news_page->redactor_photo): ?>
						<img src="<?= NEWS.$news_page->redactor_photo; ?>" alt="<?= $news_page->redactor_name ?: ""; ?> redactor photo" />
					<?php endif ?>
					<p><?= $news_page->redactor_name ?: ""; ?></p>
				</div>
				<div class="space30"></div>

				<div class="subscription shadow_wrap">
					<p class="desc"><?= $news_page->subscr_desc ?: ""; ?></p>

					<form action="#" method="POST" id="subscribtion_form">
						<input type="hidden" name="action" value="subscribe" />
						<input type="text" placeholder="E-mail" name="email" />
						<button type="button" class="submit">Следить</button>
						<div class="clear"></div>
						<p class="response"></p>
					</form>
				</div>

				<div class="news_cats">
					<?php if (isset($config["fb_link"]) && $config["fb_link"]): ?>
						<a href="<?= $config["fb_link"]; ?>" class="news_fb_link" target="_blank"><img src="<?= RS.'img/fb_ico.png'; ?>" alt="Facebook" />Мы на Фейсбуке</a>		
					<?php endif ?>

					
					<div class="clear"></div>
					<?php if ($all_cats): ?>
						<p>Читать только про:</p>
						<ul class="cats_list">
							<?php foreach ($all_cats as $key => $cat): ?>
								<li><a href="<?= RS.'news/?cat='.$cat->alias; ?>"><?= $cat->name ?: ""; ?></a></li>
							<?php endforeach ?>
						</ul>
					<?php endif ?>
					
				</div>
			</div>
		</div>
		
		<div class="clear"></div>
		<div class="space50 hidden-sm hidden-xs"></div>

		<div class="news_target">

			<?php if ($news): ?>
				<?php foreach ($news as $key => $news_item): ?>
					<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 item">
						<div class="shadow_wrap">
							<a href="<?= RS.'news/'.$news_item->id.'/'; ?>">
								<div class="preview" style="background-image: url('<?= $news_item->preview ? NEWS.$news_item->preview : RS."img/def_logo.jpg"; ?>')">
									<div class="hover"></div>
								</div>
							</a>
							<div class="inner">
								<div class="news_inf">
									<p>
										<?php if ($news_item->cat_alias && false): ?>
											<a href="<?= RS.'news/?cat='.$news_item->cat_alias; ?>"><?= $news_item->cat_name ?: ""; ?></a>
										<?php endif ?>
										<span class="date"><?= $news_item->dateCreate ? date("d.m.Y", strtotime($news_item->dateCreate)): ""; ?></span>
									</p>
								</div>
								<div class="news_desc low_capt"><p><a href="<?= RS.'news/'.$news_item->id.'/'; ?>" ><?=$news_item->caption ?: ""; ?></a></p></div>
							</div>
						</div>
					</div>
				<?php endforeach ?>
			<?php endif ?>

			<div class="clear"></div>
		</div>

		<div class="clear"></div>

		<div class="pag">

			<ul>
			<?php 
				function pnu($i, $cur_page, $curr_cat = null){

					$curr_cat_alias = $curr_cat ? "?cat=".$curr_cat->alias."&" : "?";
					if($i == $cur_page){
						return "javascript:void(0);";
					}elseif($i == 1){
						return RS."news/".$curr_cat_alias;
					}
					return $curr_cat_alias."page=$i";
				}
			?>

			<?php if ($num_pages > 1): ?>
				<?php if ($num_pages <= 6): ?>
					<?php for ($i=1; $i < $num_pages+1; $i++): ?>
						<li class="<?php echo ($cur_page == $i ? 'active' : ''); ?>"><a href="<?= pnu($i,$cur_page, $curr_cat) ?>"><?php echo $i; ?></a></li>
					<?php endfor ?>
				<?php elseif ($cur_page <= 3): ?>
					<li class="<?php echo ($cur_page == 1 ? 'active' : ''); ?>"><a href="<?= pnu(1,$cur_page, $curr_cat) ?>">1</a></li>
					<li class="<?php echo ($cur_page == 2 ? 'active' : ''); ?>"><a href="<?= pnu(2,$cur_page, $curr_cat) ?>">2</a></li>
					<li class="<?php echo ($cur_page == 3 ? 'active' : ''); ?>"><a href="<?= pnu(3,$cur_page, $curr_cat) ?>">3</a></li>
					<li class=""><a href="<?= pnu(4,$cur_page, $curr_cat) ?>">4</a></li>
					<li>...</li>
					<li><a href="<?= pnu($num_pages,$cur_page, $curr_cat) ?>"><?= $num_pages ?></a></li>

				<?php elseif ($cur_page <= ($num_pages-3)): ?>
					<li><a href="<?= pnu(1,$cur_page, $curr_cat) ?>">1</a></li>
					<li>...</li>
					<li class=""><a href="<?= pnu($cur_page-1,$cur_page, $curr_cat) ?>"><?= ($cur_page-1) ?></a></li>
					<li class="active"><a href="<?= pnu($cur_page,$cur_page, $curr_cat) ?>"><?= $cur_page ?></a></li>
					<li class=""><a href="<?= pnu($cur_page+1,$cur_page, $curr_cat) ?>"><?= ($cur_page+1) ?></a></li>
					<li>...</li>
					<li><a href="<?= pnu($num_pages,$cur_page, $curr_cat) ?>"><?= $num_pages ?></a></li>

				<?php else: ?>
					<li><a href="<?= pnu(1,$cur_page, $curr_cat) ?>">1</a></li>
					<li>...</li>
					<li class=""><a href="<?= pnu($num_pages-3,$cur_page, $curr_cat) ?>"><?= ($num_pages-3) ?></a></li>
					<li class="<?php echo ($cur_page == ($num_pages-2) ? 'active' : ''); ?>"><a href="<?= pnu($num_pages-2,$cur_page, $curr_cat) ?>"><?= ($num_pages-2) ?></a></li>
					<li class="<?php echo ($cur_page == ($num_pages-1) ? 'active' : ''); ?>"><a href="<?= pnu($num_pages-1,$cur_page, $curr_cat) ?>"><?= ($num_pages-1) ?></a></li>
					<li class="<?php echo ($cur_page == $num_pages ? 'active' : ''); ?>"><a href="<?= pnu($num_pages,$cur_page, $curr_cat) ?>"><?= $num_pages ?></a></li>
				<?php endif ?>
			<?php endif ?>
			</ul>

		</div>
		
	</div>
</section>

<?= $this->element('news_subscr') ?>