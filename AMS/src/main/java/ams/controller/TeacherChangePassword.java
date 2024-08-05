package ams.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ams.db.Student;
import ams.db.Teacher;
import ams.model.StudentDao;
import ams.model.TeacherDao;

/**
 * Servlet implementation class TeacherChangePassword
 */
@WebServlet("/ams.controller.TeacherChangePassword")
public class TeacherChangePassword extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		HttpSession session = request.getSession();
		Teacher t = new Teacher();
		t.setEmailid((String) session.getAttribute("emailid"));
		t.setPassword(request.getParameter("opass"));
		
		int status = TeacherDao.validate(t);
		if(status==0)
		{
			response.sendRedirect("teacherChangePassword.jsp?msg=Invalid Old password");			

		}
		else
		{
			String npass = request.getParameter("npass");
			String cpass = request.getParameter("cpass");
			if(!npass.equals(cpass))
			{
				response.sendRedirect("teacherChangePassword.jsp?msg=password doesn't match");
			}
			else
			{
				t.setPassword(npass);
				int st = TeacherDao.doChangePassword(t);
				if(st == 0 )
				{
					response.sendRedirect("teacherChangePassword.jsp?msg=Error in Updation");
				}
				else
				{
					response.sendRedirect("teacherWelcome.jsp?msg=Successfully Updated");
				}
			}
		}
	}

}
