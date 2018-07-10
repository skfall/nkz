<?php 
	// Start header content

	$headParams = array( 'parent'=>$parent, 'alias'=>$alias, 'id'=>$id, 'item_id'=>$item_id, 'appTable'=>$appTable );
	
	$data['headContent'] = $zh->getCardEditHeader($headParams);

	
	$cardItem = $zh->getFlatsItem($item_id);
	$cardItem["layouts"] = $zh->getFlatsLayouts($item_id);
	$houses = $zh->getHouses();
	$rooms = $zh->getRoomsForLayouts();




	$rootPath = ROOT_PATH;
	
	$cardTmp = array(
					'Название'			=>	array( 'type'=>'input', 	'field'=>'layout_name', 			'params'=>array('hold'=>'Название', 'size'=>50 ) ),
					
					'clear-ggwp'				=>	array( 'type'=>'clear' ),

					'Дом'	=>	array( 'type'=>'select', 	'field'=>'house_id', 		'params'=>array( 'list'=>$houses, 
							 'fieldValue'=>'id', 
						 'fieldTitle'=>'name', 
						 'currValue'=>$cardItem['house_id'], 
						 'onChange'=>""
						 ) ),

					'Категория'	=>	array( 'type'=>'select', 	'field'=>'room_id', 		'params'=>array( 'list'=>$rooms, 
							 'fieldValue'=>'id', 
						 'fieldTitle'=>'name', 
						 'currValue'=>$cardItem['room_id'], 
						 'onChange'=>""
						 ) ),

					'Свойства'			=>	array( 'type'=>'area', 	'field'=>'properties', 			'params'=>array('hold'=>'Текст1*Текст2;
Текст2*Текст2;', 'size'=>100 ) ),
					'Особенности'			=>	array( 'type'=>'area', 	'field'=>'features', 			'params'=>array('hold'=>'Строка1;
Строка2;', 'size'=>100 ) ),

					'Описание'				=>	array( 'type'=>'area', 	'field'=>'flat_desc', 		'params'=>array() ),
					

					'clear-0'				=>	array( 'type'=>'clear' ),

					'Публикация'			=>	array( 'type'=>'block', 	'field'=>'block', 			'params'=>array( 'reverse'=>true ) ),
					'Планировки'				=>	array( 'type'=>'header' ),
					
					 'Планировки '	=>	array( 'type'=>'image_mult', 'field'=>'layouts', 		'params'=>array( 'path'=>RSF."/split/files/layouts/", 'appTable'=>$appTable, 'id'=>$item_id, 'field'=>'filename' ) )
					 );

	$cardEditFormParams = array( 'cardItem'=>$cardItem, 'cardTmp'=>$cardTmp, 'rootPath'=>$rootPath, 'actionName'=>"editFlat", 'ajaxFolder'=>'edit', 'appTable'=>$appTable );
	
	$cardEditFormStr = $zh->getCardEditForm($cardEditFormParams);
	
	// Join content
	
	$data['bodyContent'] .= "
		<div class='ipad-20' id='order_conteinter'>
			<h3 class='new-line'>Форма редактирования квартиры #$item_id</h3>";
	
	$data['bodyContent'] .= $cardEditFormStr;
				
	$data['bodyContent'] .=	"
		</div>
	";

?>