<?php 
	//********************
	//** WEB MIRACLE TECHNOLOGIES
	//********************
	
	// get post
	
	$appTable = $_POST['appTable'];
	
	$item_id = (isset($_POST['item_id']) ? $_POST['item_id'] : 0);
	$now = date("Y-m-d H:i:s", time());
	$cardUpd = array(
		'ref'			=> (int)$_POST['ref'],
		'floor'			=> (int)$_POST['floor'],
		'floor_name'			=> $_POST['floor_name'],
		'props'			=> $_POST['props'],

		'block'			=> $_POST['block'][0],
		'created' => $now,
		'modified' => $now
	);



	// Create main table item
	
	$query = "INSERT INTO [pre]$appTable ";
	
	$fieldsStr = " ( ";
	
	$valuesStr = " ( ";
	
	$cntUpd = 0;
	foreach($cardUpd as $field => $itemUpd)
	{
		$cntUpd++;
		
		$fieldsStr .= ($cntUpd==1 ? "`$field`" : ", `$field`");
		
		$valuesStr .= ($cntUpd==1 ? "'$itemUpd'" : ", '$itemUpd'");
	}
	
	$fieldsStr .= " ) ";
	
	$valuesStr .= " ) ";
	
	$query .= $fieldsStr." VALUES ".$valuesStr;
		
	$item_id = $ah->rs($query,0,1,1);
	if($item_id)
	{
		$data['item_id'] = $item_id;
	}else
	{
		$data['item_id'] = 0;
	}
	$data['real_item_id'] = $item_id;
	/*IMG GALLERY SET*/
	$file_path = "../../../../split/files/new_th/";
	$filename = "layouts";
	//echo '<pre>'; print_r($item_id); echo '</pre>'; exit();
	if(isset($_FILES[$filename]) && count($_FILES[$filename]) > 0 && $item_id)
	{		
		$files_upload = $ah->mtvc_add_files_file_miltiple(array(
				'path'			=>$file_path,
				'name'			=>5,
				'pre'			=>"thll_",
				'size'			=>10,
				'rule'			=>0,
				'max_w'			=>2500,
				'max_h'			=>2500,
				'files'			=>$filename,
				'resize_path'	=>$file_path."crop/",
				'resize_w'		=>435,
				'resize_h'		=>340,
				'resize_path_2'	=>"0",
				'resize_w_2'	=>0,
				'resize_h_2'	=>0
			  ));
		if($files_upload)
		{	
			$now = date("Y-m-d H:i:s", time());
			foreach($files_upload as $file_upload)
			{
				$query = "INSERT INTO osc_nth_blocks_layouts_items (`ref`, `source`, `created`, `modified`) VALUES ('$item_id', '$file_upload', '$now', '$now')";
				$ah->rs($query,0,1);
				chmod($file_path.$file_upload,0777);
				
			}
		}
	}

	
	$data['message'] = "Планировка линии успешно создана. ID =  $item_id";
	$data['status'] = "success";
	