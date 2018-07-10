<?php 

	$appTable = "osc_sys_projects";
	$item_id = $_POST['item_id'];
	$cardUpd = array(
					'name'			=> $_POST['name'],
					'alias'			=> $_POST['alias'],
					'location'			=> $_POST['location'],
					'features'			=> $_POST['features'],
					'order_id'			=> (int)$_POST['order_id'],
					'block'			=> $_POST['block'][0],
					'link'			=> $_POST['link'],
					'target'		=> $_POST['target'][0],
					'modified'	=> date("Y-m-d H:i:s", time())
					);
					

	$filename = "logo";
	if(isset($_FILES[$filename]) && $_FILES[$filename]['size'] > 0)
	{
		$file_path = "../../../../split/files/projects/";
		
		$file_update = $ah->mtvc_add_files_file(array(
				'path'			=>$file_path,
				'name'			=>5,
				'pre'			=>"prgl_",
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
	$filename = "source";
	if(isset($_FILES[$filename]) && $_FILES[$filename]['size'] > 0) {
		$file_path = "../../../../split/files/projects/";
		$file_update = $ah->mtvc_add_files_file(array(
				'path'			=>$file_path,
				'name'			=>5,
				'pre'			=>"prgi_",
				'size'			=>10,
				'rule'			=>0,
				'max_w'			=>2500,
				'max_h'			=>2500,
				'files'			=>$filename
			  ));
		if($file_update) {
			$cardUpd[$filename] = $file_update;
			$curr_filename = $_POST['curr_filename'];
			unlink($file_path.$curr_filename);
		}
	}
	// Update main table
	$alias = $_POST["alias"];
	$q = "SELECT M.* FROM `osc_sys_projects` AS M WHERE M.alias = '$alias' AND M.id != '$item_id' LIMIT 1";
	$check_alias = $ah->rs($q);


	if ($alias) {
		if (!$check_alias) {
			$cntUpd = 0;
			$query = "UPDATE `$appTable` SET ";
			foreach($cardUpd as $field => $itemUpd) {
				$cntUpd++;
				$query .= ($cntUpd==1 ? "`$field`='$itemUpd'" : ", `$field`='$itemUpd'");
			}
			$query .= " WHERE `id`=$item_id LIMIT 1";
			$ah->rs($query);
			$data['message'] = "Проект успешно сохранен.";

		}else{
			$data["message"]  = "Такой алиас уже существует.";		
		}
	}else{
		$data["message"]  = "Заполните поле Алиас.";
	}
	
	
	
	