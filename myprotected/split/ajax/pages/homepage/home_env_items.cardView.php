<?php 
	// Start header content

	$headParams = array( 'parent'=>$parent, 'alias'=>$alias, 'id'=>$id, 'item_id'=>$item_id, 'appTable'=>$appTable );
	
	$data['headContent'] = $zh->getCardViewHeader($headParams);
	
	// Start body content
	
	$cardItem = $zh->getHomeEnvItemsItem($item_id);


	$cardTmp = array(
					 'ID'						=>	array( 'type'=>'text', 		'field'=>'id', 				'params'=>array() ),
					 'Заголовок'					=>	array( 'type'=>'text', 		'field'=>'caption', 		'params'=>array() ),
					 'Название таба'					=>	array( 'type'=>'text', 		'field'=>'parent_name', 		'params'=>array() ),
					 'Очередность вывода'					=>	array( 'type'=>'text', 		'field'=>'order_id', 		'params'=>array() ),
					 'Время пешком'					=>	array( 'type'=>'text', 		'field'=>'time_walk', 		'params'=>array() ),
					 'Время на машине'					=>	array( 'type'=>'text', 		'field'=>'time_car', 		'params'=>array() ),
					 'Публикация'				=>	array( 'type'=>'text', 		'field'=>'block', 			'params'=>array( 'replace'=>array('0'=>'Да', '1'=>'Нет') ) ),
					 'Дата создания'					=>	array( 'type'=>'text', 		'field'=>'created', 		'params'=>array() ),
					 'Дата редактирования'					=>	array( 'type'=>'text', 		'field'=>'modified', 		'params'=>array() ),
		
					 );

	$cardViewTableParams = array( 'cardItem'=>$cardItem, 'cardTmp'=>$cardTmp, 'rootPath'=>$rootPath );
	
	$cardViewTableStr = $zh->getCardViewTable($cardViewTableParams);
	
	// Join content
	
	$data['bodyContent'] .= "
		<div class='ipad-20' id='order_conteinter'>
			<h3>Детальный просмотр элемента окружения #$item_id</h3>";
	
	$data['bodyContent'] .= $cardViewTableStr;
				
	$data['bodyContent'] .=	"
		</div>
	";

?>