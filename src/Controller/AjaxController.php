<?php
namespace App\Controller;
use Cake\Core\Configure;
use Cake\Network\Exception\NotFoundException;
use Cake\View\Exception\MissingTemplateException;
use Cake\Network\Session\CacheSession;
use Cake\ORM\TableRegistry;
use Cake\Datasource\ConnectionManager;
use Cake\Network\Request;
class AjaxController extends AppController
{
    public $components = array('RequestHandler');
    public function initialize()
    {
        parent::initialize();
    }
    public function index()
    {      
        $conn = ConnectionManager::get('default');
        if ($this->request->is('ajax')) {
            $response = array('status'=>'fail','message'=>'Unexpected request '.$this->request->data['action']);
            if(!empty($this->request->data['action'])) {
                switch($this->request->data['action']){
                    case 'appointment':
                        $response = $this->Model->appointment();
                        break;                
                    case 'contact_form':
                        $response = $this->Model->contactForm();
                        break;
                    case 'recall':
                        $response = $this->Model->recall();
                        break;
                    case 'getThLayouts':
                        $response = $this->Model->getThLayouts();
                        break;
                    case 'getThBlock':
                        $response = $this->Model->changeThBlock();
                        break;
                    case 'subscribe':
                        $response = $this->Model->subscribeNews();
                        break;
                    case 'loadMoreBp':
                        $response = $this->Model->getBpEntries(null, null, true);
                        break;
                    case 'bp_question':
                        $response = $this->Model->bpQuestion();
                        break;
                    case 'bp_subscription':
                        $response = $this->Model->bpSubscription();
                        break;
                    case 'load_rd_th':
                        $response = $this->Th->getReadyTh();
                        break;
                    case 'load_lines_layouts':
                        $response = $this->Th->getThLinesLayouts();
                        break;
                    default: break;
                }
            }
            echo json_encode($response);
            exit();
        } 
    }
}
