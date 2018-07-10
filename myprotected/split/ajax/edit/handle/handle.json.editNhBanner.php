<?php 
	//********************
	//** WEB MIRACLE TECHNOLOGIES
	//********************
	
	// get post
	
	$appTable = `osc_nh_banner`;
	
	$item_id = $_POST['item_id'];
	
	$cardUpd = array(
		'caption'			=> $_POST['caption'],
		'sub_1'			=> $_POST['sub_1'],
		'sub_2'			=> $_POST['sub_2'],
		'pos'			=> (int)$_POST['pos'],
		
		'block'			=> $_POST['block'][0],
		'modified' => date("Y-m-d H:i:s", time())

					);
	// File upload filename
	$file_path = "../../../../split/files/new_home/";
	// PREVIEW ------------------
	$im_1_filename = "source";
	$im_1 		= false;
	$im_1_name 	= 5;
	$im_1_pre 	= "nh_b_";
	
	if(isset($_FILES[$im_1_filename]) && $_FILES[$im_1_filename]['size'] > 0)
	{
		$im_1 		= true;
	}
	
	if($im_1)
	{
		$file_update = false;
		$file_update = $ah->mtvc_add_files_file(array(
				'path'			=>$file_path,
				'name'			=>$im_1_name,
				'pre'			=>$im_1_pre,
				'size'			=>10,
				'rule'			=>0,
				'max_w'			=>2500,
				'max_h'			=>2500,
				'files'			=>$im_1_filename
			  ));
		
		if($file_update)
		{
			$cardUpd[$im_1_filename] = $file_update;
		}
	}

	
// Update main table
	
$query = "UPDATE `osc_nh_banner` SET ";
			
$cntUpd = 0;
foreach($cardUpd as $field => $itemUpd)
{
	$cntUpd++;
	$query .= ($cntUpd==1 ? "`$field`='$itemUpd'" : ", `$field`='$itemUpd'");
}

$query .= " WHERE `id`=$item_id LIMIT 1";

$ah->rs($query);


$data['status'] = "success";
$data['message'] = "Слайд #$item_id успешно сохранен.";	