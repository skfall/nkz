<?php 
	// Start header content

	$headParams = array( 'parent'=>$parent, 'alias'=>$alias, 'id'=>$id, 'item_id'=>$item_id, 'appTable'=>$appTable );
	
	$data['headContent'] = $zh->getCardViewHeader($headParams);
	
	// Start body content
	
	$cardItem = $zh->getHousesItem($item_id);
	$slides = $zh->getHousesImages($item_id);
	$gal = $zh->getHousesGal($item_id);

	$images = array();
	$video = array();
	$pano = array();

	foreach ($slides as $key => $slide) {
		if ($slide["type"] == 1) {
			array_push($images, $slide);
		}elseif($slide["type"] == 2){
			array_push($video, $slide);
		}elseif($slide["type"] == 3){
			array_push($pano, $slide);
		}
	}

	$cardItem['gal'] = $gal;
	$cardItem['images'] = $images;
	$cardItem['video'] = $video[0]['source'];
	$cardItem['panorama'] = $pano[0]['source'];

	$cardTmp = array(
					 'ID'						=>	array( 'type'=>'text', 		'field'=>'id', 				'params'=>array() ),
					 'Название'					=>	array( 'type'=>'text', 		'field'=>'name', 		'params'=>array() ),
					 'Алиас'					=>	array( 'type'=>'text', 		'field'=>'alias', 		'params'=>array() ),
					 'Заголовок'					=>	array( 'type'=>'text', 		'field'=>'sub_name', 		'params'=>array() ),
					 'Краткое описание (tooltip)'					=>	array( 'type'=>'text', 		'field'=>'short_desc', 		'params'=>array() ),
					 'Особенности'					=>	array( 'type'=>'text', 		'field'=>'properties', 		'params'=>array() ),
					 'Заголовок (в планировке под картой)'					=>	array( 'type'=>'text', 		'field'=>'house_flat_col_caption', 		'params'=>array() ),
					 'Текст (в планировке под картой)'					=>	array( 'type'=>'text', 		'field'=>'house_flat_info', 		'params'=>array() ),
					 'Процент завершения'					=>	array( 'type'=>'text', 		'field'=>'progress', 		'params'=>array() ),
					 'Дата завершения'					=>	array( 'type'=>'text', 		'field'=>'finish'), 
					 'Площадь квартир'					=>	array( 'type'=>'text', 		'field'=>'mid_flats_area'), 
					 'Стоимость квартир'					=>	array( 'type'=>'text', 		'field'=>'mid_flats_price'), 


					 'Публикация'				=>	array( 'type'=>'text', 		'field'=>'block', 			'params'=>array( 'replace'=>array('0'=>'Да', '1'=>'Нет') ) ),
					 'Дата создания'					=>	array( 'type'=>'text', 		'field'=>'created', 		'params'=>array() ),
					 'Дата редактирования'					=>	array( 'type'=>'text', 		'field'=>'modified', 		'params'=>array() ),

					 'Meta-title'					=>	array( 'type'=>'text', 		'field'=>'meta_title'), 
					 'Meta-keys'					=>	array( 'type'=>'text', 		'field'=>'meta_title'), 
					 'Meta-desc'					=>	array( 'type'=>'text', 		'field'=>'meta_desc'), 

					 'Видео'			=>	array( 'type'=>'frame',	'field'=>'video',			'params'=>array( 'field'=>'source' ) ),
					 'Панорама'			=>	array( 'type'=>'frame',	'field'=>'panorama',			'params'=>array( 'field'=>'source' ) ),
					 
					 'Слайды'			=>	array( 'type'=>'images',	'field'=>'images',			'params'=>array( 'path'=>RSF.'/split/files/house_slides/', 'field'=>'source' ) ),
					 'Гарелея'			=>	array( 'type'=>'images',	'field'=>'gal',			'params'=>array( 'path'=>RSF.'/split/files/house_gal/', 'field'=>'source' ) ),
					 
					 );

	$cardViewTableParams = array( 'cardItem'=>$cardItem, 'cardTmp'=>$cardTmp, 'rootPath'=>$rootPath );
	
	$cardViewTableStr = $zh->getCardViewTable($cardViewTableParams);
	
	// Join content
	
	$data['bodyContent'] .= "
		<div class='ipad-20' id='order_conteinter'>
			<h3>Детальный просмотр блока таунхауса #$item_id</h3>";
	
	$data['bodyContent'] .= $cardViewTableStr;
				
	$data['bodyContent'] .=	"
		</div>
	";

?>