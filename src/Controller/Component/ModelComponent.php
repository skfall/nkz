<?php
namespace App\Controller\Component;
use Cake\Controller\Component;
use Cake\Datasource\ConnectionManager;
use Cake\ORM\TableRegistry;
require_once "HelpComponent.php";
class ModelComponent extends HelpComponent {
	// The other component your component uses
    // public $components = ['Help'];
	
    public $months = array(
        '01' => 'Январь', 
        '02' => 'Февраль', 
        '03' => 'Март', 
        '04' => 'Апрель', 
        '05' => 'Май', 
        '06' => 'Июнь', 
        '07' => 'Июль', 
        '08' => 'Август', 
        '09' => 'Сентябрь', 
        '10' => 'Октябрь', 
        '11' => 'Ноябрь', 
        '12' => 'Декабрь'
    );

	public function goToHome(){
		$this->r2(RS);
	}
       
    public function getMenu(){
        $menu = $this->menu()->where(['block' => 0])->select(['name' => LANG_PREFIX.'name'])->select($this->menu)->order(['order_id'])->limit(100)->all();
        return $menu;
    }

    public function checkPageBlock($alias){
        $page = $this->menu()->where(['block' => 0, 'alias' => $alias])->select('id')->first();
        if (!$page) {
            return true; 
        }else{
            return false;
        }
    }

    public function getSiteConfig(){
        $config = $this->total_config()->first();
        return $config;
    }

    public function getMenuByAlias($alias){
        $menu_item = $this->menu()->where(['alias' => $alias, 'block' => 0])->first();
        return $menu_item;
    }
    
    
    public function getPagination($table, $per_pag){
        $per_page = $per_pag;
        $cur_page = 1;

        if (isset($_GET['page']) && $_GET['page'] > 0) $cur_page = $_GET['page'];
        $start = ($cur_page - 1) * $per_page;
        $count_posts = $this->table->find()->where(['block' => 0])->select(['count' => $this->table->find()->count('id')])->first();
        $num_pages = ceil($count_posts['count'] / $per_page);

        return array('num_pages'=>$num_pages, 'cur_page'=>$cur_page, 'start'=>$start, 'per_page'=>$per_page);
    }

    public function getPage($page){
        switch ($page) {
            case 'about':
                $table = $this->about();
                break;
            case 'contacts':
                $table = $this->contacts();
                break;
            case 'townhouses':
                $table = $this->townhouses();
                break;
            default:
                $table = "";
                break;
        }
        $page = array();
        if ($table) {
            $page = $table->where(['id' => 1])->first();
        }
        return $page;
    }

    public function appointment(){
        $response = array("status" => "failed", "reason" => "", "message" => "");

        $name = $this->post("name");
        $contact = $this->post("contact");


        if ($name && strlen($name) >= 2) {
            if ($contact && strlen($contact) >= 2) {
                $success = $this->appointments->query()
                    ->insert(['name', 'contact', 'seen', 'created'])
                    ->values([
                        'name' => $name, 
                        'contact' => $contact,
                        'seen' => 0, 
                        'created' => $this->now()
                    ])
                    ->execute();
                if ($success) {
                    $response["status"] = "success";
                    $response["message"] = "Спасибо, наш менеджер свяжется с вами в ближайшее время.";
                    $response["reason"] = "";
                }
            }else{
                $response["reason"] = "contact";
                $response["message"] = "Укажите контактые данные.";    
            }
        }else{
            $response["reason"] = "name";
            $response["message"] = "Укажите корректное имя.";
        }
        return $response;
    }


    public function bpQuestion(){
        $response = array("status" => "failed", "reason" => "", "message" => "");
        $message = $this->post("message");
        $contact = $this->post("contact");
        $name = $this->post("name");
        $cat = $this->post("cat");

        if (!$cat) $cat = "";

        if ($message && strlen($message) >= 10) {
            if ($name && strlen($name) >= 2) {
                if ($contact && strlen($contact) >= 2) {
                    $success = $this->bp_questions->query()
                        ->insert(['cat', 'name', 'message', 'contact', 'seen', 'created'])
                        ->values([
                            'cat' => $cat, 
                            'name' => $name,
                            'message' => $message,
                            'contact' => $contact,
                            'seen' => 0, 
                            'created' => $this->now()
                        ])
                        ->execute();
                    if ($success) {
                        $response["status"] = "success";
                        $response["message"] = "Спасибо, наш менеджер свяжется с вами в ближайшее время.";
                        $response["reason"] = "";
                    }
                }else{
                    $response["reason"] = "contact";
                    $response["message"] = "Укажите контактые данные.";    
                }
            }else{
                $response["reason"] = "name";
                $response["message"] = "Укажите корректное имя.";
            }
        }else{
            $response["reason"] = "message";
            $response["message"] = "Вопрос должен содержать минимум 10 символов.";
        }

        return $response;
    }

    public function bpSubscription(){
        $response = array("status" => "failed", "reason" => "", "message" => "");
        $cats = $this->post("cat_name");
        $email = $this->post("email");
        $phone = $this->post("phone");
        $valid_phone = false;
        $valid_email = false;

        $cats_names = "";
        if ($cats) {
            foreach ($cats as $key => $cat) {
                $cats_names .= $cat.';';
            }
        }


        if ($email) {
            if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
                $valid_email = true;
            }else{
                $response["reason"] = "email";
                $response["message"] = "Укажите корректный email.";  
                return $response;
            }
        }

