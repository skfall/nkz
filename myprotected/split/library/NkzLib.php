<?php
	/*	KLYCHA WEB TECHNOLOGIES	*/
	/*	***************************	*/
	/*	Author: Sivkovich Maxim		*/
	/*	***************************	*/
	/*	Developed: from 2013		*/
	/*	***************************	*/
	
	// Settings class
	
require("BasicHelp.php");
class NKZ extends BasicHelp
{
   		public $dbh;
		
		public $table;
		public $id;
		public $item;
		
		public function __construct($dbh)
		{
			parent::__construct($dbh);
			$this->dbh = $dbh;
		} 
		
		public function getTHpage(){
			$q = "
				SELECT M.* 
				FROM `osc_th_page` AS M 
				WHERE M.id = 1 
				LIMIT 1
			";
			$result = $this->rs($q, 1);
			return $result;
		}

		public function getThGal($type){
			$q = "
				SELECT M.* 
				FROM `osc_th_gal` AS M 
				WHERE M.gal_num = ".$type." AND M.block = 0
			";
			$result = $this->rs($q);
			return $result;
		}


		public function getTHtabsItem($id) {
			$query = "SELECT M.* FROM `osc_th_tabs` as M WHERE `id`='$id' LIMIT 1";
			$resultMassive = $this->rs($query);
			$result = ($resultMassive ? $resultMassive[0] : array());
			return $result;
		}

		public function getTHtabs($params=array(),$typeCount=false){
			$filter_and = "";
			if(isset($params['filtr']['massive'])) {
				foreach($params['filtr']['massive'] as $f_name => $f_value) {
					if($f_value < 0) continue;
					$filter_and .= " AND ($f_name='$f_value') ";
				}
			}
			if(isset($params['filtr']['filtr_search_key']) && isset($params['filtr']['filtr_search_field']) && trim($params['filtr']['filtr_search_key']) != ""){
				$search_field = $params['filtr']['filtr_search_field'];
				$search_key = $params['filtr']['filtr_search_key'];
				$filter_and .= " AND ($search_field LIKE '%$search_key%') ";
			}
			$sort_field		= (isset($params['filtr']['sort_filtr']) ? $params['filtr']['sort_filtr'] : "M.id");
			$sort_vector	= (isset($params['filtr']['order_filtr']) ? $params['filtr']['order_filtr'] : "");
			$limit = (isset($_COOKIE['global_on_page']) ? (int)$_COOKIE['global_on_page'] : GLOBAL_ON_PAGE);
			if($limit <= 0) $limit = GLOBAL_ON_PAGE;
			$start = (isset($params['start']) ? ($params['start']-1)*$limit : 0);
			if(!$typeCount) {
				$query = "SELECT M.*
						FROM osc_th_tabs as M  
						WHERE 1 $filter_and 
						ORDER BY $sort_field $sort_vector 
						LIMIT $start,$limit";
				return $this->rs($query);
			}else{
				$query = "SELECT COUNT(*)  
						FROM osc_th_tabs as M  
						WHERE 1 $filter_and 
						LIMIT 100000";
				$result = $this->rs($query);
				return $result[0]['COUNT(*)'];
			}
		}
		public function getThBlocksItem($id){
			$query = "SELECT M.* FROM osc_th_blocks as M WHERE `id`='$id' LIMIT 1";
			$resultMassive = $this->rs($query);
			
			$result = ($resultMassive ? $resultMassive[0] : array());
		
			return $result;
		}

		public function getThBlockImages($id){
			$query = "SELECT M.* FROM osc_th_blocks_items as M WHERE `ref`='$id'";
			$resultMassive = $this->rs($query);
			$result = ($resultMassive ? $resultMassive : array());
			return $result;
		}

		public function getThFloors(){
			$query = "SELECT M.* FROM osc_th_floors as M WHERE `block`=0";
			$resultMassive = $this->rs($query);
			$result = ($resultMassive ? $resultMassive : array());
			return $result;
		}

		public function getThBlocks($params=array(),$typeCount=false){
			$filter_and = "";
			if(isset($params['filtr']['massive'])){
				foreach($params['filtr']['massive'] as $f_name => $f_value){
					if($f_value < 0) continue;
					$filter_and .= " AND ($f_name='$f_value') ";
				}
			}
			if(isset($params['filtr']['filtr_search_key']) && isset($params['filtr']['filtr_search_field']) && trim($params['filtr']['filtr_search_key']) != ""){
				$search_field = $params['filtr']['filtr_search_field'];
				$search_key = $params['filtr']['filtr_search_key'];
				$filter_and .= " AND ($search_field LIKE '%$search_key%') ";
			}
			$sort_field		= (isset($params['filtr']['sort_filtr']) ? $params['filtr']['sort_filtr'] : "M.id");
			$sort_vector	= (isset($params['filtr']['order_filtr']) ? $params['filtr']['order_filtr'] : "");
			$limit = (isset($_COOKIE['global_on_page']) ? (int)$_COOKIE['global_on_page'] : GLOBAL_ON_PAGE);
			if($limit <= 0) $limit = GLOBAL_ON_PAGE;
			$start = (isset($params['start']) ? ($params['start']-1)*$limit : 0);
			if(!$typeCount){
				$query = "
					SELECT M.* 
					FROM osc_th_blocks as M  
					WHERE 1 $filter_and 
					ORDER BY $sort_field $sort_vector 
					LIMIT $start,$limit
				";
				return $this->rs($query);
			}else{
				$query = "
					SELECT COUNT(*)  
					FROM osc_th_blocks as M  
					WHERE 1 $filter_and 
					LIMIT 100000
				";	
				$result = $this->rs($query);
				return $result[0]['COUNT(*)'];
			}
		}

		public function getThLayoutsItem($id){
			$query = "
				SELECT M.*,
				(SELECT B.name AS block_name FROM osc_th_blocks AS B WHERE B.id = M.th_id LIMIT 1) AS block_name, 
				(SELECT F.name AS floor_name FROM osc_th_floors AS F WHERE F.id = M.floor_id LIMIT 1) AS floor_name ,
				(SELECT E.name FROM osc_sys_events AS E WHERE E.ref_id = M.id AND E.type = 2 LIMIT 1) AS event_name 
				FROM osc_th_layouts as M 
				WHERE `id`='$id' 
				LIMIT 1";
			$resultMassive = $this->rs($query);
			
			$result = ($resultMassive ? $resultMassive[0] : array());
		
			return $result;
		}

		public function getThLayoutsImages($id){
			$query = "SELECT M.* FROM osc_th_layouts_items as M WHERE `ref_id`='$id'";
			$resultMassive = $this->rs($query);
			$result = ($resultMassive ? $resultMassive : array());
			return $result;
		}

		public function getThLayouts($params=array(),$typeCount=false){
			$filter_and = "";
			if(isset($params['filtr']['massive'])){
				foreach($params['filtr']['massive'] as $f_name => $f_value){
					if($f_value < 0) continue;
					$filter_and .= " AND ($f_name='$f_value') ";
				}
			}
			if(isset($params['filtr']['filtr_search_key']) && isset($params['filtr']['filtr_search_field']) && trim($params['filtr']['filtr_search_key']) != ""){
				$search_field = $params['filtr']['filtr_search_field'];
				$search_key = $params['filtr']['filtr_search_key'];
				$filter_and .= " AND ($search_field LIKE '%$search_key%') ";
			}
			$sort_field		= (isset($params['filtr']['sort_filtr']) ? $params['filtr']['sort_filtr'] : "M.id");
			$sort_vector	= (isset($params['filtr']['order_filtr']) ? $params['filtr']['order_filtr'] : "");
			$limit = (isset($_COOKIE['global_on_page']) ? (int)$_COOKIE['global_on_page'] : GLOBAL_ON_PAGE);
			if($limit <= 0) $limit = GLOBAL_ON_PAGE;
			$start = (isset($params['start']) ? ($params['start']-1)*$limit : 0);
			if(!$typeCount){
				$query = "
					SELECT M.* ,
				(SELECT B.name FROM osc_th_blocks AS B WHERE B.id = M.th_id LIMIT 1) AS block_name, 
				(SELECT F.name FROM osc_th_floors AS F WHERE F.id = M.floor_id LIMIT 1) AS floor_name ,
				(SELECT E.name FROM osc_sys_events AS E WHERE E.ref_id = M.id AND E.type = 2 LIMIT 1) AS event_name 
					FROM osc_th_layouts as M  
					WHERE 1 $filter_and 
					ORDER BY $sort_field $sort_vector 
					LIMIT $start,$limit
				";

				return $this->rs($query);
			}else{
				$query = "
					SELECT COUNT(*)  
					FROM osc_th_layouts as M  
					WHERE 1 $filter_and 
					LIMIT 100000
				";	
				$result = $this->rs($query);
				return $result[0]['COUNT(*)'];
			}
		}

