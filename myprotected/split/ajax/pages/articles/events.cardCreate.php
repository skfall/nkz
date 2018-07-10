<?php 
	// Start header content

	$headParams = array( 'parent'=>$parent, 'alias'=>$alias, 'id'=>$id, 'item_id'=>$item_id, 'appTable'=>$appTable );
	
	$data['headContent'] = $zh->getCardCreateHeader($headParams);
	
	// Start body content
	
	$cardItem = $zh->getEventItem($item_id);

	$types = array(
		array(
			'id' => 1,
			'name' => 'Акция с привязкой к планировке квартиры'
		),
		array(
			'id' => 2,
			'name' => 'Акция с привязкой к планировке таунхауса'
		)
	);
	

	$rootPath = ROOT_PATH;
	
	$cardTmp = array(
					 'Тип акции'	=>	array( 'type'=>'select', 	'field'=>'type', 		'params'=>array( 'list'=>$types, 
							 'fieldValue'=>'id', 
						 'fieldTitle'=>'name', 
						 'currValue'=>'', 
						 'onChange'=>""
						 ) ),

					 'clear-ggg'				=>	array( 'type'=>'clear' ),
					 'Название'	=>	array( 'type'=>'input', 	'field'=>'name', 		'params'=>array( 'size'=>50, 'hold'=>'Название', 'onchange'=>"" ) ),
					 'Заголовок на сайте'	=>	array( 'type'=>'input', 	'field'=>'caption', 		'params'=>array( 'size'=>50, 'hold'=>'Заголовок на сайте', 'onchange'=>"" ) ),
					 'clear-0'				=>	array( 'type'=>'clear' ),

					 

					 'Дата остановки таймера'				=>	array( 'type'=>'date', 'field'=>'finish', 'params'=>array(  ) ),
					 
					 'clear-1'				=>	array( 'type'=>'clear' ),
					 
					 'Публикация'			=>	array( 'type'=>'block', 	'field'=>'block', 			'params'=>array( 'reverse'=>true ) ),
					 
					 );

	$cardEditFormParams = array( 'cardItem'=>$cardItem, 'cardTmp'=>$cardTmp, 'rootPath'=>$rootPath, 'actionName'=>"createEventNew", 'ajaxFolder'=>'create', 'appTable'=>$appTable );
	
	$cardEditFormStr = $zh->getCardEditForm($cardEditFormParams);
	
	// Join content
	
	$data['bodyContent'] .= "
		<div class='ipad-20' id='order_conteinter'>
			<h3 class='new-line'>Форма создания Акции</h3>";
	
	$data['bodyContent'] .= $cardEditFormStr;
				
	$data['bodyContent'] .=	"
		</div>
	";

?>