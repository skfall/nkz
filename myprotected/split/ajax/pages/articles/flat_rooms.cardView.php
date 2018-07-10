<?php 
	// Start header content

	$headParams = array( 'parent'=>$parent, 'alias'=>$alias, 'id'=>$id, 'item_id'=>$item_id, 'appTable'=>$appTable );
	
	$data['headContent'] = $zh->getCardViewHeader($headParams);
	
	// Start body content
	
	$cardItem = $zh->getFlatRoomsItem($item_id);

	$event_id = $cardItem['event_id'];
	if ($event_id) {
		$cardItem['event_link'] = "<a class='view-link'	href='javascript:void(0);' onclick=\"loadPage('articles','events',74,".$event_id.",'cardView',{});\"><img title='Детальный просмотр акции' src='split/img/glaz.png' style='margin-top: 3px;' ></a>";
	}else{
		$cardItem['event_link'] = "Не участвует";
	}
	
	
	$cardTmp = array(
					 'ID'						=>	array( 'type'=>'text', 		'field'=>'id', 				'params'=>array() ),
					 'Название'					=>	array( 'type'=>'text', 		'field'=>'name', 		'params'=>array() ),
					 'Алиас'					=>	array( 'type'=>'text', 		'field'=>'alias', 			'params'=>array() ),
					 'Акция'					=>	array( 'type'=>'text', 		'field'=>'event_link', 			'params'=>array() )
					 
					 );

	$cardViewTableParams = array( 'cardItem'=>$cardItem, 'cardTmp'=>$cardTmp, 'rootPath'=>$rootPath );
	
	$cardViewTableStr = $zh->getCardViewTable($cardViewTableParams);
	
	// Join content
	
	$data['bodyContent'] .= "
		<div class='ipad-20' id='order_conteinter'>
			<h3>Детальный просмотр комнаты #$item_id</h3>";
	
	$data['bodyContent'] .= $cardViewTableStr;
				
	$data['bodyContent'] .=	"
		</div>
	";

?>