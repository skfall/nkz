<?php 
	// Start header content

	$headParams = array( 'parent'=>$parent, 'alias'=>$alias, 'id'=>$id, 'item_id'=>$item_id, 'appTable'=>$appTable );
	
	$data['headContent'] = $zh->getCardViewHeader($headParams);
	
	// Start body content
	
	$cardItem = $zh->getUpdThayout($item_id);


	$rootPath = ROOT_PATH;
	
	$cardTmp = array(
					 'ID'						=>	array( 'type'=>'text', 		'field'=>'id', 				'params'=>array() ),
					 'Заголовок'					=>	array( 'type'=>'text', 		'field'=>'caption', 		'params'=>array() ),
					 'Описание'					=>	array( 'type'=>'text', 		'field'=>'cottage_desc', 		'params'=>array() ),
					 'В стоимость входит'					=>	array( 'type'=>'text', 		'field'=>'features', 		'params'=>array() ),
					 'Свойства'					=>	array( 'type'=>'text', 		'field'=>'properties', 		'params'=>array() ),
					 'Цена'					=>	array( 'type'=>'text', 		'field'=>'price', 		'params'=>array() ),
					 'Площадь'					=>	array( 'type'=>'text', 		'field'=>'area', 		'params'=>array() ),
					 'Порядковый номер'			=>	array( 'type'=>'text', 		'field'=>'pos', 		'params'=>array() ),
					 'Изображения'			=>	array( 'type'=>'images',	'field'=>'layouts',			'params'=>array( 'path'=>RSF.'/split/files/townhouses/', 'field'=>'filename' ) ),
					 'Публикация'				=>	array( 'type'=>'text', 		'field'=>'block', 			'params'=>array( 'replace'=>array('0'=>'Да', '1'=>'Нет') ) ),
					 'Дата создания'			=>	array( 'type'=>'date', 		'field'=>'created', 		'params'=>array() ),
					 'Дата редактирования'		=>	array( 'type'=>'date', 		'field'=>'modified', 		'params'=>array() )
					 );

	$cardViewTableParams = array( 'cardItem'=>$cardItem, 'cardTmp'=>$cardTmp, 'rootPath'=>$rootPath );
	
	$cardViewTableStr = $zh->getCardViewTable($cardViewTableParams);
	
	// Join content
	
	$data['bodyContent'] .= "
		<div class='ipad-20' id='order_conteinter'>
			<h3>Детальный просмотр таунхауса #$item_id</h3>";
	
	$data['bodyContent'] .= $cardViewTableStr;
				
	$data['bodyContent'] .=	"
		</div>
	";

?>