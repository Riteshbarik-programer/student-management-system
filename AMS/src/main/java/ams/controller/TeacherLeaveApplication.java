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
import ams.db.TeacherLeave;
import ams.model.LeaveApplicationDao;
import ams.model.TeacherLeaveDao;


@WebServlet("/ams.controller.TeacherLeaveApplication")
public class TeacherLeaveApplication extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String regdno = request.getParameter("regdno");
		String emailid = request.getParameter("emailid");
		String from = request.getParameter("from");
		String to = request.getParameter("to");
		String reason = request.getParameter("reason");
		
		
		TeacherLeave l = new TeacherLeave();
		l.setRegdno(regdno);
		l.setEmailid(emailid);
		l.setTo(to);
		l.setFrom(from);
		l.setReason(reason);
		
		int status = TeacherLeaveDao.registerLeave(l);
				if(status>0)
				{
					
					response.sendRedirect("teacherLeaveApplication.jsp?msg=Application send");
					
				}
				else
					response.sendRedirect("teacherLeaveApplication.jsp?msg=Sending failed");
	}

}
