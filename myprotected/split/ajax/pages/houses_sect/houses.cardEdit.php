<?php 
	// Start header content

	$headParams = array( 'parent'=>$parent, 'alias'=>$alias, 'id'=>$id, 'item_id'=>$item_id, 'appTable'=>$appTable );
	
	$data['headContent'] = $zh->getCardEditHeader($headParams);

	
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
	$cardItem['images'] = $images;
	$cardItem['video'] = $video[0]['source'];
	$cardItem['panorama'] = $pano[0]['source'];
	$cardItem['gal'] = $gal;


	$rootPath = ROOT_PATH;
	
	$cardTmp = array(
					'Название'			=>	array( 'type'=>'input', 	'field'=>'name', 			'params'=>array('hold'=>'Название', 'size'=>50, 'onchange'=>"change_alias();" ) ),
					'Алиас'			=>	array( 'type'=>'input', 	'field'=>'alias', 			'params'=>array('hold'=>'Алиас', 'size'=>50 ) ),
					'clear-ggwp'				=>	array( 'type'=>'clear' ),

					'Заголовок'			=>	array( 'type'=>'input', 	'field'=>'sub_name', 			'params'=>array('hold'=>'Заголовок', 'size'=>100 ) ),
					'clear-ggwp2'				=>	array( 'type'=>'clear' ),
					'Краткое описание (tooltip)'			=>	array( 'type'=>'input', 	'field'=>'short_desc', 			'params'=>array('hold'=>'Краткое описание', 'size'=>100 ) ),

					'Особенности'			=>	array( 'type'=>'area', 	'field'=>'properties', 			'params'=>array('hold'=>'Строка1;
Строка2;', 'size'=>100 ) ),
					'Заголовок (в планировке под картой)'			=>	array( 'type'=>'input', 	'field'=>'house_flat_col_caption', 			'params'=>array('hold'=>'Заголовок', 'size'=>100 ) ),
					'Текст (в планировке под картой)'				=>	array( 'type'=>'redactor', 	'field'=>'house_flat_info', 		'params'=>array() ),
					'Процент завершения'			=>	array( 'type'=>'number', 	'field'=>'progress', 			'params'=>array('hold'=>'Процент завершения', 'size'=>100 ) ),
					'Дата завершения'			=>	array( 'type'=>'date', 	'field'=>'finish', 			'params'=>array('hold'=>'', 'size'=>100 ) ),
					'Площадь квартир'			=>	array( 'type'=>'input', 	'field'=>'mid_flats_area', 			'params'=>array('hold'=>'Площадь квартир', 'size'=>20 ) ),
					'Стоимость квартир'			=>	array( 'type'=>'input', 	'field'=>'mid_flats_price', 			'params'=>array('hold'=>'Стоимость квартир', 'size'=>20 ) ),



					'clear-0'				=>	array( 'type'=>'clear' ),

					'Публикация'			=>	array( 'type'=>'block', 	'field'=>'block', 			'params'=>array( 'reverse'=>true ) ),
					'Очередность вывода'			=>	array( 'type'=>'number', 	'field'=>'order_id', 			'params'=>array('hold'=>'Очередность вывода', 'size'=>20 ) ),
					'Мета-теги'				=>	array( 'type'=>'header' ),
					'Meta-title'			=>	array( 'type'=>'input', 	'field'=>'meta_title', 			'params'=>array('hold'=>'Meta-title', 'size'=>100 ) ),
					'Meta-keys'			=>	array( 'type'=>'input', 	'field'=>'meta_keys', 			'params'=>array('hold'=>'Meta-keys', 'size'=>100 ) ),
					'Meta-desc'			=>	array( 'type'=>'area', 	'field'=>'meta_desc', 			'params'=>array('hold'=>'Meta-desc', 'size'=>100 ) ),
					
					'Изображения'				=>	array( 'type'=>'header' ),
					'Video'			=>	array( 'type'=>'area', 	'field'=>'video', 			'params'=>array('hold'=>'Video iFrame', 'size'=>100 ) ),
					'Panorama'			=>	array( 'type'=>'area', 	'field'=>'panorama', 			'params'=>array('hold'=>'Panorama iFrame', 'size'=>100 ) ),
					 'Слайды'	=>	array( 'type'=>'image_mult', 'field'=>'images', 		'params'=>array( 'path'=>RSF."/split/files/house_slides/", 'appTable'=>$appTable, 'id'=>$item_id, 'field'=>'source' ) ),
					 'Галерея'	=>	array( 'type'=>'image_mult', 'field'=>'gal', 		'params'=>array( 'path'=>RSF."/split/files/house_gal/", 'appTable'=>$appTable, 'id'=>$item_id, 'field'=>'source', 'shotam' => 'house_gal' ) )
					 );

	$cardEditFormParams = array( 'cardItem'=>$cardItem, 'cardTmp'=>$cardTmp, 'rootPath'=>$rootPath, 'actionName'=>"editHouse", 'ajaxFolder'=>'edit', 'appTable'=>$appTable );
	
	$cardEditFormStr = $zh->getCardEditForm($cardEditFormParams);
	
	// Join content
	
	$data['bodyContent'] .= "
		<div class='ipad-20' id='order_conteinter'>
			<h3 class='new-line'>Форма редактирования дома #$item_id</h3>";
	
	$data['bodyContent'] .= $cardEditFormStr;
				
	$data['bodyContent'] .=	"
		</div>
	";

?>