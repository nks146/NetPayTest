<!DOCTYPE html>
<html lang="en">
   <head>
      <!-- Required meta tags -->
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <title>File System</title>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
   </head>
   <body>
      Scan the Folder: <input type="text" name="folder_path" value="" id="folder_path">
      <button name="scan" id="scan">Scan</button></br>
      Search the File and Folder: <input type="text" name="name" value="" id="name">
      <button name="search_key" id="search_key">Search</button>
      <div>
         <ul class="searchResult" id="searchResult"> </ul>
      </div>
      <div class="container-scroller">
      </div>
      <script>
         $(document).ready(function(){ 
         $('#scan').click(function(){ 
            var folder_path = $('#folder_path').val(); 
            if(folder_path != "")
            { 
               $.ajax({ 
                  url: 'ajax.php',
                  data: {folder_path:folder_path},
                  type: 'post',
                  success: function(response) {
                  alert(response);
               }
               }); 
            }         
          });


         $('#search_key').click(function(){ 
         $('#searchResult').show();
         var searchText = $('#name').val();
         if(searchText != "")
         { 
         	$.ajax({ 
         		url: 'ajax.php',
         		data: {searchText:searchText},
         		type: 'post',
         		dataType: 'json',
         		success: function(response) {
         		if(response != ""){			
         			var len = response.length; 
         			$("#searchResult").empty();
         			for( var i = 0; i<len; i++){
         				var path_name = response[i]['path_name'];
         				$("#searchResult").append("<li>"+path_name+"</li>"); 
         			}
         		} else {
         			$("#searchResult").empty();					
         			$("#searchResult").append("<li>Data Not Found</li>");
         		}
         	}
         	}); 
         }else {
         	$("#searchResult").hide();	
         }				
          });
         });
      </script>
   </body>
</html>