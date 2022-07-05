<?php
require("include/config.php");
include("classes/FileClass.php");
$obj = new FileClass();

if(isset($_POST['folder_path']) && $_POST['folder_path']!="")
{ 
	$dir = $_POST['folder_path'];
	$GLOBALS['I'] = 0;
	$mysqli->query("TRUNCATE TABLE `folders`");
	$obj->acessFolder($dir,$GLOBALS['I']);
	echo 'File system has been created';
}

if(isset($_POST['searchText']) && $_POST['searchText']!="")
{ 
	$dir = $_POST['searchText'];
	$obj->searchFileAndFolder($_POST['searchText']);
	
}

?>
