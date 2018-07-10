<?php 
	require_once "../../../../require.base.php";
	require_once "../../../library/AjaxHelp.php";
	$ah = new ajaxHelp($dbh);
	$data = array('status' => 'failed', 'message' => '');
	
	$root = 'https://'.$_SERVER['SERVER_NAME'].'/';
	$news = $ah->getNewsUrls();
	$houses = $ah->getHousesUrls();
	foreach ($news as $key => &$value) {
		$value['url'] = $root.'news/'.$value['url'];
	}
	$houses_urls = array();

	foreach ($houses as $key => $h) {


		if ($h["rooms"]) {
			foreach ($h["rooms"] as $rkey => $r) {
				$r_name = "";
				if ($r['alias'] == 'r1') {
					$r_name = "1-к квартиры";
				}elseif($r['alias'] == 'r2'){
					$r_name = "2-к квартиры";
				}elseif($r['alias'] == 'r3'){
					$r_name = "3-к квартиры";
				}elseif($r['alias'] == 'rn'){
					$r_name = "2-х яр. квартиры";
				}

				$h_url = array(
					'url' => $root.'flats/'.$h['url'].'/'.$r['alias'].'/',
					'name' => $h['name'].' | '.$r_name
				);

				array_push($houses_urls, $h_url);
			}
		}
	}

	
	
	
	$urls = array(
		array(
			'url' => $root,
			'name' => 'Главная',
			'children' => ''
		),
		array(
			'url' => $root.'about/',
			'name' => $ah->getMenuNameByTable('osc_menu', 1)['name'],
			'children' => ''
		),
		array(
			'url' => $root.'building-progress/',
			'name' => $ah->getMenuNameByTable('osc_menu', 3)['name'],
			'children' => ''
		),
		array(
			'url' => $root.'news/',
			'name' => $ah->getMenuNameByTable('osc_menu', 4)['name'],
			'children' => $news
		),
		array(
			'url' => $root.'contacts/',
			'name' => $ah->getMenuNameByTable('osc_menu', 5)['name'],
			'children' => ''
		),
		array(
			'url' => $root.'flats/',
			'name' => $ah->getMenuNameByTable('osc_menu', 6)['name'],
			'children' => $houses_urls
		),
		array(
			'url' => $root.'townhouses/',
			'name' => $ah->getMenuNameByTable('osc_menu', 7)['name'],
			'children' => ''
		),
		array(
			'url' => $root.'cottages/',
			'name' => $ah->getMenuNameByTable('osc_menu', 8)['name'],
			'children' => ''
		)
	);


	
	$xml = '<?xml version="1.0" encoding="UTF-8"?>
	<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">';
		foreach ($urls as $key => $value) {
			$loc = $value['url'];
			$xml .= '
				<url>
			      <loc>'.$loc.'</loc>
			   </url>
			';

			if (isset($value['children']) && $value['children']) {
				foreach ($value['children'] as $c_key => $c_value) {
					$c_loc = $c_value['url'];
					$xml .= '
						<url>
					      <loc>'.$c_loc.'</loc>
					   </url>
					';
				}
			}
		}
	   

	$xml .= '</urlset>';

	$sitemap = fopen("../../../../../sitemap.xml", "w") or die("Unable to open sitemap!");
	if (fwrite($sitemap, $xml)) {
		$data['status'] = 'success';
		$data['message'] = 'Sitemap обновлен!';
	}

	fclose($sitemap);


	echo json_encode($data);