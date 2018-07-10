<?php 
	//********************
	//** WEB MIRACLE TECHNOLOGIES
	//********************
	
	// get post
	
	$appTable = "osc_sys_projects";

	$cardUpd = array(
					'name'			=> $_POST['name'],
					'alias'			=> $_POST['alias'],
					'location'			=> $_POST['location'],
					'features'			=> $_POST['features'],
					'block'			=> $_POST['block'][0],
					'order_id'			=> (int)$_POST['order_id'],
					'link'			=> $_POST['link'],
					'target'		=> $_POST['target'][0],
					'created'	=> date("Y-m-d H:i:s", time()),
					'modified'	=> date("Y-m-d H:i:s", time())
					);

	// Create main table item

	// Update main table
	$alias = $_POST["alias"];
	$q = "SELECT M.* FROM `osc_sys_projects` AS M WHERE M.alias = '$alias' LIMIT 1";
	$check_alias = $ah->rs($q);

	if ($alias) {
		if (!$check_alias) {


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

			$query = "INSERT INTO `$appTable` ";
	
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

			if($item_id) {
				$data['item_id'] = $item_id;

			}else{
				$data['item_id'] = 0;
			}
			
			$data['message'] = "Проект успешно создан.";
		}else{
			$data["message"]  = "Такой алиас уже существует.";		
		}
	}else{
		$data["message"]  = "Заполните поле Алиас.";
	}

	
	
	