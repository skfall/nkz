<?php
namespace App\Controller;

use Cake\Core\Configure;
use Cake\Network\Exception\ForbiddenException;
use Cake\Network\Exception\NotFoundException;
use Cake\View\Exception\MissingTemplateException;
use App\Utils as Utils;

class PagesController extends AppController {

    private function getBreadCrumbs($params = array()){
        $action = $this->request->params['action'];
        $breadcrumbs = new Utils\Breadcrumbs($action, $params);
        return $breadcrumbs->result;
    }

    private $page_breadcrumbs = array();

    public function dev(){
        // $houses = $this->Model->getHouses();
        // foreach ($houses as $key => $h) {
        //     echo "<pre>"; print_r($h->first_room->alias); echo "</pre>"; 
        // }
        die();
    }

    public function home() {
        $page = "home";
        $ban = $this->Model->getBanSect();
        $houses = $this->Model->getHouses();
        $env = $this->Model->getHomeEnv();
        $gal = $this->Model->getHomeGal();
        $docs = $this->Model->getDocs();
        $dev = $this->Model->getHomeDev();
        $common = $this->Model->getHomeCommon();
        $projects = $this->Model->getProjects();


        $last_bp_entries = $this->Model->getBpEntries(null, null, false, 5);



        $meta = $this->Model->getMetaData($page);

        if (isset($meta['meta_title']) && $meta['meta_title']) {
            $meta_title = $meta['meta_title'];
            $this->set('meta_title', $meta_title);
        }
        if (isset($meta['meta_desc']) && $meta['meta_desc']) {
            $meta_desc = $meta['meta_desc'];
            $this->set('meta_desc', $meta_desc);
        }
        if (isset($meta['meta_keys']) && $meta['meta_keys']) {
            $meta_keys = $meta['meta_keys'];
            $this->set('meta_keys', $meta_keys);
        }


        $view_model = compact('page', 'houses', 'infrastructure', 'env', 'gal', 'docs', 'dev', 'projects', 'ban', 'common', 'last_bp_entries');
        $this->set($view_model);
    }

    public function flats() {
        $page = "flats";
        $page_block = $this->Model->checkPageBlock($page);
        if ($page_block) $this->Help->r2(RS.'404/');
        $houses = $this->Model->getHouses();
        $manager = $this->Model->getManager();
        $manager_menu = $this->Model->getManagerMenu();

        $view_model = compact('page', 'houses', 'manager', 'manager_menu');
        $this->set($view_model);
    }

    public function layouts(){
        $page = "layouts";

        $house_url = str_replace('\'', '', str_replace('"', '', trim($this->ri[1])));
        $room_url = str_replace('\'', '', str_replace('"', '', trim($this->ri[2])));

        $houses_list = $this->Model->getHousesList();
        $breadcrumbs = $this->getBreadCrumbs(['curr_house' => $house_url, 'houses' => $houses_list]);

        $rooms_list = null;
        $house = null;
        $room = null;
        $flats = null;
        $doc_cats = $this->Model->getDocCats();
        $manager = $this->Model->getManager();
        $manager_menu = $this->Model->getManagerMenu();

        if ($house_url && $room_url) {
            $house = $this->Model->getHouse($house_url);
            if ($house && $room_url) {
                $rooms_list = $this->Model->getRoomsList($house->id);
                $room = $this->Model->getRoom($house->id, $room_url);
                if ($room) {
                    $flats = $this->Model->getFlats($house->id, $room->id);
                }
            }
        }

        if (isset($house['meta_title']) && $house['meta_title']) {
            $meta_title = $house['meta_title'];
            $this->set('meta_title', $meta_title);
        }
        if (isset($house['meta_desc']) && $house['meta_desc']) {
            $meta_desc = $house['meta_desc'];
            $this->set('meta_desc', $meta_desc);
        }
        if (isset($house['meta_keys']) && $house['meta_keys']) {
            $meta_keys = $house['meta_keys'];
            $this->set('meta_keys', $meta_keys);
        }

        $view_model = compact('page', 'breadcrumbs', 'house', 'flats', 'houses_list', 'rooms_list', 'room', 'doc_cats', 'manager', 'manager_menu');
        $this->set($view_model);
    }

