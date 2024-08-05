<%@page import="ams.model.ChatMessageDao"%>
<%@page import="ams.db.ChatMessage"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
 <meta http-equiv="refresh" content="4" > 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body onload="show()">
<table style="min-width: 100%;">
					<%
			ChatMessage msg=new ChatMessage();
					msg.setSender((String)session.getAttribute("emailid"));
					msg.setReceiver((String)session.getAttribute("receiverEmailid"));
					out.println(msg.getSender());
					out.println(msg.getReceiver());
					
					
			ArrayList<ChatMessage> all1 = ChatMessageDao.fetchMessage(msg);
				Iterator<ChatMessage> it1 = all1.iterator();
				while(it1.hasNext()){
					ChatMessage tr1 = it1.next();
					%>
					<%
					String a=(String)session.getAttribute("emailid");
					String b=tr1.getSender();
					if(a.equals(b)){
						
					%>
					
				<tr >
					<td></td><td style="font-size: 20px;float: right;background: #559fea; padding :5px;border-radius: 10px; margin-left:20px;"><b><%=tr1.getMessage() %></b><br><samp style="color: #55eaa9; text-decoration: underline;"><%=tr1.getTime() %></samp></td>
				</tr>
				<%
  				}else{
  			%>	
				<tr >
					<td></td><td style="font-size: 20px;float: left;background: #accd3b; padding :5px;border-radius: 10px; margin-right:20px;"><b><%=tr1.getMessage() %></b><br><samp style="color: #5265f4; text-decoration: underline;"><%=tr1.getTime() %></samp></td>
				</tr>
				<%
  				}
  			%>	
				<%
  				}
  			%>		
			</table>
</body>
<script type="text/javascript">

/* window.onload=init;
function init(){
	setInterval(reloader,4000);
}
function reloader(){
	document.location.reload();
}
 */
 
 function show() {
	 setTimeout("show()",500);
	
}
</script>
</html>