<?php
use Cake\Core\Plugin;
use Cake\Routing\RouteBuilder;
use Cake\Routing\Router;
use Cake\Routing\Route\DashedRoute;



$clearRU = $_SERVER['REQUEST_URI']; //preg_replace(RS, "", $_SERVER['REQUEST_URI'], 1); // str_replace(RS,"",$_SERVER['REQUEST_URI'],1);
$rdr = false;
$rdr_uri = '/';
switch($clearRU){
    case "/kontakti/":
        $rdr = true;
        $rdr_uri = "https://n-k-z.com/contacts/";
        break;
    case "/novini/novini-zabudovnika/":
        $rdr = true;
        $rdr_uri = "https://n-k-z.com/building-progress/";
        break;
    case "/akzii/":
        $rdr = true;
        $rdr_uri = "https://n-k-z.com/";
        break;
    case "/taunxausy-v-koncha-zaspe/":
        $rdr = true;
        $rdr_uri = "https://n-k-z.com/townhouses/";
        break;
    case "/novini/novosti-dlya-investorov/":
        $rdr = true;
        $rdr_uri = "https://n-k-z.com/news/";
        break;
    case "/pro-kompleks/dokumenti/":
        $rdr = true;
        $rdr_uri = "https://n-k-z.com/documents/";
        break;
    case "/obmen-zhilja/":
        $rdr = true;
        $rdr_uri = "https://n-k-z.com/event/flat/";
        break;
    case "/obmen-avtomobilja-na-kvartiru-novaja-usluga/":
        $rdr = true;
        $rdr_uri = "https://n-k-z.com/event/car/";
        break;
    case "/kvartiry/1k-kvartyry/":
        $rdr = true;
        $rdr_uri = "https://n-k-z.com/flats/lion/r1/";
        break;
    case "/kvartiry/2k-kvartiry/":
        $rdr = true;
        $rdr_uri = "https://n-k-z.com/flats/lion/r2/";
        break;
    case "/kvartiry/3k-kvartyry/":
        $rdr = true;
        $rdr_uri = "https://n-k-z.com/flats/lion/r3/";
        break;
    case "/kvartiry/2-yrovnevie/":
        $rdr = true;
        $rdr_uri = "https://n-k-z.com/flats/lion/rn/";
        break;
    case "/kvartiry/gotovye-kvartiry/":
        $rdr = true;
        $rdr_uri = "https://n-k-z.com/flats/";
        break;
    case '/zagalna-informaciya/':
        $rdr = true;
        $rdr_uri = "https://n-k-z.com/";
        break;
    default: break;
}
if($rdr){
    header("HTTP/1.1 301 Moved Permanently");
    header("location: $rdr_uri"); exit();
}



Router::defaultRouteClass(DashedRoute::class);

Router::scope('/', function (RouteBuilder $routes) {
    $routes->connect('/', ['controller' => 'Pages', 'action' => 'newhome']);
    $routes->connect('/flats/', ['controller' => 'Pages', 'action' => 'flats']);
    $routes->connect('/infrastructure/', ['controller' => 'Pages', 'action' => 'infrastructure']);
    $routes->connect('/contacts/', ['controller' => 'Pages', 'action' => 'contacts']);
    $routes->connect('/about/', ['controller' => 'Pages', 'action' => 'about']);
    $routes->connect('/news/', ['controller' => 'Pages', 'action' => 'news']);
    $routes->connect('/news/:item/', ['controller' => 'Pages', 'action' => 'newsItem'], ['pass' => ['item']]);

    $routes->connect('/townhouses/', ['controller' => 'Pages', 'action' => 'newth']);
    $routes->connect('/townhouses/:id/', ['controller' => 'Pages', 'action' => 'newthItem'], ['pass' => ['id']]);

    //$routes->connect('/old-home/', ['controller' => 'Pages', 'action' => 'home']);    
    //$routes->connect('/old-townhouses/', ['controller' => 'Pages', 'action' => 'townhouses']);
    $routes->connect('/cottages/', ['controller' => 'Pages', 'action' => 'cottages']);
    $routes->connect('/cottages/:id/', ['controller' => 'Pages', 'action' => 'cottageItem'], ['pass' => ['id']]);
    $routes->connect('/flats/:house/:layouts/', ['controller' => 'Pages', 'action' => 'layouts'], ['pass' => ['house', 'layouts']]);
    $routes->connect('/building-progress/', ['controller' => 'Pages', 'action' => 'bp']);

    // Dev controller
    // $routes->connect('/dev/', ['controller' => 'Pages', 'action' => 'dev']);

    // Default
	Router::connect('/ajax/', ['controller' => 'Ajax', 'action' => 'index']);
	Router::connect('/404/', ['controller' => 'System', 'action' => 'err404']);
	Router::connect('/sitemap/', ['controller' => 'System', 'action' => 'sitemap']);
    Router::connect('/*', ['controller' => 'System', 'action' => 'goto404']);

    $routes->fallbacks(DashedRoute::class);

});

Plugin::routes();