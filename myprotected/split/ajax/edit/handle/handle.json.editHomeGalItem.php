<?php 

	$appTable = "osc_home_gal";
	$item_id = $_POST['item_id'];
	$cardUpd = array(
					'caption'			=> $_POST['caption'],
					'features'			=> $_POST['features'],
					
					'order_id'			=> (int)$_POST['order_id'],
					'block'			=> $_POST['block'][0],
					
					'modified'	=> date("Y-m-d H:i:s", time())
					);
					

	$filename = "source";
	if(isset($_FILES[$filename]) && $_FILES[$filename]['size'] > 0)
	{
		$file_path = "../../../../split/files/images/";
		
		$file_update = $ah->mtvc_add_files_file(array(
				'path'			=>$file_path,
				'name'			=>5,
				'pre'			=>"hmgl_",
				'size'			=>10,
				'rule'			=>0,
				'max_w'			=>2500,
				'max_h'			=>2500,
				'files'			=>$filename,
				'resize_path'	=>$file_path."crop/",
				'resize_w'		=>630,
				'resize_h'		=>500,
				'resize_path_2'	=>"0",
				'resize_w_2'	=>0,
				'resize_h_2'	=>0
			  ));
		if($file_update)
		{
			$cardUpd[$filename] = $file_update;
			
			$curr_filename = $_POST['curr_filename'];
			
			unlink($file_path.$curr_filename);
		}
	}
	
	$cntUpd = 0;
	$query = "UPDATE `$appTable` SET ";
	foreach($cardUpd as $field => $itemUpd) {
		$cntUpd++;
		$query .= ($cntUpd==1 ? "`$field`='$itemUpd'" : ", `$field`='$itemUpd'");
	}
	$query .= " WHERE `id`=$item_id LIMIT 1";
	$ah->rs($query);
	$data['message'] = "Элемент галереи успешно сохранен.";
	
	
	
	