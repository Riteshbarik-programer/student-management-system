<!DOCTYPE html>
<%@page import="ams.db.Student"%>
<%@page import="ams.model.StudentDao"%>
<html lang="en">
<head>
	<title>Contact V9</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
	<link rel="icon" type="image/png" href="images2/icons/favicon.ico"/>
<!--===============================================================================================-->
	
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts2/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts2/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor2/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor2/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor2/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor2/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor2/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css3/util.css">
	<link rel="stylesheet" type="text/css" href="css3/main.css">
<!--===============================================================================================-->
</head>
<body>
<%
	String emailid = (String)session.getAttribute("emailid");
	Student s1 = StudentDao.getDetails(emailid);
%>

	<div class="container-contact100">
		<div class="contact100-map" id="google_map" data-map-x="40.722047" data-map-y="-73.986422" data-pin="images/icons/map-marker.png" data-scrollwhell="0" data-draggable="1"></div>

		<div class="wrap-contact100">
		<%
			String msg = request.getParameter("msg");
		    if(msg!=null)
		    {
		%>
		<h3 style="color: Green; text-align: center;"><u>
		<%
			out.print(msg);
		    }
		%>
		</u></h3>
			<form class="contact100-form validate-form" action="ams.controller.StudentFeedback" method="post">
				<span class="contact100-form-title">
					Feedback
				</span>

				<div class="wrap-input100 validate-input" data-validate="Please enter your name">
					<input class="input100" type="text" name="regdno" placeholder="Regd No" value="<%=s1.getRegdno() %>" >
					<span class="focus-input100"></span>
				</div>

				<div class="wrap-input100 validate-input" data-validate = "Please enter email: e@a.x">
					<input class="input100" type="text" name="emailid" placeholder="Email Id" value="<%=s1.getEmailid() %>">
					<span class="focus-input100"></span>
				</div>

				<div class="wrap-input100 validate-input" data-validate = "Please enter your message">
					<textarea class="input100" name="message" placeholder="Your Message"></textarea>
					<span class="focus-input100"></span>
				</div>

				<div class="container-contact100-form-btn">
					<button class="contact100-form-btn">
						Send
					</button>
				</div>
			</form>

			
		</div>
	</div>



	<div id="dropDownSelect1"></div>

