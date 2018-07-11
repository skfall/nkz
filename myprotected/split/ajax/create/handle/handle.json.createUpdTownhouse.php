<?php 
	//********************
	//** WEB MIRACLE TECHNOLOGIES
	//********************
	
	// get post
	$appTable = $_POST['appTable'];
	
	$item_id = (isset($_POST['item_id']) ? $_POST['item_id'] : 0);
	
	$cardUpd = array(
					'caption'			=> $_POST['caption'],
					'price'			=> $_POST['price'],
					'area'			=> $_POST['area'],
					'th_desc'			=> $_POST['th_desc'],
					'properties'			=> $_POST['properties'],
					'features'			=> $_POST['features'],
					'pos'			=> (int)$_POST['pos'],
					'modified' => date('Y-m-d H:i:s', time()),
					'created' => date('Y-m-d H:i:s', time())

	);
	


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




	$file_path = "../../../../split/files/townhouses/";
	$filename = "layouts";
	
	if(isset($_FILES[$filename]) && count($_FILES[$filename]) > 0)
	{		
		$files_upload = $ah->mtvc_add_files_file_miltiple(array(
				'path'			=>$file_path,
				'name'			=>5,
				'pre'			=>"updthl_",
				'size'			=>10,
				'rule'			=>0,
				'max_w'			=>2500,
				'max_h'			=>2500,
				'files'			=>$filename,
				'resize_path'	=>$file_path."crop/",
				'resize_w'		=>500,
				'resize_h'		=>350,
				'resize_path_2'	=>"0",
				'resize_w_2'	=>0,
				'resize_h_2'	=>0
			  ));
		if($files_upload){
			$now = date("Y-m-d H:i:s");
			foreach($files_upload as $file_upload){
				$query = "INSERT INTO `osc_unc_th_layouts` (`filename`, `th_id`, `created`, `modified`, `block`) VALUES ('$file_upload', '$item_id', '$now', '$now', 0)";
				$ah->rs($query);
				chmod($file_path.$file_upload,0777);
			}
		}
	}


	
	$data['message'] = "Таунхаус успешно создан. ID =  $item_id";
	$data['status'] = "success";
	
	
	
	