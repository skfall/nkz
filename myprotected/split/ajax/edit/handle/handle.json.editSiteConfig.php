<?php 
	//********************
	//** WEB MIRACLE TECHNOLOGIES
	//********************
	
	// get post
	
	$appTable = $_POST['appTable'];
	
	$item_id = $_POST['item_id'];

	$lpx = $_POST['lpx'];

	$lang_prefix = ($lpx ? $lpx."_" : ""); // empty = en

	$query = "SELECT `filename` FROM [pre]total_config WHERE `id`='$item_id' LIMIT 1";
	$alias = $ah->rs($query);

	$old_filename = $alias[0]['filename'];
	
	$cardUpd = array(
					'sitename'		=> $_POST['sitename'],
					'index'			=> $_POST['index'][0],
					'support_email'		=> $_POST['support_email'],
					'phone_number'		=> $_POST['phone_number'],
					'phone_number2'		=> $_POST['phone_number2'],
					'partnership_phone'		=> $_POST['partnership_phone'],
					
					'hotline_phone'		=> $_POST['hotline_phone'],
					
					'address'		=> $_POST['address'],
					'office_address'		=> $_POST['office_address'],

					'work_time'		=> $_POST['work_time'],
					'fb_link'		=> $_POST['fb_link'],


					$lang_prefix.'meta_title'	=> $_POST['meta_title'],
					$lang_prefix.'meta_keys'		=> $_POST['meta_keys'],
					$lang_prefix.'meta_desc'		=> $_POST['meta_desc'],


					'afterHead'		=> $_POST['afterHead'],
					'afterBody'		=> $_POST['afterBody'],
					
					'dateModify'	=> date("Y-m-d H:i:s", time())
					);
					

	


	// Update main table
	
	$query = "UPDATE [pre]$appTable SET ";
	
	$cntUpd = 0;
	foreach($cardUpd as $field => $itemUpd)
	{
		$cntUpd++;
		$query .= ($cntUpd==1 ? "`$field`='$itemUpd'" : ", `$field`='$itemUpd'");
	}
	
	$query .= " WHERE `id`=$item_id LIMIT 1";
		
	$data['query'] = $query;
		
	$ah->rs($query);
	
	
	
	$data['message'] = "Настройки успешно вступили в силу";
	