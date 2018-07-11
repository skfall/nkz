<?php 
	// Start header content

	$headParams = array( 'parent'=>$parent, 'alias'=>$alias, 'id'=>$id, 'item_id'=>$item_id, 'appTable'=>$appTable );
	
	$data['headContent'] = $zh->getCardEditHeader($headParams);
	
	// Start body content
	
	$cardItem = $zh->getUpdThayout($item_id);

	$rootPath = ROOT_PATH;
	
	$cardTmp = array(
					 'Название'				=>	array( 'type'=>'input', 		'field'=>'caption', 		'params'=>array( 'size'=>100, 'hold'=>'Caption' ) ),
					 'Описание'				=>	array( 'type'=>'area', 		'field'=>'cottage_desc', 		'params'=>array( 'size'=>100, 'hold'=>'Описание' ) ),
					 'В стоимость входит'				=>	array( 'type'=>'area', 		'field'=>'features', 		'params'=>array( 'size'=>100, 'hold'=>'Строка; Строка;' ) ),
					 'Свойства'				=>	array( 'type'=>'area', 		'field'=>'properties', 		'params'=>array( 'size'=>100, 'hold'=>'свойство*значение;
свойство*значение;' ) ),
					 'clear-1'				=>	array( 'type'=>'clear' ),
					 
					 'Цена'				=>	array( 'type'=>'input', 		'field'=>'price', 		'params'=>array( 'size'=>30, 'hold'=>'Цена' ) ),
					 'Площадь'				=>	array( 'type'=>'input', 		'field'=>'area', 		'params'=>array( 'size'=>30, 'hold'=>'Площадь' ) ),

					 'clear-2'				=>	array( 'type'=>'clear' ),
					 'Позиция'				=>	array( 'type'=>'number', 	'field'=>'pos', 			'params'=>array( 'size'=>30, 'hold'=>'Position' ) ),
					  
					 																							 
					 'Публикация'			=>	array( 'type'=>'block', 	'field'=>'block', 			'params'=>array( 'reverse'=>true ) ),
					 
					 'Изображения'	=>	array( 'type'=>'image_mult', 'field'=>'layouts', 		'params'=>array( 'path'=>RSF."/split/files/townhouses/", 'appTable'=>$appTable, 'id'=>$item_id, 'field'=>'filename' ) ),

					 
					 );

	$cardEditFormParams = array( 'cardItem'=>$cardItem, 'cardTmp'=>$cardTmp, 'rootPath'=>$rootPath, 'actionName'=>"editUpdTownhouse", 'ajaxFolder'=>'edit', 'appTable'=>$appTable );
	
	$cardEditFormStr = $zh->getCardEditForm($cardEditFormParams);
	
	// Join content
	
	$data['bodyContent'] .= "
		<div class='ipad-20' id='order_conteinter'>
			<h3 class='new-line'>Форма редактирования таунхауса #$item_id</h3>";
	
	$data['bodyContent'] .= $cardEditFormStr;
				
	$data['bodyContent'] .=	"
		</div>
	";

?>