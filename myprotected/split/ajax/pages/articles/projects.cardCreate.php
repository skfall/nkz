<?php 
	// Start header content

	$item_id = -1;
	$headParams = array( 'parent'=>$parent, 'alias'=>$alias, 'id'=>$id, 'item_id'=>$item_id, 'appTable'=>$appTable );
	
	$data['headContent'] = $zh->getCardCreateHeader($headParams);
	
	// Start body content
	
	$cardItem = $zh->getProjectsItem($item_id);
	
	$cardTmp = array(
					'Название'			=>	array( 'type'=>'input', 	'field'=>'name', 			'params'=>array('hold'=>'Название', 'size'=>100, 'onchange' => 'change_alias();' ) ),
					'clear-0'				=>	array( 'type'=>'clear' ),
					'Алиас'			=>	array( 'type'=>'input', 	'field'=>'alias', 			'params'=>array('hold'=>'Название', 'size'=>100 ) ),

					'clear-1'				=>	array( 'type'=>'clear' ),
					'Местоположение'			=>	array( 'type'=>'input', 	'field'=>'location', 			'params'=>array('hold'=>'Местоположение', 'size'=>100 ) ),
					'Особенности'			=>	array( 'type'=>'area', 	'field'=>'features', 			'params'=>array('hold'=>'Строка 1;
Строка 2;', 'size'=>100 ) ),
					'Ссылка'			=>	array( 'type'=>'input', 	'field'=>'link', 			'params'=>array('hold'=>'Ссылка', 'size'=>100 ) ),
					'Очередность вывода'			=>	array( 'type'=>'number', 	'field'=>'order_id', 			'params'=>array('hold'=>'Ссылка', 'size'=>100 ) ),
					'clear-2'				=>	array( 'type'=>'clear' ),
					
					'Открывать в новом окне'			=>	array( 'type'=>'block', 	'field'=>'target', 			'params'=>array( 'reverse'=>false ) ),
					'Публикация'			=>	array( 'type'=>'block', 	'field'=>'block', 			'params'=>array( 'reverse'=>true ) ),

					'Изображения'				=>	array( 'type'=>'header' ),
					 'Логотип'		=>	array( 'type'=>'image_mono', 'field'=>'logo', 		'params'=>array( 'path'=>RSF."/split/files/projects/", 'appTable'=>$pageTable, 'id'=>1 ) ),
					 'Изображение'		=>	array( 'type'=>'image_mono', 'field'=>'source', 		'params'=>array( 'path'=>RSF."/split/files/projects/", 'appTable'=>$pageTable, 'id'=>1 ) ),
					 
					 );

	$cardEditFormParams = array( 'cardItem'=>$cardItem, 'cardTmp'=>$cardTmp, 'rootPath'=>$rootPath, 'actionName'=>"createProject", 'ajaxFolder'=>'create', 'appTable'=>$appTable );
	
	$cardEditFormStr = $zh->getCardEditForm($cardEditFormParams);
	
	// Join content
	
	$data['bodyContent'] .= "
		<div class='ipad-20' id='order_conteinter'>
			<h3 class='new-line'>Форма создания проекта</h3>";
	
	$data['bodyContent'] .= $cardEditFormStr;
				
	$data['bodyContent'] .=	"
		</div>
	";

?>