<?php 
	// Start header content

	$headParams = array( 'parent'=>$parent, 'alias'=>$alias, 'id'=>$id, 'item_id'=>$item_id, 'appTable'=>$appTable );
	
	$data['headContent'] = $zh->getCardViewHeader($headParams, $lpx);
	$pref = ($lpx ? $lpx.'_' : '');
	
	// Start body content
	
	$cardItem = $zh->getArticleItem($item_id, $lpx);

	$langs = $zh->getAvailableLangs();

	$rootPath = ROOT_PATH;
	
	$cardTmp = array(
					 'ID'					=>	array( 'type'=>'text', 		'field'=>'id', 				'params'=>array() ),
					 'Название '.$lpx				=>	array( 'type'=>'text', 		'field'=>$pref.'name', 			'params'=>array() ),
					 
					 'Категория'			=>	array( 'type'=>'text', 		'field'=>'cat_name', 		'params'=>array() ),
					 //'Изображение'			=>	array( 'type'=>'image',		'field'=>'filename',		'params'=>array( 'path'=>RSF.'/split/files/banners/' ) ),
					 'Алиас'				=>	array( 'type'=>'text', 		'field'=>'alias', 			'params'=>array() ),
					 'Публикация'			=>	array( 'type'=>'text', 		'field'=>'block', 			'params'=>array( 'replace'=>array('0'=>'Да', '1'=>'Нет') ) ),
					 'В категории "Популярные"?'			=>	array( 'type'=>'text', 		'field'=>'popular', 			'params'=>array( 'replace'=>array('1'=>'Да', '0'=>'Нет') ) ),
					 'App Store'			=>	array( 'type'=>'text', 		'field'=>'app_store', 			'params'=>array()),
					 'Google Play'			=>	array( 'type'=>'text', 		'field'=>'google_play', 			'params'=>array()),
					 'PC'					=>	array( 'type'=>'text', 		'field'=>'pc', 			'params'=>array()),
					 'Macintosh'			=>	array( 'type'=>'text', 		'field'=>'mac', 			'params'=>array()),

					 'Содержание '.$lpx		=>	array( 'type'=>'text', 		'field'=>$pref.'content', 		'params'=>array() ),
					 'Дата создания'		=>	array( 'type'=>'date', 		'field'=>'dateCreate', 		'params'=>array() ),
					 'Дата редактирования'	=>	array( 'type'=>'date', 		'field'=>'dateModify', 		'params'=>array() ),

					 'Изображение Превью'				=>	array( 'type'=>'image',		'field'=>'fl_name_preview',			'params'=>array( 'path'=>RSF.'/split/files/images/' ) ),
					 'Баннер'				=>	array( 'type'=>'image',		'field'=>'fl_name_banner',			'params'=>array( 'path'=>RSF.'/split/files/images/' ) ),
					 'Верхнее изображение'				=>	array( 'type'=>'image',		'field'=>'fl_name_top_img',			'params'=>array( 'path'=>RSF.'/split/files/images/' ) ),
					 'Нижнее изображение'				=>	array( 'type'=>'image',		'field'=>'fl_name_bot_img',			'params'=>array( 'path'=>RSF.'/split/files/images/' ) ),
					 'Изображение модального окна'				=>	array( 'type'=>'image',		'field'=>'fl_name_modal',			'params'=>array( 'path'=>RSF.'/split/files/images/' ) )
					 );

	$cardViewTableParams = array( 'cardItem'=>$cardItem, 'cardTmp'=>$cardTmp, 'rootPath'=>$rootPath, 'lpx'=>$lpx, 'headParams'=>$headParams, 'langs'=>$langs );
	
	$cardViewTableStr = $zh->getCardViewTable($cardViewTableParams);
	
	// Join content
	
	$data['bodyContent'] .= "
		<div class='ipad-20' id='order_conteinter'>
			<h3>Детальный просмотр материала #$item_id</h3>";
	
	$data['bodyContent'] .= $cardViewTableStr;
				
	$data['bodyContent'] .=	"
		</div>
	";

?>