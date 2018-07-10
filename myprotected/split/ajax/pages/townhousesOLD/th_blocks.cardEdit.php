<?php 
	// Start header content

	$headParams = array( 'parent'=>$parent, 'alias'=>$alias, 'id'=>$id, 'item_id'=>$item_id, 'appTable'=>$appTable );
	
	$data['headContent'] = $zh->getCardEditHeader($headParams);

	
	$cardItem = $zh->getThBlocksItem($item_id);
	$cardItem['images'] = $zh->getThBlockImages($item_id);

	$rootPath = ROOT_PATH;
	
	$cardTmp = array(
					'Название'			=>	array( 'type'=>'input', 	'field'=>'name', 			'params'=>array('hold'=>'Название', 'size'=>100 ) ),
					'Особенности'			=>	array( 'type'=>'area', 	'field'=>'features', 'params'=>array( 'size'=>100, 'hold'=>'Строка1;
Строка2;' ) ),
					'clear-0'				=>	array( 'type'=>'clear' ),
					'Статистика '			=>	array( 'type'=>'area', 	'field'=>'stats', 'params'=>array( 'size'=>100, 'hold'=>'Текст1*Текст1;
Текст2*Текст2;' ) ),
					'Публикация'			=>	array( 'type'=>'block', 	'field'=>'block', 			'params'=>array( 'reverse'=>true ) ),
					'Изображения'				=>	array( 'type'=>'header' ),
					 'Выбор изображений'	=>	array( 'type'=>'image_mult', 'field'=>'images', 		'params'=>array( 'path'=>RSF."/split/files/townhouses/", 'appTable'=>$appTable, 'id'=>$item_id, 'field'=>'source' ) )
					 );

	$cardEditFormParams = array( 'cardItem'=>$cardItem, 'cardTmp'=>$cardTmp, 'rootPath'=>$rootPath, 'actionName'=>"editTHblocks", 'ajaxFolder'=>'edit', 'appTable'=>$appTable );
	
	$cardEditFormStr = $zh->getCardEditForm($cardEditFormParams);
	
	// Join content
	
	$data['bodyContent'] .= "
		<div class='ipad-20' id='order_conteinter'>
			<h3 class='new-line'>Форма редактирования блока таунхауса #$item_id</h3>";
	
	$data['bodyContent'] .= $cardEditFormStr;
				
	$data['bodyContent'] .=	"
		</div>
	";

?>