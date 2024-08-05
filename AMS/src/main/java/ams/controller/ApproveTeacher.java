package ams.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import ams.db.TeacherLeave;

import ams.model.TeacherLeaveDao;

/**
 * Servlet implementation class ApproveStudent
 */
@WebServlet("/ams.controller.ApproveTeacher")
public class ApproveTeacher extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String emailid = request.getParameter("emailid");
		String status = request.getParameter("status");
		String to = request.getParameter("to");
		
		TeacherLeave tl = new TeacherLeave();
		tl.setEmailid(emailid);
		tl.setTo(to);
		tl.setStatus(status);
		
		int result = TeacherLeaveDao.doApprove(tl);
		if(result>0)
			response.sendRedirect("adminViewTeacherLeave.jsp");
		else
			response.sendRedirect("adminViewTeacherLeave.jsp?msg=Error");
	}

}
