<?php 	// Start header content	$headParams = array( 'parent'=>$parent, 'alias'=>$alias, 'id'=>$id, 'item_id'=>$item_id, 'appTable'=>$appTable );		$data['headContent'] = $zh->getCardEditHeader($headParams);		// Start body content		$cardItem = $zh->getHMapItem($item_id);		$cardTmp = array(					 'Название'				=>	array( 'type'=>'input', 	'field'=>'name', 		'params'=>array( 'size'=>100, 'hold'=>'Название' ) ),					 'clear-0' => array('type' => 'clear'),					 'Пункт назначения'				=>	array( 'type'=>'input', 	'field'=>'destination', 		'params'=>array( 'size'=>100, 'hold'=>'Пункт назначения' ) ),					 'clear-1' => array('type' => 'clear'),					 'Растояние'				=>	array( 'type'=>'number', 	'field'=>'distance', 		'params'=>array( 'size'=>100, 'hold'=>'Растояние' ) ),					 'Время пути (автомобиль)'				=>	array( 'type'=>'number', 	'field'=>'time_car', 		'params'=>array( 'size'=>100, 'hold'=>'Время пути (автомобиль)' ) ),					 'Время пути (общ. тр.)'				=>	array( 'type'=>'number', 	'field'=>'time_bus', 		'params'=>array( 'size'=>100, 'hold'=>'Время пути (общ. тр.)' ) ),					 										 'Изображение'			=>	array( 'type'=>'image_mono','field'=>'file', 		'params'=>array( 'path'=>RSF."/split/files/home/", 'appTable'=>$appTable, 'id'=>$item_id ) ),					 					 					 					 );	$cardEditFormParams = array( 'cardItem'=>$cardItem, 'cardTmp'=>$cardTmp, 'rootPath'=>$rootPath, 'actionName'=>"editHomeMapItem", 'ajaxFolder'=>'edit', 'appTable'=>$appTable );		$cardEditFormStr = $zh->getCardEditForm($cardEditFormParams);		// Join content		$data['bodyContent'] .= "		<div class='ipad-20' id='order_conteinter'>			<h3 class='new-line'>Форма редактирования элемента #$item_id</h3>";		$data['bodyContent'] .= $cardEditFormStr;					$data['bodyContent'] .=	"		</div>	";?>