<?php

class FileClass {

	public function __construct()
    {
        global $mysqli;
        
    }
	/**
	 * Insert and read folder and file system
	 */
	public function acessFolder($dir,$parent) {
		try {
			global $mysqli;
	        $result = array();        
	        if(is_dir($dir)){
	            $scan_dir = scandir($dir);
	                foreach($scan_dir as $value){
	                    if(!in_array($value, array(".",".."))){
	                        if(is_dir($dir. DIRECTORY_SEPARATOR. $value)){
	                            $result[$value] = [++$GLOBALS['I']]; //add folder index
	                            $result[$value][] = $parent;  //add parent folder index
	                            $mysqli->query("insert into folders set name='".$value."', parent_id='".$parent."'");                           
	                            $GLOBALS['I'] = $mysqli->insert_id;
	                            $result[$value][] = $this->acessFolder($dir. DIRECTORY_SEPARATOR. $value,$GLOBALS['I']);
	                    }else{
	                        $result[] = $value;
	                        $mysqli->query("insert into folders set name='".$value."', parent_id='".$parent."'");
	                    }
	                }
	            }
	        }
			return ['success' => true, 'message' => 'File system has been created', 'fileStructure' => $result];
		} catch (\Exception $e) {
			return ['success' => false, 'message' => $e->getMessage()];
		}
	}

	/**
	 * Insert and read folder and file system
	 */
	public function searchFileAndFolder($name)
	{
		global $mysqli;
		$searchText = '%'.$_POST['searchText'].'%';
		$search_data = $mysqli->query("WITH RECURSIVE files_paths (id, name, path) AS
			(
			  SELECT id, name, CAST(name AS VARCHAR(255)) FROM folders WHERE parent_id = '0'
			  UNION ALL 
			    SELECT f.id, f.name, CONCAT(fp.path, '/', f.name)
			    FROM files_paths AS fp JOIN folders AS f
			      ON fp.id = f.parent_id
			)
			SELECT path FROM files_paths where path like '".$searchText."' ");

		$count = $search_data->num_rows;
		if($count>0)
		{
			while($row = $search_data->fetch_array(MYSQLI_BOTH))
			{
				$search_arr[] = array("path_name" => $row['path']);
			}
			echo json_encode($search_arr);
		}else{
			echo 0;
		}
	}
	
}
?>