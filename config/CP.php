<?php
/* KAM STUDIO | Project Settings */
class CP
{
	public $multilang = true;
	public $projectFolderName = "nkz"; // Либо имя папки либо пустая строка
	public $projectFolder = "/"; // не трогать
	public $domainName;
	public $ri;
	public $defLang = "ru";
	
	// iw - Hebrew, 	ID = 52 (Israel)
	// ru - Russian, 	ID = 94
	// en - English, 	ID = 1
	// fr - French, 	ID = 34
	function __construct(){
		session_start();
		$this->projectFolder .= ($this->projectFolderName ? $this->projectFolderName."/" : "");
		
		define('RS', $this->projectFolder);
		define('IMG_PATH', RS.'split/files/images/');
		define('HOUSE_GAL', RS.'split/files/house_gal/');
		define('ARTICLE_PATH', RS.'split/files/content/');
		define('HOUSE_SLIDES_PATH', RS.'split/files/house_slides/');
		define('LAYOUTS', RS.'split/files/layouts/');
		define('DOCS', RS.'split/files/docs/');
		define('ICONS', RS.'split/files/icons/');
		define('PROJECTS', RS.'split/files/projects/');
		define('TH', RS.'split/files/townhouses/');
		define('NEWS', RS.'split/files/news/');
		define('NEWS_GAL', RS.'split/files/news_gal/');
		define('BP', RS.'split/files/bp/');
		define('COTTAGES_PATH', RS.'split/files/cottages/');
		define('NTH', RS.'split/files/new_th/');
		define('NH', RS.'split/files/new_home/');

		
		//MULTILANG
		define("DEF_LANG", $this->defLang);
		
		if(isset($_GET['lang-destroy'])){
			$_SESSION['lang'] = DEF_LANG;
		}
		$sess_lang =  (isset($_SESSION['lang']) ? ($_SESSION['lang'] ? $_SESSION['lang'] : DEF_LANG) : DEF_LANG);
		$_SESSION['lang'] = $sess_lang;
		define('LANG', $sess_lang);
		define('LANG_PREFIX', (LANG==DEF_LANG ? "" : $sess_lang."_") );
		
		
		$this->ini();

	}
	
	public function ini(){
		// GET FA AND LA
		$domainName = $_SERVER['SERVER_NAME'];
		$this->domainName = $domainName;
		
		$defLang = $this->defLang;
		
		$ri_trim = trim($_SERVER['REQUEST_URI'],'/\\');
		$ri = explode("/",$ri_trim);
		
		if(!$ri){
			header("Location: ".$this->projectFolder.($this->multilang ? LANG."/" : "")."404/");
			exit();
		}else{ 
			if(count($ri) > 1){
				if($ri[0]==$domainName) array_shift($ri);
				if($ri[0]==$this->projectFolderName) array_shift($ri);
			}
			if(strpos($ri[0], "index.php") !== false || trim($ri[0]) == "" || $ri[0] ==$domainName || $ri[0]==$this->projectFolderName){ 
				$ri[0] = "home";
			}
			$lastAlias = $ri[count($ri)-1];
			if($lastAlias[0]=='?' && count($ri) > 1){
				$lastAlias = $ri[count($ri)-2];
			}
			
			$this->ri = $ri;
			
			define("FA",$ri[0]);   
			define("LA",$lastAlias);
		}
	}
	
	public function check_true_url($checkFA, $checkLANG){
		if($this->multilang && LANG!=FA && FA!='home' && FA!='ajax' && FA!='logout'){ 
			if(!$checkFA){
				if(!$checkLANG){
					$_SESSION['lang'] = DEF_LANG;
					header("HTTP/1.1 301 Moved Permanently");
            		header("location: ".RS.DEF_LANG."/404/"); exit;
				}else{
					header("HTTP/1.1 301 Moved Permanently");
            		header("location: ".RS.LANG."/404/"); exit;
				}
			}else{
				$_SESSION['lang'] = FA;
				$trueURL = RS.FA."/";
				foreach($this->ri as $i => $item){
					if(!$i) continue;
					$trueURL .= $item.( $item[0]!='?' ? "/" : "" );
				} 
				header("HTTP/1.1 301 Moved Permanently");
				header("location: $trueURL"); exit;
			}
		}
	}
}