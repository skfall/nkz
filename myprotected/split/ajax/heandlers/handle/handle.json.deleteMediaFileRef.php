<?php 
	//********************
	//** WEB MIRACLE TECHNOLOGIES
	//********************
	
	// get post
	switch ($_POST['table']) {
		case 'th_gal':
			if ($_POST["path"] == "../split/files/house_gal/") {
				$appTable = 'osc_sys_house_gal';
			}else{
				$appTable = 'osc_th_gal';
			}
			break;
		case 'th_layouts':
			$appTable = 'osc_th_layouts_items';
			break;
		case 'sys_bp_entries':
			$appTable = 'osc_sys_bp_photos';
			break;
		case 'sys_doc_cats':
			$appTable = 'osc_sys_docs';
			break;
		case 'th_blocks':
			$appTable = 'osc_th_blocks_items';
			break;
		case 'sys_flats':
			$appTable = 'osc_sys_flats_layouts';
			break;
		case 'sys_houses':
			if ($_POST['path'] == '../split/files/house_slides/') {
				$appTable = 'osc_sys_house_slides';
			}elseif($_POST['path'] == '../split/files/house_gal/'){
				$appTable = 'osc_sys_house_gal';
			}
			break;
		case 'nth_blocks_layouts':
			$appTable = 'osc_nth_blocks_layouts_items';
			break;
		case 'nth_ready_th':
			$appTable = 'osc_nth_ready_th_layouts';
			break;
		default:
			break;
	}

	
	$id = $_POST['id'];

	$path = $_POST['path'];
	
	$root_path = "../../../..";
	
	if($path=='/split/files/documents/') $appTable = 'docs_ref';
	
	$data = array();

	$query = "SELECT * FROM $appTable WHERE `id`='$id' LIMIT 1";

	$data = $ah->rs($query);
	
	if($data)
	{
		$data = $data[0];
		
		$filepath = $root_path.$path.$data['file'];
		$croppath = $root_path.$path."crop/".$data['crop'];
	
	
		if(file_exists($filepath) && trim($data['file']) != "")
		{
			unlink($filepath);
		}
		
		if(file_exists($croppath) && trim($data['crop']) != "")
		{
			unlink($croppath);
		}
		
		$query = "DELETE FROM $appTable WHERE `id`='$id' LIMIT 1";
		
		$ah->rs($query);
		
		$data['message'] = "Success file delete";
	}else
	{
		$data['message'] = 'File not found';
	}
	