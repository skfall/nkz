<?php 	//********************	//** WEB MIRACLE TECHNOLOGIES	//********************		// get post		$appTable = $_POST['appTable'];		$item_id = (isset($_POST['item_id']) ? $_POST['item_id'] : 0);		$cardUpd = array(					'name'			=> $_POST['name'],					'total_area'	=> (double)$_POST['total_area'],					'block'			=> $_POST['block'][0],					'parts_area'	=> (mb_strlen($_POST['parts_area']) > 0 ? serialize($_POST['parts_area']) : '')	);	if (isset($_POST['event_id']) && $_POST['event_id']) {		$cardUpd['event_id'] = $_POST['event_id'];	}	// Create main table item		$query = "INSERT INTO [pre]$appTable ";		$fieldsStr = " ( ";		$valuesStr = " ( ";		$cntUpd = 0;	foreach($cardUpd as $field => $itemUpd)	{		$cntUpd++;				$fieldsStr .= ($cntUpd==1 ? "`$field`" : ", `$field`");				$valuesStr .= ($cntUpd==1 ? "'$itemUpd'" : ", '$itemUpd'");	}		$fieldsStr .= " ) ";		$valuesStr .= " ) ";		$query .= $fieldsStr." VALUES ".$valuesStr;				$item_id = $ah->rs($query,0,1,1);	if($item_id)	{		$data['item_id'] = $item_id;	}else	{		$data['item_id'] = 0;	}	$data['real_item_id'] = $item_id;	/*IMG GALLERY SET*/	$file_path = "../../../../split/files/cottages/";	$filename = "layouts";	//echo '<pre>'; print_r($item_id); echo '</pre>'; exit();	if(isset($_FILES[$filename]) && count($_FILES[$filename]) > 0 && $item_id)	{				$files_upload = $ah->mtvc_add_files_file_miltiple(array(				'path'			=>$file_path,				'name'			=>5,				'pre'			=>"ctl_",				'size'			=>10,				'rule'			=>0,				'max_w'			=>2500,				'max_h'			=>2500,				'files'			=>$filename,				'resize_path'	=>$file_path."crop/",				'resize_w'		=>500,				'resize_h'		=>350,				'resize_path_2'	=>"0",				'resize_w_2'	=>0,				'resize_h_2'	=>0			  ));		if($files_upload)		{			foreach($files_upload as $file_upload)			{				$query = "INSERT INTO osc_sys_cottages_layouts_items (`ref`, `file`) VALUES ('$item_id', '$file_upload')";				$ah->rs($query,0,1);				chmod($file_path.$file_upload,0777);							}		}	}		$data['message'] = "Планировка коттеджа успешно создана. ID =  $item_id";	$data['status'] = "success";	