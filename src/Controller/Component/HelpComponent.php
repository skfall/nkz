<?php
namespace App\Controller\Component;
use Cake\Controller\Component;
use Cake\Datasource\ConnectionManager;
use Cake\Network\Email\Email;
interface Helper
{
	public function safedata($value);
	public function xss_clean($data);
	public function post($param,$defvalue = '');
	public function _get($param,$defvalue = '');
	public function _action(); 
	public function _pre($arr, $ext=false); 
	public function r2($to,$ntype='e',$msg=''); 
	public function q($query, $fetch = 0); 
	public function now(); 
	public function send_mail($from,$fromName,$to,$subject,$html,$attachments=NULL);
	public function check_phone($phone);
	public function check_user($search_key,$field='login');  
}
class HelpComponent extends ContextComponent implements Helper
{
    public $conn;
    
    public $devCompany = "POSITIVE BUSINESS";
    
    public function __construct(){
        $this->conn = ConnectionManager::get('default');
    }
    
    public function safedata($value){
        if(!isset($value)) {
            return '';	
        }
        if (is_string($value)) {
            $value = trim($value);
            $value=htmlentities($value, ENT_QUOTES, 'utf-8');
        }    
        return $value;
    }
    public function xss_clean($data){
            if (is_array($data)) {
                    $cleaned_array = array();
                    foreach($data as $name => $value) {
                            $cleaned_array[$name] = $this->safedata($value);
                    }
                    return $cleaned_array;		
            }
            return $cleaned_data = $this->safedata($data);
    }
    public function post($param,$defvalue = '') {
        if(!isset($_POST[$param])) 	{
            return $defvalue;
        }
        else {
            return $this->safedata($_POST[$param]);
        }
    }
    public function _get($param,$defvalue = '')
    {
        if(!isset($_GET[$param])) {
            return $defvalue;
        }
        else {
            return $this->safedata($_GET[$param]);
        }
    }
    public function _action() {
        if(!isset($_POST['action'])) 	{
            return false;
        }
        else {
            return $this->safedata($_POST['action']);
        }
    }
    public function _pre( $arr, $ext=false ) {
        echo "<pre>";
            print_r($arr);
            echo "</pre>";
            if($ext) exit();
    }
    
    public function r2($to,$ntype='e',$msg=''){
		// die("r2: ".$to);
        if($msg==''){
            header("HTTP/1.1 301 Moved Permanently");
            header("location: $to"); exit;
        }
        $_SESSION['ntype']=$ntype ; $_SESSION['notify']=$msg ;
        header("HTTP/1.1 301 Moved Permanently");
        header("location: $to"); exit;
    }
    public function q($query, $fetch = 0){
        if (isset($fetch) && $fetch == 0) {
            return $this->conn->query($query)->fetchAll('assoc');
        }elseif(isset($fetch) && $fetch == 1){
            return $this->conn->query($query)->fetch('assoc');
        }elseif(isset($fetch) && $fetch == 2){
            return $this->conn->query($query);
        }else{
            exit('query expect params');
        }
    }
    public function now(){
        return $now = date("Y-m-d H:i:s");
    }
   
    public function send_mail($from,$fromName,$to,$subject,$html,$attachments=false ){
			$email_obj = new Email('default');
			
			// example attach one file: "img/cake.icon.png"
			// example attach several files : array("img/cake.power.gif","img/cake.icon.png")
			
			if($attachments){
				$email_obj->attachments($attachments);
			}
			
			return $email_obj->from(array($from => $fromName))
				->emailFormat('html')
				->to($to)
				->subject($subject)
				->send($html);
		}
		
	public function check_phone($phone, $iso='ua'){
		$reg_exp = "//";
		switch($iso)
		{
			case 'ua':{
				$reg_exp = '/[+380]\s\([0-9]{2}\)\s[0-9]{3}-[0-9]{2}-[0-9]{2}/';
				break;
				}
			default:{
				break;
				}
		}
		return preg_match($reg_exp, $phone);
    }
	
	public function check_user($search_key, $field='login'){
		$q = "SELECT id, name FROM osc_users WHERE `$field`='$search_key' LIMIT 1";
		return $this->q($q,1);
	}
	
	public function check_language($lang){
		$q = "
			SELECT R.lang_id   
			FROM osc_languages AS M 
			LEFT JOIN osc_site_languages as R ON R.lang_id = M.id 
			WHERE M.alias='$lang' AND R.block=0 
			LIMIT 1
		";
		return $this->q($q,1);
    }
  

}
