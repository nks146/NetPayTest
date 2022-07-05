<?php
ini_set('display_errors', 1); 
ini_set('display_startup_errors', 1); 
error_reporting(E_ALL);
//define('SITE_URL',"http://localhost/sd_app/");
//main db connection
		$hostname = "localhost";
		$user = "root";
		$password = "root";
		$database = "file_system_1";
	    mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
		$mysqli = new mysqli($hostname, $user, $password);
		$mysqli->select_db($database);
?>