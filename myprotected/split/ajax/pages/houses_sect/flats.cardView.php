<?php 
	// Start header content

	$headParams = array( 'parent'=>$parent, 'alias'=>$alias, 'id'=>$id, 'item_id'=>$item_id, 'appTable'=>$appTable );
	
	$data['headContent'] = $zh->getCardViewHeader($headParams);
	
	// Start body content
	
	$cardItem = $zh->getFlatsItem($item_id);
	$cardItem['layouts'] = $zh->getFlatsLayouts($item_id);


	$cardTmp = array(
					 'ID'						=>	array( 'type'=>'text', 		'field'=>'id', 				'params'=>array() ),
					 'Название'					=>	array( 'type'=>'text', 		'field'=>'layout_name', 		'params'=>array() ),
					 'Дом'					=>	array( 'type'=>'text', 		'field'=>'house_name', 		'params'=>array() ),
					 'Категория'					=>	array( 'type'=>'text', 		'field'=>'room_name', 		'params'=>array() ),
					 'Участие в акции'					=>	array( 'type'=>'text', 		'field'=>'event_name', 		'params'=>array() ),
					 'Описание'					=>	array( 'type'=>'text', 		'field'=>'flat_desc', 		'params'=>array() ),
					 'Свойства'					=>	array( 'type'=>'text', 		'field'=>'properties', 		'params'=>array() ),
					 


					 'Публикация'				=>	array( 'type'=>'text', 		'field'=>'block', 			'params'=>array( 'replace'=>array('0'=>'Да', '1'=>'Нет') ) ),
					 'Дата создания'					=>	array( 'type'=>'text', 		'field'=>'created', 		'params'=>array() ),
					 'Дата редактирования'					=>	array( 'type'=>'text', 		'field'=>'modified', 		'params'=>array() ),

					 'Планировки'			=>	array( 'type'=>'images',	'field'=>'layouts',			'params'=>array( 'path'=>RSF.'/split/files/layouts/', 'field'=>'filename' ) ),
					 
					 );

	$cardViewTableParams = array( 'cardItem'=>$cardItem, 'cardTmp'=>$cardTmp, 'rootPath'=>$rootPath );
	
	$cardViewTableStr = $zh->getCardViewTable($cardViewTableParams);
	
	// Join content
	
	$data['bodyContent'] .= "
		<div class='ipad-20' id='order_conteinter'>
			<h3>Детальный квартиры #$item_id</h3>";
	
	$data['bodyContent'] .= $cardViewTableStr;
				
	$data['bodyContent'] .=	"
		</div>
	";

?>