<?php 
	//********************
	//** WEB MIRACLE TECHNOLOGIES
	//********************
	
	// get post
	
	$appTable = "osc_nh_traffic";
	
	$item_id = $_POST['item_id'];


	
	$cardUpd = array(
					'caption'			=> $_POST['caption'],
					'sub_caption'			=> $_POST['sub_caption'],
					'description'			=> $_POST['description'],
					'notification'			=> $_POST['notification'],

					'time1'			=> (int)$_POST['time1'],
					'dest1'			=> $_POST['dest1'],
					'ob1_lat'			=> (float)$_POST['ob1_lat'],
					'ob1_lng'			=> (float)$_POST['ob1_lng'],

					'time2'			=> (int)$_POST['time2'],
					'dest2'			=> $_POST['dest2'],
					'ob2_lat'			=> (float)$_POST['ob2_lat'],
					'ob2_lng'			=> (float)$_POST['ob2_lng'],

					'time3'			=> (int)$_POST['time3'],
					'dest3'			=> $_POST['dest3'],
					'ob3_lat'			=> (float)$_POST['ob3_lat'],
					'ob3_lng'			=> (float)$_POST['ob3_lng'],


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
	