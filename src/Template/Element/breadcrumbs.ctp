<div class="breadcrumbs">
	<div class="container">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<?php if (isset($breadcrumbs) && $breadcrumbs): ?>
				<ul class="main">
					<?php foreach ($breadcrumbs as $i => $step): ?>
						<?php if ($step["type"] == 'single'): ?>
							<li class="single m_li"><span> - </span><a href="<?= $step['link']; ?>"><?= $step['name']; ?></a></li>
						<?php elseif($step["type"] == 'mult'): ?>
							<li class="mult m_li">
								<span><?= $step["name"]; ?></span>
								<?php if ($step["sub"]): ?>
									<ul>
										<?php foreach ($step["sub"] as $sub_i => $sub_item): ?>

											<li><a href="<?= $sub_item['link']; ?>"><?= $sub_item["name"]; ?></a></li>
										<?php endforeach ?>
									</ul>
								<?php endif ?>

							</li>
						<?php endif ?>
					<?php endforeach ?>
				</ul>
			<?php endif ?>
		</div>
	</div>
</div>