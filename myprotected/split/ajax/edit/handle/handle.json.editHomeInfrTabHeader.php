<?php 
	//********************
	//** WEB MIRACLE TECHNOLOGIES
	//********************
	
	// get post
	
	$appTable = "osc_home_common";

	
	
	$cardUpd = array(
					'infr_capt'			=> $_POST['infr_capt'],
					
					);
					
	
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
	
	
	$data['message'] = "Заголовок успешно сохранен.";
	