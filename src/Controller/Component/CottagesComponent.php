<?php
namespace App\Controller\Component;
use Cake\Controller\Component;
use Cake\Datasource\ConnectionManager;
use Cake\ORM\TableRegistry;
require_once "HelpComponent.php";
class CottagesComponent extends HelpComponent {
	public function getMenuByAlias($alias){
        $q = "SELECT M.* FROM `osc_menu` AS M WHERE M.alias = '$alias' AND M.block = 0 LIMIT 1";
        return $this->q($q, 1);
    }
    public function getCTBanner(){
        $q = "SELECT M.* FROM `osc_ct_banner` AS M WHERE M.id = 1 AND M.block = 0 LIMIT 1";
        return $this->q($q, 1);
    }

    public function getCTReasons(){
        $q = "SELECT M.* FROM `osc_ct_reasons` AS M LIMIT 5";
        return $this->q($q);
    }

    public function getCTEquip(){
        $q = "SELECT M.* FROM `osc_ct_equip` AS M WHERE M.id = 1 AND M.block = 0 LIMIT 1";
        $result = $this->q($q, 1);
        if ($result) {

            $result['items'] = array();
            $q = "SELECT M.* FROM `osc_ct_equip_items` AS M LIMIT 200";
            $result['items'] = $this->q($q);
        }
        return $result;
    }

    public function getCottagesGallery(){
        $q = "SELECT M.* FROM `osc_ct_gallery` AS M WHERE M.id = 1 AND M.block = 0 LIMIT 1";
        $result = $this->q($q, 1);
        if ($result) {
            $result['items'] = array();
            $q = "SELECT M.* FROM `osc_ct_gallery_items` AS M LIMIT 200";
            $result['items'] = $this->q($q);
        }
        
        return $result;
    }

    
    public function getCTLayouts(){
        $result = array();
        $layout_data = array();
        $layout_filter = array();
        $layout_images = array();
        $layout_event = array();

        $q = "
            SELECT
                M.id, 
                M.name,
                M.total_area,
                M.parts_area,
                M.event_id
            FROM `osc_sys_cottages_layouts` AS M
            WHERE M.block = 0
            ORDER BY M.total_area
            LIMIT 1
        ";
        $layout_data = $this->q($q, 1);

        $q = "SELECT M.total_area FROM `osc_sys_cottages_layouts` AS M WHERE M.block = 0 ORDER BY M.total_area LIMIT 200";
        $layout_filter = $this->q($q);

        if ($layout_data) {
            $layout_id = $layout_data['id'];
            $layout_event_id = $layout_data['event_id'];
            $q = "SELECT M.* FROM `osc_sys_cottages_layouts_items` AS M WHERE M.ref = '$layout_id' LIMIT 100";
            $layout_images = $this->q($q);

            if ($layout_event_id) {
                $q = "
                    SELECT 
                        E.id,
                        E.name,
                        E.details
                    FROM `osc_sys_events` AS E 
                    WHERE 
                        E.block = 0 AND 
                        E.id = '$layout_event_id'
                    LIMIT 1
                ";
               $layout_event = $this->q($q, 1);
            }
            
        }

        $result = array(
            'layout_data' => $layout_data,
            'layout_filter' => $layout_filter,
            'layout_images' => $layout_images,
            'layout_event' => $layout_event 
        );
        return $result;
    }

