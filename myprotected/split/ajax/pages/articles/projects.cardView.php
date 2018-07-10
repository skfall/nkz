<?php 
	// Start header content

	$headParams = array( 'parent'=>$parent, 'alias'=>$alias, 'id'=>$id, 'item_id'=>$item_id, 'appTable'=>$appTable );
	
	$data['headContent'] = $zh->getCardViewHeader($headParams);
	
	// Start body content
	
	$cardItem = $zh->getProjectsItem($item_id);
	$cardItem['images'] = $zh->getProjectsItem($item_id);

	$cardTmp = array(
					 'ID'						=>	array( 'type'=>'text', 		'field'=>'id', 				'params'=>array() ),
					 'Название'					=>	array( 'type'=>'text', 		'field'=>'name', 		'params'=>array() ),
					 'Алиас'					=>	array( 'type'=>'text', 		'field'=>'alias', 		'params'=>array() ),
					 'Местоположение'					=>	array( 'type'=>'text', 		'field'=>'location', 		'params'=>array() ),

					 'Особенности'					=>	array( 'type'=>'text', 		'field'=>'features', 		'params'=>array() ),
					 'Ссылка'					=>	array( 'type'=>'text', 		'field'=>'link', 		'params'=>array() ),

					 'Очередность вывода'					=>	array( 'type'=>'text', 		'field'=>'order_id', 		'params'=>array() ),

					 'Публикация'				=>	array( 'type'=>'text', 		'field'=>'block', 			'params'=>array( 'replace'=>array('0'=>'Да', '1'=>'Нет') ) ),
					 'Дата создания'					=>	array( 'type'=>'text', 		'field'=>'created', 		'params'=>array() ),
					 'Дата редактирования'					=>	array( 'type'=>'text', 		'field'=>'modified', 		'params'=>array() ),




					 'Лого'			=>	array( 'type'=>'image',	'field'=>'logo',			'params'=>array( 'path'=>RSF.'/split/files/projects/', 'field'=>'logo' ) ),
					 'Изображение'			=>	array( 'type'=>'image',	'field'=>'source',			'params'=>array( 'path'=>RSF.'/split/files/projects/', 'field'=>'source' ) ),
					 );

	$cardViewTableParams = array( 'cardItem'=>$cardItem, 'cardTmp'=>$cardTmp, 'rootPath'=>$rootPath );
	
	$cardViewTableStr = $zh->getCardViewTable($cardViewTableParams);
	
	// Join content
	
	$data['bodyContent'] .= "
		<div class='ipad-20' id='order_conteinter'>
			<h3>Детальный просмотр проекта #$item_id</h3>";
	
	$data['bodyContent'] .= $cardViewTableStr;
				
	$data['bodyContent'] .=	"
		</div>
	";

?>