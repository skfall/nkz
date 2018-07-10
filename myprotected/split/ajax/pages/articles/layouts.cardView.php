<?php 
	// Start header content

	$headParams = array( 'parent'=>$parent, 'alias'=>$alias, 'id'=>$id, 'item_id'=>$item_id, 'appTable'=>$appTable );
	
	$data['headContent'] = $zh->getCardViewHeader($headParams);
	
	// Start body content
	
	$cardItem = $zh->getFlatItem($item_id);

	$cardItem['event_name'] = ($cardItem['event_name'] ? $cardItem['event_name'] : 'Не участвует');

	$event_id = $cardItem['event_id'];
	if ($event_id) {
		$cardItem['event_link'] = "<a class='view-link'	href='javascript:void(0);' onclick=\"loadPage('articles','events',74,".$event_id.",'cardView',{});\"><img title='Детальный просмотр акции' src='split/img/glaz.png' style='margin-top: 3px;' ></a>";
	}else{
		$cardItem['event_link'] = "Не участвует";
	}



	$rootPath = ROOT_PATH;

	$cardTmp = array(
					 'ID'						=>	array( 'type'=>'text', 		'field'=>'id', 				'params'=>array() ),
					 'Дом'					=>	array( 'type'=>'text', 		'field'=>'house_name', 		'params'=>array() ),
					 'Количество комнат'					=>	array( 'type'=>'text', 		'field'=>'room_name', 			'params'=>array() ),
					 'Описание'					=>	array( 'type'=>'text', 		'field'=>'details', 		'params'=>array() ),
					 'Общая площадь (м)'			=>	array( 'type'=>'text', 		'field'=>'total_area', 		'params'=>array() ),
					 'Публикация'				=>	array( 'type'=>'text', 		'field'=>'block', 			'params'=>array( 'replace'=>array('0'=>'Да', '1'=>'Нет') ) ),
					 'Акция'					=>	array( 'type'=>'text', 		'field'=>'event_link', 			'params'=>array() ),
					 'Планировки'			=>	array( 'type'=>'images',	'field'=>'layouts',			'params'=>array( 'path'=>RSF.'/split/files/layouts/', 'field'=>'file' ) ),
					 );

	$cardViewTableParams = array( 'cardItem'=>$cardItem, 'cardTmp'=>$cardTmp, 'rootPath'=>$rootPath );
	
	$cardViewTableStr = $zh->getCardViewTable($cardViewTableParams);
	
	// Join content
	
	$data['bodyContent'] .= "
		<div class='ipad-20' id='order_conteinter'>
			<h3>Детальный просмотр планировок квартиры #$item_id</h3>";
	
	$data['bodyContent'] .= $cardViewTableStr;
				
	$data['bodyContent'] .=	"
		</div>
	";

?>