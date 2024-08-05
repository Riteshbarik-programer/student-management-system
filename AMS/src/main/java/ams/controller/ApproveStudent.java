package ams.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ams.db.StudentLeave;
import ams.model.StudentLeaveDao;


@WebServlet("/sms.controller.ApproveStudent")
public class ApproveStudent extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String emailid = request.getParameter("emailid");
		String status = request.getParameter("status");
		String to = request.getParameter("to");
		System.out.println(status);
		StudentLeave sl = new StudentLeave();
		sl.setEmailid(emailid);
		sl.setTo(to);
		sl.setStatus(status);
	
		
		int result = StudentLeaveDao.doApprove(sl);
		if(result>0)
			response.sendRedirect("adminViewStudentLeave.jsp");
		else
			response.sendRedirect("adminViewStudentLeave.jsp?msg=Error");
	}

}
