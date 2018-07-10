<?php 
	// Start header content

	$headParams = array( 'parent'=>$parent, 'alias'=>$alias, 'id'=>$id, 'item_id'=>$item_id, 'appTable'=>$appTable, 'type'=>'global-settings' );
	
	$data['headContent'] = $zh->getCardEditHeader($headParams);
	
	// Start body content
	
	$cardItem = $zh->getSiteConfigs($item_id, $lpx);

	$langs = $zh->getAvailableLangs();
	$lpx_name = ($lpx ? $lpx : 'en');

	$cardTmp = array(


					 'Управление сайтом'	=>	array( 'type'=>'header'),
					 'Название сайта'		=>	array( 'type'=>'input', 	'field'=>'sitename', 			'params'=>array( 'size'=>35, 'hold'=>'Название сайта') ),

					 'Рабочее время'		=>	array( 'type'=>'input', 	'field'=>'work_time', 			'params'=>array( 'size'=>35, 'hold'=>'Название сайта') ),
	
					 'clear-0'				=>	array( 'type'=>'clear' ),
					 'Индексация'			=>	array( 'type'=>'block', 	'field'=>'index', 				'params'=>array( 'reverse'=>false ) ),

					'Контактная информация' => array('type' =>  'header'),
					'Email'		=>	array( 'type'=>'input', 	'field'=>'support_email', 			'params'=>array( 'size'=>35, 'hold'=>'') ),
					'Номер телефона 1'		=>	array( 'type'=>'input', 	'field'=>'phone_number', 			'params'=>array( 'size'=>35, 'hold'=>'') ),
					'Номер телефона 2'		=>	array( 'type'=>'input', 	'field'=>'phone_number2', 			'params'=>array( 'size'=>35, 'hold'=>'') ),

					'Ссылка на Facebook'		=>	array( 'type'=>'input', 	'field'=>'fb_link', 			'params'=>array( 'size'=>35, 'hold'=>'') ),

					'clear-1'				=>	array( 'type'=>'clear' ),

					'Номер телефона (договорной отдел))'		=>	array( 'type'=>'input', 	'field'=>'partnership_phone', 			'params'=>array( 'size'=>35, 'hold'=>'') ),
					'Номер телефона (гарячая линия))'		=>	array( 'type'=>'input', 	'field'=>'hotline_phone', 			'params'=>array( 'size'=>35, 'hold'=>'') ),

					'clear-3'				=>	array( 'type'=>'clear' ),

					'Адрес'		=>	array( 'type'=>'input', 	'field'=>'address', 			'params'=>array( 'size'=>35, 'hold'=>'Адрес') ),
					'Адрес центрального офиса'		=>	array( 'type'=>'input', 	'field'=>'office_address', 			'params'=>array( 'size'=>35, 'hold'=>'Адрес центрального офиса') ),



					 'Мета-теги по умолчанию'	=>	array( 'type'=>'header'),
					 'Title'				=>	array( 'type'=>'input', 	'field'=>'meta_title', 			'params'=>array( 'size'=>50, 'hold'=>'Title', 'onchange'=>"" ) ),
					 
					 'Keywords'				=>	array( 'type'=>'input', 	'field'=>'meta_keys', 			'params'=>array( 'size'=>50, 'hold'=>'Keywords', 'onchange'=>"" ) ),
					 
					 'Description'			=>	array( 'type'=>'area', 		'field'=>'meta_desc', 			'params'=>array( 'size'=>100, 'hold'=>'Description' ) ),


					 'JavaScript code'	=>	array( 'type'=>'header'),
					 'Аеред закрытием тега </head>'				=>	array( 'type'=>'area', 	'field'=>'afterHead', 			'params'=>array( 'size'=>100, 'hold'=>'<script>some code...</script>', 'onchange'=>"" ) ),
					 'перед закрытием тега </body>'				=>	array( 'type'=>'area', 	'field'=>'afterBody', 			'params'=>array( 'size'=>100, 'hold'=>'<script>some code...</script>', 'onchange'=>"" ) )

					 );

	$cardEditFormParams = array( 'cardItem'=>$cardItem, 'cardTmp'=>$cardTmp, 'rootPath'=>$rootPath, 'actionName'=>"editSiteConfig", 'ajaxFolder'=>'edit', 'appTable'=>$appTable, 'lpx'=>$lpx, 'headParams'=>$headParams, 'langs'=>$langs );
	
	$cardEditFormStr = $zh->getCardEditForm($cardEditFormParams);
	
	// Join content
	
	$data['bodyContent'] .= "
		<div class='ipad-20' id='order_conteinter'>
			<h3 class='new-line'>Глобальные настройки сайта (режим редактирования)</h3>";
	
	$data['bodyContent'] .= $cardEditFormStr;
				
	$data['bodyContent'] .=	"
		</div>
	";

?>