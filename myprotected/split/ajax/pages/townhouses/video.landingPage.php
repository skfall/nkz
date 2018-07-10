<?php 
	// Start header content
	$headParams = array( 'parent'=>$parent, 'alias'=>$alias, 'id'=>$id, 'appTable'=>$appTable );
	
	$data['headContent'] = $zh->getLandingHeader($headParams);
	
	// GET PAGE DATA
	
	$cardItem = $zh->getThVideo();

	
	// Join Content
	
	$data['bodyContent'] = ""; // $filterFormStr;
	
	// new block
	
	$data['bodyContent'] .= "
		<div id='landCluster' class='animatedX'>
			<h3 class='new-line'>Редактирование секции <b>Видео</b></h3>
	";
	
		$rootPath = ROOT_PATH;
		
		$cardTmp = array(

			 'Заголовок'			=>	array( 'type'=>'area', 	'field'=>'caption', 'params'=>array( 'size'=>100, 'hold'=>'Заголовок' ) ),
			 'clear-0' => array('type' => 'clear'),

			 'Таймкод 1'			=>	array( 'type'=>'number', 	'field'=>'time1', 'params'=>array( 'size'=>30, 'hold'=>'Таймкод 1' ) ),
			 'Таймкод 2'			=>	array( 'type'=>'number', 	'field'=>'time2', 'params'=>array( 'size'=>30, 'hold'=>'Таймкод 2' ) ),
			 'Таймкод 3'			=>	array( 'type'=>'number', 	'field'=>'time3', 'params'=>array( 'size'=>30, 'hold'=>'Таймкод 3' ) ),
			 'Таймкод 4'			=>	array( 'type'=>'number', 	'field'=>'time4', 'params'=>array( 'size'=>30, 'hold'=>'Таймкод 4' ) ),
			 'Таймкод 5'			=>	array( 'type'=>'number', 	'field'=>'time5', 'params'=>array( 'size'=>30, 'hold'=>'Таймкод 5' ) ),
			 
			 'clear-1' => array('type' => 'clear'),

			 'Заголовок видео 1'			=>	array( 'type'=>'input', 	'field'=>'name1', 'params'=>array( 'size'=>20, 'hold'=>'Заголовок видео 1' ) ),
			 'Заголовок видео 2'			=>	array( 'type'=>'input', 	'field'=>'name2', 'params'=>array( 'size'=>20, 'hold'=>'Заголовок видео 2' ) ),
			 'Заголовок видео 3'			=>	array( 'type'=>'input', 	'field'=>'name3', 'params'=>array( 'size'=>20, 'hold'=>'Заголовок видео 3' ) ),
			 'Заголовок видео 4'			=>	array( 'type'=>'input', 	'field'=>'name4', 'params'=>array( 'size'=>20, 'hold'=>'Заголовок видео 4' ) ),
			 'Заголовок видео 5'			=>	array( 'type'=>'input', 	'field'=>'name5', 'params'=>array( 'size'=>20, 'hold'=>'Заголовок видео 5' ) ),

			 'Публикация'			=>	array( 'type'=>'block', 	'field'=>'block', 			'params'=>array( 'reverse'=>true ) ),
			 
			 
			 'Изображение'		=>	array( 'type'=>'image_mono', 'field'=>'poster', 		'params'=>array( 'path'=>RSF."/split/files/new_th/", 'appTable'=>$pageTable, 'id'=>1 ) ),
			 'Видео'		=>	array( 'type'=>'image_mono', 'field'=>'video', 		'params'=>array( 'path'=>RSF."/split/files/new_th/", 'appTable'=>$pageTable, 'id'=>1 ) ),
																										 
			 //'Публикация'		=>	array( 'type'=>'block', 	'field'=>'block', 		'params'=>array( 'reverse'=>true ) )
			 );
	
		$cardEditFormParams = array( 'cardItem'=>$cardItem, 'cardTmp'=>$cardTmp, 'rootPath'=>$rootPath, 'actionName'=>"editThVideo", 'ajaxFolder'=>'edit', 'appTable'=>$pageTable );
		
		$cardEditFormStr = $zh->getCardEditForm($cardEditFormParams, true);
		
		$data['bodyContent'] .= $cardEditFormStr;
	
	$data['bodyContent'] .= "</div><!-- landCluster --><div class='divider'></div>";
	
	// end new block
	
?>