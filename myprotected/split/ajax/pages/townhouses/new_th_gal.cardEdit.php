<?php 
	// Start header content

	$headParams = array( 'parent'=>$parent, 'alias'=>$alias, 'id'=>$id, 'item_id'=>$item_id, 'appTable'=>$appTable );
	
	$data['headContent'] = $zh->getCardEditHeader($headParams);
	
	// Start body content
	
	$cardItem = $zh->getThNewGalItem($item_id);

	$rootPath = ROOT_PATH;
	
	$cardTmp = array(
					 'Заголовок'				=>	array( 'type'=>'area', 		'field'=>'caption', 		'params'=>array( 'size'=>100, 'hold'=>'Caption' ) ),
					 
					 'clear-1'				=>	array( 'type'=>'clear' ),
					 
					 'Позиция'				=>	array( 'type'=>'number', 	'field'=>'pos', 			'params'=>array( 'size'=>100, 'hold'=>'Position' ) ),
					  
					 'clear-2'				=>	array( 'type'=>'clear' ),
					 																							 
					 'Публикация'			=>	array( 'type'=>'block', 	'field'=>'block', 			'params'=>array( 'reverse'=>true ) ),
					 
					 'Изображение'			=>	array( 'type'=>'image_mono','field'=>'image', 		'params'=>array( 'path'=>RSF."/split/files/new_th/", 'appTable'=>$appTable, 'id'=>$item_id ) ),

					 
					 );

	$cardEditFormParams = array( 'cardItem'=>$cardItem, 'cardTmp'=>$cardTmp, 'rootPath'=>$rootPath, 'actionName'=>"editNewThGalItem", 'ajaxFolder'=>'edit', 'appTable'=>$appTable );
	
	$cardEditFormStr = $zh->getCardEditForm($cardEditFormParams);
	
	// Join content
	
	$data['bodyContent'] .= "
		<div class='ipad-20' id='order_conteinter'>
			<h3 class='new-line'>Форма редактирования GALLERY Townhouses #$item_id</h3>";
	
	$data['bodyContent'] .= $cardEditFormStr;
				
	$data['bodyContent'] .=	"
		</div>
	";

?>