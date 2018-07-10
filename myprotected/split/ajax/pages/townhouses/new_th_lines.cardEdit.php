<?php 
	// Start header content

	$headParams = array( 'parent'=>$parent, 'alias'=>$alias, 'id'=>$id, 'item_id'=>$item_id, 'appTable'=>$appTable );
	
	$data['headContent'] = $zh->getCardEditHeader($headParams);
	
	// Start body content
	
	$cardItem = $zh->getThNewLinesItem($item_id);

	$rootPath = ROOT_PATH;
	
	$cardTmp = array(
					 'Название'				=>	array( 'type'=>'input', 		'field'=>'name', 		'params'=>array( 'size'=>100, 'hold'=>'Name' ) ),
					 
					 'clear-0'				=>	array( 'type'=>'clear' ),

					 'Строка 1'				=>	array( 'type'=>'input', 		'field'=>'row_1', 		'params'=>array( 'size'=>100, 'hold'=>'свойство*значение' ) ),
					 'Строка 2'				=>	array( 'type'=>'input', 		'field'=>'row_2', 		'params'=>array( 'size'=>100, 'hold'=>'свойство*значение' ) ),
					 'Строка 3'				=>	array( 'type'=>'input', 		'field'=>'row_3', 		'params'=>array( 'size'=>100, 'hold'=>'свойство*значение' ) ),
					 'Строка 4'				=>	array( 'type'=>'input', 		'field'=>'row_4', 		'params'=>array( 'size'=>100, 'hold'=>'свойство*значение' ) ),
					 
					 'clear-1'				=>	array( 'type'=>'clear' ),
					 
					 'Позиция'				=>	array( 'type'=>'number', 	'field'=>'pos', 			'params'=>array( 'size'=>100, 'hold'=>'Position' ) ),
					  
					 'clear-2'				=>	array( 'type'=>'clear' ),
					 																							 
					 'Публикация'			=>	array( 'type'=>'block', 	'field'=>'block', 			'params'=>array( 'reverse'=>true ) ),
					 
					 'Превью'			=>	array( 'type'=>'image_mono','field'=>'preview', 		'params'=>array( 'path'=>RSF."/split/files/new_th/", 'appTable'=>$appTable, 'id'=>$item_id ) ),

					 
					 );

	$cardEditFormParams = array( 'cardItem'=>$cardItem, 'cardTmp'=>$cardTmp, 'rootPath'=>$rootPath, 'actionName'=>"editNewThLine", 'ajaxFolder'=>'edit', 'appTable'=>$appTable );
	
	$cardEditFormStr = $zh->getCardEditForm($cardEditFormParams);
	
	// Join content
	
	$data['bodyContent'] .= "
		<div class='ipad-20' id='order_conteinter'>
			<h3 class='new-line'>Форма редактирования LINES Townhouses #$item_id</h3>";
	
	$data['bodyContent'] .= $cardEditFormStr;
				
	$data['bodyContent'] .=	"
		</div>
	";

?>