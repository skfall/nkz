<?php 
	// Start header content

	$headParams = array( 'parent'=>$parent, 'alias'=>$alias, 'id'=>$id, 'item_id'=>$item_id, 'appTable'=>$appTable );
	
	$data['headContent'] = $zh->getCardEditHeader($headParams);

	
	$cardItem = $zh->getRoomsItem($item_id);
	$houses = $zh->getHouses();

	$rooms_types = array(
		array(
			'id' => 'r1',
			'name' => '1к'
		),
		array(
			'id' => 'r2',
			'name' => '2к'
		),
		array(
			'id' => 'r3',
			'name' => '3к'
		),
		array(
			'id' => 'rn',
			'name' => '2яр'
		),
		array(
			'id' => 'com',
			'name' => 'Commercial'
		),
	);


	$rootPath = ROOT_PATH;
	
	$cardTmp = array(
					'Название'			=>	array( 'type'=>'input', 	'field'=>'name', 			'params'=>array('hold'=>'Название', 'size'=>50 ) ),
					'clear-2221'				=>	array( 'type'=>'clear' ),
					'Название в фильтре на сайте'			=>	array( 'type'=>'input', 	'field'=>'short_name', 			'params'=>array('hold'=>'Название в фильтре на сайте', 'size'=>50 ) ),
					'Очередность в фильре'			=>	array( 'type'=>'number', 	'field'=>'order_id', 			'params'=>array('hold'=>'Очередность в фильре', 'size'=>50 ) ),
					'Заголовок в планировках на сайте'			=>	array( 'type'=>'input', 	'field'=>'caption', 			'params'=>array('hold'=>'Заголовок в планировках на сайте', 'size'=>50 ) ),
					'clear-ggwp'				=>	array( 'type'=>'clear' ),
					'Тип категории'	=>	array( 'type'=>'select', 	'field'=>'alias', 		'params'=>array( 'list'=>$rooms_types, 
							 'fieldValue'=>'id', 
						 'fieldTitle'=>'name', 
						 'currValue'=>$cardItem['alias'], 
						 'onChange'=>""
						 ) ),

					'Привязать категорию к дому'	=>	array( 'type'=>'select', 	'field'=>'house_id', 		'params'=>array( 'list'=>$houses, 
							 'fieldValue'=>'id', 
						 'fieldTitle'=>'name', 
						 'currValue'=>$cardItem['house_id'], 
						 'onChange'=>""
						 ) ),

					'clear-0'				=>	array( 'type'=>'clear' ),
					'Публикация'			=>	array( 'type'=>'block', 	'field'=>'block', 			'params'=>array( 'reverse'=>true ) )
					 );

	$cardEditFormParams = array( 'cardItem'=>$cardItem, 'cardTmp'=>$cardTmp, 'rootPath'=>$rootPath, 'actionName'=>"editRoom", 'ajaxFolder'=>'edit', 'appTable'=>$appTable );
	
	$cardEditFormStr = $zh->getCardEditForm($cardEditFormParams);
	
	// Join content
	
	$data['bodyContent'] .= "
		<div class='ipad-20' id='order_conteinter'>
			<h3 class='new-line'>Форма редактирования категории комнат #$item_id</h3>";
	
	$data['bodyContent'] .= $cardEditFormStr;
				
	$data['bodyContent'] .=	"
		</div>
	";

?>