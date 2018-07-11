<?php
namespace App\Controller\Component;
use Cake\Controller\Component;
use Cake\Datasource\ConnectionManager;
use Cake\ORM\TableRegistry;
require_once "HelpComponent.php";
class ThComponent extends HelpComponent {
    
    public function getThBanners(){
        return TableRegistry::get('osc_nth_banner')->find()->where(['block' => 0])->order(['pos'])->all();
    } 
    
    public function getThIntro(){
        return TableRegistry::get('osc_nth_intro')->find()->where(['block' => 0])->first();
    }   
    
    public function getThVideo(){
        return TableRegistry::get('osc_nth_video')->find()->where(['block' => 0])->first();
    }

    public function getThGal(){
        return TableRegistry::get('osc_nth_gal')->find()->where(['block' => 0])->order(['pos'])->all();
    }

    public function getThBlocks(){
        return TableRegistry::get('osc_nth_blocks')->find()->where(['block' => 0])->order(['pos'])->all();
    }

    public function getThInfoblock1(){
        $infoblock = TableRegistry::get('osc_nth_infoblock1')->find()->where(['block' => 0])->first();
        $items = TableRegistry::get('osc_nth_infoblock1_items')->find()->all();
        $infoblock["items"] = $items;
        return $infoblock;
    }

    public function getThInfoblock2(){
        return TableRegistry::get('osc_nth_infoblock2')->find()->where(['block' => 0])->first();
    }

    public function getThReadyTh(){
        $townhouses = TableRegistry::get('osc_nth_ready_th')->find()->where(['block' => 0])->order(['area'])->all()->toArray();
        if ($townhouses) {
            foreach ($townhouses as $key => &$value) {
                $th_id = (int)$value['id']; 
                $items = TableRegistry::get('osc_nth_ready_th_layouts')->find()->where(['block' => 0, 'ref' => $th_id])->all();
                $value['layouts'] = $items;
            }
        }
        return $townhouses;
    }

    public function getReadyTh(){
        $response = array('status' => '', 'message' => '');
        $th_id = (int)$this->post('id');
        $th = TableRegistry::get('osc_nth_ready_th')->find()->where(['block' => 0, 'id' => $th_id])->first();
        
        if ($th) {
            $response['th_name'] = $th->name;
            $response['th_desc'] = $th->content;

            $layouts = TableRegistry::get('osc_nth_ready_th_layouts')->find()->where(['block' => 0, 'ref' => $th->id])->all();
            
            $layouts_html = "";
            if ($layouts && count($layouts) > 0) {
                ob_start(); ?>

                <div class="top_owl owl-carousel">
                    <?php 
                        if ($layouts && count($layouts) > 0) {
                            foreach ($layouts as $fk => $fv) { ?>
                                <div class="item">
                                    <a href="<?= NTH.$fv->source; ?>" class="fancybox" data-fancybox="th_layout_gal_<?= $fk ?>">
                                        <img src="<?= NTH.'crop/435x340_'.$fv->source; ?>" alt="Layout">
                                    </a>
                                </div>
                            <?php }
                        }
                    ?>
                </div>
                <div class="bot_owl owl-carousel">
                    <?php 
                        if ($layouts && count($layouts) > 0) {
                            foreach ($layouts as $fk => $fv) { ?>
                                <div class="item">
                                    <img src="<?= NTH.'crop/435x340_'.$fv->source; ?>" alt="Layout">
                                </div>
                            <?php }
                        }
                    ?>
                </div>

                <?php $layouts_html = ob_get_clean();
            }

            $response['layouts'] = $layouts_html;
            $response['status'] = "success";
        }
        return $response;
    }

    public function getThLinesLayouts(){
        $response = array('status' => '', 'message' => '');
        $th_id = (int)$this->post('id');
        $th = TableRegistry::get('osc_nth_blocks')->find()->where(['block' => 0, 'id' => $th_id])->first();

        $layouts_html = "";
        if ($th) {
            $floors = TableRegistry::get('osc_nth_blocks_layouts')->find()->where(['block' => 0, 'ref' => $th_id])->order(['floor'])->all()->toArray();
            if ($floors && count($floors) > 0) {
                foreach ($floors as $fk => &$fv) {
                    $fid = $fv['id'];
                    $layouts = TableRegistry::get('osc_nth_blocks_layouts_items')->find()->where(['ref' => $fid, 'block' => 0])->all()->toArray();
                    $fv['layouts'] = $layouts;
                }
            }

            if ($floors && count($floors) > 0) {
                ob_start(); ?>
                    <div class="block_layout_wrapper">
                        <div class="floors_select">
                            <ul>
                                <?php 
                                    foreach ($floors as $k => $v) { 
                                        $active = "";
                                        if($k == 0) $active = "active";
                                        ?>
                                        <li><a href="javascript:void(0);" class="<?= $active; ?>" onclick="app.th_floors_handler(<?= $v['id'] ?>, this);"><span><?= $v['floor_name'] ?: $v['floor']; ?></span></a></li>                                        
                                    <?php }
                                ?>
                            </ul>
                        </div>

                        <?php 
                            foreach ($floors as $key => $value) { 
                                $active = "";
                                if ($key == 0) $active = "active";
                                ?>
                                <div class="th_block_layout_holder layout_item <?= $active ?>" id="th_floor_item_<?= $value['id'] ?>">
                                    <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 images">
                                        <div class="owl-carousel primary">
                                            <?php
                                                foreach ($value['layouts'] as $lk => $lv) { ?>
                                                    <div class="item">
                                                        <a href="<?= NTH.$lv['source'] ?>" class="fancybox_ajax">
                                                            <img src="<?= NTH."crop/435x340_".$lv['source'] ?>" alt="Layout" />
                                                        </a>
                                                    </div>
                                                <?php } 
                                            ?>
                                        </div>
                                        <div class="owl-carousel secondary">
                                            <?php
                                                foreach ($value['layouts'] as $lk => $lv) { ?>
                                                    <div class="item">
                                                        <img src="<?= NTH."crop/435x340_".$lv['source'] ?>" alt="Layout" />
                                                    </div>
                                                <?php } 
                                            ?>
                                        </div>
                                    </div>
                                    <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12 properties">
                                        <div class="text">
                                            <?php if (isset($value['props']) && $value['props']): ?>
                                                <?php
                                                    $stats = explode(';', $value['props']);
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
                                                <a href="javascript:void(0);" class="order_btn bggreen" data-toggle="modal" data-target="#visit_modal">Записаться на просмотр</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            <?php }
                        ?>
                        
                    </div>
                <?php $layouts_html = ob_get_clean(); 
            }

           
        }

        $response['layouts'] = $layouts_html;
        $response['status'] = "success";        
        return $response;        
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
