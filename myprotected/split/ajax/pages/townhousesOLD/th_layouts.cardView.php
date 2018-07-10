<?php 
	// Start header content

	$headParams = array( 'parent'=>$parent, 'alias'=>$alias, 'id'=>$id, 'item_id'=>$item_id, 'appTable'=>$appTable );
	
	$data['headContent'] = $zh->getCardViewHeader($headParams);
	
	// Start body content
	
	$cardItem = $zh->getThLayoutsItem($item_id);
	$cardItem['images'] = $zh->getThLayoutsImages($item_id);

	$cardTmp = array(
					 'ID'						=>	array( 'type'=>'text', 		'field'=>'id', 				'params'=>array() ),
					 'Название планировки'					=>	array( 'type'=>'text', 		'field'=>'layout_name', 		'params'=>array() ),
					 'Название таунхауса'					=>	array( 'type'=>'text', 		'field'=>'block_name', 		'params'=>array() ),
					 'Этаж'					=>	array( 'type'=>'text', 		'field'=>'floor_name', 		'params'=>array() ),
					 'Участие в акции'					=>	array( 'type'=>'text', 		'field'=>'event_name', 		'params'=>array() ),
					 'Параметры'					=>	array( 'type'=>'text', 		'field'=>'stats', 		'params'=>array() ),
					 'Публикация'				=>	array( 'type'=>'text', 		'field'=>'block', 			'params'=>array( 'replace'=>array('0'=>'Да', '1'=>'Нет') ) ),
					 'Дата редактирования'					=>	array( 'type'=>'text', 		'field'=>'modified', 		'params'=>array() ),
					 
					 'Изображения'			=>	array( 'type'=>'images',	'field'=>'images',			'params'=>array( 'path'=>RSF.'/split/files/layouts/', 'field'=>'source' ) ),
					 );

	$cardViewTableParams = array( 'cardItem'=>$cardItem, 'cardTmp'=>$cardTmp, 'rootPath'=>$rootPath );
	
	$cardViewTableStr = $zh->getCardViewTable($cardViewTableParams);
	
	// Join content
	
	$data['bodyContent'] .= "
		<div class='ipad-20' id='order_conteinter'>
			<h3>Детальный просмотр блока таунхауса #$item_id</h3>";
	
	$data['bodyContent'] .= $cardViewTableStr;
				
	$data['bodyContent'] .=	"
		</div>
	";

?>