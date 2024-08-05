<!DOCTYPE html>
	<%@page import="ams.model.TeacherDao"%>
<%@page import="ams.db.Teacher"%>
<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts4/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor4/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor4/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor4/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor4/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor4/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css4/util.css">
	<link rel="stylesheet" type="text/css" href="css4/main.css">
<!--===============================================================================================-->
</head>
<body>

<%
          String emailid = (String)session.getAttribute("emailid");
          Teacher t = TeacherDao.getDetails(emailid);
          
          %>
	<div class="container-contact100">

		<div class="wrap-contact100">
			<form class="contact100-form validate-form" action="ams.controller.TeacherLeaveApplication" method="post">
				

				<div class="wrap-input100 validate-input" data-validate="Please enter your name">
					<input class="input100" type="text" name="regdno" placeholder="Regd No" value="<%= t. getRegdno()%>">
					<span class="focus-input100"></span>
				</div>

				<div class="wrap-input100 validate-input" data-validate = "Please enter your email: e@a.x">
					<input class="input100" type="text" name="emailid" placeholder="E-mail" value="<%= t. getEmailid()%>">
					<span class="focus-input100"></span>
				</div>

				<div class="wrap-input100 validate-input" data-validate = "Please enter your phone">
					<input class="input100" type="text" name="from" placeholder="From">
					<span class="focus-input100"></span>
				</div>
				<div class="wrap-input100 validate-input" data-validate = "Please enter your phone">
					<input class="input100" type="text" name="to" placeholder="To">
					<span class="focus-input100"></span>
				</div>

				<div class="wrap-input100 validate-input" data-validate = "Please enter your message">
					<textarea class="input100" name="reason" placeholder="Reason"></textarea>
					<span class="focus-input100"></span>
				</div>

				<div class="container-contact100-form-btn">
					<button class="contact100-form-btn">
						<span>
							<i class="fa fa-paper-plane-o m-r-6" aria-hidden="true"></i>
							Send
						</span>
					</button>
				</div>
			</form>
		</div>
	</div>



	<div id="dropDownSelect1"></div>

<!--===============================================================================================-->
	<script src="vendor4/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor4/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor4/bootstrap/js/popper.js"></script>
	
<!--===============================================================================================-->
	<script src="vendor4/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor4/daterangepicker/moment.min.js"></script>
	<script src="vendor4/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="vendor4/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="js4/main.js"></script>

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-23581568-13');
</script>

</body>
</html>
