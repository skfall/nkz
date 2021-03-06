<?php 
	// Start header content

	$headParams = array( 'parent'=>$parent, 'alias'=>$alias, 'id'=>$id, 'item_id'=>$item_id, 'appTable'=>$appTable, 'type'=>'serv_orders_view' );
	
	$data['headContent'] = $zh->getCardViewHeader($headParams);
	
	// Start body content
	
	$cardItem = $zh->getBpQuestionsItem($item_id);

	$rootPath = "../../../../..";
	
	$cardTmp = array(
					 'ID'						=>	array( 'type'=>'text', 		'field'=>'id', 				'params'=>array() ),
					 'Имя'				=>	array('type'=>'text',		'field'=>'name'),
					 'Контакт'				=>	array('type'=>'text',		'field'=>'contact'),
					 'Категория вопроса'				=>	array('type'=>'text',		'field'=>'cat'),
					 'Вопрос'				=>	array('type'=>'text',		'field'=>'message'),
					 'Сообщение'				=>	array('type'=>'text',		'field'=>'message'),
					  'Дата'				=>	array('type'=>'text',		'field'=>'created'),
					 /*'Phone'			=>	array( 'type'=>'text', 		'field'=>'phone', 		'params'=>array() ),
					 
					 'Дата редактирования'		=>	array( 'type'=>'date', 		'field'=>'dateModify', 		'params'=>array() )*/
					 );

	$cardViewTableParams = array( 'cardItem'=>$cardItem, 'cardTmp'=>$cardTmp, 'rootPath'=>$rootPath );
	
	$cardViewTableStr = $zh->getCardViewTable($cardViewTableParams);
	
	// Join content
	
	$data['bodyContent'] .= "
		<div class='ipad-20' id='order_conteinter'>
			<h3>Детальный просмотр заявки #$item_id</h3>";
	
	$data['bodyContent'] .= $cardViewTableStr;
				
	$data['bodyContent'] .=	"
		</div>
	";

?>