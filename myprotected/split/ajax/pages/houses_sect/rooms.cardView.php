<?php 
	// Start header content

	$headParams = array( 'parent'=>$parent, 'alias'=>$alias, 'id'=>$id, 'item_id'=>$item_id, 'appTable'=>$appTable );
	
	$data['headContent'] = $zh->getCardViewHeader($headParams);
	
	// Start body content
	
	$cardItem = $zh->getRoomsItem($item_id);


	$cardTmp = array(
					 'ID'						=>	array( 'type'=>'text', 		'field'=>'id', 				'params'=>array() ),
					 'Название'					=>	array( 'type'=>'text', 		'field'=>'name', 		'params'=>array() ),
					 'Алиас'					=>	array( 'type'=>'text', 		'field'=>'alias', 		'params'=>array() ),
					 'Название в фильтре на сайте'					=>	array( 'type'=>'text', 		'field'=>'short_name', 		'params'=>array() ),
					 'Очередность в фильре'			=>	array('type'=>'text',		'field'=>'order_id'),
					 'Заголовок в планировках на сайте'					=>	array( 'type'=>'text', 		'field'=>'caption', 		'params'=>array() ),




					 'Дом'					=>	array( 'type'=>'text', 		'field'=>'house_name', 		'params'=>array() ),
					  


					 'Публикация'				=>	array( 'type'=>'text', 		'field'=>'block', 			'params'=>array( 'replace'=>array('0'=>'Да', '1'=>'Нет') ) ),
					 'Дата создания'					=>	array( 'type'=>'text', 		'field'=>'created', 		'params'=>array() ),
					 'Дата редактирования'					=>	array( 'type'=>'text', 		'field'=>'modified', 		'params'=>array() ),

					 
					 
					 );

	$cardViewTableParams = array( 'cardItem'=>$cardItem, 'cardTmp'=>$cardTmp, 'rootPath'=>$rootPath );
	
	$cardViewTableStr = $zh->getCardViewTable($cardViewTableParams);
	
	// Join content
	
	$data['bodyContent'] .= "
		<div class='ipad-20' id='order_conteinter'>
			<h3>Детальный просмотр категории #$item_id</h3>";
	
	$data['bodyContent'] .= $cardViewTableStr;
				
	$data['bodyContent'] .=	"
		</div>
	";

?>