    public function contacts(){
        $page = "contacts";
        $page_block = $this->Model->checkPageBlock($page);
        if ($page_block) $this->Help->r2(RS.'404/');
        $breadcrumbs = $this->getBreadCrumbs();

        $contacts_page = $this->Model->getPage($page);




        $meta = $this->Model->getMetaData($page);
        if (isset($meta['meta_title']) && $meta['meta_title']) {
            $meta_title = $meta['meta_title'];
            $this->set('meta_title', $meta_title);
        }
        if (isset($meta['meta_desc']) && $meta['meta_desc']) {
            $meta_desc = $meta['meta_desc'];
            $this->set('meta_desc', $meta_desc);
        }
        if (isset($meta['meta_keys']) && $meta['meta_keys']) {
            $meta_keys = $meta['meta_keys'];
            $this->set('meta_keys', $meta_keys);
        }

        $view_model = compact('page', 'breadcrumbs', 'contacts_page');
        $this->set($view_model);
    }

    public function about(){
        $page = "about";
        $page_block = $this->Model->checkPageBlock($page);
        if ($page_block) $this->Help->r2(RS.'404/');

        $breadcrumbs = $this->getBreadCrumbs();
        $about_page = $this->Model->getPage($page);
        $projects = $this->Model->getProjects();


        $meta = $this->Model->getMetaData($page);
        if (isset($meta['meta_title']) && $meta['meta_title']) {
            $meta_title = $meta['meta_title'];
            $this->set('meta_title', $meta_title);
        }
        if (isset($meta['meta_desc']) && $meta['meta_desc']) {
            $meta_desc = $meta['meta_desc'];
            $this->set('meta_desc', $meta_desc);
        }
        if (isset($meta['meta_keys']) && $meta['meta_keys']) {
            $meta_keys = $meta['meta_keys'];
            $this->set('meta_keys', $meta_keys);
        }

        $view_model = compact('page', 'breadcrumbs', 'about_page', 'projects');
        $this->set($view_model);
    }

    public function townhouses(){
        $page = "townhouses";
        $page_block = $this->Model->checkPageBlock($page);
        if ($page_block) $this->Help->r2(RS.'404/');

        $th_page = $this->Model->getPage($page);
        $manager = $this->Model->getManager();
        $manager_menu = $this->Model->getManagerMenu();
        $gal1 = $this->Model->getThGal(1);
        $gal2 = $this->Model->getThGal(2);
        $tabs = $this->Model->getThTabs();
        $docs = $this->Model->getDocCats();

        $first_floors = array();
        $first_block = $this->Model->getThBlock();
        if ($first_block) {
            $first_floors = $this->Model->getThFloors($first_block->id);
        }


        $meta = $this->Model->getMetaData($page);
        if (isset($meta['meta_title']) && $meta['meta_title']) {
            $meta_title = $meta['meta_title'];
            $this->set('meta_title', $meta_title);
        }
        if (isset($meta['meta_desc']) && $meta['meta_desc']) {
            $meta_desc = $meta['meta_desc'];
            $this->set('meta_desc', $meta_desc);
        }
        if (isset($meta['meta_keys']) && $meta['meta_keys']) {
            $meta_keys = $meta['meta_keys'];
            $this->set('meta_keys', $meta_keys);
        }

        $view_model = compact('page', 'manager', 'manager_menu', 'th_page', 'gal1', 'gal2', 'tabs', 'docs', 'first_block', 'first_floors');
        $this->set($view_model);
    }

