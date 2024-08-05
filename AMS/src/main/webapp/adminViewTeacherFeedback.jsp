<!DOCTYPE html>
<%@page import="ams.model.TeacherFeedbackDao"%>
<%@page import="ams.db.FeedbackTeacher"%>
<%@page import="ams.model.StudentFeedbackDao"%>
<%@page import="ams.db.FeedbackStudent"%>
<%@page import="java.util.Iterator"%>
<%@page import="ams.model.StudentDao"%>
<%@page import="ams.db.Student"%>
<%@page import="java.util.ArrayList"%>
<html lang="en">
<head>
	<title>Table V02</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/css/util.css">
	<link rel="stylesheet" type="text/css" href="css/css/main.css">
<!--===============================================================================================-->
</head>
<body>
	
	<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
					<div class="table">

						<div class="row header">
							<div class="cell">
								Emailid
							</div>
							<div class="cell">
								Regd no
							</div>
							<div class="cell">
								Message
							</div>
							
						</div>
						
<%
	ArrayList<FeedbackTeacher> all = TeacherFeedbackDao.fetchViewTeacherFeedback();
	Iterator it = all.iterator();
	while(it.hasNext())
	{
		FeedbackTeacher ft = (FeedbackTeacher)it.next();
	
%>
						<div class="row" >
							<div class="cell" data-title="Emailid">
								<%=ft.getEmailid() %>
							</div>
							<div class="cell" data-title="Regd No">
								<%=ft.getRegdno() %>
							</div>
							<div class="cell" data-title="Message">
								<%=ft.getMessage() %>
							</div>
							
						</div>

				<%
				
	}
				%>		
						
					</div>
			</div>
		</div>
	</div>


	

<!--===============================================================================================-->	
	<script src="vendor/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/vendor/bootstrap/js/popper.js"></script>
	
<!--===============================================================================================-->
	<script src="vendor/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="js/js/main.js"></script>

</body>
</html>