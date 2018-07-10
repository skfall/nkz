<?php 
	// Start header content

	$item_id = -1;
	$headParams = array( 'parent'=>$parent, 'alias'=>$alias, 'id'=>$id, 'item_id'=>$item_id, 'appTable'=>$appTable );
	
	$data['headContent'] = $zh->getCardCreateHeader($headParams);
	

	$cardItem = $zh->getHomeEnvItemsItem($item_id);
	$parents = $zh->getHomeEnvParents();
	
	$cardTmp = array(
					'Заголовок'			=>	array( 'type'=>'input', 	'field'=>'caption', 			'params'=>array('hold'=>'Заголовок', 'size'=>50) ),

					'Таб'	=>	array( 'type'=>'select', 	'field'=>'ref', 		'params'=>array( 'list'=>$parents, 
							 'fieldValue'=>'id', 
						 'fieldTitle'=>'name', 
						 'currValue'=>$cardItem['ref'], 
						 'onChange'=>""
						 ) ),
					'clear-1'				=>	array( 'type'=>'clear' ),
					'Время пешком'			=>	array( 'type'=>'number', 	'field'=>'time_walk', 			'params'=>array('hold'=>'Время пешком', 'size'=>50) ),
					'Время на машине'			=>	array( 'type'=>'input', 	'field'=>'time_car', 			'params'=>array('hold'=>'Время на машине', 'size'=>50) ),
					'Очередность вывода'			=>	array( 'type'=>'number', 	'field'=>'order_id', 			'params'=>array('hold'=>'Очередность вывода', 'size'=>50) ),
					'clear-0'				=>	array( 'type'=>'clear' ),

					'Публикация'			=>	array( 'type'=>'block', 	'field'=>'block', 			'params'=>array( 'reverse'=>true ) ),
					 
					 );

	$cardEditFormParams = array( 'cardItem'=>$cardItem, 'cardTmp'=>$cardTmp, 'rootPath'=>$rootPath, 'actionName'=>"createHomeEI", 'ajaxFolder'=>'create', 'appTable'=>$appTable );
	
	$cardEditFormStr = $zh->getCardEditForm($cardEditFormParams);
	
	// Join content
	
	$data['bodyContent'] .= "
		<div class='ipad-20' id='order_conteinter'>
			<h3 class='new-line'>Форма создания элемента окружения</h3>";
	
	$data['bodyContent'] .= $cardEditFormStr;
				
	$data['bodyContent'] .=	"
		</div>
	";

?>