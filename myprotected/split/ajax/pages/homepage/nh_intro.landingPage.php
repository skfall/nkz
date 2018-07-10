<?php 
	// Start header content
	$headParams = array( 'parent'=>$parent, 'alias'=>$alias, 'id'=>$id, 'appTable'=>$appTable );
	
	$data['headContent'] = $zh->getLandingHeader($headParams);
	
	// GET PAGE DATA
	
	$cardItem = $zh->getNhIntro();
	
	
	// Join Content
	
	$data['bodyContent'] = ""; // $filterFormStr;
	
	// new block
	
	$data['bodyContent'] .= "
		<div id='landCluster' class='animatedX'>
			<h3 class='new-line'>Редактирование секции <b>Добро пожаловать</b></h3>
	";
	
		$rootPath = ROOT_PATH;
		
		$cardTmp = array(
			'Заголовок'			=>	array( 'type'=>'input', 	'field'=>'caption', 'params'=>array( 'size'=>100, 'hold'=>'Заголовок' ) ),

			'Описание'			=>	array( 'type'=>'redactor', 	'field'=>'content', 'params'=>array( 'size'=>100, 'hold'=>'Описание' ) ),
			
												 
			 'Публикация'		=>	array( 'type'=>'block', 	'field'=>'block', 		'params'=>array( 'reverse'=>true ) ),

			 'Изображение'			=>	array( 'type'=>'image_mono','field'=>'image', 		'params'=>array( 'path'=>RSF."/split/files/new_home/", 'appTable'=>$appTable, 'id'=>$item_id ) ),
			 );
	
		$cardEditFormParams = array( 'cardItem'=>$cardItem, 'cardTmp'=>$cardTmp, 'rootPath'=>$rootPath, 'actionName'=>"editNhIntro", 'ajaxFolder'=>'edit', 'appTable'=>$pageTable );
		
		$cardEditFormStr = $zh->getCardEditForm($cardEditFormParams, true);
		
		$data['bodyContent'] .= $cardEditFormStr;
	
	$data['bodyContent'] .= "</div><!-- landCluster --><div class='divider'></div>";
	
	// end new block
	
?>