<?php 	// Start header content	$headParams = array( 'parent'=>$parent, 'alias'=>$alias, 'id'=>$id, 'item_id'=>$item_id, 'appTable'=>$appTable );		$data['headContent'] = $zh->getCardEditHeader($headParams);		// Start body content		$cardItem = $zh->getHomeEnvItem($item_id);		$cardTmp = array(					 'Заголовок таба'				=>	array( 'type'=>'input', 	'field'=>'name', 		'params'=>array( 'size'=>100, 'hold'=>'Заголовок', 'onchange' => 'change_alias();' ) ),					 'clear-0'				=>	array( 'type'=>'clear' ),										 'Алиас'				=>	array( 'type'=>'input', 	'field'=>'alias', 		'params'=>array( 'size'=>100, 'hold'=>'Заголовок' ) ),										 					 'clear-2'				=>	array( 'type'=>'clear' ),					 'Публикация'			=>	array( 'type'=>'block', 	'field'=>'block', 			'params'=>array( 'reverse'=>true ) ),					 'Изображения'				=>	array( 'type'=>'header' ),					 'Изображение'			=>	array( 'type'=>'image_mono','field'=>'image', 		'params'=>array( 'path'=>RSF."/split/files/images/", 'appTable'=>$appTable, 'id'=>$item_id ) ),					 'Иконка'			=>	array( 'type'=>'image_mono','field'=>'icon', 		'params'=>array( 'path'=>RSF."/split/files/images/", 'appTable'=>$appTable, 'id'=>$item_id ) ),					 					 );	$cardEditFormParams = array( 'cardItem'=>$cardItem, 'cardTmp'=>$cardTmp, 'rootPath'=>$rootPath, 'actionName'=>"editHomeEnvTabItem", 'ajaxFolder'=>'edit', 'appTable'=>$appTable );		$cardEditFormStr = $zh->getCardEditForm($cardEditFormParams);		// Join content		$data['bodyContent'] .= "		<div class='ipad-20' id='order_conteinter'>			<h3 class='new-line'>Форма редактирования таба #$item_id</h3>";		$data['bodyContent'] .= $cardEditFormStr;					$data['bodyContent'] .=	"		</div>	";?>