<?php
header('Access-Control-Allow-Origin: *');
class DB{

	private $host = 'localhost';
	private $username = 'root';
	private $password = '';
	private $database = 'mangames';
	public $db;

	public function __construct(){
		try{
			$this->db = new PDO('mysql:host='.$this->host.';dbname='.$this->database, $this->username, $this->password, array(
					PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES UTF8',
					PDO::ATTR_ERRMODE => PDO::ERRMODE_WARNING
				));
		}catch(PDOException $e){
			die('erreur' + $e);
		}
	}
}
?>    