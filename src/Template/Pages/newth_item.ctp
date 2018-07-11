<?php 
    if ($info1) { ?>
        <section class="th_info_block_1">
            <div class="row">
                <div class="container">
                    <div class="col col-lg-8 col-md-12 col-sm-12 col-xs-12 left_side">
                        <?php 
                            $info_capt = str_replace("\n", "<br/>", $info1->caption);
                        ?>
                        <div class="caption"><?= $info_capt ?></div>
                        <div class="separator"></div>
                        <div class="content_target">
                            <?= $info1->content ?>
                            <p></p>
                        </div>

                        <?php 
                            $icons = $info1->items;
                            if ($icons && count($icons) > 0) { ?>
                                <div class="icons">
                                    <table>
                                        <tbody>
                                            <?php 
                                                $cnt = 0;
                                                foreach ($icons as $ik => $iv) {
                                                    if ($cnt == 0) {
                                                        ?>
                                                            <tr>
                                                        <?php
                                                    }

                                                    ?>
                                                        <td><span class="bg" style="background-image: url('<?= NTH.$iv->icon; ?>');"></span><span class="text"><?= $iv->name ?></span></td>
                                                    <?php
                                                    
                                                    $cnt++;
                                                    if ($cnt == 2) {
                                                        ?>
                                                            </tr>
                                                        <?php
                                                        $cnt = 0;
                                                    }
                                                    
                                                }
                                            ?>
                                            
                                        </tbody>
                                    </table>
                                </div>
                            <?php }
                        ?>
                    
                        
                    </div>
                </div>
            </div>
            <div class="clear"></div>
        </section>
    <?php }
?>

<?php if (isset($env) && $env && count($env) > 0): ?>
	<section class="new_home_environment home_environment home_section hidden-sm hidden-xs" id="home_environment">
		<div class="home_environment_toggle_h hidden-lg hidden-md mobile_toogle_h" data-target=".home_environment_toggle_c">
			Все рядом
			<div class="border"></div>
		</div>
		<div class="home_environment_toggle_c home_toggle_c animated2">
			<div class="container">
				<div class="section_header hidden-sm hidden-xs"><?= $common->env_capt ?: ""; ?></div>
				<div class="trick_master">
					<div class="env_nav">
						<ul>
							<?php foreach ($env as $key => $e): ?>
								<?php
									$class = "";
									$target = "";
									$icon = "";
									switch ($e->alias) {
									 	case 'children':
									 		$class = "children_g";
									 		$target = ".children_g_c";
									 		$icon = "mf-inf-cg2";
									 		break;
									 	case 'schools':
									 		$class = "school";
									 		$target = ".school_g_c";
									 		$icon = "mf-inf-school2";
									 		break;
									 	case 'health':
									 		$class = "hospital";
									 		$target = ".health_g_c";
									 		$icon = "mf-inf-hospital2";
									 		break;
									 	case 'goods_and_services':
									 		$class = "health";
									 		$target = ".goods_g_c";
									 		$icon = "mf-inf-shops2";
									 		break;
									 	case 'restoraunts':
									 		$class = "rest";
									 		$target = ".rest_g_c";
									 		$icon = "mf-inf-cafe2";
									 		break;
									 	default:
									 		break;
									 } 
								?>
								<li class="<?= $class; ?> <?= $key == 0 ? "active" : ""; ?>" data-target="<?= '.env'.$e->alias; ?>">
									<?php if ($e->icon): ?>
										<span class="icon" style="background-image: url('<?= IMG_PATH.$e->icon; ?>');"></span>
									<?php endif ?>
									<span><?= $e->name ?: ""; ?></span>
								</li>
							<?php endforeach ?>
						</ul>
					</div>
					<div class="hide_scroll_bar"></div>
				</div>

				<?php foreach ($env as $key => $e): ?>

					<div class="env_c <?= 'env'.$e->alias; ?> <?= $key == 0 ? "active" : ""; ?>">
						<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
							<?php if ($e->env_list && count($e->env_list) > 0): ?>
								<ul>

									<?php foreach ($e->env_list as $key => $item): ?>
										<li>
											<?php if ($item->time_walk): ?>
												<span class="time_mark"><span class="value"><?= $item->time_walk; ?></span><br>мин</span>
											<?php endif ?>
											<span class="point_name"><?= $item->caption ? $item->caption : ""; ?></span> <span class="path_time"><?= $item->time_car ? $item->time_car : ""; ?></span><hr />
										</li>

									<?php endforeach ?>
								</ul>
							<?php endif ?>
						</div>
						<div class="col-lg-4 col-md-4 hidden-sm hidden-xs">
							<div class="icon_area">
								<?php if ($e->image): ?>
									<img src="<?= IMG_PATH.$e->image; ?>" alt="Icon" >
								<?php endif ?>
								
							</div>
						</div>
					</div>
				<?php endforeach ?>
				
			</div>
		</div>	
	</section>
