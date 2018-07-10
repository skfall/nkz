<?php 
	// Start header content
	$headParams = array( 'parent'=>$parent, 'alias'=>$alias, 'id'=>$id, 'appTable'=>$appTable );
	
	$data['headContent'] = $zh->getLandingHeader($headParams);
	// GET PAGE DATA
	$cardData = $zh->getHomePage($pageTable);

	$cardItem = $cardData;

	
	// Get page items
	
	$itemsList = $zh->getNhBannerItems($params);
	$totalItems = $zh->getNhBannerItems($params,true);
	
	// Pagination operations
	
	$on_page = (isset($_COOKIE['global_on_page']) ? $_COOKIE['global_on_page'] : GLOBAL_ON_PAGE);
	
	$pages = ceil($totalItems/$on_page);
	
	$start_page = (isset($params['start']) ? $params['start'] : 1);
	
	$frst_page = 1;
	$prev_page = 1;
	$next_page = $pages;
	$last_page = $pages;
				
	if($start_page < $pages) $next_page = $start_page+1;
	if($start_page > 1) $prev_page = $start_page-1;
	
	// Filter JS open
	
	if(isset($_COOKIE['filter-1']) && $_COOKIE['filter-1']) $data['filter']['f1'] = 1;
	if(isset($_COOKIE['filter-2']) && $_COOKIE['filter-2']) $data['filter']['f2'] = 1;
	if(isset($_COOKIE['filter-3']) && $_COOKIE['filter-3']) $data['filter']['f3'] = 1;
	
	// Filter arrays
	$filter1_options = array( 'By ID'=>'M.id', 'By Name'=>'M.name' );
	
	$filter2_options = array( 
							'Публикация'	=> array( 'fieldName'=>'M.block', 'params' => array('Yes'=>'0', 'No'=>'1') )
							);
							
	$filter3_options = array( 
							'sort' => array( 'ID'=>'id', 'Порядковому номеру'=>'order_id' ),
							'order' => array( 'По возрастанию'=>'', 'По убыванию'=>' DESC' ) 
							);
	// Start data content
	
	$filterFormParams = array(	'params'=>$params, 
								'headParams'=>$headParams, 
								'filter1_options'=>$filter1_options, 
								'filter2_options'=>$filter2_options, 
								'filter3_options'=>$filter3_options, 
								'on_page'=>$on_page 
							  );
	
	$filterFormStr = $zh->getLandingFilterForm($filterFormParams);
	
	// Table structure
	
	$tableColumns = array(
						  'Checkbox'			=>	array('type'=>'checkbox',	'field'=>''),
						  'Заголовок'				=>	array('type'=>'text',		'field'=>'caption'),
						  'Просмотр'			=>	array('type'=>'cardView',	'field'=>'Смотреть'),
						  'Редактирование'		=>	array('type'=>'cardEdit',	'field'=>'Редактировать'),
						  'ID'					=>	array('type'=>'text',		'field'=>'id')
						  );
	
	$tableParams = array( 'itemsList'=>$itemsList, 'tableColumns'=>$tableColumns, 'headParams'=>$headParams );
	
	$tableStr = $zh->getItemsTable($tableParams);
	
	// START PAGINATION
	
	$pagiParams = array( 'headParams'=>$headParams, 'start_page'=>$start_page, 'pages'=>$pages, 'on_page'=>$on_page );
	
	$pagiStr = $zh->getLandingPagination($pagiParams);
	
	// Join Content
	
	$data['bodyContent'] = $filterFormStr;
	
	// new block
	
	$data['bodyContent'] .= "
		<div id='landCluster' class='animatedX'>
			<h3 class='new-line'>Редактирование секции <b>Баннер</b></h3>
	";
		$cardTmp = array(
			 'Карта (lat)'		=>	array( 'type'=>'number', 'field'=>'nh_lat', 	'params'=>array( 'size'=>100, 'hold'=>'Карта (lat)' ) ),
			 'Карта (lng)'		=>	array( 'type'=>'number', 'field'=>'nh_lng', 	'params'=>array( 'size'=>100, 'hold'=>'Карта (lng)' ) ),
			 'Генплан'			=>	array( 'type'=>'image_mono','field'=>'genplan', 		'params'=>array( 'path'=>RSF."/split/files/new_home/", 'appTable'=>$appTable, 'id'=>$item_id ) ),
			 );
	
		$cardEditFormParams = array( 'cardItem'=>$cardItem, 'cardTmp'=>$cardTmp, 'rootPath'=>$rootPath, 'actionName'=>"editHhBannerCommonItems", 'ajaxFolder'=>'edit', 'appTable'=>$pageTable );
		
		$cardEditFormStr = $zh->getCardEditForm($cardEditFormParams, true);
		
		$data['bodyContent'] .= $cardEditFormStr;
	
	$data['bodyContent'] .= "</div><!-- landCluster --><div class='divider'></div>";
	
	// end new block
	
	$data['bodyContent'] .= "<h2 class='tableCaption'>Слайды:</h2>";
	
	$data['bodyContent'] .= $tableStr;
	
	$data['bodyContent'] .= $pagiStr;
?>