<?php 
	// Start header content

	$headParams = array( 'parent'=>$parent, 'alias'=>$alias, 'id'=>$id, 'item_id'=>$item_id, 'appTable'=>$appTable, 'type'=>'serv_orders_view' );
	
	$data['headContent'] = $zh->getCardViewHeader($headParams);
	
	// Start body content
	
	$cardItem = $zh->getEventRecall($item_id);
	$layout_id = $cardItem['layout_id'];

	$parent_alias = "";
	if ($cardItem['type_event'] == 'Акция с привязкой к планировке квартиры') {
		$r_row = "'articles','layouts',74,".$layout_id.",'cardView',{}";
	}elseif($cardItem['type_event'] == 'Акция с привязкой к комнате'){
		$r_row = "'articles','flat_rooms',74,".$layout_id.",'cardView',{}";
	}elseif($cardItem['type_event'] == 'Акция - Обменяй машину на квартиру'){
		$r_row = "'articles','events',74,2,'cardView',{}";
	}elseif($cardItem['type_event'] == 'Акция - Обменяй старую квартиру на новую'){
		$r_row = "'articles','events',74,3,'cardView',{}";
	}elseif($cardItem['type_event'] == 'Акция с привязкой к планировке таунхауса'){
		$r_row = "'townhouses','townhouses-layouts',81,".$layout_id.",'cardView',{}";
	}elseif($cardItem['type_event'] == 'Акция с привязкой к планировке коттеджа'){
		$r_row = "'cottages','cottages-layouts',81,".$layout_id.",'cardView',{}";
	}
	

	$cardItem['layout_link'] = "<a class='view-link'	href='javascript:void(0);' onclick=\"loadPage(".$r_row.");\"><img title='Детальный просмотр участники акции' src='split/img/glaz.png' style='margin-top: 3px;' ></a>";

	$rootPath = "../../../../..";
	
	$cardTmp = array(
					 'ID'						=>	array( 'type'=>'text', 		'field'=>'id', 				'params'=>array() ),
					 'Имя'					=>	array( 'type'=>'text', 		'field'=>'name', 		'params'=>array() ),
					 'Телефон'					=>	array( 'type'=>'text', 		'field'=>'phone', 			'params'=>array() ),
					 'Тип акции'					=>	array( 'type'=>'text', 		'field'=>'type_event', 			'params'=>array() ),
					 'Участник акции'					=>	array( 'type'=>'text', 		'field'=>'layout_link', 			'params'=>array() ),
					 /*'Phone'			=>	array( 'type'=>'text', 		'field'=>'phone', 		'params'=>array() ),*/

					 'Дата создания'			=>	array( 'type'=>'date', 		'field'=>'dateCreate', 		'params'=>array() )/*
					 'Дата редактирования'		=>	array( 'type'=>'date', 		'field'=>'dateModify', 		'params'=>array() )*/
					 );

	$cardViewTableParams = array( 'cardItem'=>$cardItem, 'cardTmp'=>$cardTmp, 'rootPath'=>$rootPath );
	
	$cardViewTableStr = $zh->getCardViewTable($cardViewTableParams);
	
	// Join content
	
	$data['bodyContent'] .= "
		<div class='ipad-20' id='order_conteinter'>
			<h3>Детальный просмотр заявки на консультацию #$item_id</h3>";
	
	$data['bodyContent'] .= $cardViewTableStr;
				
	$data['bodyContent'] .=	"
		</div>
	";

?>