		public function getFreeLayouts($type){

			$_table = "";
			$used_layouts = array();
			if ($type == 1) {
				$_table = "osc_sys_flats";
				$q = "SELECT ref_id FROM osc_sys_events WHERE type = 1";
				$used_layouts = $this->rs($q);
			}elseif($type == 2){
				$_table = "osc_th_layouts";
				$q = "SELECT ref_id FROM osc_sys_events WHERE type = 2";
				$used_layouts = $this->rs($q);
			}

			$and = "";
			if ($used_layouts && count($used_layouts)) {
				foreach ($used_layouts as $key => $l) {
					$id = $l["ref_id"];
					$and .= " AND M.id != ".$id;
				}
			}
			

			$query = "
				SELECT M.*
				FROM `".$_table."` as M 
				WHERE `block`=0 ".$and;




			$resultMassive = $this->rs($query);
			$result = ($resultMassive ? $resultMassive : array());

		
			return $result;
		}

		public function getEventItem($id){

			$query = "
				SELECT M.*,
				(SELECT FL.layout_name FROM `osc_sys_flats` AS FL WHERE FL.id = M.ref_id LIMIT 1) AS fl_layout_name,
				(SELECT TH.layout_name FROM `osc_th_layouts` AS TH WHERE TH.id = M.ref_id LIMIT 1) AS th_layout_name
				FROM osc_sys_events as M 
				WHERE `id`='$id' 
				LIMIT 1";
			$resultMassive = $this->rs($query);
			$result = ($resultMassive ? $resultMassive[0] : array());
		
			return $result;
		}


		public function getEvents($params=array(),$typeCount=false){
			$filter_and = "";
			if(isset($params['filtr']['massive'])){
				foreach($params['filtr']['massive'] as $f_name => $f_value){
					if($f_value < 0) continue;
					$filter_and .= " AND ($f_name='$f_value') ";
				}
			}
			if(isset($params['filtr']['filtr_search_key']) && isset($params['filtr']['filtr_search_field']) && trim($params['filtr']['filtr_search_key']) != ""){
				$search_field = $params['filtr']['filtr_search_field'];
				$search_key = $params['filtr']['filtr_search_key'];
				$filter_and .= " AND ($search_field LIKE '%$search_key%') ";
			}
			$sort_field		= (isset($params['filtr']['sort_filtr']) ? $params['filtr']['sort_filtr'] : "M.id");
			$sort_vector	= (isset($params['filtr']['order_filtr']) ? $params['filtr']['order_filtr'] : "");
			$limit = (isset($_COOKIE['global_on_page']) ? (int)$_COOKIE['global_on_page'] : GLOBAL_ON_PAGE);
			if($limit <= 0) $limit = GLOBAL_ON_PAGE;
			$start = (isset($params['start']) ? ($params['start']-1)*$limit : 0);
			if(!$typeCount){
				$query = "
					SELECT M.* ,
					(SELECT TH.layout_name FROM `osc_th_layouts` AS TH WHERE TH.id = M.ref_id LIMIT 1) as th_layout_name,
					(SELECT FL.layout_name FROM `osc_sys_flats` AS FL WHERE FL.id = M.ref_id LIMIT 1) as fl_layout_name
					FROM osc_sys_events as M  
					WHERE 1 $filter_and 
					ORDER BY $sort_field $sort_vector 
					LIMIT $start,$limit
				";

				return $this->rs($query);
			}else{
				$query = "
					SELECT COUNT(*)  
					FROM osc_sys_events as M  
					WHERE 1 $filter_and 
					LIMIT 100000
				";	
				$result = $this->rs($query);
				return $result[0]['COUNT(*)'];
			}
		}



		public function getHousesItem($id){
			$query = "SELECT M.* FROM osc_sys_houses as M WHERE `id`='$id' LIMIT 1";
			$resultMassive = $this->rs($query);
			
			$result = ($resultMassive ? $resultMassive[0] : array());
		
			return $result;
		}

		public function getHousesImages($id){
			$query = "SELECT M.* FROM osc_sys_house_slides as M WHERE `house_id`='$id'";
			$resultMassive = $this->rs($query);
			$result = ($resultMassive ? $resultMassive : array());
			return $result;
		}

		public function getHousesGal($id){
			$query = "SELECT M.* FROM osc_sys_house_gal as M WHERE `house_id`='$id'";
			$resultMassive = $this->rs($query);
			$result = ($resultMassive ? $resultMassive : array());
			return $result;
		}


		public function getHouses($params=array(),$typeCount=false){
			$filter_and = "";
			if(isset($params['filtr']['massive'])){
				foreach($params['filtr']['massive'] as $f_name => $f_value){
					if($f_value < 0) continue;
					$filter_and .= " AND ($f_name='$f_value') ";
				}
			}
			if(isset($params['filtr']['filtr_search_key']) && isset($params['filtr']['filtr_search_field']) && trim($params['filtr']['filtr_search_key']) != ""){
				$search_field = $params['filtr']['filtr_search_field'];
				$search_key = $params['filtr']['filtr_search_key'];
				$filter_and .= " AND ($search_field LIKE '%$search_key%') ";
			}
			$sort_field		= (isset($params['filtr']['sort_filtr']) ? $params['filtr']['sort_filtr'] : "M.id");
			$sort_vector	= (isset($params['filtr']['order_filtr']) ? $params['filtr']['order_filtr'] : "");
			$limit = (isset($_COOKIE['global_on_page']) ? (int)$_COOKIE['global_on_page'] : GLOBAL_ON_PAGE);
			if($limit <= 0) $limit = GLOBAL_ON_PAGE;
			$start = (isset($params['start']) ? ($params['start']-1)*$limit : 0);
			if(!$typeCount){
				$query = "
					SELECT M.* ,
					(SELECT COUNT(L.id) FROM osc_sys_flats AS L WHERE L.house_id = M.id LIMIT 1) AS layouts_count
					FROM osc_sys_houses as M  
					WHERE 1 $filter_and 
					ORDER BY $sort_field $sort_vector 
					LIMIT $start,$limit
				";
				return $this->rs($query);
			}else{
				$query = "
					SELECT COUNT(*)  
					FROM osc_sys_houses as M  
					WHERE 1 $filter_and 
					LIMIT 100000
				";	
				$result = $this->rs($query);
				return $result[0]['COUNT(*)'];
			}
		}

		public function getRoomsItem($id){
			$query = "SELECT M.*, (SELECT H.name FROM osc_sys_houses AS H WHERE H.id = M.house_id LIMIT 1) AS house_name FROM osc_sys_rooms as M WHERE `id`='$id' LIMIT 1";
			$resultMassive = $this->rs($query);
			
			$result = ($resultMassive ? $resultMassive[0] : array());
		
			return $result;
		}

		public function getRoomsForLayouts(){
			$q = "
				SELECT M.* ,
					(SELECT H.name FROM osc_sys_houses AS H WHERE H.id = M.house_id LIMIT 1) AS house_name
				FROM osc_sys_rooms as M  
				WHERE 1 
				ORDER BY id  
				LIMIT 1000
			";
			return $this->rs($q);
		}

		public function getRooms($params=array(),$typeCount=false){
			$filter_and = "";
			if(isset($params['filtr']['massive'])){
				foreach($params['filtr']['massive'] as $f_name => $f_value){
					if($f_value < 0) continue;
					$filter_and .= " AND ($f_name='$f_value') ";
				}
			}
			if(isset($params['filtr']['filtr_search_key']) && isset($params['filtr']['filtr_search_field']) && trim($params['filtr']['filtr_search_key']) != ""){
				$search_field = $params['filtr']['filtr_search_field'];
				$search_key = $params['filtr']['filtr_search_key'];
				$filter_and .= " AND ($search_field LIKE '%$search_key%') ";
			}
			$sort_field		= (isset($params['filtr']['sort_filtr']) ? $params['filtr']['sort_filtr'] : "M.id");
			$sort_vector	= (isset($params['filtr']['order_filtr']) ? $params['filtr']['order_filtr'] : "");
			$limit = (isset($_COOKIE['global_on_page']) ? (int)$_COOKIE['global_on_page'] : GLOBAL_ON_PAGE);
			if($limit <= 0) $limit = GLOBAL_ON_PAGE;
			$start = (isset($params['start']) ? ($params['start']-1)*$limit : 0);
			if(!$typeCount){
				$query = "
					SELECT M.* ,
					(SELECT H.name FROM osc_sys_houses AS H WHERE H.id = M.house_id LIMIT 1) AS house_name
					FROM osc_sys_rooms as M  
					WHERE 1 $filter_and 
					ORDER BY $sort_field $sort_vector 
					LIMIT $start,$limit
				";
				return $this->rs($query);
			}else{
				$query = "
					SELECT COUNT(*)  
					FROM osc_sys_rooms as M  
					WHERE 1 $filter_and 
					LIMIT 100000
				";	
				$result = $this->rs($query);
				return $result[0]['COUNT(*)'];
			}
		}


