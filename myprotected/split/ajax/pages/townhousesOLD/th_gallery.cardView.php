<?php 	// Start header content	$headParams = array( 'parent'=>$parent, 'alias'=>$alias, 'id'=>$id, 'item_id'=>$item_id, 'appTable'=>$appTable );		$data['headContent'] = $zh->getCardViewHeader($headParams);		// Start body content		$cardItem = $zh->getTHgalleryItem($item_id);		$cardTmp = array(					 'ID'						=>	array( 'type'=>'text', 		'field'=>'id', 				'params'=>array() ),					 'Описание'					=>	array( 'type'=>'text', 		'field'=>'file_desc', 			'params'=>array() ),					 'Изображение превью'		=>	array( 'type'=>'image',		'field'=>'filename',			'params'=>array( 'path'=>RSF.'/split/files/townhouses/' ) )					 					 );	$cardViewTableParams = array( 'cardItem'=>$cardItem, 'cardTmp'=>$cardTmp, 'rootPath'=>$rootPath );		$cardViewTableStr = $zh->getCardViewTable($cardViewTableParams);		// Join content		$data['bodyContent'] .= "		<div class='ipad-20' id='order_conteinter'>			<h3>Детальный просмотр элемента галереи таунхаусов #$item_id</h3>";		$data['bodyContent'] .= $cardViewTableStr;					$data['bodyContent'] .=	"		</div>	";?>