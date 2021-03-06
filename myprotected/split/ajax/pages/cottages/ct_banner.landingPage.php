<?php 
	// Start header content
	$headParams = array( 'parent'=>$parent, 'alias'=>$alias, 'id'=>$id, 'appTable'=>$appTable );
	
	$data['headContent'] = $zh->getLandingHeader($headParams);
	
	// GET PAGE DATA
	
	$cardItem = $zh->getCTbanner();

	
	// Join Content
	
	$data['bodyContent'] = ""; // $filterFormStr;
	
	// new block
	
	$data['bodyContent'] .= "
		<div id='landCluster' class='animatedX'>
			<h3 class='new-line'>Редактирование секции <b>Баннер - Коттеджи</b></h3>
	";
	
		$rootPath = ROOT_PATH;
		
		$cardTmp = array(

			 'Заголовок'			=>	array( 'type'=>'area', 	'field'=>'caption', 'params'=>array( 'size'=>100, 'hold'=>'Заголовок' ) ),
			 'clear-0' => array('type' => 'clear'),
			 'Подзаголовок'			=>	array( 'type'=>'area', 	'field'=>'sub_caption', 'params'=>array( 'size'=>100, 'hold'=>'Подзаголовок' ) ),
			 'Описание'			=>	array( 'type'=>'area', 	'field'=>'details', 'params'=>array( 'size'=>100, 'hold'=>'Описание' ) ),
			 'Публикация'			=>	array( 'type'=>'block', 	'field'=>'block', 			'params'=>array( 'reverse'=>true ) ),
			 
			 
			 'Изображение'		=>	array( 'type'=>'image_mono', 'field'=>'filename', 		'params'=>array( 'path'=>RSF."/split/files/cottages/", 'appTable'=>$pageTable, 'id'=>1 ) ),
																										 
			 //'Публикация'		=>	array( 'type'=>'block', 	'field'=>'block', 		'params'=>array( 'reverse'=>true ) )
			 );
	
		$cardEditFormParams = array( 'cardItem'=>$cardItem, 'cardTmp'=>$cardTmp, 'rootPath'=>$rootPath, 'actionName'=>"editCTBanner", 'ajaxFolder'=>'edit', 'appTable'=>$pageTable );
		
		$cardEditFormStr = $zh->getCardEditForm($cardEditFormParams, true);
		
		$data['bodyContent'] .= $cardEditFormStr;
	
	$data['bodyContent'] .= "</div><!-- landCluster --><div class='divider'></div>";
	
	// end new block
	
?>