    public function newth(){
        $page = "new_th";
        $page_block = $this->Model->checkPageBlock("townhouses");
        if ($page_block) $this->Help->r2(RS.'404/');
        
        $manager = $this->Model->getManager();
        $manager_menu = $this->Model->getManagerMenu();
        
        $banners = $this->Th->getThBanners();
        $intro = $this->Th->getThIntro();
        $ready_th = $this->Th->getThReadyTh();
        $blocks = $this->Th->getThBlocks();

        $townhouses_layouts = $this->Th->getUpdThLayouts();

        $video = $this->Th->getThVideo();
        $gal = $this->Th->getThGal();
        $info1 = $this->Th->getThInfoblock1();
        $info2 = $this->Th->getThInfoblock2();

        $env = $this->Model->getHomeEnv();
        $traffic = $this->Model->getNhTraffic();
        

        $meta = $this->Model->getMetaData("townhouses");
        if (isset($meta['meta_title']) && $meta['meta_title']) {
            $meta_title = $meta['meta_title'];
            $this->set('meta_title', $meta_title);
        }
        if (isset($meta['meta_desc']) && $meta['meta_desc']) {
            $meta_desc = $meta['meta_desc'];
            $this->set('meta_desc', $meta_desc);
        }
        if (isset($meta['meta_keys']) && $meta['meta_keys']) {
            $meta_keys = $meta['meta_keys'];
            $this->set('meta_keys', $meta_keys);
        }

        $view_model = compact('page', 'manager', 'manager_menu', 'banners', 'intro', 'ready_th', 'blocks', 'townhouses_layouts', 'info1', 'info2', 'traffic', 'env', 'video', 'gal');
        $this->set($view_model);
    }

    public function newthItem(){
        $page = "new_th";
        $page_block = $this->Model->checkPageBlock("townhouses");
        if ($page_block) $this->Help->r2(RS.'404/');
        
        $manager = $this->Model->getManager();
        $manager_menu = $this->Model->getManagerMenu();
        $video = $this->Th->getThVideo();
        $gal = $this->Th->getThGal();
        $info1 = $this->Th->getThInfoblock1();
        $info2 = $this->Th->getThInfoblock2();

        $townhouses_layouts = $this->Th->getUpdThLayouts();
        $curr_th_id = (int)LA;
        $curr_th = $this->Th->getUpdTh($curr_th_id);
        if (!$curr_th) $this->Help->r2(RS.'404/');
        

        $env = $this->Model->getHomeEnv();
        $traffic = $this->Model->getNhTraffic();

        $meta = $this->Model->getMetaData("townhouses");
        if (isset($meta['meta_title']) && $meta['meta_title']) {
            $meta_title = $meta['meta_title'];
            $this->set('meta_title', $meta_title);
        }
        if (isset($meta['meta_desc']) && $meta['meta_desc']) {
            $meta_desc = $meta['meta_desc'];
            $this->set('meta_desc', $meta_desc);
        }
        if (isset($meta['meta_keys']) && $meta['meta_keys']) {
            $meta_keys = $meta['meta_keys'];
            $this->set('meta_keys', $meta_keys);
        }

        $view_model = compact('page', 'manager', 'manager_menu', 'video', 'gal', 'blocks', 'info1', 'info2', 'traffic', 'env', 'curr_th', 'townhouses_layouts');
        $this->set($view_model);
    }

    public function newhome(){
        $page = "newhome";

        $banners = $this->Model->getNewHomeBanners();

        $intro = $this->Model->getNhIntro();
        $env = $this->Model->getHomeEnv();
        $gal = $this->Model->getHomeGal();
        $dev = $this->Model->getHomeDev();
        $common = $this->Model->getHomeCommon();
        $projects = $this->Model->getProjects();
        $grid = $this->Model->getNhGrid();
        $traffic = $this->Model->getNhTraffic();

        $meta = $this->Model->getMetaData($page);


        if (isset($meta['meta_title']) && $meta['meta_title']) {
            $meta_title = $meta['meta_title'];
            $this->set('meta_title', $meta_title);
        }
        if (isset($meta['meta_desc']) && $meta['meta_desc']) {
            $meta_desc = $meta['meta_desc'];
            $this->set('meta_desc', $meta_desc);
        }
        if (isset($meta['meta_keys']) && $meta['meta_keys']) {
            $meta_keys = $meta['meta_keys'];
            $this->set('meta_keys', $meta_keys);
        }


        $view_model = compact('page', 'env', 'common', 'gal', 'dev', 'projects', 'banners', 'intro', 'grid', 'traffic');
        $this->set($view_model);
    }

