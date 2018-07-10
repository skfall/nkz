<?php 
	// Start header content

	$headParams = array( 'parent'=>$parent, 'alias'=>$alias, 'id'=>$id, 'item_id'=>$item_id, 'appTable'=>$appTable );
	
	$data['headContent'] = $zh->getCardEditHeader($headParams);

	
	$cardItem = $zh->getDocsCatsItem($item_id);
	$cardItem['docs'] = $zh->getDocs($item_id);


	$rootPath = ROOT_PATH;
	
	$cardTmp = array(
					'Название'			=>	array( 'type'=>'input', 	'field'=>'name', 			'params'=>array('hold'=>'Название', 'size'=>50, 'onchange' => 'change_alias();' ) ),
					'Алиас'			=>	array( 'type'=>'input', 	'field'=>'alias', 'params'=>array( 'size'=>50, 'hold'=>'Алиас') ),
					'clear-0'				=>	array( 'type'=>'clear' ),

					'Публикация'			=>	array( 'type'=>'block', 	'field'=>'block', 			'params'=>array( 'reverse'=>true ) ),
					'Изображения'				=>	array( 'type'=>'header' ),
					 'Иконка'		=>	array( 'type'=>'image_mono', 'field'=>'icon', 		'params'=>array( 'path'=>RSF."/split/files/docs/", 'appTable'=>$pageTable, 'id'=>1 ) ),
					 'Документы'	=>	array( 'type'=>'image_mult', 'field'=>'docs', 		'params'=>array( 'path'=>RSF."/split/files/docs/", 'appTable'=>$appTable, 'id'=>$item_id, 'field'=>'source' ) )
					 );

	$cardEditFormParams = array( 'cardItem'=>$cardItem, 'cardTmp'=>$cardTmp, 'rootPath'=>$rootPath, 'actionName'=>"editDocsCats", 'ajaxFolder'=>'edit', 'appTable'=>$appTable );
	
	$cardEditFormStr = $zh->getCardEditForm($cardEditFormParams);
	
	// Join content
	
	$data['bodyContent'] .= "
		<div class='ipad-20' id='order_conteinter'>
			<h3 class='new-line'>Форма редактирования категории документов #$item_id</h3>";
	
	$data['bodyContent'] .= $cardEditFormStr;
				
	$data['bodyContent'] .=	"
		</div>
	";

?>