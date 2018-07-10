<?php 	// Start header content	$headParams = array( 'parent'=>$parent, 'alias'=>$alias, 'id'=>$id, 'item_id'=>$item_id, 'appTable'=>$appTable );		$data['headContent'] = $zh->getCardEditHeader($headParams);		// Start body content		$cardItem = $zh->getProgramItem($item_id);	$free_layouts = $zh->getFreeFlatsLayouts($cardItem['layouts']);	$used_layouts = $zh->getUsedFlatsLayouts($cardItem['layouts']);	$free_layout_row = array();	$used_layout_row = array();	foreach ($free_layouts as $i => $v) {		$v_name = $v['house_name'].' | '.$v['room_name'].' | '.$v['total_area'];		$free_layout_row[$i] = array('id' => $v['id'], 'name' => $v_name );	}	foreach ($used_layouts as $i => $u) {		$v_name = $u['house_name'].' | '.$u['room_name'].' | '.$u['total_area'];		$used_layout_row[$i] = array('id' => $u['id'], 'name' => $v_name );	}	$rootPath = ROOT_PATH;		$cardTmp = array(					 'Название'				=>	array( 'type'=>'input', 	'field'=>'name', 		'params'=>array( 'size'=>100, 'hold'=>'Название' ,'onchange'=>"change_alias();") ),					 'Алиас (URL)'				=>	array( 'type'=>'input', 	'field'=>'alias', 		'params'=>array( 'size'=>100, 'hold'=>'Алиас' ) ),					 'clear-1'				=>	array( 'type'=>'clear' ),					 'Заголовок'				=>	array( 'type'=>'input', 	'field'=>'caption', 		'params'=>array( 'size'=>100, 'hold'=>'Заголовок' ) ),					 'Краткое описание'				=>	array( 'type'=>'input', 	'field'=>'sub_title', 		'params'=>array( 'size'=>100, 'hold'=>'Краткое описание' ) ),					 'Описание'				=>	array( 'type'=>'redactor', 	'field'=>'content', 		'params'=>array() ),					 					 'clear-2'				=>	array( 'type'=>'clear' ),					 																							 					 'Публикация'			=>	array( 'type'=>'block', 	'field'=>'block', 			'params'=>array( 'reverse'=>true ) ),					 'Открывать на новой странице?'			=>	array( 'type'=>'block', 	'field'=>'target', 			'params'=>array(  ) ),					 					 'clear-4'				=>	array( 'type'=>'clear' ),					 'clear-5'				=>	array( 'type'=>'clear' ),					 'Непривязанные планировки'	=>	array( 'type'=>'multiselect', 	'field'=>'free_layout_id', 	'params'=>array( 'list'=>$free_layout_row, 'fieldValue'=>'id', 'fieldTitle'=>'name', 'currValue'=>'id', 'onChange'=>"", 'first' => array('id' => 0, 'name' => 'Выберите планировку'), 'cust' => true ) ),					 'Привязанные планировки'	=>	array( 'type'=>'multiselect', 	'field'=>'used_layout_id', 	'params'=>array( 'list'=>$used_layout_row, 'fieldValue'=>'id', 'fieldTitle'=>'name', 'currValue'=>'id', 'onChange'=>"", 'first' => array('id' => 0, 'name' => 'Выберите планировку'), 'cust' => true ) ),					 'Превью'			=>	array( 'type'=>'image_mono','field'=>'preview', 		'params'=>array( 'path'=>RSF."/split/files/programs/", 'appTable'=>$appTable, 'id'=>$item_id ) ),					 'Изображение'			=>	array( 'type'=>'image_mono','field'=>'filename', 		'params'=>array( 'path'=>RSF."/split/files/programs/", 'appTable'=>$appTable, 'id'=>$item_id ) ),					 					 'Мета-теги'				=>	array( 'type'=>'header' ),					 'Meta title'				=>	array( 'type'=>'input', 	'field'=>'meta_title', 		'params'=>array( 'size'=>100, 'hold'=>'Meta title' ) ),					 'clear-3'				=>	array( 'type'=>'clear' ),					 'Meta keys'				=>	array( 'type'=>'input', 	'field'=>'meta_keys', 		'params'=>array( 'size'=>100, 'hold'=>'Meta keys' ) ),					 'Meta desc'				=>	array( 'type'=>'area', 	'field'=>'meta_desc', 		'params'=>array( 'size'=>100, 'hold'=>'Meta desc' ) )					 					 					 );	$cardEditFormParams = array( 'cardItem'=>$cardItem, 'cardTmp'=>$cardTmp, 'rootPath'=>$rootPath, 'actionName'=>"editProgramItem", 'ajaxFolder'=>'edit', 'appTable'=>$appTable );		$cardEditFormStr = $zh->getCardEditForm($cardEditFormParams);		// Join content		$data['bodyContent'] .= "		<div class='ipad-20' id='order_conteinter'>			<h3 class='new-line'>Форма редактирования программы #$item_id</h3>";		$data['bodyContent'] .= $cardEditFormStr;					$data['bodyContent'] .=	"		</div>	";?>