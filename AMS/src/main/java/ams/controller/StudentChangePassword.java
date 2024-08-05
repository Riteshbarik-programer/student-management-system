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
import ams.model.AdminDao;
import ams.model.StudentDao;


@WebServlet("/ams.controller.StudentChangePassword")
public class StudentChangePassword extends HttpServlet
{
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		HttpSession session = request.getSession();
		Student s = new Student();
		s.setEmailid((String) session.getAttribute("emailid"));
		s.setPassword(request.getParameter("opass"));
		
		int status = StudentDao.validate(s);
		if(status==0)
		{
			response.sendRedirect("studentChangePassword.jsp?msg=Invalid Old password");			

		}
		else
		{
			String npass = request.getParameter("npass");
			String cpass = request.getParameter("cpass");
			if(!npass.equals(cpass))
			{
				response.sendRedirect("studentChangePassword.jsp?msg=password doesn't match");
			}
			else
			{
				s.setPassword(npass);
				int st = StudentDao.doChangePassword(s);
				if(st == 0 )
				{
					response.sendRedirect("studentChangePassword.jsp?msg=Error in Updation");
				}
				else
				{
					response.sendRedirect("studentWelcome.jsp?msg=Successfully Updated");
				}
			}
		}
	}	
	
}