    public function news(){
        $page = "news";
        $page_block = $this->Model->checkPageBlock($page);
        if ($page_block) $this->Help->r2(RS.'404/');
        
        $cat = 0;
        $curr_cat = null;
        $news_page = $this->Model->getNewsPage();

        $request = $this->request->query();
        if (isset($request["cat"]) && array_key_exists("cat", $request) && $request["cat"]) {
            $check_cat = $this->Model->checkNewsCat($request["cat"]);
            if ($check_cat) {
                $curr_cat = $check_cat;
                $cat = (int)$curr_cat->id;
            }
        }
        $top_news_id = 0;

        $top_news = $this->Model->getTopNews();
        $all_cats = $this->Model->getNewsCats();
        if ($top_news) $top_news_id = $top_news->id;

        $per_size = (isset($this->site_conf) && $this->site_conf && $this->site_conf->projects_pag) ? (int)$this->site_conf->projects_pag : 10;
        $pag = $this->Model->getNewsPag($cat, $per_size); // CAT ID || PER PAGE
        $num_pages = $pag['num_pages'];
        $cur_page = $pag['cur_page'];
        $start = $pag['start'];
        $per_page = $pag['per_page'];

        $news = $this->Model->getNews($cat, $top_news_id, $start, $per_page);
        $breadcrumbs = $this->getBreadCrumbs();


        $meta = $this->Model->getMetaData($page);
        if (isset($meta['meta_title']) && $meta['meta_title']) {
            $meta_title = $meta['meta_title'];
            $this->set('meta_title', $meta_title);
        }
        if (isset($meta['meta_desc']) && $meta['meta_desc']) {
            $meta_desc = $meta['meta_desc'];
            $this->set('meta_desc', $meta_desc);
        }
        if (isset($meta['meta_keys']) && $meta['meta_keys']) {
            $meta_keys = $meta['meta_keys'];
            $this->set('meta_keys', $meta_keys);
        }

        $view_model = compact('page', 'breadcrumbs', 'news', 'top_news', 'all_cats', 'curr_cat', 'news_page', 'num_pages', 'cur_page');
        $this->set($view_model);
    }

    public function newsItem(){
        $page = "newsItem";
        $page_block = $this->Model->checkPageBlock("news");
        if ($page_block) $this->Help->r2(RS.'404/');

        $id = (int)LA;
        $news_item = $this->Model->getNewsItem($id);
        if (!$news_item) $this->Help->r2(RS.'404/');

        $all_cats = $this->Model->getNewsCats();
        $breadcrumbs = $this->getBreadCrumbs();


        $meta = $this->Model->getMetaData("news");
        if (isset($meta['meta_title']) && $meta['meta_title']) {
            $meta_title = $meta['meta_title'];
            $this->set('meta_title', $meta_title);
        }
        if (isset($meta['meta_desc']) && $meta['meta_desc']) {
            $meta_desc = $meta['meta_desc'];
            $this->set('meta_desc', $meta_desc);
        }
        if (isset($meta['meta_keys']) && $meta['meta_keys']) {
            $meta_keys = $meta['meta_keys'];
            $this->set('meta_keys', $meta_keys);
        }

        $view_model = compact('page', 'breadcrumbs', 'news_item', 'all_cats');
        $this->set($view_model);
    }