<?php endif ?>

<?php 
if ($traffic) { ?>
	<section class="traffic hidden-sm hidden-xs">
		<div class="container">
			<div class="col-lg-5 col-md-5 hidden-sm hidden-xs"></div>
			<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12">
				<div class="caption"><?= $traffic->caption ?: ""; ?></div>
				<div class="sub_caption"><?= $traffic->sub_caption ?: ""; ?></div>

				<div class="description">
					<?= $traffic->description ?: ""; ?>
				</div>

				<?php 
					if ($traffic->notification) { ?>
						<div class="notification">
							<div class="text"><?= $traffic->notification; ?></div>
						</div>
					<?php }
				?>
				
			</div>
		</div>
	</section>

	<section class="home_transport home_section hidden-lg hidden-md" id="home_transport">
		<!-- <div class="home_transport_toggle_h hidden-lg hidden-md mobile_toogle_h" data-target=".home_transport_toggle_c">
			Транспорт
			<div class="border"></div>
		</div> -->
		<div class="home_transport_toggle_c home_toggle_c animated2" style="display: block;">
			<div class="container">
				<div class="section_header"><?= $traffic->caption ?: ""; ?></div>

				<div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
					<ul class="subway">
						<?php 
							if ($traffic->time1 > 0 && $traffic->ob1_lat > 0 && $traffic->ob1_lng > 0 && $traffic->dest1) { ?>
								<li>
									<img src="<?= RS.'img/icons/Metro.svg'; ?>" alt="Metro" class="metro_icon">
									<span><?= $traffic->time1; ?> минут до м. <?= $traffic->dest1; ?> <a href="javascript:void(0);" class="new_map_trigger" data-nlat="<?= number_format($traffic->ob1_lat, 4); ?>" data-nlng="<?= number_format($traffic->ob1_lng, 4); ?>" data-from="vidubichi">Показать маршрут</a></span>
									
								</li>
							<?php }

							if ($traffic->time2 > 0 && $traffic->ob2_lat > 0 && $traffic->ob2_lng > 0 && $traffic->dest2) { ?>
								<li>
									<img src="<?= RS.'img/icons/Metro.svg'; ?>" alt="Metro" class="metro_icon">
									<span><?= $traffic->time2; ?> минут до м. <?= $traffic->dest2; ?> <a href="javascript:void(0);" class="new_map_trigger" data-nlat="<?= number_format($traffic->ob2_lat, 4); ?>" data-nlng="<?= number_format($traffic->ob2_lng, 4); ?>" data-from="vidubichi">Показать маршрут</a></span>
									
								</li>
							<?php }

							if ($traffic->time3 > 0 && $traffic->ob3_lat > 0 && $traffic->ob3_lng > 0 && $traffic->dest3) { ?>
								<li>
									<img src="<?= RS.'img/icons/Metro.svg'; ?>" alt="Metro" class="metro_icon">
									<span><?= $traffic->time3; ?> минут до м. <?= $traffic->dest3; ?> <a href="javascript:void(0);" class="new_map_trigger" data-nlat="<?= number_format($traffic->ob3_lat, 4); ?>" data-nlng="<?= number_format($traffic->ob3_lng, 4); ?>" data-from="vidubichi">Показать маршрут</a></span>
									
								</li>
							<?php }
						?>
						
					</ul>
				</div>

				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<div class="transport_text">
						<img src="<?= RS.'img/icons/Minibus.svg'; ?>" alt="Icon">
						<p><?= $traffic->notification ?: ""; ?></p>
					</div>
				</div>
			</div>
		</div>	
	</section>
<?php }
?>


