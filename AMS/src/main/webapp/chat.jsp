<%@page import="ams.db.Teacher"%>
<%@page import="ams.db.ChatStudent"%>
<%@page import="ams.model.ChatStudentDao"%>
<%@page import="java.util.ArrayList"%>

<%@page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Chatting room</title>
	
	<style type="text/css">
		.mainDiv{

		}
		.sideDiv{
			width: 100%;
			min-height:  60px;
			background: linear-gradient(to right, rgba(208,240,162,1) 2%,rgba(69,117,1,1) 47%); 
			color: red;
		}
		.leftDiv{
			border-top-left-radius: 15px;
			overflow-y: scroll;
			overflow-x: hidden;
			position: absolute;
			height: 584px;
			width: 20%;
			margin-top: 5px;
			/* background: -webkit-linear-gradient(45deg, rgba(154,30,80,1) 0%,rgba(232,126,179,0) 100%); */
			/* background-image: url(images/webchat.jpg); */
			background-color: white;
		}
		.rightDiv{

			height: 584px;
			width: 79%;
			margin-top: 5px;
			margin-left: 30%;
			float: right;
			/* background: linear-gradient(135deg, #f3c5bd 0%,#ff6600 50%); */
			background-color: white;
		}
		#ownName{
			max-height: 60px;
			max-width: 28.66%;
			
			position:absolute;
			border-top-left-radius: 15px;
			font-size: 35px;
			padding: 10px;
		}
		#friends{
			height: 540px;
			min-width: 28.66%;
			/* background: linear-gradient(to bottom, rgba(154,121,30,1) 0%,rgba(166,132,44,1) 15%,rgba(207,170,95,0.7) 68%,rgba(232,193,126,0) 100%); */
			
			background-repeat: no-repeat;
			
		}
		 body{
			/*  background: linear-gradient(45deg, rgba(102,207,252,1) 0%,rgba(3,149,207,1) 62%);  */
			
		} 
	</style>
</head>
<body>
 <%
		String emailid =  (String) session.getAttribute("emailid"); 
		out.println(emailid);
		if(emailid == null)
			response.sendRedirect("index.jsp");
	%> 
	<form action="studentWelcome.jsp">
			<input type="submit" value="back" style="float:right; margin-right:30px;margin-top: 20px;background-color: gray;color: white;">
		</form>
<div class="mainDiv">
	<div class="">
	<div id="">
			<% String name=request.getParameter("name");
				
			out.println(name);
			
			//out.print(name);%>
		</div>
		<!-- <a href="mm.controller.Logout"><img alt="LogOut" src="images/exit.png" height="40px" width="40px" style="box-shadow: -42px 12px 73px -27px rgba(0,0,0,0.75);float: right; padding-top: 10px;padding-right: 20px;"></a> -->
	</div>
	<div class="rightDiv">
		
	</div>
	<div class="leftDiv">
		
		<div id="friends">
			<table>
			<%
				
				ArrayList<Teacher> all = ChatStudentDao.fetchTeacher();
					Iterator<Teacher> it = all.iterator();
					while(it.hasNext()){
						Teacher tr = it.next();
			%>
					
					<tr>
					
					<td style="font-size: 25px; padding-top: 10px;text-decoration: none;color: black; padding-left: 20px;"><a href="sms.controller.ChatPage?name=<%=tr.getName()%>&emailid=<%=tr.getEmailid()%>" style="text-decoration: none; color: black;"><%=tr.getName() %></a></td>
					<% if(tr.getStatus()!=null)
						{
						%>
					<td><img src="images/online.png" style="float: right; height: 20px; width: 20px; position: absolute;right: 20px; "></td>
						<%}else{
							%>
							<td><img src="images/ofline.png" style="float: right; height: 20px; width: 20px; position: absolute;right: 20px; "></td>
						<%} %>
				</tr>
			<%
  				}
  			%>				
				
			</table>
		</div>
	</div>
	
</div>
</body>
</html>