<?php
namespace App\Controller;

use Cake\Core\Configure;
use Cake\Network\Exception\ForbiddenException;
use Cake\Network\Exception\NotFoundException;
use Cake\View\Exception\MissingTemplateException;


class SystemController extends AppController {

    public function err404(){
        $page = "404";
        $this->set('page', $page);
    }

    public function goto404(){
        $this->Help->r2(RS.'404/'); exit();
    }

    public function sitemap(){

    }
}
