<?php 
	//********************
	//** WEB MIRACLE TECHNOLOGIES
	//********************
	
	// get post
	
	$appTable = $_POST['appTable'];
	
	$item_id = (isset($_POST['item_id']) ? $_POST['item_id'] : 0);
	
	$cardUpd = array(
					'name'			=> $_POST['name'],
					'caption'			=> $_POST['caption'],
					'finish'	=> $_POST['finish'],
					'type' => $_POST['type'],
					'block'			=> $_POST['block'][0],
					'start'	=> date("Y-m-d H:i:s", time()),
					'modified'	=> date("Y-m-d H:i:s", time()),
					'created'	=> date("Y-m-d H:i:s", time()),


	);


	// Create main table item
	
	$query = "INSERT INTO `osc_sys_events`";
	
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
	if($item_id)
	{
		$data['item_id'] = $item_id;
	}else
	{
		$data['item_id'] = 0;
	}
	$data['real_item_id'] = $item_id;
	
	if (!$_POST["finish"]) {
		$data['message'] = "Укажите время окончания акции.";
	}
	if ($item_id) {
		$data['message'] = "Акция успешно создана. ID =  $item_id";
		$data['status'] = "success";
	}
	