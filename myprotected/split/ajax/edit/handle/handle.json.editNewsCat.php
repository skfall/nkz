<?php 	//********************	//** WEB MIRACLE TECHNOLOGIES	//********************		// get post		$appTable = $_POST['appTable'];		$item_id = $_POST['item_id'];		$cardUpd = array(					'name'			=> $_POST['name'],					'alias'			=> $_POST['alias'],					'modified'		=> date("Y-m-d H:i:s", time())					);								// Update main table	$alias = $_POST["alias"];	if ($alias) {		$q = "SELECT M.id FROM `osc_page_news_cats` AS M WHERE M.alias = '$alias' AND M.id != '$item_id' LIMIT 1";		$check_alias = $ah->rs($q);		if (!$check_alias) {			$query = "UPDATE [pre]$appTable SET ";				$cntUpd = 0;			foreach($cardUpd as $field => $itemUpd)			{				$cntUpd++;				$query .= ($cntUpd==1 ? "`$field`='$itemUpd'" : ", `$field`='$itemUpd'");			}						$query .= " WHERE `id`=$item_id LIMIT 1";								$ah->rs($query);						$data['status'] = "success";			$data['message'] = "Рубрика #$item_id успешно сохранена.";		}else{			$data["message"] = "Такой Алиас уже существует.";		}	}else{		$data["message"] = "Заполните поле 'Алиас'";	}			