<?php 
	// Start header content

	$item_id = -1;
	$headParams = array( 'parent'=>$parent, 'alias'=>$alias, 'id'=>$id, 'item_id'=>$item_id, 'appTable'=>$appTable );
	
	$data['headContent'] = $zh->getCardCreateHeader($headParams);
	

	$houses = $zh->getHouses();
	$rooms = $zh->getRooms();
	$events = $zh->getEventsByType(3);

	// Start body content
	
	$cardItem = $zh->getFlatItem($item_id);

	$rootPath = ROOT_PATH;
	
	$cardTmp = array(
					 'Дом'	=>	array( 'type'=>'select', 	'field'=>'house_id', 		'params'=>array( 'list'=>$houses, 
					 																									 'fieldValue'=>'id', 
																														 'fieldTitle'=>'name', 
																														 'currValue'=>$cardItem['house_id'], 
																														 'onChange'=>""
																														 ) ),
					 'Количество комнат'	=>	array( 'type'=>'select', 	'field'=>'room_id', 		'params'=>array( 'list'=>$rooms, 
					 																									 'fieldValue'=>'id', 
																														 'fieldTitle'=>'name', 
																														 'currValue'=>$cardItem['room_id'], 
																														 'onChange'=>""
																														 ) ),
					 
					 'Привязать планировку к существующей акции'	=>	array( 'type'=>'select', 	'field'=>'event_id', 		'params'=>array( 'list'=>$events, 
					 																									 'fieldValue'=>'id', 
																														 'fieldTitle'=>'name', 
																														 'currValue'=>$cardItem['event_id'], 
																														 'first' => array('id' => 0, 'name' => 'Выберите акцию'),
																														 'onChange'=>""
																														 ) ),
					 
					 'clear-1'				=>	array( 'type'=>'clear' ),
					 'Общий метраж (м)'			=>	array( 'type'=>'number', 	'field'=>'total_area', 			'params'=>array( 'size'=>50, 'hold'=>'' ) ),

					 'Описание'			=>	array( 'type'=>'area', 	'field'=>'details', 			'params'=>array( 'size'=>50, 'hold'=>'Описание' ) ),

					 'Метраж комнат (м)'			=>	array( 'type'=>'area', 	'field'=>'parts_area', 			'params'=>array( 'size'=>50, 'hold'=>'Кухня*10.5; 
Комната*30;
Прихожая*10;' ) ),
					  
					 'clear-2'				=>	array( 'type'=>'clear' ),
					 																							 
					 'Публикация'			=>	array( 'type'=>'block', 	'field'=>'block', 			'params'=>array( 'reverse'=>true ) ),
	
					 'Планировки'				=>	array( 'type'=>'header' ),
					 'Выбор изображений'	=>	array( 'type'=>'image_mult', 'field'=>'layouts', 		'params'=>array( 'path'=>RSF."/split/files/layouts/", 'appTable'=>$appTable, 'id'=>$item_id, 'field'=>'file' ) )
					 
					 );

	$cardEditFormParams = array( 'cardItem'=>$cardItem, 'cardTmp'=>$cardTmp, 'rootPath'=>$rootPath, 'actionName'=>"createLayout", 'ajaxFolder'=>'create', 'appTable'=>$appTable );
	
	$cardEditFormStr = $zh->getCardEditForm($cardEditFormParams);
	
	// Join content
	
	$data['bodyContent'] .= "
		<div class='ipad-20' id='order_conteinter'>
			<h3 class='new-line'>Форма создания планировок квартиры</h3>";
	
	$data['bodyContent'] .= $cardEditFormStr;
				
	$data['bodyContent'] .=	"
		</div>
	";

?>