        if ($phone) {
            if (mb_strlen($phone) > 10 && $this->check_phone($phone)) {
                $valid_phone = true;
            }else{
                $response["reason"] = "phone";
                $response["message"] = "Укажите корректный телефон."; 
                return $response; 
            }
        }

        

        if ($valid_phone || $valid_email) {
            $success = $this->bp_subscriptions->query()
                ->insert(['cats', 'email', 'phone', 'seen', 'created'])
                ->values([
                    'cats' => $cats_names,
                    'email' => $email,
                    'phone' => $phone,
                    'seen' => 0,
                    'created' => $this->now()
                ])
                ->execute();
            if ($success) {
                $response["status"] = "success";
                $response["message"] = "Будем держать вас в курсе.";
                $response["reason"] = "";
            }
        }else{
            $response["reason"] = "email";
            $response["message"] = "Укажите контактные данные.";  
        }  

        return $response;
    }

    public function subscribeNews(){
        $response = array("status" => "failed", "reason" => "", "message" => "");
        $email = $this->post("email");

        if ($email) {
            if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
                $success = $this->subscriptions->query()
                    ->insert(['email', 'seen', 'created'])
                    ->values([
                        'email' => $email,
                        'seen' => 0,
                        'created' => $this->now()
                    ])
                    ->execute();
                if ($success) {
                    $response["status"] = "success";
                    $response["message"] = "Вы успешно подписались на рассылку новостей.";
                    $response["reason"] = "";
                }
            }else{
                $response["reason"] = "email";
                $response["message"] = "Укажите корректный email.";  
                return $response;
            }
        }else{
            $response["reason"] = "email";
            $response["message"] = "Укажите корректный email.";  
            return $response;
        }

        return $response;
    }

    public function contactForm(){
        $response = array("status" => "failed", "reason" => "", "message" => "");

        $email = "";
        $phone = "";

        $name = $this->post("name");
        $phone = $this->post("phone");
        $email = $this->post("email");
        $message = $this->post("message");

        $valid_phone = false;
        $valid_email = false;

        if ($name && strlen($name) >= 2) {
            if ($phone) {
                if (mb_strlen($phone) > 10 && $this->check_phone($phone)) {
                    $valid_phone = true;
                }else{
                    $response["reason"] = "phone";
                    $response["message"] = "Укажите корректный телефон."; 
                    return $response; 
                }
            }

            if ($email) {
                if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
                    $valid_email = true;
                }else{
                    $response["reason"] = "email";
                    $response["message"] = "Укажите корректный email.";  
                    return $response;
                }
            }

            if ($valid_phone || $valid_email) {
                $success = $this->contact_form->query()
                    ->insert(['name', 'phone', 'email', 'message', 'seen', 'created'])
                    ->values([
                        'name' => $name,
                        'phone' => $phone,
                        'email' => $email,
                        'message' => $message,
                        'seen' => 0,
                        'created' => $this->now()
                    ])
                    ->execute();
                if ($success) {
                    $response["status"] = "success";
                    $response["message"] = "";
                    $response["name"] = $name;
                    $response["reason"] = "";
                }
            }else{

                $response["reason"] = "phone";
                $response["message"] = "Укажите контактные данные.";  
            }            
        }else{
            $response["reason"] = "name";
            $response["message"] = "Укажите корректное имя.";
        }
        return $response;
    }
   
    public function recall(){
        $response = array("status" => "failed", "reason" => "", "message" => "");

        $phone = $this->post("phone");

        if ($this->check_phone($phone)) {
            $success = $this->recall->query()
                ->insert(['phone', 'seen', 'created'])
                ->values([
                    'phone' => $phone,
                    'seen' => 0,
                    'created' => $this->now()
                ])
                ->execute();
            if ($success) {
                $response["status"] = "success";
                $response["message"] = "Спасибо, мы перезвоним вам в течении 30 минут.";
                $response["reason"] = "";
            }
        }else{
            $response["reason"] = "phone";
            $response["message"] = "Укажите корректный телефон."; 
        }

        return $response;
    }

    public function getHouses(){
        $houses = $this->houses()->where(['block' => 0])->order(["order_id"])->all();
        if ($houses) {
            foreach ($houses as $key => $house) {
                $house->slides = $this->house_slides()->where(['block' => 0, 'house_id' => $house->id, 'type' => 1])->all();
                $house->gallery = $this->house_gal()->where(['block' => 0, 'house_id' => $house->id])->all();
                $house->rooms = $this->rooms()->where(['block' => 0, 'house_id' => $house->id])->order(['order_id'])->all();
                $house->first_room = $this->rooms()->where(['block' => 0, 'house_id' => $house->id])->select(['alias'])->first();
            }
        }
        return $houses;
    }

    public function getHouse($alias){
        $house = $this->houses()->where(['block' => 0, 'alias' => $alias])->first();
        if ($house) {
           $house->slides = $this->house_slides()->where(['block' => 0, 'house_id' => $house->id])->all();
           $house->coords = $this->env_coords()->where(['block' => 0, 'ref' => $house->id, 'type' => 1])->all();
           $house->gal = $this->house_gal()->where(['block' => 0, 'house_id' => $house->id, 'type' => 1])->all();
        }
        return $house;
    }

    public function getHousesList(){
        $list = $this->houses()->where(['block' => 0])->select(['name', 'alias', 'short_desc', 'id'])->all();
        if ($list) {
            foreach ($list as $key => $house_item) {
                $house_item->first_room = $this->rooms()->where(['block' => 0, 'house_id' => $house_item->id])->select(['alias'])->first();
            }
        }
        return $list;
    }

    public function getRoomsList($house_id){
        $list = $this->rooms()->where(['block' => 0, 'house_id' => $house_id])->select(['alias', 'short_name'])->order(['order_id'])->all();
        return $list;
    }


    public function getRoom($house_id, $alias){
        $room = $this->rooms()->select($this->rooms)->select([
            'house_name' => $this->houses()->select([
                'osc_sys_houses.name'
            ])->where([
                'osc_sys_houses.id' => $house_id
            ])
        ])->where(['block' => 0, 'alias' => $alias, 'house_id' => $house_id])->first();
        
        return $room;
    }

    public function getDocs(){
        $docs = $this->docs()
            ->select($this->docs)
            ->select([
                "cat_name" => $this->doc_cats()
                    ->select(["cat_name" => "osc_sys_doc_cats.name"])
                    ->where(["osc_sys_doc_cats.id = osc_sys_docs.cat"])
                ])
            ->all()
            ->toArray();
        return $docs;
    }

    public function getDocCats(){
        $doc_cats = $this->doc_cats()->where(['block' => 0])->all();
        if ($doc_cats) {
            foreach ($doc_cats as $key => $cat) {
                $cat->docs = $this->docs()->where(['block' => 0, 'cat' => $cat->id])->all()->toArray();
            }
        }
        return $doc_cats;
    }

    public function getHomeDev(){
        $dev = $this->home_dev()->where(['block' => 0, 'id' => 1])->first();
        return $dev;
    }

    public function getProjects(){
        $projects = $this->projects()->where(['block' => 0])->order(['order_id'])->all();
        return $projects;
    }

    public function getFlats($house_id, $room_id){
        $flats = null;
        if ($house_id && $room_id) {
            $flats = $this->flats()->where(['block' => 0, 'house_id' => $house_id, 'room_id' => $room_id])->all();

            if ($flats) {
                foreach ($flats as $key => $flat) {
                    $flat->layouts = $this->flats_layouts()->where(['flat_id' => $flat->id, 'block' => 0])->all();
                    $flat->events = $this->events()->where(['ref_id' => $flat->id, 'block' => 0, 'type' => 1])->first();
                }   
            }
        }
        return $flats;
    }

    public function getManager(){
        $manager = $this->manager()->where(['id' => 1, 'block' => 0])->first();
        return $manager;
    }

    public function getManagerMenu(){
        $manager_menu = $this->manager_menu()->where(['block' => 0])->all();
        return $manager_menu;
    }

    public function getThTabs(){
        $tabs = $this->th_tabs()->where(['block' => 0])->all();
        return $tabs;
    }

    public function getHomeInfr(){
        $infrastruct = $this->home_inf()->where(['block' => 0])->all();
        return $infrastruct;
    }

    public function getHomeCommon(){
        $common = $this->home_common()->where(['id' => 1])->first();
        return $common;
    }

    public function getHomeEnv(){
        $env = $this->home_env()->where(['block' => 0])->all();
        if ($env && count($env) > 0) {
            foreach ($env as $key => $value) {
                $value->env_list = $this->home_env_items()->where(['block' => 0, 'ref' => $value->id])->order(["order_id"])->all();
            }
        }

        return $env;
    }

    public function getBanSect(){
        $ban = $this->home_ban()->where(['id' => 1, 'block' => 0])->first();
        return $ban;
    }

    public function getThGal($num){
        $gal = array();
        if ($num) {
            $gal = $this->th_gal()->where(['block' => 0, 'gal_num' => $num])->all();
        }
        return $gal;
    }

    public function getHomeGal(){
        $gal = $this->home_gal()->where(['block' => 0, 'type' => 1])->order(["order_id"])->all();
        return $gal;
    }

    public function getThBlock($id = 0){
        $conditions = array('block' => 0);
        if ($id) $conditions["id"] = $id;
        $th_block = $this->th_blocks()->where($conditions)->first();
        if ($th_block) {
            $th_block->gal = $this->th_blocks_items()->where(['block' => 0, 'ref' => $th_block->id])->all();
        }
        return $th_block;
    }

    public function getThFloors($block_id){
        $floors = array();
        if ($block_id) {
            $block = $this->th_blocks()->where(['block' => 0, 'id' => $block_id])->first();
            if ($block) {
                $layout_floors = $this->th_layouts()->where(['block' => 0, 'th_id' => $block->id])->select(['floor' => 'floor_id'])->distinct('floor_id')->all();
                foreach ($layout_floors as $key => $f) {
                    $floors[$key] = $this->th_floors()->where(['block' => 0, 'id' => $f->floor])->first();
                }
            }
        }
        return $floors;
    }

    public function getThLayouts(){
        $response = "";
        
        $th_id = $this->post('block_id');
        $floor_id = $this->post('floor_id');

        if ($th_id && $floor_id) {
            $layouts = $this->th_layouts()->where(['block' => 0, 'th_id' => $th_id, 'floor_id' => $floor_id])->all();
            if ($layouts) {
                foreach ($layouts as $key => $l) {
                    $l->gal = $this->th_layouts_items()->where(['block' => 0, 'ref_id' => $l->id])->all();
                    $l->event = $this->events()->where(['block' => 0, 'ref_id' => $l->id, 'type' => 2])->first();
                }
            }

            ob_start();
            foreach ($layouts as $key => $layout) {
                $event_mark_class = isset($layout->event) && $layout->event ? "event_layout" : "";
                $event = isset($layout->event) && $layout->event ? $layout->event : "";
            
            ?>
                <!-- LAYOUT ITEM -->
                <div class="layout_item <?= $event_mark_class; ?>">

                    <div class="th_floor_target">
                        <?php if ($event): ?>
                            <?php $timer_val = strtotime($event['finish']); ?>

                            <div class="event timer" data-time_val="<?= $timer_val;?>">
                                <div class="event_mark">Акция</div>
                                <div class="name"><?= isset($event->caption) && $event->caption ? $event->caption : ""; ?></div>
                                <div class="time_left">
                                    <div class="days"><span class="b"></span> <span class="sm">д.</span></div>
                                    <div class="separator"> : </div>
                                    <div class="hours"><span class="b"></span> <span class="sm">ч.</span></div>
                                    <div class="separator"> : </div>
                                    <div class="minutes"><span class="b"></span> <span class="sm">м.</span></div>
                                    <div class="time_left_text">до конца акции</div>
                                </div>
                            </div>
                        <?php endif ?>
                    
                        <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12 properties">
                            <div class="text">
                                <?php if (isset($layout->stats) && $layout->stats): ?>
                                    <?php
                                        $stats = explode(';', $layout->stats);
                                        if ($stats[count($stats) - 1] == '') array_pop($stats);

                                    ?>


                                    <table class="params">
                                        <?php foreach ($stats as $key => $stat): ?>
                                            <?php
                                                $stat_row = explode('*', $stat);
                                                $area_name = $stat_row[0];
                                                $area_value = str_replace('м2', 'м<sup>2</sup>', $stat_row[1]);

                                            ?>

                                            <tr class="<?= $key == 0 ? "first" : ""; ?>">
                                                <td><?= $area_name; ?></td>
                                                <td><?= $area_value; ?></td>
                                            </tr>
                                        <?php endforeach ?>
                                    </table>
                                <?php endif ?>
                                <!-- DESKTOP FEATURES -->
                                <div class="features hidden-sm hidden-xs">
                                    
                                    <?php if ($event): ?>
                                        <a href="javascript:void(0);" class="order_btn" data-toggle="modal" data-target="#visit_modal">Воспользоваться случаем</a>
                                    <?php else: ?>
                                        <a href="javascript:void(0);" class="order_btn bggreen" data-toggle="modal" data-target="#visit_modal">Записаться на просмотр</a>
                                    <?php endif ?>

                                    <!-- <div class="share">
                                        <div class="send_friend"><span>Отправить другу</span></div>
                                    </div> -->
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 images">
                            <?php if (isset($layout->gal) && $layout->gal): ?>
                                <div class="owl-carousel primary">
                                    <?php foreach ($layout->gal as $key => $gal): ?>
                                        <?php 
                                            $source = $gal->source ? LAYOUTS.$gal->source : IMG_PATH.'def_logo.jpg'; 
                                        ?>
                                        <div class="item" style="overflow:hidden;">
                                            <img src="<?= $source; ?>" alt="Layout" style="width:auto;height:auto;max-width:80%;margin:0 auto;display:block;" />
                                            <?php /*<div class="image" style="background-image: url('<?= $source; ?>');"></div>*/ ?>
                                        </div>
                                    <?php endforeach ?>
                                </div>
                                <div class="owl-carousel secondary">
                                    <?php foreach ($layout->gal as $key => $dot): ?>
                                        <?php 
                                            $source = $dot->source ? LAYOUTS.'crop/500x350_'.$dot->source : IMG_PATH.'def_logo.jpg'; 
                                        ?>
                                        <div class="item">
                                            <div class="image" style="background-image: url('<?= $source; ?>');"></div>
                                        </div>
                                    <?php endforeach ?>
                                </div>
                            <?php endif ?>

                            <div class="clear"></div>
                            <!-- MOB FEATURES -->
                            <div class="features hidden-lg hidden-md">

                                <div class="features_c features_tab active">
                                    <?php if ($event): ?>
                                        <a href="#" class="order_btn" data-toggle="modal" data-target="#visit_modal">Воспользоваться случаем</a>
                                    <?php else: ?>
                                        <a href="#" class="order_btn bggreen" data-toggle="modal" data-target="#visit_modal">Записаться на просмотр</a>
                                    <?php endif ?>

             <!--                        <div class="share">
                                        <div class="send_friend"><span>Отправить другу</span></div>
                                    </div> -->
                                </div>
                                
                            </div>
                        </div>
                    </div>
                
                    
                    
                    <div class="clear"></div>
                </div>
                <!-- LAYOUT ITEM END -->

            <?php
            }
            $response = ob_get_contents();
            ob_clean();
        }

        return $response;
    }

    public function changeThBlock(){
        $response = "";

        $block_name = $this->post('block_name');
        $block_id = 0;
        switch ($block_name) {
            case 'praha_town':
                $block_id = 1;
                break;
            case 'amst_town':
                $block_id = 2;
                break;
            case 'bud_town':
                $block_id = 3;
                break;
            case 'bud_house':
                $block_id = 4;
                break;
            case 'amst_house':
                $block_id = 5;
                break;
            case 'praha_house':
                $block_id = 6;
                break;
            default:
                break;
        }

        if ($block_id > 0) {
            $block = $this->th_blocks()->where(['block' => 0, 'id' => $block_id])->first();
            if ($block) {
                $block->gal = $this->th_blocks_items()->where(['block' => 0, 'ref' => $block->id])->all();
                $layout_floors = $this->th_layouts()->where(['block' => 0, 'th_id' => $block->id])->select(['floor' => 'floor_id'])->distinct('floor_id')->all();
                $floors = array();
                foreach ($layout_floors as $key => $f) {
                    $floors[$key] = $this->th_floors()->where(['block' => 0, 'id' => $f->floor])->first();
                }
                ob_start();
                ?>
                    <div class="th_block">
                        <div class="container">
                            <h5 class="caption"><?= $block->name ? $block->name : ""; ?></h5>
                            <?php if (isset($block->gal) && $block->gal && count($block->gal) > 0): ?>
                                <div class="block_slider owl-carousel">
                                    <?php foreach ($block->gal as $key => $g): ?>
                                        <?php if ($g->source): ?>
                                            <div class="item">
                                                <div class="image" style="background-image: url('<?= TH.$g->source; ?>');"></div>
                                            </div>
                                        <?php endif ?>
                                    <?php endforeach ?>
                                </div>
                            <?php endif ?>
                        </div>
                        <div class="block_info">
                            <div class="container">
                                <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12 features">
                                    <?php if ($block->features): ?>
                                        <?php 
                                            $block_features = explode(';', $block->features);
                                            if ($block_features[count($block_features) - 1] == "") array_pop($block_features);
                                        ?>
                                        <?php if ($block_features): ?>
                                            <p class="col_header">Особенности</p>
                                            <ul>
                                                <?php foreach ($block_features as $key => $f): ?>
                                                    <li><span><?= $f; ?></span></li>
                                                <?php endforeach ?>
                                            </ul>
                                        <?php endif ?>
                                    <?php endif ?>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 properties">
                                    <?php if ($block->stats): ?>
                                        <?php 
                                            $block_stats = explode(';', $block->stats);
                                            if ($block_stats[count($block_stats) - 1] == "") array_pop($block_stats);
                                        ?>
                                        <?php if ($block_stats): ?>
                                            <table>
                                                <tbody>
                                                    <?php foreach ($block_stats as $key => $s): ?>
                                                        <?php
                                                            $b_stat_row = explode('*', $s);
                                                            $fb_stat = str_replace('м2', 'м<sup>2</sup>', $b_stat_row[0]);
                                                            $sb_stat = str_replace('м2', 'м<sup>2</sup>', $b_stat_row[1]);
                                                        ?>
                                                        <tr>
                                                            <td><?= $fb_stat; ?></td>
                                                            <td><strong><?= $sb_stat; ?></strong></td>
                                                        </tr>
                                                    <?php endforeach ?>
                                                </tbody>
                                            </table>
                                        <?php endif ?>
                                    <?php endif ?>
                                    
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 mobile_th_layouts_btn_wrap">
                                    <a href="javascript:void(0);" class="show_th_layouts_btn" data-block="<?= $block->id; ?>"><span>Показать планировки</span></a>
                                </div>
                                
                                <div class="clear"></div>
                                
                            </div>
                        </div>
                        
                        <div class="container">
                            <?php if (isset($floors) && $floors && count($floors) > 0): ?>
                                <div class="floors_select">
                                    <ul>
                                        <?php foreach ($floors as $key => $floor): ?>
                                            <li class="<?= $key == 0 ? "active" : ""; ?>" data-block="<?= $block->id; ?>" data-floor="<?= $floor->id; ?>"><a href="javascript:void(0);"><span><?= $floor->name ? $floor->name : ($key + 1); ?></span></a></li>
                                        <?php endforeach ?>
                                    </ul>
                                </div>
                            <?php endif ?>

                            <div class="th_layouts_target" id="th_layouts_target">

                            </div>
                        </div>
                    </div>
                <?php
                $response = ob_get_contents();
                ob_clean();
            }
        }
        return $response;
    }

    public function checkNewsCat($cat_alias){
        return $this->news_cats()->where(['alias' => $cat_alias])->first();
    }

    public function getNewsPag($cat, $per_pag){
        $per_page = $per_pag;
        $cur_page = 1;
        $cat = (int)$cat;
        if (isset($_GET["page"]) && (int)$_GET["page"] > 0) $cur_page = $_GET['page'];
        $start = ($cur_page - 1) * $per_page;
        $count_posts = $this->news()->where(['block' => 0]);
        if ($cat > 0) $count_posts = $count_posts->where(['cat' => $cat]);
        $count_posts = $count_posts->select(['count' => $count_posts->count('id')])->first();

        $count = 0;
        if ($count_posts && $count_posts->count) $count = $count_posts->count; 
        $num_pages = ceil($count / $per_page);
        return array('num_pages'=>$num_pages, 'cur_page'=>$cur_page, 'start'=>$start, 'per_page'=>$per_page);
    }

    public function getTopNews(){
        return $this->news()->where(['is_top' => 1, 'block' => 0])->first();
    }

    public function getNewsCats(){
        return $this->news_cats()->all();
    }

    public function getNewsPage(){
        return $this->page_news()->where(['id' => 1])->first();
    }

    public function getNews($cat, $top_news_id, $start, $limit){
        $cat = (int)$cat;
        $news = $this->news()
            ->where(['block' => 0])
            ->select($this->news);
        if ($cat > 0) $news = $news->where(['cat' => $cat]);
        if ($top_news_id > 0) $news = $news->where(['id !=' => $top_news_id]);
        
        $news = $news->select([
            "cat_name" => $this->news_cats()
                ->select(["cat_name" => "osc_page_news_cats.name"])
                ->where(["osc_page_news_cats.id = osc_page_news_items.cat"])
            ]);

        $news = $news->select([
            "cat_alias" => $this->news_cats()
                ->select(["cat_alias" => "osc_page_news_cats.alias"])
                ->where(["osc_page_news_cats.id = osc_page_news_items.cat"])
            ]);
      

        $news = $news->order(['dateCreate' => 'DESC'])->limit($limit)->offset($start)->all();

        return $news;
    }

    public function getNewsItem($id){
        $id = (int)$id;
        if ($id <= 0) return;

        $item = $this->news()->where(['id' => $id, 'block' => 0])->select($this->news);

        $item = $item->select([
            "cat_name" => $this->news_cats()
                ->select(["cat_name" => "osc_page_news_cats.name"])
                ->where(["osc_page_news_cats.id = osc_page_news_items.cat"])
            ]);

        $item = $item->select([
            "cat_alias" => $this->news_cats()
                ->select(["cat_alias" => "osc_page_news_cats.alias"])
                ->where(["osc_page_news_cats.id = osc_page_news_items.cat"])
            ])->first();

        if ($item) {
            $item->gal = $this->news_files()->where(['ref' => $id])->all();

            if ($item->cat > 0) {
                $item->neighbors = $this->news()->where(['cat' => $item->cat, 'block' => 0, 'id != ' => $item->id])->select($this->news);
                $item->neighbors = $item->neighbors->select([
                    "cat_name" => $this->news_cats()
                        ->select(["cat_name" => "osc_page_news_cats.name"])
                        ->where(["osc_page_news_cats.id = osc_page_news_items.cat"])
                    ]);

                $item->neighbors = $item->neighbors->select([
                    "cat_alias" => $this->news_cats()
                        ->select(["cat_alias" => "osc_page_news_cats.alias"])
                        ->where(["osc_page_news_cats.id = osc_page_news_items.cat"])
                    ])->all();
            }
            

            
        }

        return $item;
    }

    

    public function getMetaData($page){
        switch ($page) {
            case 'home':
                $q = "SELECT M.* FROM `osc_meta_table` AS M WHERE M.id = 1 LIMIT 1";
                return $this->q($q, 1);
                break;
            case 'townhouses':
                $q = "SELECT M.* FROM `osc_th_page` AS M WHERE M.id = 1 LIMIT 1";
                return $this->q($q, 1);
                break;
            case 'news':
                $q = "SELECT M.* FROM `osc_page_news` AS M WHERE M.id = 1 LIMIT 1";
                return $this->q($q, 1);
                break;
            case 'contacts':
                $q = "SELECT M.* FROM `osc_contacts_page` AS M WHERE M.id = 1 LIMIT 1";
                return $this->q($q, 1);
                break;
            case 'about':
                $q = "SELECT M.* FROM `osc_about_page` AS M WHERE M.id = 1 LIMIT 1";
                return $this->q($q, 1);
                break;
            
            default:
                # code...
                break;
        }
    }


    public function getBpCats(){
        return $this->bp_cats()
            ->select($this->bp_cats)
            ->select([
                'count_entries' => $this->bp_entries()->select([
                    'count_entries' => 'COUNT(osc_sys_bp_entries.id)'
                ])->where([
                    'osc_sys_bp_cats.id = osc_sys_bp_entries.cat'
                ])
            ])
            ->where(['block' => 0])
            ->all();
    }

    public function checkBpCat($cat_alias){
        return $this->bp_cats()->where(['alias' => $cat_alias, 'block' => 0])->first();
    }

    public function getAvailableDates($cat){
        $dates =  $this->bp_entries()
            ->select(['month' => 'MONTH(created)'])
            ->select(['year' => 'YEAR(created)']);
        if ($cat > 0) $dates = $dates->where(['cat' => $cat]);
        $dates =  $dates->distinct()
            ->order(['created' => 'DESC'])
            ->all();
        return $dates;
    }

    public function getBpEntries($cat = 0, $period = array(), $ajax = false, $count_entries = 0){

        if ($ajax) {
            $_cat = $this->post("curr_cat");
            $_period = $this->post("curr_period");
            $check_cat = null;
            if ($_cat) {
                $check_cat = $this->checkBpCat($_cat);
            }
            if ($check_cat) {
                $cat = $check_cat->id; 
            }
            if ($_period) {
                $q_period = explode('_', $_period);
                $y = (int)$q_period[0];
                $m = (int)$q_period[1];
                if ($y && $m) {
                    $period["year"] = $y;
                    $period["month"] = sprintf("%02d", $m);
                }
            }
        }

        $entries = $this->bp_entries()->select($this->bp_entries)->where(['block' => 0]);

        if ($cat > 0) $entries = $entries->where(["cat" => $cat]);

        if ($period) {
            $month = intval($period["month"]);
            $entries = $entries->where(['YEAR(`created`)' => $period["year"], 'MONTH(`created`)' => $month]);
        }else{
            $last_period = $this->bp_entries();
            if($cat > 0) $last_period = $last_period->where(['cat' => $cat]);
            $last_period = $last_period->select(['month' => 'MONTH(created)', 'year' => 'YEAR(created)'])
                ->order(['created' => 'DESC']);
                if ($count_entries > 0) {

                    $last_period = $last_period->limit($count_entries)->all();
                    if ($last_period && count($last_period)  > 0) {
                        foreach ($last_period as $key => $lp) {
                            if ($key == 0) {
                                $entries = $entries->where(['MONTH(created)' => $lp->month, 'YEAR(created)' => $lp->year]);
                            }else{
                                $entries = $entries->orWhere(['MONTH(created)' => $lp->month, 'YEAR(created)' => $lp->year]);
                            }
                        }
                    }
                }else{
                    $last_period = $last_period->first();
                    if ($last_period) {
                        $entries = $entries->where(['MONTH(created)' => $last_period->month, 'YEAR(created)' => $last_period->year]);
                    }
                }
        }

        $entries = $entries->select([
            'cat_name' => $this->bp_cats()
            ->select(['cat_name' => 'osc_sys_bp_cats.name'])
            ->where(['osc_sys_bp_cats.id = osc_sys_bp_entries.cat'])
        ]);
        $entries = $entries->select([
            'cat_price' => $this->bp_cats()
            ->select(['cat_price' => 'osc_sys_bp_cats.price_from'])
            ->where(['osc_sys_bp_cats.id = osc_sys_bp_entries.cat'])
        ]);
        $entries = $entries->select([
            'cat_link' => $this->bp_cats()
            ->select(['cat_link' => 'osc_sys_bp_cats.link'])
            ->where(['osc_sys_bp_cats.id = osc_sys_bp_entries.cat'])
        ]);
        $entries = $entries->select([
            'cat_alias' => $this->bp_cats()
            ->select(['cat_alias' => 'osc_sys_bp_cats.alias'])
            ->where(['osc_sys_bp_cats.id = osc_sys_bp_entries.cat'])
        ]);

        if ($count_entries > 0) {
            $entries = $entries->order(["created" => "DESC"])->limit($count_entries)->all();
        }else{
            $entries = $entries->order(["created" => "DESC"])->all();
        }

        if ($entries) {
            foreach ($entries as $key => $entry) {
                $entry->gal = $this->bp_photos()
                    ->where(['block' => 0, 'entry_id' => $entry->id])
                    ->all();
            }
        }

        if ($ajax) {
            return $this->printAjaxBp($entries);
        }else{
            return $entries;
        }
    }

    public function printAjaxBp($entries){
        $html = "";
        if ($entries) {
            ob_start();
                ?>
                    <?php foreach ($entries as $mkey => $entry): ?>
                        <?php
                            $type = 1;
                            $count_images = 0;
                            if ($entry->gal) {
                                $count_images = count($entry->gal);
                            }
                            if ($count_images == 2) {
                                $type = 2;
                            }elseif($count_images >= 3){
                                $type = 3;
                            }
                        ?>
                        <div class="item type<?= $type; ?>">
                            <?php 
                                
                            ?>
                            <div class="col-lg-12 info_row">
                                <p><span class="date"><?= date("d-m-Y", strtotime($entry->created)); ?></span> <a href="<?= RS.'building-progress/?cat='.$entry->cat_alias; ?>" class="cat"><?= $entry->cat_name ?: ""; ?></a></p>

                                <p class="item_name"><?= $entry->caption ?: ""; ?></p>

                                <div class="item_desc content_target">
                                    <div id="bp_inner_height">
                                        <?= $entry->description ?: ""; ?>
                                    </div>
                                </div>

                                <!-- <div class="show_more dni" id="show_more_det_<?= $entry->id; ?>">Детали</div> -->

                            </div>

                            <div class="clear"></div>
                            <?php if ($entry->gal && count($entry->gal) > 0): ?>
                                <div class="images mobile">
                                    <div class="owl-carousel">
                                        <?php foreach ($entry->gal as $key => $im): ?>
                                            <div class="mob_item">
                                                <a href="<?= BP.$im->source; ?>" data-fancybox="bp_item_mob_<?= $entry->id; ?>" class="fancybox">
                                                    <div class="image" style="background-image: url('<?= BP.'crop/500x500_'.$im->source; ?>');"></div>
                                                </a>
                                            </div>
                                        <?php endforeach ?>
                                    </div>
                                </div>
                            <?php endif ?>
                            
                            <div class="clear"></div>
                            <?php if ($entry->gal && count($entry->gal) > 0): ?>
                                <div class="images desktop">


                                    <?php if ($type == 1): ?>
                                        <?php foreach ($entry->gal as $key => $im): ?>
                                            <?php if ($key <= 2): ?>
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 b_col">
                                                    <a href="<?= BP.$im->source; ?>" data-fancybox="bp_item_<?= $entry->id; ?>" class="fancybox">
                                                        <div class="image_item" style="background-image: url('<?= BP.'crop/500x500_'.$im->source; ?>');">
                                                            <div class="hover"></div>
                                                        </div>
                                                    </a>
                                                </div>
                                            <?php else: ?>
                                                <a href="" class="fancybox dn" data-fancybox="bp_item_<?= $key; ?>"></a>
                                            <?php endif ?>

                                        <?php endforeach ?>
                                        
                                    <?php elseif($type == 2): ?>

                                        <?php foreach ($entry->gal as $key => $im): ?>
                                            <?php if ($key <= 2): ?>
                                                
                                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 b_col">
                                                    <a href="<?= BP.$im->source; ?>" data-fancybox="bp_item_<?= $entry->id; ?>" class="fancybox">
                                                        <div class="image_item" style="background-image: url('<?= BP.'crop/500x500_'.$im->source; ?>');">
                                                            <div class="hover"></div>
                                                        </div>
                                                    </a>
                                                </div>
                                                
                                            
                                            <?php else: ?>
                                                <a href="" class="fancybox dn" data-fancybox="bp_item_<?= $key; ?>"></a>
                                            <?php endif ?>

                                        <?php endforeach ?>

                                    <?php elseif($type == 3): ?>

                                        <?php foreach ($entry->gal as $key => $im): ?>
                                            <?php if ($key <= 2): ?>
                                                
                                            
                                                <?php if ($key == 0): ?>
                                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 b_col left">
                                                        <a href="<?= BP.$im->source; ?>" data-fancybox="bp_item_<?= $entry->id; ?>" class="fancybox">
                                                            <div class="image_item" style="background-image: url('<?= BP.'crop/500x500_'.$im->source; ?>');">
                                                                <div class="hover"></div>
                                                            </div>
                                                        </a>
                                                    </div>
                                                <?php elseif($key == 1): ?>
                                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 b_col right">
                                                        <a href="<?= BP.$im->source; ?>" data-fancybox="bp_item_<?= $entry->id; ?>" class="fancybox">
                                                            <div class="image_item" style="background-image: url('<?= BP.'crop/500x500_'.$im->source; ?>');">
                                                                <div class="hover"></div>
                                                            </div>
                                                        </a>
                                                <?php elseif($key == 2): ?>
                                                        <a href="<?= BP.$im->source; ?>" data-fancybox="bp_item_<?= $entry->id; ?>" class="fancybox">
                                                            <div class="image_item" style="background-image: url('<?= BP.'crop/500x500_'.$im->source; ?>');">
                                                                <div class="hover"></div>
                                                                <?php if ($count_images > 3): ?>
                                                                    <span class="count_inf"><?= "+".($count_images - 3); ?></span>
                                                                <?php endif ?>
                                                            </div>
                                                        </a>
                                                    </div>
                                                <?php endif ?>
                                            
                                            <?php else: ?>
                                                <a href="<?= BP.$im->source; ?>" class="fancybox dn" data-fancybox="bp_item_<?= $entry->id; ?>"></a>

                                            <?php endif ?>
                                        <?php endforeach ?>
                                    <?php endif ?>

                
                                    
                                    
                                    <div class="clear"></div>
                                </div>
                            <?php endif ?>

                            
                            <div class="bottom_bar">
                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                    <p>
                                        <?= $entry->cat_price ?: ""; ?> 
                                        <a href="<?= $entry->cat_link ?: RS."flats/"; ?>" class="layouts">Показать планировки</a>
                                    </p>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                    <p>
                                        <a href="javascript:void(0);" class="subscribe" data-cat="<?= $entry->cat_name ?: ""; ?>">Следить за строительством</a>
                                        <a href="javascript:void(0);" class="question" data-cat="<?= $entry->cat_name ?: ""; ?>">Задать вопрос</a>
                                    </p>
                                </div>

                                <div class="clear"></div>
                            </div>
                        </div>
                    <?php endforeach ?>
                <?php
            $html = ob_get_contents();
            ob_get_clean();

            return $html;
        }
    }

    public function getNewHomeBanners(){
        return TableRegistry::get('osc_nh_banner')->find()->where(['block' => 0])->order(['pos'])->all();
    }

    public function getNhIntro(){
        return TableRegistry::get('osc_nh_intro')->find()->where(['block' => 0])->first();
    }

    public function getNhGrid(){
        return TableRegistry::get('osc_nh_grid')->find()->where(['block' => 0])->order(['pos'])->all();
    }

    public function getNhTraffic(){
        return TableRegistry::get('osc_nh_traffic')->find()->where(['block' => 0])->first();
    }

    public function getUpdThLayouts(){
        $townhouses = TableRegistry::get('osc_unc_th')->find()->where(['block' => 0])->order(['pos'])->all();
        if ($townhouses && count($townhouses) > 0) {
            foreach ($townhouses as $k => $ct) {
                $ct['layouts'] = [];
                $layouts = TableRegistry::get('osc_unc_th_layouts')->find()->where(['block' => 0, 'th_id' => $ct->id])->all();
                if ($layouts && count($layouts) > 0) $ct['layouts'] = $layouts;
            }
        }
        return $townhouses;
    }

    public function getUpdTh($id){
        $id = (int)$id;
        $th = TableRegistry::get('osc_unc_th')->find()->where(['block' => 0, 'id' => $id])->first();
        if ($th && count($th) > 0){
            $th['layouts'] = [];
            $layouts = TableRegistry::get('osc_unc_th_layouts')->find()->where(['block' => 0, 'th_id' => $th->id])->all();
            if ($layouts && count($layouts) > 0) $th['layouts'] = $layouts;
        }
        return $th;
    }

    
}
