<?php 
	// Start header content

	$headParams = array( 'parent'=>$parent, 'alias'=>$alias, 'id'=>$id, 'item_id'=>$item_id, 'appTable'=>$appTable );
	
	$data['headContent'] = $zh->getCardViewHeader($headParams);
	
	// Start body content
	
	$cardItem = $zh->getThBlocksItem($item_id);
	$cardItem['images'] = $zh->getThBlockImages($item_id);

	$cardTmp = array(
					 'ID'						=>	array( 'type'=>'text', 		'field'=>'id', 				'params'=>array() ),
					 'Название'					=>	array( 'type'=>'text', 		'field'=>'name', 		'params'=>array() ),
					 'Особенности'					=>	array( 'type'=>'text', 		'field'=>'features', 		'params'=>array() ),
					 'Статистика'					=>	array( 'type'=>'text', 		'field'=>'stats', 		'params'=>array() ),
					 'Публикация'				=>	array( 'type'=>'text', 		'field'=>'block', 			'params'=>array( 'replace'=>array('0'=>'Да', '1'=>'Нет') ) ),
					 'Дата редактирования'					=>	array( 'type'=>'text', 		'field'=>'modified', 		'params'=>array() ),
					 
					 'Изображения'			=>	array( 'type'=>'images',	'field'=>'images',			'params'=>array( 'path'=>RSF.'/split/files/townhouses/', 'field'=>'source' ) ),
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