		public function getFlatsItem($id){
			$query = "
				SELECT M.*, 
				(SELECT H.name FROM osc_sys_houses AS H WHERE H.id = M.house_id LIMIT 1) as house_name,
				(SELECT R.name FROM osc_sys_rooms AS R WHERE R.id = M.room_id LIMIT 1) as room_name,
				(SELECT E.name FROM osc_sys_events AS E WHERE E.ref_id = M.id AND E.type = 1 LIMIT 1) as event_name
				FROM osc_sys_flats as M 
				WHERE `id`='$id' 
				LIMIT 1";
			$resultMassive = $this->rs($query);
			
			$result = ($resultMassive ? $resultMassive[0] : array());
		
			return $result;
		}

		public function getFlatsLayouts($id){
			$query = "SELECT M.* FROM osc_sys_flats_layouts as M WHERE M.flat_id='$id'";
			$resultMassive = $this->rs($query);
			$result = ($resultMassive ? $resultMassive : array());
			return $result;
		}


		public function getFlats($params=array(),$typeCount=false){
			$filter_and = "";
			if(isset($params['filtr']['massive'])){
				foreach($params['filtr']['massive'] as $f_name => $f_value){
					if($f_value < 0) continue;
					$filter_and .= " AND ($f_name='$f_value') ";
				}
			}
			if(isset($params['filtr']['filtr_search_key']) && isset($params['filtr']['filtr_search_field']) && trim($params['filtr']['filtr_search_key']) != ""){
				$search_field = $params['filtr']['filtr_search_field'];
				$search_key = $params['filtr']['filtr_search_key'];
				$filter_and .= " AND ($search_field LIKE '%$search_key%') ";
			}
			$sort_field		= (isset($params['filtr']['sort_filtr']) ? $params['filtr']['sort_filtr'] : "M.id");
			$sort_vector	= (isset($params['filtr']['order_filtr']) ? $params['filtr']['order_filtr'] : "");
			$limit = (isset($_COOKIE['global_on_page']) ? (int)$_COOKIE['global_on_page'] : GLOBAL_ON_PAGE);
			if($limit <= 0) $limit = GLOBAL_ON_PAGE;
			$start = (isset($params['start']) ? ($params['start']-1)*$limit : 0);
			if(!$typeCount){
				$query = "
					SELECT M.* ,
					(SELECT H.name FROM osc_sys_houses AS H WHERE H.id = M.house_id LIMIT 1) as house_name,
					(SELECT R.name FROM osc_sys_rooms AS R WHERE R.id = M.room_id LIMIT 1) as room_name,
					(SELECT E.name FROM osc_sys_events AS E WHERE E.ref_id = M.id AND E.type = 1 LIMIT 1) as event_name
					FROM osc_sys_flats as M  
					WHERE 1 $filter_and 
					ORDER BY $sort_field $sort_vector 
					LIMIT $start,$limit
				";
				return $this->rs($query);
			}else{
				$query = "
					SELECT COUNT(*)  
					FROM osc_sys_flats as M  
					WHERE 1 $filter_and 
					LIMIT 100000
				";	
				$result = $this->rs($query);
				return $result[0]['COUNT(*)'];
			}
		}



		public function getDocs($cat){
			$q = "
				SELECT M.* FROM `osc_sys_docs` AS M WHERE M.cat = '$cat' LIMIT 1000
			";

			$resultMassive = $this->rs($q);
			
			$result = ($resultMassive ? $resultMassive : array());
			return $result;
		}

		public function getDocsCatsItem($id){
			$query = "SELECT M.*,
			(SELECT COUNT(`id`) FROM `osc_sys_docs` WHERE `cat` = M.id LIMIT 1) AS docs_count 
			FROM osc_sys_doc_cats as M WHERE `id`='$id' LIMIT 1";
			$resultMassive = $this->rs($query);
			
			$result = ($resultMassive ? $resultMassive[0] : array());
		
			return $result;
		}


		public function getDocsCats($params=array(),$typeCount=false){
			$filter_and = "";
			if(isset($params['filtr']['massive'])){
				foreach($params['filtr']['massive'] as $f_name => $f_value){
					if($f_value < 0) continue;
					$filter_and .= " AND ($f_name='$f_value') ";
				}
			}
			if(isset($params['filtr']['filtr_search_key']) && isset($params['filtr']['filtr_search_field']) && trim($params['filtr']['filtr_search_key']) != ""){
				$search_field = $params['filtr']['filtr_search_field'];
				$search_key = $params['filtr']['filtr_search_key'];
				$filter_and .= " AND ($search_field LIKE '%$search_key%') ";
			}
			$sort_field		= (isset($params['filtr']['sort_filtr']) ? $params['filtr']['sort_filtr'] : "M.id");
			$sort_vector	= (isset($params['filtr']['order_filtr']) ? $params['filtr']['order_filtr'] : "");
			$limit = (isset($_COOKIE['global_on_page']) ? (int)$_COOKIE['global_on_page'] : GLOBAL_ON_PAGE);
			if($limit <= 0) $limit = GLOBAL_ON_PAGE;
			$start = (isset($params['start']) ? ($params['start']-1)*$limit : 0);
			if(!$typeCount){
				$query = "
					SELECT M.* ,
					(SELECT COUNT(`id`) FROM `osc_sys_docs` WHERE `cat` = M.id LIMIT 1) AS docs_count 
					FROM osc_sys_doc_cats as M  
					WHERE 1 $filter_and 
					ORDER BY $sort_field $sort_vector 
					LIMIT $start,$limit
				";
				return $this->rs($query);
			}else{
				$query = "
					SELECT COUNT(*)  
					FROM osc_sys_doc_cats as M  
					WHERE 1 $filter_and 
					LIMIT 100000
				";	
				$result = $this->rs($query);
				return $result[0]['COUNT(*)'];
			}
		}

		public function getManager(){
			$query = "SELECT M.*
			FROM osc_sys_manager as M WHERE `id`='1' LIMIT 1";
			$resultMassive = $this->rs($query);
			
			$result = ($resultMassive ? $resultMassive[0] : array());
		
			return $result;
		}




		public function getManagerMenuItem($id){
			$query = "SELECT M.*
			
			FROM osc_sys_manager_menu as M WHERE `id`='$id' LIMIT 1";
			$resultMassive = $this->rs($query);
			
			$result = ($resultMassive ? $resultMassive[0] : array());
		
			return $result;
		}


		public function getManagerMenu($params=array(),$typeCount=false){
			$filter_and = "";
			if(isset($params['filtr']['massive'])){
				foreach($params['filtr']['massive'] as $f_name => $f_value){
					if($f_value < 0) continue;
					$filter_and .= " AND ($f_name='$f_value') ";
				}
			}
			if(isset($params['filtr']['filtr_search_key']) && isset($params['filtr']['filtr_search_field']) && trim($params['filtr']['filtr_search_key']) != ""){
				$search_field = $params['filtr']['filtr_search_field'];
				$search_key = $params['filtr']['filtr_search_key'];
				$filter_and .= " AND ($search_field LIKE '%$search_key%') ";
			}
			$sort_field		= (isset($params['filtr']['sort_filtr']) ? $params['filtr']['sort_filtr'] : "M.id");
			$sort_vector	= (isset($params['filtr']['order_filtr']) ? $params['filtr']['order_filtr'] : "");
			$limit = (isset($_COOKIE['global_on_page']) ? (int)$_COOKIE['global_on_page'] : GLOBAL_ON_PAGE);
			if($limit <= 0) $limit = GLOBAL_ON_PAGE;
			$start = (isset($params['start']) ? ($params['start']-1)*$limit : 0);
			if(!$typeCount){
				$query = "
					SELECT M.* 
					FROM osc_sys_manager_menu as M  
					WHERE 1 $filter_and 
					ORDER BY $sort_field $sort_vector 
					LIMIT $start,$limit
				";
				return $this->rs($query);
			}else{
				$query = "
					SELECT COUNT(*)  
					FROM osc_sys_manager_menu as M  
					WHERE 1 $filter_and 
					LIMIT 100000
				";	
				$result = $this->rs($query);
				return $result[0]['COUNT(*)'];
			}
		}

		public function getAboutPage(){
			$q = "
				SELECT M.* 
				FROM `osc_about_page` AS M 
				WHERE M.id = 1 
				LIMIT 1
			";
			$result = $this->rs($q, 1);
			return $result;
		}

		public function getContactsPage(){
			$q = "
				SELECT M.* 
				FROM `osc_contacts_page` AS M 
				WHERE M.id = 1 
				LIMIT 1
			";
			$result = $this->rs($q, 1);
			return $result;
		}

		public function getProjectsItem($id){
			$query = "SELECT M.* 
			FROM osc_sys_projects as M WHERE `id`='$id' LIMIT 1";
			$resultMassive = $this->rs($query);
			
			$result = ($resultMassive ? $resultMassive[0] : array());
		
			return $result;
		}


