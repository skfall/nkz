<?php 	// Start header content	$headParams = array( 'parent'=>$parent, 'alias'=>$alias, 'id'=>$id, 'item_id'=>$item_id, 'appTable'=>$appTable );		$data['headContent'] = $zh->getCardViewHeader($headParams);		// Start body content		$cardItem = $zh->getHomeEnvItem($item_id);		$cardTmp = array(					 'ID'						=>	array( 'type'=>'text', 		'field'=>'id', 				'params'=>array() ),					 'Заголовок таба'					=>	array( 'type'=>'text', 		'field'=>'name', 			'params'=>array() ),										 'Алиас'					=>	array( 'type'=>'text', 		'field'=>'alias', 			'params'=>array() ),					 					 'Иконка'		=>	array( 'type'=>'image',		'field'=>'icon',			'params'=>array( 'path'=>RSF.'/split/files/images/' ) ),					 'Изображение'		=>	array( 'type'=>'image',		'field'=>'image',			'params'=>array( 'path'=>RSF.'/split/files/images/' ) ),					 					 'Дата редактирования'					=>	array( 'type'=>'text', 		'field'=>'modified', 			'params'=>array() ),					 'Дата создания'					=>	array( 'type'=>'text', 		'field'=>'created', 			'params'=>array() ),					 					 					 );	$cardViewTableParams = array( 'cardItem'=>$cardItem, 'cardTmp'=>$cardTmp, 'rootPath'=>$rootPath );		$cardViewTableStr = $zh->getCardViewTable($cardViewTableParams);		// Join content		$data['bodyContent'] .= "		<div class='ipad-20' id='order_conteinter'>			<h3>Детальный просмотр таба #$item_id</h3>";		$data['bodyContent'] .= $cardViewTableStr;					$data['bodyContent'] .=	"		</div>	";?>