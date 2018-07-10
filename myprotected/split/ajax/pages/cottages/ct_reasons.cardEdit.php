<?php 
	// Start header content

	$headParams = array( 'parent'=>$parent, 'alias'=>$alias, 'id'=>$id, 'item_id'=>$item_id, 'appTable'=>$appTable );
	
	$data['headContent'] = $zh->getCardEditHeader($headParams);

	
	$cardItem = $zh->getCTreasonsItem($item_id);
		
	$cardTmp = array(
					 'Заголовок'			=>	array( 'type'=>'input', 	'field'=>'caption', 			'params'=>array( 'size'=>50, 'hold'=>'(
' ) ),
					 'Описание'			=>	array( 'type'=>'area', 	'field'=>'details', 			'params'=>array('hold'=>'Описание') ),
					 	
					 'Изображение'			=>	array( 'type'=>'image_mono','field'=>'filename', 		'params'=>array( 'path'=>RSF."/split/files/cottages/", 'appTable'=>$appTable, 'id'=>$item_id ) ),
					 
					 
					 
					 );

	$cardEditFormParams = array( 'cardItem'=>$cardItem, 'cardTmp'=>$cardTmp, 'rootPath'=>$rootPath, 'actionName'=>"editCTreason", 'ajaxFolder'=>'edit', 'appTable'=>$appTable );
	
	$cardEditFormStr = $zh->getCardEditForm($cardEditFormParams);
	
	// Join content
	
	$data['bodyContent'] .= "
		<div class='ipad-20' id='order_conteinter'>
			<h3 class='new-line'>Форма редактирования секции '5 причин' #$item_id</h3>";
	
	$data['bodyContent'] .= $cardEditFormStr;
				
	$data['bodyContent'] .=	"
		</div>
	";

?>