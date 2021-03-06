<?php 
	// Start header content

	$headParams = array( 'parent'=>$parent, 'alias'=>$alias, 'id'=>$id, 'item_id'=>$item_id, 'appTable'=>$appTable );
	
	$data['headContent'] = $zh->getCardEditHeader($headParams);
	
	// Start body content
	
	$cardItem = $zh->getCtReadyItem($item_id);

	$rootPath = ROOT_PATH;
	
	$cardTmp = array(

					'Название'				=>	array( 'type'=>'input', 		'field'=>'name', 		'params'=>array( 'size'=>100, 'hold'=>'Название' ) ),
					 'Площадь'				=>	array( 'type'=>'number', 		'field'=>'area', 		'params'=>array( 'size'=>100, 'hold'=>'Площадь' ) ),

					 'Описание'				=>	array( 'type'=>'area', 		'field'=>'content', 		'params'=>array( 'size'=>100, 'hold'=>'Описание' ) ),
					 
					 'clear-1'				=>	array( 'type'=>'clear' ),
					 
					 																							 
					 'Публикация'			=>	array( 'type'=>'block', 	'field'=>'block', 			'params'=>array( 'reverse'=>true ) ),
					 
					 'Изображения'				=>	array( 'type'=>'header' ),
					 'Выбор изображений'	=>	array( 'type'=>'image_mult', 'field'=>'layouts', 		'params'=>array( 'path'=>RSF."/split/files/cottages/", 'appTable'=>$appTable, 'id'=>$item_id, 'field'=>'source' ) )

					 
					 );

	$cardEditFormParams = array( 'cardItem'=>$cardItem, 'cardTmp'=>$cardTmp, 'rootPath'=>$rootPath, 'actionName'=>"editNewReadyCt", 'ajaxFolder'=>'edit', 'appTable'=>$appTable );
	
	$cardEditFormStr = $zh->getCardEditForm($cardEditFormParams);
	
	// Join content
	
	$data['bodyContent'] .= "
		<div class='ipad-20' id='order_conteinter'>
			<h3 class='new-line'>Форма редактирования READY COTTAGES #$item_id</h3>";
	
	$data['bodyContent'] .= $cardEditFormStr;
				
	$data['bodyContent'] .=	"
		</div>
	";

?>