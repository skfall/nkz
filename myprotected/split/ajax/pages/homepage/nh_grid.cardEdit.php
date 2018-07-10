<?php 
	// Start header content

	$headParams = array( 'parent'=>$parent, 'alias'=>$alias, 'id'=>$id, 'item_id'=>$item_id, 'appTable'=>$appTable );
	
	$data['headContent'] = $zh->getCardEditHeader($headParams);

	
	$cardItem = $zh->getNhGridItem($item_id);


	$rootPath = ROOT_PATH;
	
	$cardTmp = array(
		'Заголовок'			=>	array( 'type'=>'input', 	'field'=>'caption', 			'params'=>array('hold'=>'Заголовок', 'size'=>50) ),
		'Описание'			=>	array( 'type'=>'area', 	'field'=>'description', 			'params'=>array('hold'=>'Описание', 'size'=>50) ),

		'clear-1'				=>	array( 'type'=>'clear' ),
		
		'Публикация'			=>	array( 'type'=>'block', 	'field'=>'block', 			'params'=>array( 'reverse'=>true ) ),
		'Очередность вывода'			=>	array( 'type'=>'number', 	'field'=>'pos', 			'params'=>array('hold'=>'Очередность вывода', 'size'=>50) ),

		'Изображение'			=>	array( 'type'=>'image_mono','field'=>'source', 		'params'=>array( 'path'=>RSF."/split/files/new_home/", 'appTable'=>$appTable, 'id'=>$item_id ) ),
					 );

	$cardEditFormParams = array( 'cardItem'=>$cardItem, 'cardTmp'=>$cardTmp, 'rootPath'=>$rootPath, 'actionName'=>"editNhGridItem", 'ajaxFolder'=>'edit', 'appTable'=>$appTable );
	
	$cardEditFormStr = $zh->getCardEditForm($cardEditFormParams);
	
	// Join content
	
	$data['bodyContent'] .= "
		<div class='ipad-20' id='order_conteinter'>
			<h3 class='new-line'>Форма редактирования элемента</h3>";
	
	$data['bodyContent'] .= $cardEditFormStr;
				
	$data['bodyContent'] .=	"
		</div>
	";

?>