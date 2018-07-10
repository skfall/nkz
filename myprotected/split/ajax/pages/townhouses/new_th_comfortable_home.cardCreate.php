<?php 
	// Start header content
	$headParams = array( 'parent'=>$parent, 'alias'=>$alias, 'id'=>$id, 'item_id'=>$item_id, 'appTable'=>$appTable );
	
	$data['headContent'] = $zh->getCardCreateHeader($headParams);
	
	// Start body content
	
	$cardItem = $zh->getThInfo1Item($item_id);
	
	$cardTmp = array(
					'Название'				=>	array( 'type'=>'input', 	'field'=>'name', 		'params'=>array( 'size'=>100, 'hold'=>'Заголовок' ) ),
								
					'Иконка'			=>	array( 'type'=>'image_mono','field'=>'icon', 		'params'=>array( 'path'=>RSF."/split/files/new_th/", 'appTable'=>$appTable, 'id'=>$item_id ) ),
					 
					 
					 );
	$cardEditFormParams = array( 'cardItem'=>$cardItem, 'cardTmp'=>$cardTmp, 'rootPath'=>$rootPath, 'actionName'=>"createNewThInfo1Item", 'ajaxFolder'=>'create', 'appTable'=>$appTable );
	
	$cardEditFormStr = $zh->getCardEditForm($cardEditFormParams);
	
	// Join content
	
	$data['bodyContent'] .= "
		<div class='ipad-20' id='order_conteinter'>
			<h3 class='new-line'>Форма создания элемента секции </h3>";
	
	$data['bodyContent'] .= $cardEditFormStr;
				
	$data['bodyContent'] .=	"
		</div>
	";
?>