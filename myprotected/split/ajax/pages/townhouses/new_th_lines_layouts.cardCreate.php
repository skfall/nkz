<?php 
	// Start header content

	$headParams = array( 'parent'=>$parent, 'alias'=>$alias, 'id'=>$id, 'item_id'=>$item_id, 'appTable'=>$appTable );
	
	$data['headContent'] = $zh->getCardCreateHeader($headParams);
	
	// Start body content
	
	$cardItem = $zh->getThNewLinesLayoutsItem($item_id);
	$blocks = $zh->getLines();

	$rootPath = ROOT_PATH;
	
	$cardTmp = array(
		'Линия'	=>	array( 'type'=>'select', 	'field'=>'ref', 		'params'=>array( 
			'list'=>$blocks, 
			'fieldValue'=>'id', 
			'fieldTitle'=>'name', 
			'currValue'=>$cardItem['ref'], 
			'onChange'=>""
		)),
		 
		 'clear-0'				=>	array( 'type'=>'clear' ),

		 'Этаж'				=>	array( 'type'=>'number', 		'field'=>'floor', 		'params'=>array( 'size'=>100, 'hold'=>'Этаж' ) ),
		 'Название этажа'				=>	array( 'type'=>'input', 		'field'=>'floor_name', 		'params'=>array( 'size'=>100, 'hold'=>'Название этажа' ) ),

		 'Свойства'				=>	array( 'type'=>'area', 		'field'=>'props', 		'params'=>array( 'size'=>100, 'hold'=>'свойство*значение;
свойство*значение;' ) ),
		 
		 'clear-1'				=>	array( 'type'=>'clear' ),
		 
																									  
		 'Публикация'			=>	array( 'type'=>'block', 	'field'=>'block', 			'params'=>array( 'reverse'=>true ) ),
		 
		 'Изображения'				=>	array( 'type'=>'header' ),
		 'Выбор изображений'	=>	array( 'type'=>'image_mult', 'field'=>'layouts', 		'params'=>array( 'path'=>RSF."/split/files/new_th/", 'appTable'=>$appTable, 'id'=>$item_id, 'field'=>'source' ) )
	);

	$cardEditFormParams = array( 'cardItem'=>$cardItem, 'cardTmp'=>$cardTmp, 'rootPath'=>$rootPath, 'actionName'=>"createNewThLineLayout", 'ajaxFolder'=>'create', 'appTable'=>$appTable );
	
	$cardEditFormStr = $zh->getCardEditForm($cardEditFormParams);
	
	// Join content
	
	$data['bodyContent'] .= "
		<div class='ipad-20' id='order_conteinter'>
			<h3 class='new-line'>Форма создания LINE LAYOUTS Townhouses</h3>";
	
	$data['bodyContent'] .= $cardEditFormStr;
				
	$data['bodyContent'] .=	"
		</div>
	";

?>