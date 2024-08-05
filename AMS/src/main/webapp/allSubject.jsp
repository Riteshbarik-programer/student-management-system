<!DOCTYPE html>
<%@page import="ams.db.Subject"%>
<%@page import="ams.model.AdminDao"%>
<%@page import="java.util.Iterator"%>
<%@page import="ams.model.StudentDao"%>
<%@page import="ams.db.Student"%>
<%@page import="java.util.ArrayList"%>
<html lang="en">
<head>
	<title>All Subject</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor2/vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor2/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor2/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/css/main.css">
<!--===============================================================================================-->



	
	<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
					<div class="table">

						<div class="row header">
							<div class="cell">
								Subject ID
							</div>
							<div class="cell">
								Subject Name
							</div>
							<div class="cell">
								Teacher Regd No
							</div>
							<div class="cell">
								Semester
							</div>
							<div class="cell">
								Branch
							</div>
						</div>
<%
	ArrayList<Subject> all = AdminDao.fetchSubject();
	Iterator it = all.iterator();
	while(it.hasNext())
	{
		Subject s1 = (Subject)it.next();
	
%>
						<div class="row">
							<div class="cell" data-title="Full Name">
								<%=s1.getSubjectid() %>
							</div>
							<div class="cell" data-title="Age">
								<%=s1.getSubjectname() %>
							</div>
							<div class="cell" data-title="Job Title">
								<%=s1.getTeacherregdno() %>
							</div>
							<div class="cell" data-title="Location">
								<%=s1.getSemester() %>
							</div>
							<div class="cell" data-title="Location">
								<%=s1.getBranch() %>
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
	<script src="vendor2/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor2/vendor/bootstrap/js/popper.js"></script>
	<script src="vendor2/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor2/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="js/js/main.js"></script>

</body>
</html>