<section class="th_genplan hidden-sm hidden-xs">
    <div class="floating">
        <div class="item_type"></div>
        <div class="item_name"></div>
        <div class="separator"></div>
        <div class="area">площадь дома <span><span class="val"></span> <sup>м<sup>2</sup></sup></span></div>
        <div class="add_area">+ цоколь <span><span class="val"></span> <sup>м<sup>2</sup></sup></span></div>
        <div class="add_area2">+ участок <span><span class="val"></span> <sup>м<sup>2</sup></sup></span></div>
        <div class="price">цена <span><span class="val"></span> <sup>у.е.</sup></span></div>
    </div>
    <img src="<?= RS.'img/genplan_bg.jpg'; ?>" id="genplan_image" alt="Genplan" />
    <?= $this->element('genplan'); ?>
</section>

<?php 
    if ($video) { ?>

        <section class="video hidden-sm hidden-xs">
            <div class="row">
                <div class="container">
                    <?php 
                        $video_capt = str_replace("\n", "<br />", $video->caption);
                    ?>
                    <div class="caption"><?= $video_capt ?></div>
                </div>
                <div class="video_holder">
                    <video poster="<?= NTH.$video->poster ?>" class="th_video" id="th_video">
                        <source src="<?= NTH.$video->video ?>" type="video/webm; codecs=&quot;vp8, vorbis&quot;">
                        <source src="<?= NTH.$video->video ?>" type="video/mp4; codecs=&quot;avc1.42E01E, mp4a.40.2&quot;">
                        <source src="<?= NTH.$video->video ?>" type="video/ogg; codecs=&quot;theora, vorbis&quot;">
                    </video>

                    <div class="controls">
                        <div class="sound_switcher" onclick="app.mute_video(this);"></div>
                        <div class="tracker">
                            <?= $this->element('tracker'); ?>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    <?php }
?>



<?php 
    if ($gal && count($gal) > 0) { ?>
        <section class="th_gal_owl" >
            <div class="container">
                <div class="th_gal_top owl-carousel">
                    <?php 
                        foreach ($gal as $gk => $gv) { ?>
                            <div class="item">
                                <div class="title"><?= $gv->caption ?></div>
                                <a href="<?= NTH.$gv->image; ?>" class="fancybox" data-fancybox="th_page_gal">
                                    <img src="<?= NTH."crop/1120x620_".$gv->image; ?>" alt="Image" />
                                </a>
                                <div class="curr_image"><span><?= $gk + 1; ?> / <?= count($gal); ?></span></div>
                            </div>
                        <?php }
                    ?>
                </div>
                <div class="th_gal_bot owl-carousel">
                    <?php 
                        foreach ($gal as $gk => $gv) { ?>
                            <div class="item">
                                <img src="<?= NTH."crop/1120x620_".$gv->image; ?>" alt="Image" />
                            </div>
                        <?php }
                    ?>
                </div>
            </div>
        </section>
    <?php }
?>



<?php 
    if ($info2) { ?>
        <section class="th_info_block_2">
            <div class="row">
                <div class="container">

                    <div class="col col-lg-9 col-md-9 col-sm-9 col-xs-12">
                        <div class="outer_item">
                            <div class="inner_item">
                                <?php 
                                    $info_capt2 = str_replace("\n", "<br/>", $info2->caption);
                                ?>
                                <div class="caption"><?= $info_capt2 ?></div>
                                <div class="separator"></div>
                                
                                <div class="icon_table_set">
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <div class="bg" style="background-image: url('<?= RS.'img/lamp.png'; ?>');"></div>
                                                    <div class="text">Свет</div>
                                                </td>
                                                <td>
                                                    <div class="bg" style="background-image: url('<?= RS.'img/oven.png'; ?>');"></div>
                                                    <div class="text">Газ</div>
                                                </td>
                                                <td>
                                                    <div class="bg" style="background-image: url('<?= RS.'img/pipe.png'; ?>');"></div>
                                                    <div class="text">Вода</div>
                                                </td>
                                                <td>
                                                    <div class="bg" style="background-image: url('<?= RS.'img/radiator2.png'; ?>');"></div>
                                                    <div class="text">Отопление</div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>

                                <?php 
                                    $props = $info2->props;
                                    $info2_list = explode("\n", $props);
                                    if ($info2_list) { ?>
                                        <div class="additional">
                                            <p class="title">Дополнительно</p>
                                            <ul>
                                                <?php 
                                                    foreach ($info2_list as $lk => $lv) { ?>
                                                        <li><span><?= $lv ?></span></li>                                                        
                                                    <?php }
                                                ?>
                                            </ul>
                                        </div>
                                    <?php }
                                ?>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>    
    <?php }
?>


<?= $this->element("manager"); ?>