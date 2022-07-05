<?php
require("include/config.php");
include("classes/FileClass.php");
$obj = new FileClass();

if(isset($_POST['searchText']) && $_POST['searchText']!="")
{ 
	$dir = "documents";
	$GLOBALS['I'] = 0;
	$fileStructure = $obj->acessFolder($dir,$GLOBALS['I']); 
	// echo "<pre>";
	// print_r($fileStructure);
	// echo "</pre>"; die;	
	$obj->searchFileAndFolder($_POST['searchText']);
	
}

?>
