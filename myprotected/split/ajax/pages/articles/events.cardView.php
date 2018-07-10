<?php 
	// Start header content
	$headParams = array( 'parent'=>$parent, 'alias'=>$alias, 'id'=>$id, 'item_id'=>$item_id, 'appTable'=>$appTable );
	
	$data['headContent'] = $zh->getCardViewHeader($headParams);
	
	// Start body content
	
	$cardItem = $zh->getEventItem($item_id);

	if ($cardItem["type"] == 1) {
		$cardItem["lay_name"] = $cardItem["fl_layout_name"];
		$cardItem["lay_type"] = "Планировка квартиры";
	}elseif($cardItem["type"] == 2){
		$cardItem["lay_name"] = $cardItem["th_layout_name"];
		$cardItem["lay_type"] = "Планировка таунхауса";
	}
	$rootPath = ROOT_PATH;
	
	$cardTmp = array(
					 'ID'						=>	array( 'type'=>'text', 		'field'=>'id', 				'params'=>array() ),
					 'Название'					=>	array( 'type'=>'text', 		'field'=>'name', 			'params'=>array() ),
					 'Заголовок'					=>	array( 'type'=>'text', 		'field'=>'name', 			'params'=>array() ),
					 'Название планировки'					=>	array( 'type'=>'text', 		'field'=>'lay_name', 			'params'=>array() ),
					 'Тип планировки'					=>	array( 'type'=>'text', 		'field'=>'lay_type', 			'params'=>array() ),
					 'Публикация'				=>	array( 'type'=>'text', 		'field'=>'block', 			'params'=>array( 'replace'=>array('0'=>'Да', '1'=>'Нет') ) ),
					 
					 'Дата создания'			=>	array( 'type'=>'date', 		'field'=>'created', 		'params'=>array() ),
					 'Дата редактирования'		=>	array( 'type'=>'date', 		'field'=>'modified', 		'params'=>array() ),
					 'Дата окончания'		=>	array( 'type'=>'date', 		'field'=>'finish', 		'params'=>array() )
					 );
	$cardViewTableParams = array( 'cardItem'=>$cardItem, 'cardTmp'=>$cardTmp, 'rootPath'=>$rootPath );
	
	$cardViewTableStr = $zh->getCardViewTable($cardViewTableParams);
	
	// Join content
	
	$data['bodyContent'] .= "
		<div class='ipad-20' id='order_conteinter'>
			<h3>Быстрый просмотр галлереи #$item_id</h3>";
	
	$data['bodyContent'] .= $cardViewTableStr;
				
	$data['bodyContent'] .=	"
		</div>
	";
?>