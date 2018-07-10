<?php 
	// Start header content

	$headParams = array( 'parent'=>$parent, 'alias'=>$alias, 'id'=>$id, 'item_id'=>$item_id, 'appTable'=>$appTable );
	
	$data['headContent'] = $zh->getCardViewHeader($headParams);
	
	// Start body content
	
	$cardItem = $zh->getNhGridItem($item_id);


	$cardTmp = array(
					 'ID'						=>	array( 'type'=>'text', 		'field'=>'id', 				'params'=>array() ),
					 'Заголовок'					=>	array( 'type'=>'text', 		'field'=>'caption', 		'params'=>array() ),
					 'Описание'					=>	array( 'type'=>'text', 		'field'=>'description', 		'params'=>array() ),
					 'Очередность вывода'					=>	array( 'type'=>'text', 		'field'=>'pos', 		'params'=>array() ),
					 'Публикация'				=>	array( 'type'=>'text', 		'field'=>'block', 			'params'=>array( 'replace'=>array('0'=>'Да', '1'=>'Нет') ) ),
					 'Дата создания'					=>	array( 'type'=>'text', 		'field'=>'created', 		'params'=>array() ),
					 'Дата редактирования'					=>	array( 'type'=>'text', 		'field'=>'modified', 		'params'=>array() ),
					 'Изображение'		=>	array( 'type'=>'image',		'field'=>'source',			'params'=>array( 'path'=>RSF.'/split/files/new_home/' ) ),
		
					 );

	$cardViewTableParams = array( 'cardItem'=>$cardItem, 'cardTmp'=>$cardTmp, 'rootPath'=>$rootPath );
	
	$cardViewTableStr = $zh->getCardViewTable($cardViewTableParams);
	
	// Join content
	
	$data['bodyContent'] .= "
		<div class='ipad-20' id='order_conteinter'>
			<h3>Детальный просмотр элемента #$item_id</h3>";
	
	$data['bodyContent'] .= $cardViewTableStr;
				
	$data['bodyContent'] .=	"
		</div>
	";

?>