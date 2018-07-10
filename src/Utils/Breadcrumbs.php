<?php 
namespace App\Utils;
use App\Controller;

/**
* Breadcrumbs
*/
class Breadcrumbs {
	function __construct($action = "", $params = array()) {
		$this->action = $action;
		$this->getBreadcrumbs($params);

		return $this->result;
	}

	private $action = "";
	public $result = array();


	public function getBreadcrumbs($params = array()){
		switch ($this->action) {
			case 'layouts':
				$bc = array(
					array(
						'type' => 'single',
						'name' => 'Купить квартиру под Киевом',
						'link' => RS.'flats/'
					)
				);

				$houses = array();
				$curr_house = "";
				if ($params) {
					$houses = $params['houses'];
					$curr_house = $params['curr_house'];
				}
				if ($houses) {
					$append = array('type' => '', 'name' => '', 'sub' => array());
					foreach ($houses as $i => $h) {
						$first_room = "r1";
						if ($h->first_room) {
							$first_room = $h->first_room->alias;
						}
						if ($h->alias == $curr_house) {
							$append['type'] = 'mult';
							$append['name'] = $h->name;
						}else{
							array_push($append['sub'], array(
								'type' => 'sindgle',
								'name' => $h->name,
								'link' => RS.'flats/'.$h->alias.'/'.$first_room.'/'
							));
						}
						
					}
					array_push($bc, $append);
				}


				$this->result = $bc;
				break;
			case 'contacts':
				$bc = array(
					array(
						'type' => 'single',
						'name' => 'Купить квартиру под Киевом',
						'link' => RS.'flats/'
					),
					array(
						'type' => 'single',
						'name' => 'Контакты',
						'link' => RS.'contacts/'
					),
				);
				$this->result = $bc;
				break;
			case 'infrastructure':
				$bc = array(
					array(
						'type' => 'single',
						'name' => 'Купить квартиру под Киевом',
						'link' => RS.'flats/'
					),
					array(
						'type' => 'single',
						'name' => 'Инфраструктура',
						'link' => RS.'infrastructure/'
					),
				);
				$this->result = $bc;
				break;
			case 'about':
				$bc = array(
					array(
						'type' => 'single',
						'name' => 'Купить квартиру под Киевом',
						'link' => RS.'flats/'
					),
					array(
						'type' => 'mult',
						'name' => 'Покупателям',
						'sub' => array(
							array(
								'type' => 'single',
								'name' => 'Дом Лион',
								'link' => RS.'flats/lion/layouts/'
							)
						)
					),
					array(
						'type' => 'single',
						'name' => 'О застройщике',
						'link' => RS.'contacts/'
					),
				);
				$this->result = $bc;
				break;
			case 'news':
				$bc = array(
					array(
						'type' => 'single',
						'name' => 'Купить квартиру под Киевом',
						'link' => RS.'flats/'
					),
					array(
						'type' => 'single',
						'name' => 'Новости',
						'link' => RS.'news/'
					),
				);
				$this->result = $bc;
				break;
			case 'newsItem':
				$bc = array(
					array(
						'type' => 'single',
						'name' => 'Купить квартиру под Киевом',
						'link' => RS.'flats/'
					),
					array(
						'type' => 'single',
						'name' => 'Новости',
						'link' => RS.'news/'
					),
				);
				$this->result = $bc;
				break;
			case 'bp':
				$bc = array(
					array(
						'type' => 'single',
						'name' => 'Купить квартиру под Киевом',
						'link' => RS.'flats/'
					),
					array(
						'type' => 'single',
						'name' => 'Ход строительства',
						'link' => RS.'building-progress/'
					),
				);
				$this->result = $bc;
				break;
			default:
				break;
		}
	}
}