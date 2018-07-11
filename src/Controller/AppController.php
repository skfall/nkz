<?php
namespace App\Controller;
use Cake\Controller\Controller;
use Cake\Event\Event;

require_once(ROOT .DS. "config" . DS  . "CP.php");

class AppController extends Controller {
    public $cp;
    public $ri;

    public function initialize() {

        parent::initialize();
        $this->cp = new \CP();
        $this->ri = $this->cp->ri;
        $this->loadComponent('RequestHandler');
        $this->loadComponent('Flash');

        if ($this->request->action == "cottages" || $this->request->action == "cottageItem") {
            $this->viewBuilder()->layout('cottages');
        }else{
            $this->viewBuilder()->layout('nkz');
        }
        
        date_default_timezone_set('Europe/Kiev');

        // GET COMPONENTS
        $this->loadComponent('Help');
        $this->loadComponent('Model');
        $this->loadComponent('Cottages');
        $this->loadComponent('Th');
        $menu = $this->Model->getMenu();

        $config = $this->Model->getSiteConfig();

        

        $meta_title = (isset($config->meta_title) ? htmlentities($config->meta_title) : "");
        $meta_desc = (isset($config->meta_desc) ? htmlentities($config->meta_desc) : "");
        $meta_keys = (isset($config->meta_keys) ? htmlentities($config->meta_keys) : "");

        $view_model = compact('menu', 'config', 'meta_title', 'meta_desc', 'meta_keys');

        $this->set($view_model);



    }

    public function beforeRender(Event $event) {
        if (!array_key_exists('_serialize', $this->viewVars) &&
            in_array($this->response->type(), ['application/json', 'application/xml'])
        ) {
            $this->set('_serialize', true);
        }
    }
}
