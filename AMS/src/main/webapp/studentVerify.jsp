<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String emailid = request.getParameter("emailid");

%>

<h1>Verify OTP</h1>
<form action="ams.controller.VerifyStudentOTP" method="post">
	
	<input type="hidden" name="emailid" value="<%=emailid %>">
		<input type="text" name="otp" placeholder="OTP Here"><br>
			<input type="submit" value="verify">
		
	
</form>

</body>
</html>