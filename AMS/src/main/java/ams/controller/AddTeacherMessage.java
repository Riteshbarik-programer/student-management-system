package ams.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ams.db.ChatMessage;
import ams.model.ChatMessageDao;


/**
 * Servlet implementation class AddMessage
 */
@WebServlet("/sms.controller.AddTeacherMessage")
public class AddTeacherMessage extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session=request.getSession();
		String sender=(String) session.getAttribute("emailid");
		String receiver=(String) session.getAttribute("receiverEmailid");
		String message=request.getParameter("message");
		System.out.println(message);
		System.out.println(receiver);
		System.out.println(sender);
		
		Timestamp time = new Timestamp(System.currentTimeMillis());
		
		ChatMessage msg=new ChatMessage();
		
		msg.setMessage(message);
		msg.setReceiver(receiver);
		msg.setSender(sender);
		msg.setTime(time);
		int status = ChatMessageDao.addMessage(msg);
		if(status>0) {
			response.sendRedirect("chatTeacherPage.jsp");
		}
		
	}

}
