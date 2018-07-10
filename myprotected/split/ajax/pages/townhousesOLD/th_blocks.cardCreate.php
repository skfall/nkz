<?php 
	// Start header content

	$item_id = -1;
	$headParams = array( 'parent'=>$parent, 'alias'=>$alias, 'id'=>$id, 'item_id'=>$item_id, 'appTable'=>$appTable );
	
	$data['headContent'] = $zh->getCardCreateHeader($headParams);
	

	$events = $zh->getEventsByType(4);

	// Start body content
	
	$cardItem = $zh->getCottagesLayoutsItem($item_id);
	
	$cardTmp = array(

					'Название'			=>	array( 'type'=>'input', 	'field'=>'name', 			'params'=>array('hold'=>'Название', 'size'=>100 ) ),
					'Общий метраж (м2)'			=>	array( 'type'=>'number', 'field'=>'total_area', 'params'=>array('hold'=>'Общий метраж (м2)', 'size'=>100 ) ),
					  'clear-0'				=>	array( 'type'=>'clear' ),
					'Публикация'			=>	array( 'type'=>'block', 	'field'=>'block', 			'params'=>array( 'reverse'=>true ) ),
					'Привязать планировку к существующей акции'	=>	array( 'type'=>'select', 	'field'=>'event_id', 'params'=>array( 'list'=>$events, 'fieldValue'=>'id', 'fieldTitle'=>'name', 'currValue'=>$cardItem['event_id'], 'first' => array('id' => 0, 'name' => 'Выберите акцию'), 'onChange'=>"" ) ),

					 
					 'clear-1'				=>	array( 'type'=>'clear' ),

					 'Метраж комнат (м)'			=>	array( 'type'=>'area', 	'field'=>'parts_area', 			'params'=>array( 'size'=>50, 'hold'=>'Кухня*10.5; 
Комната*30;
Прихожая*10;' ) ),
					 
					  
					 'clear-2'				=>	array( 'type'=>'clear' ),
	
					 'Планировки'				=>	array( 'type'=>'header' ),
					 'Выбор изображений'	=>	array( 'type'=>'image_mult', 'field'=>'layouts', 		'params'=>array( 'path'=>RSF."/split/files/cottages/", 'appTable'=>$appTable, 'id'=>$item_id, 'field'=>'file' ) )
					 
					 );

	$cardEditFormParams = array( 'cardItem'=>$cardItem, 'cardTmp'=>$cardTmp, 'rootPath'=>$rootPath, 'actionName'=>"createCTLayout", 'ajaxFolder'=>'create', 'appTable'=>$appTable );
	
	$cardEditFormStr = $zh->getCardEditForm($cardEditFormParams);
	
	// Join content
	
	$data['bodyContent'] .= "
		<div class='ipad-20' id='order_conteinter'>
			<h3 class='new-line'>Форма создания планировоки таунхауса</h3>";
	
	$data['bodyContent'] .= $cardEditFormStr;
				
	$data['bodyContent'] .=	"
		</div>
	";

?>