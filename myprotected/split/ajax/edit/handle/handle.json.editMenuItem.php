<?php 	//********************	//** WEB MIRACLE TECHNOLOGIES	//********************		// get post		$appTable = $_POST['appTable'];		$item_id = $_POST['item_id'];	$lpx = $_POST['lpx'];	$lang_prefix = ($lpx ? $lpx."_" : ""); // empty = iw	$query = "SELECT `alias` FROM [pre]menu WHERE `id`='$item_id' LIMIT 1";	$menu = $ah->dbh->q($query,1);	$cardUpd = array(						'name'		=> $_POST['name'],						'block'			=> $_POST['block'][0],						'dateModify'	=> date("Y-m-d H:i:s", time())					);							$query = "SELECT id FROM [pre]menu WHERE `alias`='".$cardUpd['alias']."' AND `id`!=$item_id LIMIT 1";	$test_alias = $ah->rs($query);					if(strlen($cardUpd[$lang_prefix.'name'])>1)	{		if(!$test_alias)		{				// Update main table								$query = "UPDATE [pre]$appTable SET ";								$cntUpd = 0;				foreach($cardUpd as $field => $itemUpd)				{					$cntUpd++;					$query .= ($cntUpd==1 ? "`$field`='$itemUpd'" : ", `$field`='$itemUpd'");				}								$query .= " WHERE `id`=$item_id LIMIT 1";				$ah->rs($query);								// Upload files				/*				$filename = "docs";								if(isset($_FILES[$filename]) && count($_FILES[$filename]) > 0)				{					$file_path = "../../../../split/files/documents/";										$files_upload = $ah->mtvc_add_files_file_miltiple(array(							'path'			=>$file_path,							'name'			=>5,							'pre'			=>"doc_",							'size'			=>20,							'rule'			=>0,							'max_w'			=>2500,							'max_h'			=>2500,							'files'			=>$filename						  ));					if($files_upload)					{						foreach($files_upload as $file_upload)						{							$query = "INSERT INTO [pre]docs_ref (`ref_table`, `ref_id`, `file`, `crop`, `path`) VALUES ('menu', '$item_id', '$file_upload', '0', 'split/files/documents/')";														$ah->rs($query);						}					}				}				*/				$data['message'] = "Пункт Меню успешно сохранен.";							}else{			$data['status'] = "failed";			$data['message'] = "Меню с таким Алиасом уже существует";			}	}else{		$data['status'] = "failed";		$data['message'] = "Укажите Название пункта меню";		}		