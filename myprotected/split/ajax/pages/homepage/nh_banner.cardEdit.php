<?php 
	// Start header content
	$headParams = array( 'parent'=>$parent, 'alias'=>$alias, 'id'=>$id, 'item_id'=>$item_id, 'appTable'=>$appTable );
	
	$data['headContent'] = $zh->getCardEditHeader($headParams);
	
	// Start body content
	
	$cardItem = $zh->getNhBannerItem($item_id);
	
	$cardTmp = array(
		'Заголовок слайда'				=>	array( 'type'=>'area', 	'field'=>'caption', 		'params'=>array( 'size'=>100, 'hold'=>'Заголовок' ) ),
		'clear-0'				=>	array( 'type'=>'clear' ),
		'Подзаголовок 1'				=>	array( 'type'=>'area', 	'field'=>'sub_1', 		'params'=>array( 'size'=>100, 'hold'=>'Подзаголовок 1' ) ),
		'Подзаголовок 2'				=>	array( 'type'=>'area', 	'field'=>'sub_2', 		'params'=>array( 'size'=>100, 'hold'=>'Подзаголовок 2' ) ),

		
   
		'Публикация'			=>	array( 'type'=>'block', 	'field'=>'block', 			'params'=>array( 'reverse'=>true ) ),
		'Очередность вывода'			=>	array( 'type'=>'number', 	'field'=>'pos', 			'params'=>array() ),

		'Изображение'			=>	array( 'type'=>'image_mono','field'=>'source', 		'params'=>array( 'path'=>RSF."/split/files/new_home/", 'appTable'=>$appTable, 'id'=>$item_id ) ),
					 
					 );
	$cardEditFormParams = array( 'cardItem'=>$cardItem, 'cardTmp'=>$cardTmp, 'rootPath'=>$rootPath, 'actionName'=>"editNhBanner", 'ajaxFolder'=>'edit', 'appTable'=>$appTable );
	
	$cardEditFormStr = $zh->getCardEditForm($cardEditFormParams);
	
	// Join content
	
	$data['bodyContent'] .= "
		<div class='ipad-20' id='order_conteinter'>
			<h3 class='new-line'>Форма редактирования слайда #$item_id</h3>";
	
	$data['bodyContent'] .= $cardEditFormStr;
				
	$data['bodyContent'] .=	"
		</div>
	";
?>