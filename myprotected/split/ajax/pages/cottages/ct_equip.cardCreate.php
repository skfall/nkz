<?php 	// Start header content	$headParams = array( 'parent'=>$parent, 'alias'=>$alias, 'id'=>$id, 'item_id'=>$item_id, 'appTable'=>$appTable );		$data['headContent'] = $zh->getCardCreateHeader($headParams);		// Start body content		$cardItem = $zh->getCTequipItem($item_id);		$cardTmp = array(					'Заголовок'				=>	array( 'type'=>'input', 	'field'=>'caption', 		'params'=>array( 'size'=>100, 'hold'=>'Заголовок' ) ),					 					'Изображение'			=>	array( 'type'=>'image_mono','field'=>'file', 		'params'=>array( 'path'=>RSF."/split/files/cottages/", 'appTable'=>$appTable, 'id'=>$item_id ) ),					 					 					 );	$cardEditFormParams = array( 'cardItem'=>$cardItem, 'cardTmp'=>$cardTmp, 'rootPath'=>$rootPath, 'actionName'=>"createCTequipItem", 'ajaxFolder'=>'create', 'appTable'=>$appTable );		$cardEditFormStr = $zh->getCardEditForm($cardEditFormParams);		// Join content		$data['bodyContent'] .= "		<div class='ipad-20' id='order_conteinter'>			<h3 class='new-line'>Форма создания элемента секции 'Комплектация таунхаусов'</h3>";		$data['bodyContent'] .= $cardEditFormStr;					$data['bodyContent'] .=	"		</div>	";?>