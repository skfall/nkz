<?php 
	//********************
	//** WEB MIRACLE TECHNOLOGIES
	//********************
	
	// get post
	
	$appTable = $_POST['appTable'];
	
	$item_id = $_POST['item_id'];
	
	$cardUpd = array(
					'name'			=> $_POST['name'],
					'caption'			=> $_POST['caption'],
					'finish'	=> $_POST['finish'],
					
					'block'			=> $_POST['block'][0],
					'modified'	=> date("Y-m-d H:i:s", time())
					);
		



	$layout_id = (isset($_POST['layout_id']) && $_POST['layout_id'] ? $_POST['layout_id'] : array());

	if ($layout_id) {

		$cardUpd["ref_id"] = $layout_id;
	}
	// Update main table
	
	$query = "UPDATE `osc_sys_events` SET ";
	
	$cntUpd = 0;
	foreach($cardUpd as $field => $itemUpd)
	{
		$cntUpd++;
		$query .= ($cntUpd==1 ? "`$field`='$itemUpd'" : ", `$field`='$itemUpd'");
	}
	
	$query .= " WHERE `id`=$item_id LIMIT 1";

	$data['query'] = $query;
		
	

	if (!$_POST["finish"]) {
		$data['message'] = "Укажите время окончания акции.";
	}else{
		$ah->rs($query);
		$data['message'] = "Акция успешно отредактирована!";
	}
	
		