		public function getProjects($params=array(),$typeCount=false){
			$filter_and = "";
			if(isset($params['filtr']['massive'])){
				foreach($params['filtr']['massive'] as $f_name => $f_value){
					if($f_value < 0) continue;
					$filter_and .= " AND ($f_name='$f_value') ";
				}
			}
			if(isset($params['filtr']['filtr_search_key']) && isset($params['filtr']['filtr_search_field']) && trim($params['filtr']['filtr_search_key']) != ""){
				$search_field = $params['filtr']['filtr_search_field'];
				$search_key = $params['filtr']['filtr_search_key'];
				$filter_and .= " AND ($search_field LIKE '%$search_key%') ";
			}
			$sort_field		= (isset($params['filtr']['sort_filtr']) ? $params['filtr']['sort_filtr'] : "M.id");
			$sort_vector	= (isset($params['filtr']['order_filtr']) ? $params['filtr']['order_filtr'] : "");
			$limit = (isset($_COOKIE['global_on_page']) ? (int)$_COOKIE['global_on_page'] : GLOBAL_ON_PAGE);
			if($limit <= 0) $limit = GLOBAL_ON_PAGE;
			$start = (isset($params['start']) ? ($params['start']-1)*$limit : 0);
			if(!$typeCount){
				$query = "
					SELECT M.*
					FROM osc_sys_projects as M  
					WHERE 1 $filter_and 
					ORDER BY $sort_field $sort_vector 
					LIMIT $start,$limit
				";
				return $this->rs($query);
			}else{
				$query = "
					SELECT COUNT(*)  
					FROM osc_sys_projects as M  
					WHERE 1 $filter_and 
					LIMIT 100000
				";	
				$result = $this->rs($query);
				return $result[0]['COUNT(*)'];
			}
		}

		public function getHomeBan(){
			$q = "
				SELECT M.* 
				FROM `osc_home_ban` AS M 
				WHERE M.id = 1 
				LIMIT 1
			";
			$result = $this->rs($q, 1);
			return $result;
		}

		public function getHomePage(){
			$q = "
				SELECT M.* 
				FROM `osc_home_common` AS M 
				WHERE M.id = 1 
				LIMIT 1
			";
			$result = $this->rs($q, 1);
			return $result;
		}

		public function getHomeInfrItem($id){
			$query = "SELECT M.* 
			FROM osc_home_infrasctucture as M WHERE `id`='$id' LIMIT 1";
			$resultMassive = $this->rs($query);
			
			$result = ($resultMassive ? $resultMassive[0] : array());
		
			return $result;
		}


		public function getHomeInfr($params=array(),$typeCount=false){
			$filter_and = "";
			if(isset($params['filtr']['massive'])){
				foreach($params['filtr']['massive'] as $f_name => $f_value){
					if($f_value < 0) continue;
					$filter_and .= " AND ($f_name='$f_value') ";
				}
			}
			if(isset($params['filtr']['filtr_search_key']) && isset($params['filtr']['filtr_search_field']) && trim($params['filtr']['filtr_search_key']) != ""){
				$search_field = $params['filtr']['filtr_search_field'];
				$search_key = $params['filtr']['filtr_search_key'];
				$filter_and .= " AND ($search_field LIKE '%$search_key%') ";
			}
			$sort_field		= (isset($params['filtr']['sort_filtr']) ? $params['filtr']['sort_filtr'] : "M.id");
			$sort_vector	= (isset($params['filtr']['order_filtr']) ? $params['filtr']['order_filtr'] : "");
			$limit = (isset($_COOKIE['global_on_page']) ? (int)$_COOKIE['global_on_page'] : GLOBAL_ON_PAGE);
			if($limit <= 0) $limit = GLOBAL_ON_PAGE;
			$start = (isset($params['start']) ? ($params['start']-1)*$limit : 0);
			if(!$typeCount){
				$query = "
					SELECT M.*
					FROM osc_home_infrasctucture as M  
					WHERE 1 $filter_and 
					ORDER BY $sort_field $sort_vector 
					LIMIT $start,$limit
				";
				return $this->rs($query);
			}else{
				$query = "
					SELECT COUNT(*)  
					FROM osc_home_infrasctucture as M  
					WHERE 1 $filter_and 
					LIMIT 100000
				";	
				$result = $this->rs($query);
				return $result[0]['COUNT(*)'];
			}
		}

		public function getHomeEnvItem($id){
			$query = "SELECT M.* 
			FROM osc_home_env as M WHERE `id`='$id' LIMIT 1";
			$resultMassive = $this->rs($query);
			
			$result = ($resultMassive ? $resultMassive[0] : array());
		
			return $result;
		}


		public function getHomeEnv($params=array(),$typeCount=false){
			$filter_and = "";
			if(isset($params['filtr']['massive'])){
				foreach($params['filtr']['massive'] as $f_name => $f_value){
					if($f_value < 0) continue;
					$filter_and .= " AND ($f_name='$f_value') ";
				}
			}
			if(isset($params['filtr']['filtr_search_key']) && isset($params['filtr']['filtr_search_field']) && trim($params['filtr']['filtr_search_key']) != ""){
				$search_field = $params['filtr']['filtr_search_field'];
				$search_key = $params['filtr']['filtr_search_key'];
				$filter_and .= " AND ($search_field LIKE '%$search_key%') ";
			}
			$sort_field		= (isset($params['filtr']['sort_filtr']) ? $params['filtr']['sort_filtr'] : "M.id");
			$sort_vector	= (isset($params['filtr']['order_filtr']) ? $params['filtr']['order_filtr'] : "");
			$limit = (isset($_COOKIE['global_on_page']) ? (int)$_COOKIE['global_on_page'] : GLOBAL_ON_PAGE);
			if($limit <= 0) $limit = GLOBAL_ON_PAGE;
			$start = (isset($params['start']) ? ($params['start']-1)*$limit : 0);
			if(!$typeCount){
				$query = "
					SELECT M.*
					FROM osc_home_env as M  
					WHERE 1 $filter_and 
					ORDER BY $sort_field $sort_vector 
					LIMIT $start,$limit
				";
				return $this->rs($query);
			}else{
				$query = "
					SELECT COUNT(*)  
					FROM osc_home_env as M  
					WHERE 1 $filter_and 
					LIMIT 100000
				";	
				$result = $this->rs($query);
				return $result[0]['COUNT(*)'];
			}
		}

		public function getHomeEnvParents(){
			return $this->rs("SELECT M.* FROM `osc_home_env` AS M");
		}

		public function getHomeEnvItemsItem($id){
			$query = "SELECT M.* ,
			(SELECT P.name FROM `osc_home_env` AS P WHERE P.id = M.ref LIMIT 1) AS parent_name
			FROM osc_home_env_items as M WHERE `id`='$id' LIMIT 1";
			$resultMassive = $this->rs($query);
			
			$result = ($resultMassive ? $resultMassive[0] : array());
		
			return $result;
		}



		public function getHomeEnvItems($params=array(),$typeCount=false){
			$filter_and = "";
			if(isset($params['filtr']['massive'])){
				foreach($params['filtr']['massive'] as $f_name => $f_value){
					if($f_value < 0) continue;
					$filter_and .= " AND ($f_name='$f_value') ";
				}
			}
			if(isset($params['filtr']['filtr_search_key']) && isset($params['filtr']['filtr_search_field']) && trim($params['filtr']['filtr_search_key']) != ""){
				$search_field = $params['filtr']['filtr_search_field'];
				$search_key = $params['filtr']['filtr_search_key'];
				$filter_and .= " AND ($search_field LIKE '%$search_key%') ";
			}
			$sort_field		= (isset($params['filtr']['sort_filtr']) ? $params['filtr']['sort_filtr'] : "M.id");
			$sort_vector	= (isset($params['filtr']['order_filtr']) ? $params['filtr']['order_filtr'] : "");
			$limit = (isset($_COOKIE['global_on_page']) ? (int)$_COOKIE['global_on_page'] : GLOBAL_ON_PAGE);
			if($limit <= 0) $limit = GLOBAL_ON_PAGE;
			$start = (isset($params['start']) ? ($params['start']-1)*$limit : 0);
			if(!$typeCount){
				$query = "
					SELECT M.*,
			(SELECT P.name FROM `osc_home_env` AS P WHERE P.id = M.ref LIMIT 1) AS parent_name
					FROM osc_home_env_items as M  
					WHERE 1 $filter_and 
					ORDER BY $sort_field $sort_vector 
					LIMIT $start,$limit
				";
				return $this->rs($query);
			}else{
				$query = "
					SELECT COUNT(*)  
					FROM osc_home_env_items as M  
					WHERE 1 $filter_and 
					LIMIT 100000
				";	
				$result = $this->rs($query);
				return $result[0]['COUNT(*)'];
			}
		}

		public function getHomeGalItem($id){
			$query = "SELECT M.* 
			FROM osc_home_gal as M WHERE `id`='$id' LIMIT 1";
			$resultMassive = $this->rs($query);
			
			$result = ($resultMassive ? $resultMassive[0] : array());
		
			return $result;
		}



