<?php 
	//********************
	//** WEB MIRACLE TECHNOLOGIES
	//********************
	
	// get post
	
	$appTable = $_POST['appTable'];
	
	$item_id = $_POST['item_id'];
	
	$cardUpd = array(
					'caption'			=> $_POST['caption'],
					'content'			=> $_POST['content'],
					'block'			=> $_POST['block'][0]
					);
	
	
	$query = "UPDATE `osc_nth_infoblock1` SET ";
	
	$cntUpd = 0;
	foreach($cardUpd as $field => $itemUpd)
	{
		$cntUpd++;
		$query .= ($cntUpd==1 ? "`$field`='$itemUpd'" : ", `$field`='$itemUpd'");
	}
	
	$query .= " WHERE `id`=$item_id LIMIT 1";
			
	$ah->rs($query);
	
	
	$data['status'] = "success";
	$data['message'] = "Секция успешно сохранена.";
	