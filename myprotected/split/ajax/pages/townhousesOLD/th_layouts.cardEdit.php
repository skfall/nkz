<?php 
	// Start header content

	$headParams = array( 'parent'=>$parent, 'alias'=>$alias, 'id'=>$id, 'item_id'=>$item_id, 'appTable'=>$appTable );
	
	$data['headContent'] = $zh->getCardEditHeader($headParams);

	
	$cardItem = $zh->getThLayoutsItem($item_id);
	$cardItem['images'] = $zh->getThLayoutsImages($item_id);
	$blocks = $zh->getThBlocks();
	$floors = $zh->getThFloors();

	$rootPath = ROOT_PATH;
	
	$cardTmp = array(
					'Название планировки'			=>	array( 'type'=>'input', 	'field'=>'layout_name', 			'params'=>array('hold'=>'Название планировки', 'size'=>100 ) ),
					
					'clear-0'				=>	array( 'type'=>'clear' ),

					'Таунхаус'	=>	array( 'type'=>'select', 	'field'=>'th_id', 		'params'=>array( 'list'=>$blocks, 
							 'fieldValue'=>'id', 
						 'fieldTitle'=>'name', 
						 'currValue'=>$cardItem['th_id'], 
						 'onChange'=>""
						 ) ),

					'Этаж'	=>	array( 'type'=>'select', 	'field'=>'floor_id', 		'params'=>array( 'list'=>$floors, 
							 'fieldValue'=>'id', 
						 'fieldTitle'=>'name', 
						 'currValue'=>$cardItem['floor_id'], 
						 'onChange'=>""
						 ) ),


					'Параметры '			=>	array( 'type'=>'area', 	'field'=>'stats', 'params'=>array( 'size'=>100, 'hold'=>'Текст1*Текст1;
Текст2*Текст2;' ) ),
					'Публикация'			=>	array( 'type'=>'block', 	'field'=>'block', 			'params'=>array( 'reverse'=>true ) ),
					'Изображения'				=>	array( 'type'=>'header' ),
					 'Выбор изображений'	=>	array( 'type'=>'image_mult', 'field'=>'images', 		'params'=>array( 'path'=>RSF."/split/files/layouts/", 'appTable'=>$appTable, 'id'=>$item_id, 'field'=>'source' ) )
					 );

	$cardEditFormParams = array( 'cardItem'=>$cardItem, 'cardTmp'=>$cardTmp, 'rootPath'=>$rootPath, 'actionName'=>"editTHLayout", 'ajaxFolder'=>'edit', 'appTable'=>$appTable );
	
	$cardEditFormStr = $zh->getCardEditForm($cardEditFormParams);
	
	// Join content
	
	$data['bodyContent'] .= "
		<div class='ipad-20' id='order_conteinter'>
			<h3 class='new-line'>Форма редактирования планировки таунхауса #$item_id</h3>";
	
	$data['bodyContent'] .= $cardEditFormStr;
				
	$data['bodyContent'] .=	"
		</div>
	";

?>