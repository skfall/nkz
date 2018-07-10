<?php 
	// Start header content

	$headParams = array( 'parent'=>$parent, 'alias'=>$alias, 'id'=>$id, 'item_id'=>$item_id, 'appTable'=>$appTable, 'type'=>'gall_h' );
	
	$data['headContent'] = $zh->getCardEditHeader($headParams);
	
	// Start body content
	
	$cardItem = $zh->getEventItem($item_id);
	$cardItem["type_name"] = $cardItem["type"] == 1 ? "Акция привязанная к планировке квартиры" : $cardItem["type"] == 2 ? "Акция привязанная к планировке таунхауса" : "";
	$layouts = $zh->getFreeLayouts($cardItem["type"]);

	$rootPath = ROOT_PATH;
	
	$cardTmp = array(
					 'Тип акции'	=>	array( 'type'=>'input', 	'field'=>'type_name', 		'params'=>array( 'size'=>50, 'hold'=>'Тип акции', 'onchange'=>"", "disabled" => true ) ),
					 'clear-ggg'				=>	array( 'type'=>'clear' ),
					 'Название'	=>	array( 'type'=>'input', 	'field'=>'name', 		'params'=>array( 'size'=>50, 'hold'=>'Название', 'onchange'=>"" ) ),
					 'Заголовок на сайте'	=>	array( 'type'=>'input', 	'field'=>'caption', 		'params'=>array( 'size'=>50, 'hold'=>'Заголовок на сайте', 'onchange'=>"" ) ),
					 'clear-0'				=>	array( 'type'=>'clear' ),

					 'Привязать акцию к существующей планировке'	=>	array( 'type'=>'select', 	'field'=>'layout_id', 		'params'=>array( 'list'=>$layouts, 
							 'fieldValue'=>'id', 
						 'fieldTitle'=>'layout_name', 
						 'currValue'=>$cardItem['ref_id'], 
						 'onChange'=>""
						 ) ),

					 'Дата остановки таймера'				=>	array( 'type'=>'date', 'field'=>'finish', 'params'=>array(  ) ),
					 
					 'clear-1'				=>	array( 'type'=>'clear' ),
					 
					 'Публикация'			=>	array( 'type'=>'block', 	'field'=>'block', 			'params'=>array( 'reverse'=>true ) ),
					 
					 );

	$cardEditFormParams = array( 'cardItem'=>$cardItem, 'cardTmp'=>$cardTmp, 'rootPath'=>$rootPath, 'actionName'=>"editEventNew", 'ajaxFolder'=>'edit', 'appTable'=>$appTable );
	
	$cardEditFormStr = $zh->getCardEditForm($cardEditFormParams);
	
	// Join content
	
	$data['bodyContent'] .= "
		<div class='ipad-20' id='order_conteinter'>
			<h3 class='new-line'>Форма редактирования акции #$item_id</h3>";
	
	$data['bodyContent'] .= $cardEditFormStr;
				
	$data['bodyContent'] .=	"
		</div>
	";

?>