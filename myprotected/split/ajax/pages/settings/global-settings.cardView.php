<?php 
	// Start header content

	$headParams = array( 'parent'=>$parent, 'alias'=>$alias, 'id'=>$id, 'item_id'=>$item_id, 'appTable'=>$appTable, 'type'=>'global-settings' );
	$data['headContent'] = $zh->getCardViewHeader($headParams, $lpx);
	$pref = ($lpx ? $lpx.'_' : '');
	// Start body content
	
	$cardItem = $zh->getSiteConfigs($item_id, $lpx);

	$langs = $zh->getAvailableLangs();


	$rootPath = ROOT_PATH;
	
	$cardTmp = array(
					 'Название сайта'		=>	array( 'type'=>'text', 		'field'=>'sitename', 		'params'=>array() ),

					 'Email'		=>	array( 'type'=>'text', 		'field'=>'support_email', 		'params'=>array() ),
					 'Телефон 1'		=>	array( 'type'=>'text', 		'field'=>'phone_number', 		'params'=>array() ),
					 'Телефон 2'		=>	array( 'type'=>'text', 		'field'=>'phone_number2', 		'params'=>array() ),
					 'Адрес'		=>	array( 'type'=>'text', 		'field'=>'address', 		'params'=>array() ),
					 'Адрес офиса'		=>	array( 'type'=>'text', 		'field'=>'office_address', 		'params'=>array() ),
					 'Ссылка на Facebook'		=>	array( 'type'=>'text', 		'field'=>'fb_link', 		'params'=>array() ),
					 'Рабочее время'		=>	array( 'type'=>'text', 		'field'=>'work_time', 		'params'=>array() ),
					 'Индексация сайта в поисковых системах'		=>	array( 'type'=>'text', 		'field'=>'index', 		'params'=>array( 'replace'=>array('0'=>'Нет', '1'=>'Да') ) ),
					 'Тел (договорной отдел)'		=>	array( 'type'=>'text', 		'field'=>'partnership_phone', 		'params'=>array() ),
					 'Тел (гарячая линия)'		=>	array( 'type'=>'text', 		'field'=>'hotline_phone', 		'params'=>array() ),
					 
					 'Количество элементов в пагинации'		=>	array( 'type'=>'text', 		'field'=>'projects_pag', 		'params'=>array() ),
					 
					 
					 'Meta title '			=>	array( 'type'=>'text', 		'field'=>$pref.'meta_title', 		'params'=>array() ),
					 'Meta keywords '		=>	array( 'type'=>'text', 		'field'=>$pref.'meta_keys', 		'params'=>array() ),
					 'Meta description '		=>	array( 'type'=>'text', 		'field'=>$pref.'meta_desc', 		'params'=>array() ),

					 'Дата редактирования'	=>	array( 'type'=>'date', 		'field'=>'dateModify', 		'params'=>array() ),


					 'JS код перед закрытием тега </head>'		=>	array( 'type'=>'text', 		'field'=>'afterHead', 		'params'=>array() ),
					 'JS код перед закрытием тега </body>'		=>	array( 'type'=>'text', 		'field'=>'afterBody', 		'params'=>array() ),
					 );

	$cardViewTableParams = array( 'cardItem'=>$cardItem, 'cardTmp'=>$cardTmp, 'rootPath'=>$rootPath, 'lpx'=>$lpx, 'headParams'=>$headParams, 'langs'=>$langs );
	
	$cardViewTableStr = $zh->getCardViewTable($cardViewTableParams);
	
	// Join content
	
	$data['bodyContent'] .= "
		<div class='ipad-20' id='order_conteinter'>
			<h3>Глобальные настройки сайта (режим просмотра)</h3>";
	
	$data['bodyContent'] .= $cardViewTableStr;
				
	$data['bodyContent'] .=	"
		</div>
	";

?>