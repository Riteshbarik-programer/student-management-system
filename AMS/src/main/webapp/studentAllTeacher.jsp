<!DOCTYPE html>
<%@page import="java.util.Iterator"%>
<%@page import="ams.model.TeacherDao"%>
<%@page import="ams.db.Teacher"%>
<%@page import="java.util.ArrayList"%>
<html lang="en">
<head>
	<title>All Teacher</title>
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
								Full Name
							</div>
							<div class="cell">
								Regd No
							</div>
							<div class="cell">
								Emailid
							</div>
							<div class="cell">
								Photo
							</div>
						</div>
<%
	ArrayList<Teacher> all = TeacherDao.fetchTeacher();
	Iterator it = all.iterator();
	while(it.hasNext())
	{
		Teacher t1 = (Teacher)it.next();
	
%>
						<div class="row">
							<div class="cell" data-title="Full Name">
								<%=t1.getName() %>
							</div>
							<div class="cell" data-title="Age">
								<%=t1.getRegdno() %>
							</div>
							<div class="cell" data-title="Job Title">
								<a href="studentViewTeacherProfile.jsp?emailid=<%=t1.getEmailid() %>"><%=t1.getEmailid() %></a>
							</div>
							<div class="cell" data-title="Location">
								<% 
  								String photo_name=t1.getPhoto();
  							
  								if(photo_name == null)
  								{
  							%>
  									<img src="profileimg/b2.jpg" class="user-avatar rounded-circle" style="height: 50px;width: 50px;"><br> 
  							<%
  								}
  								else
  								{
  									//String p1 = "profileimg\\";
  									String p2 = t1.getPhoto();
  								
  							%>
 								<img src="<%=p2 %>" class="user-avatar rounded-circle" style="height: 50px;width: 50px;"><br> 								
  							<%
  								}
  							%>
                          
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