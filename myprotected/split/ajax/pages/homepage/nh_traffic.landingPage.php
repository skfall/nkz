<?php 
	// Start header content
	$headParams = array( 'parent'=>$parent, 'alias'=>$alias, 'id'=>$id, 'appTable'=>$appTable );
	
	$data['headContent'] = $zh->getLandingHeader($headParams);
	
	// GET PAGE DATA
	
	$cardItem = $zh->getNhTraffic();
	
	
	// Join Content
	
	$data['bodyContent'] = ""; // $filterFormStr;
	
	// new block
	
	$data['bodyContent'] .= "
		<div id='landCluster' class='animatedX'>
			<h3 class='new-line'>Редактирование секции <b>Пробки</b></h3>
	";
	
		$rootPath = ROOT_PATH;
		
		$cardTmp = array(
			'Заголовок'			=>	array( 'type'=>'input', 	'field'=>'caption', 'params'=>array( 'size'=>100, 'hold'=>'Заголовок' ) ),
			'Подзаголовок'			=>	array( 'type'=>'input', 	'field'=>'sub_caption', 'params'=>array( 'size'=>100, 'hold'=>'Подзаголовок' ) ),

			'Описание'			=>	array( 'type'=>'area', 	'field'=>'description', 'params'=>array( 'size'=>100, 'hold'=>'Описание' ) ),

			'Развозка'			=>	array( 'type'=>'area', 	'field'=>'notification', 'params'=>array( 'size'=>100, 'hold'=>'Развозка' ) ),

			'Публикация'		=>	array( 'type'=>'block', 	'field'=>'block', 		'params'=>array( 'reverse'=>true ) ),


			'clear0' => array('type' => 'clear'),

			'Время пути (об.1)'			=>	array( 'type'=>'number', 	'field'=>'time1', 'params'=>array( 'size'=>20, 'hold'=>'Время пути (об.1)' ) ),
			'Название (об.1)'			=>	array( 'type'=>'input', 	'field'=>'dest1', 'params'=>array( 'size'=>20, 'hold'=>'Название (об.1)' ) ),
			'Lat (об.1)'			=>	array( 'type'=>'number', 	'field'=>'ob1_lat', 'params'=>array( 'size'=>20, 'hold'=>'Lat (об.1)' ) ),
			'Lng (об.1)'			=>	array( 'type'=>'number', 	'field'=>'ob1_lng', 'params'=>array( 'size'=>20, 'hold'=>'Lng (об.1)' ) ),
			'clear1' => array('type' => 'clear'),

			'Время пути (об.2)'			=>	array( 'type'=>'number', 	'field'=>'time2', 'params'=>array( 'size'=>20, 'hold'=>'Время пути (об.2)' ) ),
			'Название (об.2)'			=>	array( 'type'=>'input', 	'field'=>'dest2', 'params'=>array( 'size'=>20, 'hold'=>'Название (об.2)' ) ),
			'Lat (об.2)'			=>	array( 'type'=>'number', 	'field'=>'ob2_lat', 'params'=>array( 'size'=>20, 'hold'=>'Lat (об.2)' ) ),
			'Lng (об.2)'			=>	array( 'type'=>'number', 	'field'=>'ob2_lng', 'params'=>array( 'size'=>20, 'hold'=>'Lng (об.2)' ) ),
			'clear2' => array('type' => 'clear'),

			'Время пути (об.3)'			=>	array( 'type'=>'number', 	'field'=>'time3', 'params'=>array( 'size'=>20, 'hold'=>'Время пути (об.3)' ) ),
			'Название (об.3)'			=>	array( 'type'=>'input', 	'field'=>'dest3', 'params'=>array( 'size'=>20, 'hold'=>'Название (об.3)' ) ),
			'Lat (об.3)'			=>	array( 'type'=>'number', 	'field'=>'ob3_lat', 'params'=>array( 'size'=>20, 'hold'=>'Lat (об.3)' ) ),
			'Lng (об.3)'			=>	array( 'type'=>'number', 	'field'=>'ob3_lng', 'params'=>array( 'size'=>20, 'hold'=>'Lng (об.3)' ) ),
			'clear3' => array('type' => 'clear'),
												 
			

			 );
	
		$cardEditFormParams = array( 'cardItem'=>$cardItem, 'cardTmp'=>$cardTmp, 'rootPath'=>$rootPath, 'actionName'=>"editNhTraffic", 'ajaxFolder'=>'edit', 'appTable'=>$pageTable );
		
		$cardEditFormStr = $zh->getCardEditForm($cardEditFormParams, true);
		
		$data['bodyContent'] .= $cardEditFormStr;
	
	$data['bodyContent'] .= "</div><!-- landCluster --><div class='divider'></div>";
	
	// end new block
	
?>