<?php 
	//********************
	//** WEB MIRACLE TECHNOLOGIES
	//********************
	
	// get post

	
	$appTable = $_POST['appTable'];
	
	$item_id = 1;
	$now = date("Y-m-d H:i:s", time());
	$cardUpd = array(
					'caption'		=> $_POST['caption'],
					'time1'		=> (float)$_POST['time1'],
					'time2'		=> (float)$_POST['time2'],
					'time3'		=> (float)$_POST['time3'],
					'time4'		=> (float)$_POST['time4'],
					'time5'		=> (float)$_POST['time5'],
					'name1'		=> $_POST['name1'],
					'name2'		=> $_POST['name2'],
					'name3'		=> $_POST['name3'],
					'name4'		=> $_POST['name4'],
					'name5'		=> $_POST['name5'],
					
					'block'			=> $_POST['block'][0],
					'modified'			=> $now,
					);
					
	// File upload 
	
	$filename = "poster";
	
	if(isset($_FILES[$filename]) && $_FILES[$filename]['size'] > 0)
	{
		$file_path = "../../../../split/files/new_th/";
		
		$file_update = $ah->mtvc_add_files_file(array(
				'path'			=>$file_path,
				'name'			=>5,
				'pre'			=>"th_post",
				'size'			=>10,
				'rule'			=>0,
				'max_w'			=>2500,
				'max_h'			=>2500,
				'files'			=>$filename
			  ));
		if($file_update)
		{
			$cardUpd[$filename] = $file_update;
			
			$curr_filename = $_POST['curr_filename'];
			
			unlink($file_path.$curr_filename);
		}
	}

	$filename = "video";
	
	if(isset($_FILES[$filename]) && $_FILES[$filename]['size'] > 0)
	{
		$file_path = "../../../../split/files/new_th/";
		
		$file_update = $ah->mtvc_add_files_file(array(
				'path'			=>$file_path,
				'name'			=>5,
				'pre'			=>"th_vid",
				'size'			=>50,
				'rule'			=>0,
				'max_w'			=>2500,
				'max_h'			=>2500,
				'files'			=>$filename
			  ));
		if($file_update)
		{
			$cardUpd[$filename] = $file_update;
			
			$curr_filename = $_POST['curr_filename'];
			
			unlink($file_path.$curr_filename);
		}
	}
	
	// Update main table
	
	$query = "UPDATE `$appTable` SET ";
	
	$cntUpd = 0;
	foreach($cardUpd as $field => $itemUpd)
	{
		$cntUpd++;
		$query .= ($cntUpd==1 ? "`$field`='$itemUpd'" : ", `$field`='$itemUpd'");
	}
	
	$query .= " WHERE `id`=$item_id LIMIT 1";
			
	$ah->rs($query,0,1);
	
	$data['status'] = "success";
	$data['message'] = "Секция 'Видео' успешно сохранена";
	