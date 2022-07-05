<?php
// ini_set('display_errors', 1); 
// ini_set('display_startup_errors', 1); 
// error_reporting(E_ALL);
include('classes/SubmitClass.php');
$data = unserialize(file_get_contents("database/contactData.txt"));
?>
<!DOCTYPE html>
<html lang="en">
   <head>
      <!-- Required meta tags -->
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <title>Multiple Contact Form</title>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!--       <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.3.79/jquery.form-validator.min.js"></script>
 -->      <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
      <script src="bootstrap/js/bootstrap.js"></script>
   </head>
   <body>
   	<div class="content-wrapper justify-content-center">
		  <div class="page-header">
			<h3 class="page-title">
				Multiple Contact Form
			</h3>
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb">
				<li> <span class="btn btn-primary btnClassAddNewItem" style="margin: 0 auto 6px 5px;">Add Contact</span></li>
				<li style="margin: 0 6px 5px;"><button class="btn btn-primary" id="validateForm" onclick="validateForms()">Validate</button></li>
				<li><button class="btn btn-primary" onclick="contactFormSubmit()">Save</button></li>
				</ol>

			</nav>
		  </div>
  <div>
<?php
	foreach($message as $key=>$value) {
				if(!empty($value)) {
					if($key=='success'){
					echo '<span style="color: green;">'.$value.'</span></br>';
				}else{
					echo '<span style="color: red;">'.$value.'</span></br>';
				}
				}
		}
?>
  </div>
  <form method="post" class="forms-sample contact_form" name="submitContactForm">
 <?php for($i=0; $i<count($data['name']); $i++){ ?>
  <div class="form_box bxx" id="p0">
  <strong>Contact</strong>
  <span class="btn btn-primary btnClassRemoveItem" style="margin: 0 auto 6px 208px;">Remove</span>
  <div class="row">
   <div class="col-3 grid-margin stretch-card">
	  <div class="card">
		<div class="card-body">

				<div class="row">
					<div class="col-md-12">
						<label><strong>Name</strong></label>	
						<input type="text" name="name[]" class="form-control name" id="name_0" value="<?php echo $data['name'][$i]; ?>" autocomplete="off" >
						<span class="err_message name_error" style="color: red;"></span>
					</div>
				</div>	
				<div class="row">					
					<div class="col-md-12">
						<label><strong>Email</strong></label>
						<input type="email" name="email[]" class="form-control email" id="email_0" autocomplete="off"  value="<?php echo $data['email'][$i]; ?>" >
						<span class="err_message email_error" style="color: red;"></span>
					</div>
				</div>	
				<div class="row">
					<div class="col-md-12">
						<label><strong>Phone Number</strong></label>
						<input type="text" name="phone[]" class="form-control phone" id="phone_0" autocomplete="off" value="<?php echo $data['phone'][$i]; ?>" maxlength="10" >
						<span class="err_message phone_error" style="color: red;"></span>
					</div>						
				</div>
		
		</div>
	  </div>
	</div>           
	</div>
	<span>---------------------------------------------------------------------</span>
	</div>
<?php } ?>
<div class="form_box bxx" id="p0">
  <strong>Contact</strong>
  <span class="btn btn-primary btnClassRemoveItem" style="margin: 0 auto 6px 208px;">Remove</span>
  <div class="row">
   <div class="col-3 grid-margin stretch-card">
	  <div class="card">
		<div class="card-body">

				<div class="row">
					<div class="col-md-12">
						<label><strong>Name</strong></label>	
						<input type="text" name="name[]" class="form-control name" id="name_0" value="" autocomplete="off" >
						<span class="err_message name_error" style="color: red;"></span>
					</div>
				</div>	
				<div class="row">					
					<div class="col-md-12">
						<label><strong>Email</strong></label>
						<input type="email" name="email[]" class="form-control email" id="email_0" autocomplete="off"  value="" >
						<span class="err_message email_error" style="color: red;"></span>
					</div>
				</div>	
				<div class="row">
					<div class="col-md-12">
						<label><strong>Phone Number</strong></label>
						<input type="text" name="phone[]" class="form-control phone" id="phone_0" autocomplete="off" value="" maxlength="10" >
						<span class="err_message phone_error" style="color: red;"></span>
					</div>						
				</div>
		
		</div>
	  </div>
	</div>           
	</div>
	<span>---------------------------------------------------------------------</span>
	</div>
	<div id="addrow"></div>
	</form>
</div>
      <script type="text/javascript" src="validation.js"></script>
      <script>
         	$(document).ready(function() {
			    $("body").on('click', '.btnClassAddNewItem', function(){ 
			        var reid1 = $('div.bxx:last').attr('id');
			        var n = reid1.split('p');
			        var incc = 1;
			        var nn = parseInt(n[1]) + parseInt(incc);
			        var add_row='<div class="form_box bxx" id="p'+nn+'">';
			        add_row += '<strong>Contact</strong><span class="btn btn-primary btnClassRemoveItem" style="margin: 0 auto 6px 208px;">Remove</span><div class="row"><div class="col-3 grid-margin stretch-card"><div class="card"><div class="card-body">';
			        
			        add_row += '<div class="row"><div class="col-md-12"><label><strong>Name</strong></label>	<input type="text" name="name[]" class="form-control name" id="name_'+nn+'" autocomplete="off" ><span class="err_message name_error" style="color: red;"></span></div></div>';
			        add_row += '<div class="row">	<div class="col-md-12"><label><strong>Email</strong></label><input type="email" name="email[]" class="form-control email" id="email_'+nn+'" autocomplete="off"><span class="err_message email_error" style="color: red;"></span></div></div>';
			        add_row += '<div class="row"><div class="col-md-12"><label><strong>Phone Number</strong></label><input type="text" name="phone[]" class="form-control phone" id="phone_'+nn+'" autocomplete="off" maxlength="10" ><span class="err_message phone_error" style="color: red;"></span></div></div>';
			        add_row += '</div></div></div> </div><span>---------------------------------------------------------------------</span></div>'; 

			        $('#addrow').last().before(add_row);
			    });

			    $("body").on('click', '.btnClassRemoveItem', function(e){ 
			        var divRow = $(this).closest('div.bxx');
			        divRow.remove();
			        allTotalElemets();
			    });
			    
			});
      </script>

   </body>
</html>