		public function getHomeGal($params=array(),$typeCount=false){
			$filter_and = "";
			if(isset($params['filtr']['massive'])){
				foreach($params['filtr']['massive'] as $f_name => $f_value){
					if($f_value < 0) continue;
					$filter_and .= " AND ($f_name='$f_value') ";
				}
			}
			if(isset($params['filtr']['filtr_search_key']) && isset($params['filtr']['filtr_search_field']) && trim($params['filtr']['filtr_search_key']) != ""){
				$search_field = $params['filtr']['filtr_search_field'];
				$search_key = $params['filtr']['filtr_search_key'];
				$filter_and .= " AND ($search_field LIKE '%$search_key%') ";
			}
			$sort_field		= (isset($params['filtr']['sort_filtr']) ? $params['filtr']['sort_filtr'] : "M.id");
			$sort_vector	= (isset($params['filtr']['order_filtr']) ? $params['filtr']['order_filtr'] : "");
			$limit = (isset($_COOKIE['global_on_page']) ? (int)$_COOKIE['global_on_page'] : GLOBAL_ON_PAGE);
			if($limit <= 0) $limit = GLOBAL_ON_PAGE;
			$start = (isset($params['start']) ? ($params['start']-1)*$limit : 0);
			if(!$typeCount){
				$query = "
					SELECT M.*
					FROM osc_home_gal as M  
					WHERE 1 $filter_and 
					ORDER BY $sort_field $sort_vector 
					LIMIT $start,$limit
				";
				return $this->rs($query);
			}else{
				$query = "
					SELECT COUNT(*)  
					FROM osc_home_gal as M  
					WHERE 1 $filter_and 
					LIMIT 100000
				";	
				$result = $this->rs($query);
				return $result[0]['COUNT(*)'];
			}
		}

		public function getHomeDev(){
			$q = "
				SELECT M.* 
				FROM `osc_home_dev` AS M 
				WHERE M.id = 1 
				LIMIT 1
			";
			$result = $this->rs($q, 1);
			return $result;
		}

		public function getMeta($alias){
		$q = "SELECT M.* FROM `osc_meta_table` AS M WHERE M.alias = '$alias' LIMIT 1";
		return $this->rs($q)[0];
	}

	public function getNewsCatsItem($id){
		$query = "SELECT M.* ,
		(SELECT COUNT(N.id) FROM `osc_page_news_items` AS N WHERE N.cat = M.id LIMIT 1) AS count_news
		FROM osc_page_news_cats as M WHERE `id`='$id' LIMIT 1";
		$resultMassive = $this->rs($query);
		
		$result = ($resultMassive ? $resultMassive[0] : array());
	
		return $result;
	}
	public function getNewsCats($params=array(),$typeCount=false){
		$filter_and = "";
		if(isset($params['filtr']['massive'])){
			foreach($params['filtr']['massive'] as $f_name => $f_value){
				if($f_value < 0) continue;
				$filter_and .= " AND ($f_name='$f_value') ";
			}
		}
		if(isset($params['filtr']['filtr_search_key']) && isset($params['filtr']['filtr_search_field']) && trim($params['filtr']['filtr_search_key']) != ""){
			$search_field = $params['filtr']['filtr_search_field'];
			$search_key = $params['filtr']['filtr_search_key'];
			$filter_and .= " AND ($search_field LIKE '%$search_key%') ";
		}
		$sort_field		= (isset($params['filtr']['sort_filtr']) ? $params['filtr']['sort_filtr'] : "M.id");
		$sort_vector	= (isset($params['filtr']['order_filtr']) ? $params['filtr']['order_filtr'] : "");
		$limit = (isset($_COOKIE['global_on_page']) ? (int)$_COOKIE['global_on_page'] : GLOBAL_ON_PAGE);
		if($limit <= 0) $limit = GLOBAL_ON_PAGE;
		$start = (isset($params['start']) ? ($params['start']-1)*$limit : 0);
		if(!$typeCount){
			$query = "
				SELECT M.* ,
				(SELECT COUNT(N.id) FROM `osc_page_news_items` AS N WHERE N.cat = M.id LIMIT 1) AS count_news
				FROM osc_page_news_cats as M  
				WHERE 1 $filter_and 
				ORDER BY $sort_field $sort_vector 
				LIMIT $start,$limit
			";
			return $this->rs($query);
		}else{
			$query = "
				SELECT COUNT(*)  
				FROM osc_page_news_cats as M  
				WHERE 1 $filter_and 
				LIMIT 100000
			";	
			$result = $this->rs($query);
			return $result[0]['COUNT(*)'];
		}
	}

	public function getNewsPage(){
		$q = "
			SELECT M.* 
			FROM `osc_page_news` AS M 
			WHERE M.id = 1 
			LIMIT 1
		";
		$result = $this->rs($q, 1);
		return $result;
	}



	public function getNewsItem($id){
		$query = "SELECT M.* ,
		(SELECT C.name FROM `osc_page_news_cats` AS C WHERE C.id = M.cat LIMIT 1) AS cat_name
		FROM osc_page_news_items as M WHERE `id`='$id' LIMIT 1";
		$resultMassive = $this->rs($query);
		
		$result = ($resultMassive ? $resultMassive[0] : array());

		$q = "
			SELECT M.id, M.file, M.order_pos
			FROM `osc_page_news_files` AS M 
			WHERE 
				M.block = 0 AND
				M.ref = '$id'
			LIMIT 1000
		";
		$news_item_gal = $this->rs($q);
		$result['gallery'] = ($news_item_gal ? $news_item_gal : array());

	
		return $result;
	}
	public function getNews($params=array(),$typeCount=false){
		$filter_and = "";
		if(isset($params['filtr']['massive'])){
			foreach($params['filtr']['massive'] as $f_name => $f_value){
				if($f_value < 0) continue;
				$filter_and .= " AND ($f_name='$f_value') ";
			}
		}
		if(isset($params['filtr']['filtr_search_key']) && isset($params['filtr']['filtr_search_field']) && trim($params['filtr']['filtr_search_key']) != ""){
			$search_field = $params['filtr']['filtr_search_field'];
			$search_key = $params['filtr']['filtr_search_key'];
			$filter_and .= " AND ($search_field LIKE '%$search_key%') ";
		}
		$sort_field		= (isset($params['filtr']['sort_filtr']) ? $params['filtr']['sort_filtr'] : "M.id");
		$sort_vector	= (isset($params['filtr']['order_filtr']) ? $params['filtr']['order_filtr'] : "");
		$limit = (isset($_COOKIE['global_on_page']) ? (int)$_COOKIE['global_on_page'] : GLOBAL_ON_PAGE);
		if($limit <= 0) $limit = GLOBAL_ON_PAGE;
		$start = (isset($params['start']) ? ($params['start']-1)*$limit : 0);
		if(!$typeCount){
			$query = "
				SELECT M.* ,
					(SELECT C.name FROM `osc_page_news_cats` AS C WHERE C.id = M.cat LIMIT 1) AS cat_name
				FROM osc_page_news_items as M  
				WHERE 1 $filter_and 
				ORDER BY $sort_field $sort_vector 
				LIMIT $start,$limit
			";
			return $this->rs($query);
		}else{
			$query = "
				SELECT COUNT(*)  
				FROM osc_page_news_items as M  
				WHERE 1 $filter_and 
				LIMIT 100000
			";	
			$result = $this->rs($query);
			return $result[0]['COUNT(*)'];
		}
	}


	public function getBpCatsItem($id){
		$query = "SELECT M.* ,
		(SELECT COUNT(N.id) FROM `osc_sys_bp_entries` AS N WHERE N.cat = M.id LIMIT 1) AS count_entries
		FROM osc_sys_bp_cats as M WHERE `id`='$id' LIMIT 1";
		$resultMassive = $this->rs($query);
		
		$result = ($resultMassive ? $resultMassive[0] : array());
	
		return $result;
	}
	
	public function getBpCats($params=array(),$typeCount=false){

		$filter_and = "";
		if(isset($params['filtr']['massive'])){
			foreach($params['filtr']['massive'] as $f_name => $f_value){
				if($f_value < 0) continue;
				$filter_and .= " AND ($f_name='$f_value') ";
			}
		}
		if(isset($params['filtr']['filtr_search_key']) && isset($params['filtr']['filtr_search_field']) && trim($params['filtr']['filtr_search_key']) != ""){
			$search_field = $params['filtr']['filtr_search_field'];
			$search_key = $params['filtr']['filtr_search_key'];
			$filter_and .= " AND ($search_field LIKE '%$search_key%') ";
		}
		$sort_field		= (isset($params['filtr']['sort_filtr']) ? $params['filtr']['sort_filtr'] : "M.id");
		$sort_vector	= (isset($params['filtr']['order_filtr']) ? $params['filtr']['order_filtr'] : "");
		$limit = (isset($_COOKIE['global_on_page']) ? (int)$_COOKIE['global_on_page'] : GLOBAL_ON_PAGE);
		if($limit <= 0) $limit = GLOBAL_ON_PAGE;
		$start = (isset($params['start']) ? ($params['start']-1)*$limit : 0);
		if(!$typeCount){
			$query = "
				SELECT M.* ,
				(SELECT COUNT(N.id) FROM `osc_sys_bp_entries` AS N WHERE N.cat = M.id LIMIT 1) AS count_entries
				FROM osc_sys_bp_cats as M  
				WHERE 1 $filter_and 
				ORDER BY $sort_field $sort_vector 
				LIMIT $start,$limit
			";
			return $this->rs($query);
		}else{
			$query = "
				SELECT COUNT(*)  
				FROM osc_sys_bp_cats as M  
				WHERE 1 $filter_and 
				LIMIT 100000
			";	
			$result = $this->rs($query);
			return $result[0]['COUNT(*)'];
		}
	}

