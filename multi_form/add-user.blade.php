@extends('admin.layout.layout')
@section('content')
<div class="main-panel">        
<div class="content-wrapper">
  <div class="page-header">
	<h3 class="page-title">
		{{$pageTitle}}
	</h3>
	<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="#">Dashboard</a></li>
		<li class="breadcrumb-item active" aria-current="page">{{$breadcrumb}}</li>
		</ol>
	</nav>
  </div>
  <div class="row">
   <div class="col-12 grid-margin stretch-card">
	  <div class="card">
		<div class="card-body">
		  
		<form class="forms-sample">
				
				<div class="row">
					<div class="col-md-6">
						<label><strong>User First Name</strong><span style="color:red">*</span></label>	
						<input type="text" name="first_name" class="form-control" id="first_name" placeholder="First Name" autocomplete="off" required>
						<div class="first_name-error" id="first_name-error" style="color:red;"> </div>
					</div>

					<div class="col-md-6">			
						<label><strong>User Last Name</strong><span style="color:red">*</span></label>
						<input type="text" name="last_name" class="form-control" id="last_name" placeholder="Last Name" autocomplete="off" required>
						<div class="last_name-error" id="last_name-error" style="color:red;"> </div>
					</div>			
				</div>	
				<div class="row">
					<div class="col-md-6">
						<label><strong>Gender</strong><span style="color:red">*</span></label>	
						<select name="gender" class="form-control" id="gender">	
						<option value="select">Select Gender</option>
						<option value="Male">Male</option>
						<option value="Female">Female</option>
						</select> 
						<div class="gender-error" id="gender-error" style="color:red;"> </div>
					</div>
					<div class="col-md-6">
						<label><strong>Email</strong><span style="color:red">*</span></label>				  
						<input type="email" name="email" class="form-control" id="email" autocomplete="off" placeholder="Email" required>
						<div class="email-error" id="email-error" style="color:red;"> </div>
					</div>				
				</div>
				<div class="row">
					<div class="col-md-6">
						<label><strong>Designation</strong><span style="color:red">*</span></label>				  
						<input type="text" name="designation" class="form-control" id="designation" autocomplete="off" placeholder="Designation" required>
						<div class="designation-error" id="designation-error" style="color:red;"> </div>
					</div>
					<div class="col-md-6">
						<label><strong>Joining Date</strong><span style="color:red">*</span></label>	
						<input type="date" name="joining" class="form-control" id="joining" autocomplete="off" required>
						<div class="joining-error" id="joining-error" style="color:red;"> </div>
					</div>				
				</div>
				<div class="row">
				<div class="col-md-6">
						<label><strong>Status</strong><span style="color:red">*</span></label>
						 <div class="form-group row">
						  <div class="col-md-3">
							<div class="form-check">
							  <label class="form-check-label">
								<input type="radio" class="form-check-input" name="stage_type" value="1" checked>
								Active
							  <i class="input-helper"></i></label>
							</div>
						  </div>
						  <div class="col-md-3">
							<div class="form-check">
							  <label class="form-check-label">
								<input type="radio" class="form-check-input" name="stage_type"  value="2">
								Inactive
							  <i class="input-helper"></i></label>
							</div>
						  </div>
						</div>
					</div>
				</div>
				<div class="form-group col-12">
					<input type="submit" name="Submit" value="Submit"  class="btn btn-primary mr-2">
				</div> 
			
		</form>
		</div>
	  </div>
	</div>           
	</div>
</div>
@endsection
  <!-- Custom js for this page-->
  <script src="{{ URL::asset('adminassets/js/file-upload.js') }}"></script>
  <script src="{{ URL::asset('adminassets/js/typeahead.js') }}"></script>
  <script src="{{ URL::asset('adminassets/js/select2.js') }}"></script>
  
   <script src="{{ URL::asset('adminassets/vendors/tinymce/tinymce.min.js') }}"></script>
  <script src="{{ URL::asset('adminassets/vendors/tinymce/themes/modern/theme.js') }}"></script>
  <script src="{{ URL::asset('adminassets/vendors/summernote/dist/summernote-bs4.min.js') }}"></script>
  <script src="{{ URL::asset('adminassets/js/editorDemo.js') }}"></script>
  <!-- End custom js for this page-->
  <script>
   /* $(document).ready(function(){ 
		$('#mobile').focusout(function(){ 
			var value = $(this).val();
			$.ajax({ 
				url: '',
				data: {action: 'check',checkValue:value},
				type: 'post',
				success: function(output) { 
				$('#mobile-error').html(output);
			}
			});
		});
	}); */
    $(document).ready(function(){
	   
	   // for state list------------
	   $('#country_name').change(function(){
		   var country_id = $(this).val(); 
		 $.ajax({ 
				url: '',
				data: {action: 'stateList',country_id:country_id},
				type: 'post',
				success: function(output) { 
				if(output!=""){			
						$("#state_name").html(output);
					}
			}
			});  
	   });
	   
	    if ($("#passport_issue_date-popup").length) {  
			$('#passport_issue_date-popup').datepicker({  
			  enableOnReadonly: true,
			  todayHighlight: true,
			  autoclose: true,
			});
		  }
		  
		if ($("#passport_expiry_date-popup").length) {  
			$('#passport_expiry_date-popup').datepicker({  
			  enableOnReadonly: true,
			  todayHighlight: true,
			  autoclose: true,
			});
		  }
		  
	});
  </script>