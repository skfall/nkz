<?php 
	// Start header content
	$headParams = array( 'parent'=>$parent, 'alias'=>$alias, 'id'=>$id, 'item_id'=>$item_id, 'appTable'=>$appTable );
	
	$data['headContent'] = $zh->getCardViewHeader($headParams);
	
	// Start body content
	
	$cardItem = $zh->getNhBannerItem($item_id);
	
	$cardTmp = array(
					 'ID'						=>	array( 'type'=>'text', 		'field'=>'id', 				'params'=>array() ),
					 'Заголовок слайда'					=>	array( 'type'=>'text', 		'field'=>'caption', 			'params'=>array() ),
					 'Подзаголовок 1'					=>	array( 'type'=>'text', 		'field'=>'sub_1', 			'params'=>array() ),
					 'Подзаголовок 2'					=>	array( 'type'=>'text', 		'field'=>'sub_2', 			'params'=>array() ),
					 'Позиция'					=>	array( 'type'=>'text', 		'field'=>'pos', 			'params'=>array() ),
					 'Изображение'		=>	array( 'type'=>'image',		'field'=>'source',			'params'=>array( 'path'=>RSF.'/split/files/new_home/' ) ),

					 'Публикация'				=>	array( 'type'=>'text', 		'field'=>'block', 			'params'=>array( 'replace'=>array('0'=>'Да', '1'=>'Нет') ) ),
					 
					 'Дата редактирования'					=>	array( 'type'=>'text', 		'field'=>'modified', 			'params'=>array() ),
					 'Дата создания'					=>	array( 'type'=>'text', 		'field'=>'created', 			'params'=>array() ),


					 
					 
					 );
	$cardViewTableParams = array( 'cardItem'=>$cardItem, 'cardTmp'=>$cardTmp, 'rootPath'=>$rootPath );
	
	$cardViewTableStr = $zh->getCardViewTable($cardViewTableParams);
	
	// Join content
	
	$data['bodyContent'] .= "
		<div class='ipad-20' id='order_conteinter'>
			<h3>Детальный просмотр слайда #$item_id</h3>";
	
	$data['bodyContent'] .= $cardViewTableStr;
				
	$data['bodyContent'] .=	"
		</div>
	";
?>