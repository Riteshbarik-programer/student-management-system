<!DOCTYPE html>
<%@page import="ams.model.TeacherLeaveDao"%>
<%@page import="ams.db.TeacherLeave"%>
<%@page import="ams.db.Teacher"%>
<%@page import="ams.model.TeacherDao"%>
<%@page import="java.util.Iterator"%>
<%@page import="ams.model.StudentDao"%>
<%@page import="ams.db.Student"%>
<%@page import="java.util.ArrayList"%>
<html lang="en">
<head>
	<title>View Teacher Leave</title>
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
								Regd No
							</div>
							<div class="cell">
								Emailid
							</div>
							<div class="cell">
								To
							</div>
							<div class="cell">
								From
							</div>
							<div class="cell" style="width: 300px;">
								Message
							</div>
							<div class="cell" style="width: 300px;">
								Status
							</div>
						</div>
<%
	ArrayList<TeacherLeave> all = TeacherLeaveDao.fetchTeacherLeave();
	Iterator it = all.iterator();
	while(it.hasNext())
	{
		TeacherLeave t1 = (TeacherLeave)it.next();
	
%>
						<div class="row">
							<div class="cell" data-title="Regd No">
								<%=t1.getRegdno() %>
							</div>
							<div class="cell" data-title="Emailid">
								<%=t1.getEmailid() %>
							</div>
							<div class="cell" data-title="To">
								<%=t1.getTo() %>
							</div>
							<div class="cell" data-title="From">
								<%=t1.getFrom() %>
							</div>
							<div class="cell" data-title="Reason">
								<%=t1.getReason() %>
							</div>
							<div class="cell" data-title="Status">
								<% 
								String status = t1.getStatus();
								if(status!=null)
								{
									if(status.equals("1"))
									{
										%>
										
										Approved
										<%
									}
									if(status.equals("0"))
									{
										 %>
										Rejected
										<%
									}
								}
								else
									out.print("Not Approve");
								
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