	public function getBpItem($id){
		$query = "SELECT M.* ,
		(SELECT C.name FROM `osc_sys_bp_cats` AS C WHERE C.id = M.cat LIMIT 1) AS cat_name
		FROM osc_sys_bp_entries as M WHERE `id`='$id' LIMIT 1";
		$resultMassive = $this->rs($query);
		
		$result = ($resultMassive ? $resultMassive[0] : array());

		$q = "
			SELECT M.*
			FROM `osc_sys_bp_photos` AS M 
			WHERE 
				M.block = 0 AND
				M.entry_id = '$id'
			LIMIT 1000
		";
		$news_item_gal = $this->rs($q);
		$result['photos'] = ($news_item_gal ? $news_item_gal : array());

	
		return $result;
	}
	public function getBp($params=array(),$typeCount=false){
		$filter_and = "";
		if(isset($params['filtr']['massive'])){
			foreach($params['filtr']['massive'] as $f_name => $f_value){
				if($f_value < 0) continue;
				$filter_and .= " AND ($f_name='$f_value') ";
			}
		}
		if(isset($params['filtr']['filtr_search_key']) && isset($params['filtr']['filtr_search_field']) && trim($params['filtr']['filtr_search_key']) != ""){
			$search_field = $params['filtr']['filtr_search_field'];
			$search_key = $params['filtr']['filtr_search_key'];
			$filter_and .= " AND ($search_field LIKE '%$search_key%') ";
		}
		$sort_field		= (isset($params['filtr']['sort_filtr']) ? $params['filtr']['sort_filtr'] : "M.id");
		$sort_vector	= (isset($params['filtr']['order_filtr']) ? $params['filtr']['order_filtr'] : "");
		$limit = (isset($_COOKIE['global_on_page']) ? (int)$_COOKIE['global_on_page'] : GLOBAL_ON_PAGE);
		if($limit <= 0) $limit = GLOBAL_ON_PAGE;
		$start = (isset($params['start']) ? ($params['start']-1)*$limit : 0);
		if(!$typeCount){
			$query = "
				SELECT M.* ,
					(SELECT C.name FROM `osc_sys_bp_cats` AS C WHERE C.id = M.cat LIMIT 1) AS cat_name
				FROM osc_sys_bp_entries as M  
				WHERE 1 $filter_and 
				ORDER BY $sort_field $sort_vector 
				LIMIT $start,$limit
			";
			return $this->rs($query);
		}else{
			$query = "
				SELECT COUNT(*)  
				FROM osc_sys_bp_entries as M  
				WHERE 1 $filter_and 
				LIMIT 100000
			";	
			$result = $this->rs($query);
			return $result[0]['COUNT(*)'];
		}
	}

	public function getBpPage(){
		$q = "
			SELECT M.* 
			FROM `osc_meta_table` AS M 
			WHERE M.id = 7 
			LIMIT 1
		";
		
		$result = $this->rs($q, 1);
		return $result;
	}


	public function getThBannerItem($id){
		$query = "SELECT M.* 
		FROM osc_nth_banner as M WHERE `id`='$id' LIMIT 1";
		$resultMassive = $this->rs($query);
		
		$result = ($resultMassive ? $resultMassive[0] : array());
	
		return $result;
	}
	public function getThBannerItems($params=array(),$typeCount=false){
		$filter_and = "";
		if(isset($params['filtr']['massive'])){
			foreach($params['filtr']['massive'] as $f_name => $f_value){
				if($f_value < 0) continue;
				$filter_and .= " AND ($f_name='$f_value') ";
			}
		}
		if(isset($params['filtr']['filtr_search_key']) && isset($params['filtr']['filtr_search_field']) && trim($params['filtr']['filtr_search_key']) != ""){
			$search_field = $params['filtr']['filtr_search_field'];
			$search_key = $params['filtr']['filtr_search_key'];
			$filter_and .= " AND ($search_field LIKE '%$search_key%') ";
		}
		$sort_field		= (isset($params['filtr']['sort_filtr']) ? $params['filtr']['sort_filtr'] : "M.id");
		$sort_vector	= (isset($params['filtr']['order_filtr']) ? $params['filtr']['order_filtr'] : "");
		$limit = (isset($_COOKIE['global_on_page']) ? (int)$_COOKIE['global_on_page'] : GLOBAL_ON_PAGE);
		if($limit <= 0) $limit = GLOBAL_ON_PAGE;
		$start = (isset($params['start']) ? ($params['start']-1)*$limit : 0);
		if(!$typeCount){
			$query = "
				SELECT M.*
				FROM osc_nth_banner as M  
				WHERE 1 $filter_and 
				ORDER BY $sort_field $sort_vector 
				LIMIT $start,$limit
			";
			return $this->rs($query);
		}else{
			$query = "
				SELECT COUNT(*)  
				FROM osc_nth_banner as M  
				WHERE 1 $filter_and 
				LIMIT 100000
			";	
			$result = $this->rs($query);
			return $result[0]['COUNT(*)'];
		}
	}

	public function getThIntro(){
		$q = "SELECT M.* FROM `osc_nth_intro` AS M WHERE M.id = 1 LIMIT 1";
		$result = $this->rs($q, 1);
		return $result;
	}

	public function getThVideo(){
		$q = "SELECT M.* FROM `osc_nth_video` AS M WHERE M.id = 1 LIMIT 1";
		$result = $this->rs($q, 1);
		return $result;
	}

	public function getThNewGalItem($id){
		$query = "SELECT M.* 
		FROM osc_nth_gal as M WHERE `id`='$id' LIMIT 1";
		$resultMassive = $this->rs($query);
		
		$result = ($resultMassive ? $resultMassive[0] : array());
	
		return $result;
	}
	public function getThNewGalItems($params=array(),$typeCount=false){
		$filter_and = "";
		if(isset($params['filtr']['massive'])){
			foreach($params['filtr']['massive'] as $f_name => $f_value){
				if($f_value < 0) continue;
				$filter_and .= " AND ($f_name='$f_value') ";
			}
		}
		if(isset($params['filtr']['filtr_search_key']) && isset($params['filtr']['filtr_search_field']) && trim($params['filtr']['filtr_search_key']) != ""){
			$search_field = $params['filtr']['filtr_search_field'];
			$search_key = $params['filtr']['filtr_search_key'];
			$filter_and .= " AND ($search_field LIKE '%$search_key%') ";
		}
		$sort_field		= (isset($params['filtr']['sort_filtr']) ? $params['filtr']['sort_filtr'] : "M.id");
		$sort_vector	= (isset($params['filtr']['order_filtr']) ? $params['filtr']['order_filtr'] : "");
		$limit = (isset($_COOKIE['global_on_page']) ? (int)$_COOKIE['global_on_page'] : GLOBAL_ON_PAGE);
		if($limit <= 0) $limit = GLOBAL_ON_PAGE;
		$start = (isset($params['start']) ? ($params['start']-1)*$limit : 0);
		if(!$typeCount){
			$query = "
				SELECT M.*
				FROM osc_nth_gal as M  
				WHERE 1 $filter_and 
				ORDER BY $sort_field $sort_vector 
				LIMIT $start,$limit
			";
			return $this->rs($query);
		}else{
			$query = "
				SELECT COUNT(*)  
				FROM osc_nth_gal as M  
				WHERE 1 $filter_and 
				LIMIT 100000
			";	
			$result = $this->rs($query);
			return $result[0]['COUNT(*)'];
		}
	}

	public function getThNewLinesItem($id){
		$query = "SELECT M.* 
		FROM osc_nth_blocks as M WHERE `id`='$id' LIMIT 1";
		$resultMassive = $this->rs($query);
		
		$result = ($resultMassive ? $resultMassive[0] : array());
	
		return $result;
	}
	public function getThNewLinesItems($params=array(),$typeCount=false){
		$filter_and = "";
		if(isset($params['filtr']['massive'])){
			foreach($params['filtr']['massive'] as $f_name => $f_value){
				if($f_value < 0) continue;
				$filter_and .= " AND ($f_name='$f_value') ";
			}
		}
		if(isset($params['filtr']['filtr_search_key']) && isset($params['filtr']['filtr_search_field']) && trim($params['filtr']['filtr_search_key']) != ""){
			$search_field = $params['filtr']['filtr_search_field'];
			$search_key = $params['filtr']['filtr_search_key'];
			$filter_and .= " AND ($search_field LIKE '%$search_key%') ";
		}
		$sort_field		= (isset($params['filtr']['sort_filtr']) ? $params['filtr']['sort_filtr'] : "M.id");
		$sort_vector	= (isset($params['filtr']['order_filtr']) ? $params['filtr']['order_filtr'] : "");
		$limit = (isset($_COOKIE['global_on_page']) ? (int)$_COOKIE['global_on_page'] : GLOBAL_ON_PAGE);
		if($limit <= 0) $limit = GLOBAL_ON_PAGE;
		$start = (isset($params['start']) ? ($params['start']-1)*$limit : 0);
		if(!$typeCount){
			$query = "
				SELECT M.*
				FROM osc_nth_blocks as M  
				WHERE 1 $filter_and 
				ORDER BY $sort_field $sort_vector 
				LIMIT $start,$limit
			";
			return $this->rs($query);
		}else{
			$query = "
				SELECT COUNT(*)  
				FROM osc_nth_blocks as M  
				WHERE 1 $filter_and 
				LIMIT 100000
			";	
			$result = $this->rs($query);
			return $result[0]['COUNT(*)'];
		}
	}

