<?php 
	// Start header content

	$headParams = array( 'parent'=>$parent, 'alias'=>$alias, 'id'=>$id, 'item_id'=>$item_id, 'appTable'=>$appTable );
	
	$data['headContent'] = $zh->getCardViewHeader($headParams);
	
	// Start body content
	
	$cardItem = $zh->getThNewLinesLayoutsItem($item_id);

	$rootPath = ROOT_PATH;
	
	$cardTmp = array(
					 'ID'						=>	array( 'type'=>'text', 		'field'=>'id', 				'params'=>array() ),
					 'Название линии'					=>	array( 'type'=>'text', 		'field'=>'block_name', 		'params'=>array() ),
					 'Этаж'			=>	array( 'type'=>'text', 		'field'=>'floor', 		'params'=>array() ),
					 'Название этажа'			=>	array( 'type'=>'text', 		'field'=>'floor_name', 		'params'=>array() ),
					 
					 'Свойства'			=>	array( 'type'=>'text', 		'field'=>'props', 		'params'=>array() ),
					 
					 'Публикация'				=>	array( 'type'=>'text', 		'field'=>'block', 			'params'=>array( 'replace'=>array('0'=>'Да', '1'=>'Нет') ) ),
					 'Планировки'			=>	array( 'type'=>'images',	'field'=>'layouts',			'params'=>array( 'path'=>RSF.'/split/files/new_th/', 'field'=>'source' ) ),
					 'Дата создания'			=>	array( 'type'=>'date', 		'field'=>'created', 		'params'=>array() ),
					 'Дата редактирования'		=>	array( 'type'=>'date', 		'field'=>'modified', 		'params'=>array() )
					 );

	$cardViewTableParams = array( 'cardItem'=>$cardItem, 'cardTmp'=>$cardTmp, 'rootPath'=>$rootPath );
	
	$cardViewTableStr = $zh->getCardViewTable($cardViewTableParams);
	
	// Join content
	
	$data['bodyContent'] .= "
		<div class='ipad-20' id='order_conteinter'>
			<h3>Детальный просмотр LINE LAYOUTS Townhouses #$item_id</h3>";
	
	$data['bodyContent'] .= $cardViewTableStr;
				
	$data['bodyContent'] .=	"
		</div>
	";

?>