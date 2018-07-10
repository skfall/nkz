<?php 
	//********************
	//** WEB MIRACLE TECHNOLOGIES
	//********************
	
	// get post
	
	$appTable = "osc_home_dev";
	
	$item_id = $_POST['item_id'];


	
	$cardUpd = array(
					'caption'			=> $_POST['caption'],
					'details'			=> $_POST['details'],
					
					'stat'			=> $_POST['stat'],
					'block'			=> $_POST['block'][0],
					
					'modified'	=> date("Y-m-d H:i:s", time())
					);
					
	// File upload 
	
	// Update main table
	
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
	