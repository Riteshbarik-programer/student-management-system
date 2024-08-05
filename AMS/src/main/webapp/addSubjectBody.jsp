<!DOCTYPE html>
<html lang="en">
<head>
	<title>Contact V14</title>
	<meta charset="UTF-8">
<!--===============================================================================================-->
	
	<link rel="stylesheet" type="text/css" href="subject/css/main.css">
<!--===============================================================================================-->
</head>
<body>


	<div class="container-contact100">
		<div class="wrap-contact100">
			<form class="contact100-form validate-form" action="sms.controller.AddSubject" method="post">
				<span class="contact100-form-title">
					Add Subject
				</span>

				<label class="label-input100" for="first-name">Subject Id*</label>
				<div class="wrap-input100 validate-input">
					<input id="email" class="input100" type="text" name="subjectid" placeholder="Subject Id">
					<span class="focus-input100"></span>
				</div>
				<label class="label-input100" for="first-name">Subject Name*</label>
				<div class="wrap-input100 validate-input">
					<input id="email" class="input100" type="text" name="subjectname" placeholder="Subject Name">
					<span class="focus-input100"></span>
				</div>

				<label class="label-input100" for="email">Teacher Regd NO*</label>
				<div class="wrap-input100 validate-input">
					<input id="email" class="input100" type="text" name="teacherregdno" placeholder="Teacher Regdno.">
					<span class="focus-input100"></span>
				</div>

				<label class="label-input100" for="phone">Semester*</label>
				<div class="wrap-input100">
					<input id="phone" class="input100" type="text" name="semester" placeholder="Semester">
					<span class="focus-input100"></span>
				</div>

				<label class="label-input100" for="message">Branch*</label>
				<div class="wrap-input100">
					<input id="phone" class="input100" type="text" name="branch" placeholder="Branch">
					<span class="focus-input100"></span>
				</div>

				<div class="container-contact100-form-btn">
					<button class="contact100-form-btn">
						<span>
							Add
							<i class="zmdi zmdi-arrow-right m-l-8"></i>
						</span>
					</button>
				</div>
			</form>
		</div>
	</div>



<!--===============================================================================================-->
	<script src="subject/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="subject/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="subject/vendor/bootstrap/js/popper.js"></script>
	
<!--===============================================================================================-->
	<script src="subject/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="subject/vendor/daterangepicker/moment.min.js"></script>
	<script src="subject/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="subject/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="subject/js/main.js"></script>




</body>
</html>