    public function bp(){
        $page = "bp";
        $page_block = $this->Model->checkPageBlock("news");
        if ($page_block) $this->Help->r2(RS.'404/');
        $breadcrumbs = $this->getBreadCrumbs();
        $months = $this->Model->months;
        

        $all_cats = $this->Model->getBpCats();

        $cat = 0;
        $curr_cat = null;
        $curr_period = null;
        $period = array();
        $request = $this->request->query();
        if (isset($request["cat"]) && array_key_exists("cat", $request) && $request["cat"]) {
            $check_cat = $this->Model->checkBpCat($request["cat"]);
            if ($check_cat) {
                $curr_cat = $check_cat;
                $cat = (int)$curr_cat->id;
            }
        }

        $available_dates = $this->Model->getAvailableDates($cat);

        $final_dates = array();
        foreach ($available_dates as $key => $am) {
            $index = sprintf("%02d", $am->month);
            array_push($final_dates, array(
                    'value' => $am->year."_".$index,
                    'name' => $months[$index].' '.$am->year
                )
            );
        }

        if (isset($request["period"]) && array_key_exists("period", $request) && $request["period"]) {
            $q_period = explode('_', $request["period"]);
            $y = (int)$q_period[0];
            $m = (int)$q_period[1];

            if ($y && $m) {
                $period["year"] = $y;
                $period["month"] = sprintf("%02d", $m);
            }
        }
        if (isset($request["period"]) && array_key_exists("period", $request) && $request["period"]) {
            $curr_period = $request["period"];
        }
        $entries = $this->Model->getBpEntries($cat, $period);


        $meta = $this->Model->getMetaData("building-progress");

        if (isset($meta['meta_title']) && $meta['meta_title']) {
            $meta_title = $meta['meta_title'];
            $this->set('meta_title', $meta_title);
        }
        if (isset($meta['meta_desc']) && $meta['meta_desc']) {
            $meta_desc = $meta['meta_desc'];
            $this->set('meta_desc', $meta_desc);
        }
        if (isset($meta['meta_keys']) && $meta['meta_keys']) {
            $meta_keys = $meta['meta_keys'];
            $this->set('meta_keys', $meta_keys);
        }

        $view_model = compact('page', 'breadcrumbs', 'final_dates', 'entries', 'all_cats', 'curr_cat', 'curr_period');
        $this->set($view_model);
    }

    public function cottages(){
        $page = "cottages";
        $PA = "cottages";
        $menu_name = $this->Cottages->getMenuByAlias("cottages")['name'];

        $preloader_page_name = $menu_name;

        $banner = $this->Cottages->getCTBanner();
        $reasons = $this->Cottages->getCTReasons();
        $equip = $this->Cottages->getCTEquip();
        if (!$equip || !$equip['items']) {
            $equip = array();
        }

        $manager = $this->Model->getManager();
        $manager_menu = $this->Model->getManagerMenu();
        //$ct_layouts_array = $this->Cottages->getCTLayouts();

        // $layout_data = $ct_layouts_array['layout_data'];
        // $layout_filter = $ct_layouts_array['layout_filter'];
        // $layout_images = $ct_layouts_array['layout_images'];
        // $layout_event = $ct_layouts_array['layout_event'];

        $gallery = $this->Cottages->getCottagesGallery();
        if (!$gallery || !$gallery['items']) {
            $gallery = array();
        }

        $genplan = array();
        $genplan_array = $this->Cottages->getGenplan();
        foreach ($genplan_array as $key => $value) {
            $genplan[$value['id']] = $value; 
        }

        $env = $this->Model->getHomeEnv();
        $traffic = $this->Model->getNhTraffic();

        $upd_cottages_list = $this->Cottages->getUpdLayouts();
        $ready_ct = $this->Cottages->getCtReadyCt();

        $meta_data = $this->Cottages->getUniMeta('cottages');

        if (isset($meta_data['meta_title']) && $meta_data['meta_title']) {
            $meta_title = $meta_data['meta_title'];
            $this->set('meta_title', $meta_title);
        }
        if (isset($meta_data['meta_desc']) && $meta_data['meta_desc']) {
            $meta_desc = $meta_data['meta_desc'];
            $this->set('meta_desc', $meta_desc);
        }
        if (isset($meta_data['meta_keys']) && $meta_data['meta_keys']) {
            $meta_keys = $meta_data['meta_keys'];
            $this->set('meta_keys', $meta_keys);
        }

        $this->set([
            'preloader_page_name' => $preloader_page_name,
            'menu_name' => $menu_name,
            'page' => $page,
            'banner' => $banner,
            'reasons' => $reasons,
            'equip' => $equip,
            'gallery' => $gallery,
            'PA' => $PA,
            'cottages_list' => $upd_cottages_list,
            'manager' => $manager,
            'manager_menu' => $manager_menu,
            'ready_ct' => $ready_ct,
            'env' => $env,
            'traffic' => $traffic,
            'genplan' => $genplan
        ]);
    }