	public function getThNewLinesLayoutsItem($id){
		$query = "SELECT M.*, (SELECT `name` FROM `osc_nth_blocks` WHERE `id` = M.ref LIMIT 1) as block_name 
		FROM osc_nth_blocks_layouts as M WHERE `id`='$id' LIMIT 1";
		$resultMassive = $this->rs($query);
		
		$floors = $resultMassive;

		if ($floors) {
			foreach ($floors as $k => &$f) {
				$fid = $f['id'];
				$q = "SELECT * FROM `osc_nth_blocks_layouts_items` WHERE `ref` = '$fid' AND `block` = 0";
				$layouts = $this->rs($q);
				$f['layouts'] = $layouts;
			}
		}
		$result = ($floors ? $floors[0] : array());
	
		return $result;
	}
	public function getThNewLinesLayoutsItems($params=array(),$typeCount=false){
		$filter_and = "";
		if(isset($params['filtr']['massive'])){
			foreach($params['filtr']['massive'] as $f_name => $f_value){
				if($f_value < 0) continue;
				$filter_and .= " AND ($f_name='$f_value') ";
			}
		}
		if(isset($params['filtr']['filtr_search_key']) && isset($params['filtr']['filtr_search_field']) && trim($params['filtr']['filtr_search_key']) != ""){
			$search_field = $params['filtr']['filtr_search_field'];
			$search_key = $params['filtr']['filtr_search_key'];
			$filter_and .= " AND ($search_field LIKE '%$search_key%') ";
		}
		$sort_field		= (isset($params['filtr']['sort_filtr']) ? $params['filtr']['sort_filtr'] : "M.id");
		$sort_vector	= (isset($params['filtr']['order_filtr']) ? $params['filtr']['order_filtr'] : "");
		$limit = (isset($_COOKIE['global_on_page']) ? (int)$_COOKIE['global_on_page'] : GLOBAL_ON_PAGE);
		if($limit <= 0) $limit = GLOBAL_ON_PAGE;
		$start = (isset($params['start']) ? ($params['start']-1)*$limit : 0);
		if(!$typeCount){
			$query = "
				SELECT M.*, (SELECT `name` FROM `osc_nth_blocks` WHERE `id` = M.ref LIMIT 1) as block_name
				FROM osc_nth_blocks_layouts as M  
				WHERE 1 $filter_and 
				ORDER BY $sort_field $sort_vector 
				LIMIT $start,$limit
			";
			return $this->rs($query);
		}else{
			$query = "
				SELECT COUNT(*)  
				FROM osc_nth_blocks_layouts as M  
				WHERE 1 $filter_and 
				LIMIT 100000
			";	
			$result = $this->rs($query);
			return $result[0]['COUNT(*)'];
		}
	}

	public function getLines(){
		$q = "SELECT * FROM `osc_nth_blocks` WHERE `block` = 0";
		return $this->rs($q);
	}

	public function getThInfo1Page(){
		$query = "SELECT M.* FROM osc_nth_infoblock1 as M WHERE `id`=1 LIMIT 1";
		$resultMassive = $this->rs($query);
		
		$result = ($resultMassive ? $resultMassive[0] : array());
		
		return $result;
	}

	public function getThInfo1Item($id)
	{
		$query = "SELECT M.* FROM osc_nth_infoblock1_items as M WHERE `id`='$id' LIMIT 1";
		$resultMassive = $this->rs($query);
		
		$result = ($resultMassive ? $resultMassive[0] : array());
		
		return $result;
	}

	// Get all Home Why Us Items
	public function getThInfo1Items($params=array(),$typeCount=false)
	{
		// Filter params
		
		$filter_and = "";
		
		if(isset($params['filtr']['massive']))
		{
			foreach($params['filtr']['massive'] as $f_name => $f_value)
			{
				if($f_value < 0) continue;
				$filter_and .= " AND ($f_name='$f_value') ";
			}
		}
		
		// Filter like
		
		if(isset($params['filtr']['filtr_search_key']) && isset($params['filtr']['filtr_search_field']) && trim($params['filtr']['filtr_search_key']) != "")
		{
			$search_field = $params['filtr']['filtr_search_field'];
			$search_key = $params['filtr']['filtr_search_key'];
			
			$filter_and .= " AND ($search_field LIKE '%$search_key%') ";
		}
		
		// Filter sort
		
		$sort_field		= (isset($params['filtr']['sort_filtr']) ? $params['filtr']['sort_filtr'] : "M.id");
		
		$sort_vector	= (isset($params['filtr']['order_filtr']) ? $params['filtr']['order_filtr'] : "");
		
		// Order limits
		
		$limit = (isset($_COOKIE['global_on_page']) ? (int)$_COOKIE['global_on_page'] : GLOBAL_ON_PAGE);
		
		if($limit <= 0) $limit = GLOBAL_ON_PAGE;
		
		$start = (isset($params['start']) ? ($params['start']-1)*$limit : 0);
		
		if(!$typeCount)
		{
		
			$query = "SELECT M.*
		
					FROM osc_nth_infoblock1_items as M  
					
					WHERE 1 $filter_and 
					ORDER BY $sort_field $sort_vector 
					LIMIT $start,$limit";
					
			return $this->rs($query);
			
		}else
		{
			$query = "SELECT COUNT(*)  
		
					FROM osc_nth_infoblock1_items as M  
					
					WHERE 1 $filter_and 
					
					LIMIT 100000";
					
			$result = $this->rs($query);
			return $result[0]['COUNT(*)'];
		}
	}

	public function getThInfo2(){
		$q = "SELECT M.* FROM `osc_nth_infoblock2` AS M WHERE M.id = 1 LIMIT 1";
		$result = $this->rs($q, 1);
		return $result;
	}

	public function getThReadyItem($id){
		$query = "SELECT M.* 
		FROM osc_nth_ready_th as M WHERE `id`='$id' LIMIT 1";
		$resultMassive = $this->rs($query);
		
		$items = $resultMassive;

		if ($items) {
			foreach ($items as $k => &$f) {
				$fid = $f['id'];
				$q = "SELECT * FROM `osc_nth_ready_th_layouts` WHERE `ref` = '$fid' AND `block` = 0";
				$layouts = $this->rs($q);
				$f['layouts'] = $layouts;
			}
		}
		$result = ($items ? $items[0] : array());
	
		return $result;
	}
	public function getThReadyItems($params=array(),$typeCount=false){
		$filter_and = "";
		if(isset($params['filtr']['massive'])){
			foreach($params['filtr']['massive'] as $f_name => $f_value){
				if($f_value < 0) continue;
				$filter_and .= " AND ($f_name='$f_value') ";
			}
		}
		if(isset($params['filtr']['filtr_search_key']) && isset($params['filtr']['filtr_search_field']) && trim($params['filtr']['filtr_search_key']) != ""){
			$search_field = $params['filtr']['filtr_search_field'];
			$search_key = $params['filtr']['filtr_search_key'];
			$filter_and .= " AND ($search_field LIKE '%$search_key%') ";
		}
		$sort_field		= (isset($params['filtr']['sort_filtr']) ? $params['filtr']['sort_filtr'] : "M.id");
		$sort_vector	= (isset($params['filtr']['order_filtr']) ? $params['filtr']['order_filtr'] : "");
		$limit = (isset($_COOKIE['global_on_page']) ? (int)$_COOKIE['global_on_page'] : GLOBAL_ON_PAGE);
		if($limit <= 0) $limit = GLOBAL_ON_PAGE;
		$start = (isset($params['start']) ? ($params['start']-1)*$limit : 0);
		if(!$typeCount){
			$query = "
				SELECT M.* 
				FROM osc_nth_ready_th as M  
				WHERE 1 $filter_and 
				ORDER BY $sort_field $sort_vector 
				LIMIT $start,$limit
			";
			return $this->rs($query);
		}else{
			$query = "
				SELECT COUNT(*)  
				FROM osc_nth_ready_th as M  
				WHERE 1 $filter_and 
				LIMIT 100000
			";	
			$result = $this->rs($query);
			return $result[0]['COUNT(*)'];
		}
	}


	public function getNhBannerItem($id){
		$query = "SELECT M.* 
		FROM osc_nh_banner as M WHERE `id`='$id' LIMIT 1";
		$resultMassive = $this->rs($query);
		
		$result = ($resultMassive ? $resultMassive[0] : array());
	
		return $result;
	}


