<?php 	//********************	//** WEB MIRACLE TECHNOLOGIES	//********************		// get post		$appTable = $_POST['appTable'];		$item_id = $_POST['item_id'];		$cardUpd = array(					'name'			=> $_POST['name'],					'total_area'	=> (double)$_POST['total_area'],					'block'			=> $_POST['block'][0],					'parts_area'	=> (mb_strlen($_POST['parts_area']) > 0 ? serialize($_POST['parts_area']) : '')										);	if (isset($_POST['event_id']) && $_POST['event_id']) {		$cardUpd['event_id'] = $_POST['event_id'];	}else{		$cardUpd['event_id'] = 0;	}					// Update main table		$query = "UPDATE [pre]$appTable SET ";		$cntUpd = 0;	foreach($cardUpd as $field => $itemUpd)	{		$cntUpd++;		$query .= ($cntUpd==1 ? "`$field`='$itemUpd'" : ", `$field`='$itemUpd'");	}		$query .= " WHERE `id`=$item_id LIMIT 1";				$ah->rs($query);	/*IMG GALLERY SET*/	$file_path = "../../../../split/files/cottages/";	$filename = "layouts";		if(isset($_FILES[$filename]) && count($_FILES[$filename]) > 0)	{				$files_upload = $ah->mtvc_add_files_file_miltiple(array(				'path'			=>$file_path,				'name'			=>5,				'pre'			=>"ctl_",				'size'			=>10,				'rule'			=>0,				'max_w'			=>2500,				'max_h'			=>2500,				'files'			=>$filename,				'resize_path'	=>$file_path."crop/",				'resize_w'		=>500,				'resize_h'		=>350,				'resize_path_2'	=>"0",				'resize_w_2'	=>0,				'resize_h_2'	=>0			  ));		if($files_upload){			foreach($files_upload as $file_upload){				$query = "INSERT INTO osc_sys_cottages_layouts_items (`ref`, `file`) VALUES ('$item_id', '$file_upload')";				$ah->rs($query);				chmod($file_path.$file_upload,0777);			}		}	}		$data['status'] = "success";	$data['message'] = "Планировка коттеджа #$item_id успешно сохранена.";	