    public function cottageItem(){
        $page = "cottages";
        $PA = "cottages";
        $menu_name = $this->Cottages->getMenuByAlias("cottages")['name'];

        $preloader_page_name = $menu_name;

        $upd_cottages_list = $this->Cottages->getUpdLayouts();
        $curr_cottage_id = (int)LA;
        $curr_cottage = $this->Cottages->getUpdCottage($curr_cottage_id);
        if (!$curr_cottage) $this->Help->r2(RS.'404/');

        $genplan = array();
        $genplan_array = $this->Cottages->getGenplan();
        foreach ($genplan_array as $key => $value) {
            $genplan[$value['id']] = $value; 
        }
        $manager = $this->Model->getManager();
        $manager_menu = $this->Model->getManagerMenu();

        
        $env = $this->Model->getHomeEnv();
        $traffic = $this->Model->getNhTraffic();

        $meta_data = $this->Cottages->getUniMeta('cottages');

        if (isset($meta_data['meta_title']) && $meta_data['meta_title']) {
            $meta_title = $meta_data['meta_title'];
            $this->set('meta_title', $meta_title);
        }
        if (isset($meta_data['meta_desc']) && $meta_data['meta_desc']) {
            $meta_desc = $meta_data['meta_desc'];
            $this->set('meta_desc', $meta_desc);
        }
        if (isset($meta_data['meta_keys']) && $meta_data['meta_keys']) {
            $meta_keys = $meta_data['meta_keys'];
            $this->set('meta_keys', $meta_keys);
        }

        $this->set([
            'preloader_page_name' => $preloader_page_name,
            'menu_name' => $menu_name,
            'page' => $page,
            'genplan' => $genplan,
            'PA' => $PA,
            'curr_cottage' => $curr_cottage,
            'upd_cottages_list' => $upd_cottages_list,
            'manager' => $manager,
            'manager_menu' => $manager_menu,
            'env' => $env,
            'traffic' => $traffic,
        ]);
    }

    public function infrastructure(){
        $page = "infrastructure";
        $page_block = $this->Model->checkPageBlock($page);
        if ($page_block) $this->Help->r2(RS.'404/');
        $breadcrumbs = $this->getBreadCrumbs();

        $infrastructure = $this->Model->getHomeInfr();
        $common = $this->Model->getHomeCommon();

        $meta = $this->Model->getMetaData($page);
        if (isset($meta['meta_title']) && $meta['meta_title']) {
            $meta_title = $meta['meta_title'];
            $this->set('meta_title', $meta_title);
        }
        if (isset($meta['meta_desc']) && $meta['meta_desc']) {
            $meta_desc = $meta['meta_desc'];
            $this->set('meta_desc', $meta_desc);
        }
        if (isset($meta['meta_keys']) && $meta['meta_keys']) {
            $meta_keys = $meta['meta_keys'];
            $this->set('meta_keys', $meta_keys);
        }

        $view_model = compact('page', 'breadcrumbs', 'infrastructure', 'common');
        $this->set($view_model);
    }
}
