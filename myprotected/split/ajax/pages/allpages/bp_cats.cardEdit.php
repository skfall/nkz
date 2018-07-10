<?php 
	// Start header content

	$headParams = array( 'parent'=>$parent, 'alias'=>$alias, 'id'=>$id, 'item_id'=>$item_id, 'appTable'=>$appTable );
	
	$data['headContent'] = $zh->getCardEditHeader($headParams);

	
	$cardItem = $zh->getBpCatsItem($item_id);


	$rootPath = ROOT_PATH;
	
	$cardTmp = array(
					'Название'			=>	array( 'type'=>'input', 	'field'=>'name', 			'params'=>array('hold'=>'Название', 'size'=>100, 'onchange' => 'change_alias();' ) ),
					'Алиас'			=>	array( 'type'=>'input', 	'field'=>'alias', 'params'=>array( 'size'=>100, 'hold'=>'Алиас' ) ),
					'Строка под записями'			=>	array( 'type'=>'input', 	'field'=>'price_from', 'params'=>array( 'size'=>100, 'hold'=>'Строка под записями' ) ),
					'Ссылка под записями'			=>	array( 'type'=>'input', 	'field'=>'link', 'params'=>array( 'size'=>100, 'hold'=>'Ссылка под записями' ) ),
					'clear-0'				=>	array( 'type'=>'clear' ),
					
					 );

	$cardEditFormParams = array( 'cardItem'=>$cardItem, 'cardTmp'=>$cardTmp, 'rootPath'=>$rootPath, 'actionName'=>"editBpCat", 'ajaxFolder'=>'edit', 'appTable'=>$appTable );
	
	$cardEditFormStr = $zh->getCardEditForm($cardEditFormParams);
	
	// Join content
	
	$data['bodyContent'] .= "
		<div class='ipad-20' id='order_conteinter'>
			<h3 class='new-line'>Форма редактирования категории #$item_id</h3>";
	
	$data['bodyContent'] .= $cardEditFormStr;
				
	$data['bodyContent'] .=	"
		</div>
	";

?>