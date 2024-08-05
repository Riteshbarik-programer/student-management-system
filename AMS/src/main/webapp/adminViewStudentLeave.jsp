<!DOCTYPE html>
<%@page import="ams.model.StudentLeaveDao"%>
<%@page import="ams.db.StudentLeave"%>

<%@page import="java.util.Iterator"%>
<%@page import="ams.model.StudentDao"%>
<%@page import="ams.db.Student"%>
<%@page import="java.util.ArrayList"%>
<html lang="en">
<head>
	<title>View Student Leave</title>
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
	ArrayList<StudentLeave> all = StudentLeaveDao.fetchStudentLeave();
	Iterator it = all.iterator();
	while(it.hasNext())
	{
		StudentLeave s1 = (StudentLeave)it.next();
	
%>
						<div class="row">
							<div class="cell" data-title="Regd NO">
								<%=s1.getRegdno() %>
							</div>
							<div class="cell" data-title="Emailid">
								<%=s1.getEmailid() %>
							</div>
							<div class="cell" data-title="To">
								<%=s1.getTo() %>
							</div>
							<div class="cell" data-title="From">
								<%=s1.getFrom() %>
							</div>
							<div class="cell" data-title="Message">
								<%=s1.getMessage()%>
							</div>
							<div class="cell" data-title="Status">
							<% 
								String status = s1.getStatus();
								
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
								{
							%>
								<a href="sms.controller.ApproveStudent?emailid=<%=s1.getEmailid()%>&status=1&to=<%=s1.getTo()%>">Approve</a> &nbsp;&nbsp;
								<a href="sms.controller.ApproveStudent?emailid=<%=s1.getEmailid()%>&status=0&to=<%=s1.getTo()%>">Reject</a>
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