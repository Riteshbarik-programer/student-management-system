package ams.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ams.db.LeaveApplication;
import ams.model.LeaveApplicationDao;


@WebServlet("/ams.controller.StudentLeaveApplication")
public class StudentLeaveApplication extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String regdno = request.getParameter("regdno");
		String emailid = request.getParameter("emailid");
		String from = request.getParameter("from");
		String to = request.getParameter("to");
		String reason = request.getParameter("reason");
		
		
		LeaveApplication l = new LeaveApplication();
		l.setRegdno(regdno);
		l.setEmailid(emailid);
		l.setTo(to);
		l.setFrom(from);
		l.setReason(reason);
		
		int status = LeaveApplicationDao.applyLeave(l);
				if(status>0)
				{
					
					response.sendRedirect("studentLeaveApplication.jsp?msg=Application send");
					
				}
				else
					response.sendRedirect("studentLeaveApplication.jsp?msg=Sending failed");
	}

}
