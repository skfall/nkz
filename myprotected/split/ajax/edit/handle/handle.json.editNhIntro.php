<?php 
	//********************
	//** WEB MIRACLE TECHNOLOGIES
	//********************
	
	// get post
	
	$appTable = "osc_nh_intro";
	
	$item_id = $_POST['item_id'];


	
	$cardUpd = array(
					'caption'			=> $_POST['caption'],
					'content'			=> $_POST['content'],

					'block'			=> $_POST['block'][0],
					
					'modified'	=> date("Y-m-d H:i:s", time())
					);
					
	// File upload 
	
	// Update main table

	$filename = "image";
	
	if(isset($_FILES[$filename]) && $_FILES[$filename]['size'] > 0)
	{
		$file_path = "../../../../split/files/new_home/";
		
		$file_update = $ah->mtvc_add_files_file(array(
				'path'			=>$file_path,
				'name'			=>5,
				'pre'			=>"nh_intr_",
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
	
	$query = "UPDATE `$appTable` SET ";
	
	$cntUpd = 0;
	foreach($cardUpd as $field => $itemUpd)
	{
		$cntUpd++;
		$query .= ($cntUpd==1 ? "`$field`='$itemUpd'" : ", `$field`='$itemUpd'");
	}
	
	$query .= " WHERE `id`=1 LIMIT 1";

			
	$ah->rs($query);
	
	
	$data['message'] = "Секция успешно сохранена.";
	