    public function getCTLayoutByArea(){
        $data = array('status' => 'failed', 'html' => '');
        $area = $this->_post('area');
        $layout_data = array();
        $layout_images = array();
        $layout_event = array();
        
        $q = "
            SELECT 
                M.id, 
                M.name,
                M.total_area,
                M.parts_area,
                M.event_id
            FROM `osc_sys_cottages_layouts` AS M 
            WHERE 
                M.block = 0 AND 
                M.total_area = '$area' 
            ORDER BY M.total_area
            LIMIT 1";
        $layout_data = $this->q($q, 1);

        if ($layout_data) {
            $layout_id = $layout_data['id'];
            $layout_event_id = $layout_data['event_id'];
            $q = "SELECT M.* FROM `osc_sys_cottages_layouts_items` AS M WHERE M.ref = '$layout_id' LIMIT 100";
            $layout_images = $this->q($q);

            if ($layout_event_id) {
                $q = "
                    SELECT 
                        E.id,
                        E.name,
                        E.details
                    FROM `osc_sys_events` AS E 
                    WHERE 
                        E.block = 0 AND 
                        E.id = '$layout_event_id'
                    LIMIT 1
                ";
               $layout_event = $this->q($q, 1);
            }
            
        }

        ob_start(); ?>
            <?php if ($layout_images): ?>
                <div class="cottages_preview_owl owl-carousel aos-init aos-animate" data-aos="fade-up" id="cottages_owl_parent">
                    <?php foreach ($layout_images as $key => $value): ?>
                        <div class="plan_item">
                            <a href="<?= COTTAGES_PATH.$value['file']; ?>" class="group fancybox"  rel="plan_group">
                                <div class="hover"></div>
                                <img src="<?= COTTAGES_PATH.'crop/500x350_'.$value['file']; ?>" alt="Layout" />
                            </a>
                        </div>
                    <?php endforeach ?>
                </div>

                <div class="cottages_gal_owl owl-carousel aos-init aos-animate" data-aos="fade-up" id="cottages_owl_child">
                    <?php foreach ($layout_images as $key => $value): ?>
                        <div class="gal_item_outer">
                            <div class="gal_item">
                                <img src="<?= COTTAGES_PATH.'crop/500x350_'.$value['file']; ?>" alt="Layout" />
                            </div>
                        </div>
                    <?php endforeach ?>
                </div>
            <?php endif ?>
        <?php $data['owl'] = ob_get_contents();
        ob_clean();

        ob_start(); ?>
            <?php if ($layout_data): ?>
                <h2 class="sect_caption2 aos-init aos-animate" data-aos="fade-up">Планировки <br />коттеджей</h2>
                <hr class="heading_und2 aos-init aos-animate" data-aos="fade-up">
                <h5 class="cottage_type_name aos-init aos-animate" data-aos="fade-up"><?= ($layout_data['name'] ? $layout_data['name'] : ''); ?></h5>
                <hr class="cott_und_2 aos-init aos-animate" data-aos="fade-up" />
                <?php if ($layout_data['parts_area']): ?>
                    <?php 
                        $part = trim(unserialize($layout_data['parts_area']));
                        $exp_part = explode(';', $part);
                        if ($exp_part[count($exp_part) - 1] == '') array_pop($exp_part);
                    ?>
                    <table class="flat_area aos-init aos-animate" data-aos="fade-up">
                        <?php foreach ($exp_part as $p_key => $p_value): ?>
                            <?php
                                $exp_part_row = explode('*', trim($p_value)); 
                            ?>
                            <?php if (count($exp_part_row) > 1): ?>
                                <tr>
                                    <td><?= $exp_part_row[0]; ?></td>
                                    <td><?= $exp_part_row[1]; ?> м<sup>2</sup></td>
                                </tr>
                            <?php endif ?>
                        <?php endforeach ?>
                    </table>
                <?php endif ?>
            <?php endif ?>
        <?php $data['layout_info'] = ob_get_contents();
        ob_clean();

        ob_start(); ?>
            <?php if ($layout_event): ?>
                <?php $layout_id = $layout_data['id']; ?>
                <div class="cottage_event aos-init aos-animate" data-aos="fade-up">
                    <a href="#" onclick="core.open_layout_event_modal(event, 'ct_layout', '<?= $layout_id; ?>', '<?= $layout_event_id; ?>');">
                        <p><img src="<?= RS.'img/event_mark.jpg'; ?>" alt="Event label"></p>
                        <div class="event_desc"><?= ($layout_event['details'] ? $layout_event['details'] : ''); ?></div>
                    </a>
                </div>
            <?php endif ?>
        <?php $data['layout_event'] = ob_get_contents();
        ob_clean();

        if ($layout_data) {
            $data['status'] = "success";
        }

        return $data;
    }

    public function getGenplan(){
        $q = "
            SELECT 
                M.*
            FROM `osc_ct_genplan` AS M
            LIMIT 50
        ";
        return $this->q($q);
    }  

    public function getUniMeta($alias, $id = 0){
        $id = (int)$id;
        $id_row = "";
        if ($id) $id_row = " AND M.id = '$id' ";
        $q = "
            SELECT 
                M.meta_title,
                M.meta_keys,
                M.meta_desc
            FROM `osc_meta_table` AS M 
            WHERE M.alias = '$alias' 
            ".$id_row." 
            LIMIT 1
        ";
        return $this->q($q, 1);
    }
}
