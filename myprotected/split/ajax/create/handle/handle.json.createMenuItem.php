<?php 	//********************	//** WEB MIRACLE TECHNOLOGIES	//********************		// get post		$appTable = $_POST['appTable'];		$item_id = (isset($_POST['item_id']) ? $_POST['item_id'] : 0);		$cardUpd = array(					'name'		=> strip_tags(trim($_POST['name'])),										// LIFE HACK :)					'ru_name'		=> strip_tags(trim($_POST['name'])),					'en_name'		=> strip_tags(trim($_POST['name'])),					'fr_name'		=> strip_tags(trim($_POST['name'])),										'alias'		=> $_POST['alias'],					'parent_id'		=> (int)$_POST['parent_id'],										'order_id'		=> (int)$_POST['order_id'],					'block'			=> $_POST['block'][0],										'is_top'		=> $_POST['is_top'][0],					'is_bottom'		=> $_POST['is_bottom'][0],										'dateCreate'	=> date("Y-m-d H:i:s", time()),					'dateModify'	=> date("Y-m-d H:i:s", time())					);					if(strlen($cardUpd['name'])>1)	{		if(!$test_alias)		{					// Create main table item								$query = "INSERT INTO [pre]$appTable ";								$fieldsStr = " ( ";								$valuesStr = " ( ";								$cntUpd = 0;				foreach($cardUpd as $field => $itemUpd)				{					$cntUpd++;										$fieldsStr .= ($cntUpd==1 ? "`$field`" : ", `$field`");										$valuesStr .= ($cntUpd==1 ? "'$itemUpd'" : ", '$itemUpd'");				}								$fieldsStr .= " ) ";								$valuesStr .= " ) ";								$query .= $fieldsStr." VALUES ".$valuesStr;									$item_id = $ah->dbh->q($query,0,1,1);								if($item_id)				{					$data['item_id'] = $item_id;					$data['status'] = "success";					$data['message'] = "Новый пункт Меню успешно создан.";										// Upload files					/*					$filename = "docs";										if(isset($_FILES[$filename]) && count($_FILES[$filename]) > 0)					{						$file_path = "../../../../split/files/documents/";												$files_upload = $ah->mtvc_add_files_file_miltiple(array(								'path'			=>$file_path,								'name'			=>5,								'pre'			=>"doc_",								'size'			=>20,								'rule'			=>0,								'max_w'			=>2500,								'max_h'			=>2500,								'files'			=>$filename							  ));						if($files_upload)						{							foreach($files_upload as $file_upload)							{								$query = "INSERT INTO [pre]docs_ref (`ref_table`, `ref_id`, `file`, `crop`, `path`) VALUES ('menu', '$item_id', '$file_upload', '0', 'split/files/documents/')";																$ah->rs($query);							}						}					}					*/									}else				{					$data['item_id'] = 0;				}						}else{			$data['status'] = "failed";			$data['message'] = "Меню с таким Алиасом уже существует";			}	}else{		$data['status'] = "failed";		$data['message'] = "Укажите Название пункта меню";		}	