	public function getNhBannerItems($params=array(),$typeCount=false){
		$filter_and = "";
		if(isset($params['filtr']['massive'])){
			foreach($params['filtr']['massive'] as $f_name => $f_value){
				if($f_value < 0) continue;
				$filter_and .= " AND ($f_name='$f_value') ";
			}
		}
		if(isset($params['filtr']['filtr_search_key']) && isset($params['filtr']['filtr_search_field']) && trim($params['filtr']['filtr_search_key']) != ""){
			$search_field = $params['filtr']['filtr_search_field'];
			$search_key = $params['filtr']['filtr_search_key'];
			$filter_and .= " AND ($search_field LIKE '%$search_key%') ";
		}
		$sort_field		= (isset($params['filtr']['sort_filtr']) ? $params['filtr']['sort_filtr'] : "M.id");
		$sort_vector	= (isset($params['filtr']['order_filtr']) ? $params['filtr']['order_filtr'] : "");
		$limit = (isset($_COOKIE['global_on_page']) ? (int)$_COOKIE['global_on_page'] : GLOBAL_ON_PAGE);
		if($limit <= 0) $limit = GLOBAL_ON_PAGE;
		$start = (isset($params['start']) ? ($params['start']-1)*$limit : 0);
		if(!$typeCount){
			$query = "
				SELECT M.*
				FROM osc_nh_banner as M  
				WHERE 1 $filter_and 
				ORDER BY $sort_field $sort_vector 
				LIMIT $start,$limit
			";
			return $this->rs($query);
		}else{
			$query = "
				SELECT COUNT(*)  
				FROM osc_nh_banner as M  
				WHERE 1 $filter_and 
				LIMIT 100000
			";	
			$result = $this->rs($query);
			return $result[0]['COUNT(*)'];
		}
	}

	

	public function getNhTraffic(){
		$q = "
			SELECT M.* 
			FROM `osc_nh_traffic` AS M 
			WHERE M.id = 1 
			LIMIT 1
		";
		$result = $this->rs($q, 1);
		return $result;
	}


	public function getNhIntro(){
		$q = "
			SELECT M.* 
			FROM `osc_nh_intro` AS M 
			WHERE M.id = 1 
			LIMIT 1
		";
		$result = $this->rs($q, 1);
		return $result;
	}

	public function getNhGridItem($id){
		$query = "SELECT M.* 
		FROM osc_nh_grid as M WHERE `id`='$id' LIMIT 1";
		$resultMassive = $this->rs($query);
		
		$result = ($resultMassive ? $resultMassive[0] : array());
	
		return $result;
	}


	public function getNhGridItems($params=array(),$typeCount=false){
		$filter_and = "";
		if(isset($params['filtr']['massive'])){
			foreach($params['filtr']['massive'] as $f_name => $f_value){
				if($f_value < 0) continue;
				$filter_and .= " AND ($f_name='$f_value') ";
			}
		}
		if(isset($params['filtr']['filtr_search_key']) && isset($params['filtr']['filtr_search_field']) && trim($params['filtr']['filtr_search_key']) != ""){
			$search_field = $params['filtr']['filtr_search_field'];
			$search_key = $params['filtr']['filtr_search_key'];
			$filter_and .= " AND ($search_field LIKE '%$search_key%') ";
		}
		$sort_field		= (isset($params['filtr']['sort_filtr']) ? $params['filtr']['sort_filtr'] : "M.id");
		$sort_vector	= (isset($params['filtr']['order_filtr']) ? $params['filtr']['order_filtr'] : "");
		$limit = (isset($_COOKIE['global_on_page']) ? (int)$_COOKIE['global_on_page'] : GLOBAL_ON_PAGE);
		if($limit <= 0) $limit = GLOBAL_ON_PAGE;
		$start = (isset($params['start']) ? ($params['start']-1)*$limit : 0);
		if(!$typeCount){
			$query = "
				SELECT M.*
				FROM osc_nh_grid as M  
				WHERE 1 $filter_and 
				ORDER BY $sort_field $sort_vector 
				LIMIT $start,$limit
			";
			return $this->rs($query);
		}else{
			$query = "
				SELECT COUNT(*)  
				FROM osc_nh_grid as M  
				WHERE 1 $filter_and 
				LIMIT 100000
			";	
			$result = $this->rs($query);
			return $result[0]['COUNT(*)'];
		}
	}



	public function getUpdCtLayout($id){
		$query = "SELECT M.* 
		FROM osc_unc_cottages as M WHERE `id`='$id' LIMIT 1";

		$res = $this->rs($query);
		if ($res) {
			foreach ($res as $key => &$crv) {
				$crv['layouts'] = [];
				$cid = $crv['id'];
				$q = "SELECT M.* FROM `osc_unc_cattages_layouts` AS M WHERE M.cottage_id = $cid LIMIT 100";
				$l = $this->rs($q);
				if ($l) {
					$crv['layouts'] = $l;
				}
			}
		}

		$result = ($res ? $res[0] : array());
		return $result;
	}


	public function getUpdCtLayouts($params=array(),$typeCount=false){
		$filter_and = "";
		if(isset($params['filtr']['massive'])){
			foreach($params['filtr']['massive'] as $f_name => $f_value){
				if($f_value < 0) continue;
				$filter_and .= " AND ($f_name='$f_value') ";
			}
		}
		if(isset($params['filtr']['filtr_search_key']) && isset($params['filtr']['filtr_search_field']) && trim($params['filtr']['filtr_search_key']) != ""){
			$search_field = $params['filtr']['filtr_search_field'];
			$search_key = $params['filtr']['filtr_search_key'];
			$filter_and .= " AND ($search_field LIKE '%$search_key%') ";
		}
		$sort_field		= (isset($params['filtr']['sort_filtr']) ? $params['filtr']['sort_filtr'] : "M.id");
		$sort_vector	= (isset($params['filtr']['order_filtr']) ? $params['filtr']['order_filtr'] : "");
		$limit = (isset($_COOKIE['global_on_page']) ? (int)$_COOKIE['global_on_page'] : GLOBAL_ON_PAGE);
		if($limit <= 0) $limit = GLOBAL_ON_PAGE;
		$start = (isset($params['start']) ? ($params['start']-1)*$limit : 0);
		if(!$typeCount){
			$query = "
				SELECT M.*
				FROM osc_unc_cottages as M  
				WHERE 1 $filter_and 
				ORDER BY $sort_field $sort_vector 
				LIMIT $start,$limit
			";
			return $this->rs($query);
		}else{
			$query = "
				SELECT COUNT(*)  
				FROM osc_unc_cottages as M  
				WHERE 1 $filter_and 
				LIMIT 100000
			";	
			$result = $this->rs($query);
			return $result[0]['COUNT(*)'];
		}
	}


	public function getUpdThayout($id){
		$query = "SELECT M.* 
		FROM osc_unc_th as M WHERE `id`='$id' LIMIT 1";

		$res = $this->rs($query);
		if ($res) {
			foreach ($res as $key => &$crv) {
				$crv['layouts'] = [];
				$cid = $crv['id'];
				$q = "SELECT M.* FROM `osc_unc_th_layouts` AS M WHERE M.th_id = $cid LIMIT 100";
				$l = $this->rs($q);
				if ($l) {
					$crv['layouts'] = $l;
				}
			}
		}

		$result = ($res ? $res[0] : array());
		return $result;
	}


	public function getUpdThLayouts($params=array(),$typeCount=false){
		$filter_and = "";
		if(isset($params['filtr']['massive'])){
			foreach($params['filtr']['massive'] as $f_name => $f_value){
				if($f_value < 0) continue;
				$filter_and .= " AND ($f_name='$f_value') ";
			}
		}
		if(isset($params['filtr']['filtr_search_key']) && isset($params['filtr']['filtr_search_field']) && trim($params['filtr']['filtr_search_key']) != ""){
			$search_field = $params['filtr']['filtr_search_field'];
			$search_key = $params['filtr']['filtr_search_key'];
			$filter_and .= " AND ($search_field LIKE '%$search_key%') ";
		}
		$sort_field		= (isset($params['filtr']['sort_filtr']) ? $params['filtr']['sort_filtr'] : "M.id");
		$sort_vector	= (isset($params['filtr']['order_filtr']) ? $params['filtr']['order_filtr'] : "");
		$limit = (isset($_COOKIE['global_on_page']) ? (int)$_COOKIE['global_on_page'] : GLOBAL_ON_PAGE);
		if($limit <= 0) $limit = GLOBAL_ON_PAGE;
		$start = (isset($params['start']) ? ($params['start']-1)*$limit : 0);
		if(!$typeCount){
			$query = "
				SELECT M.*
				FROM osc_unc_th as M  
				WHERE 1 $filter_and 
				ORDER BY $sort_field $sort_vector 
				LIMIT $start,$limit
			";
			return $this->rs($query);
		}else{
			$query = "
				SELECT COUNT(*)  
				FROM osc_unc_th as M  
				WHERE 1 $filter_and 
				LIMIT 100000
			";	
			$result = $this->rs($query);
			return $result[0]['COUNT(*)'];
		}
	}



    public function __destruct(){}
}
