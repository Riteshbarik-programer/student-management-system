package ams.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ams.db.Admin;
import ams.model.AdminDao;

/**
 * Servlet implementation class AdminChangePassword
 */
@WebServlet("/ams.controller.AdminChangePassword")
public class AdminChangePassword extends HttpServlet 
{

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
	
		HttpSession session = request.getSession();
		Admin a = new Admin();
		a.setEmailid((String) session.getAttribute("emailid"));
		a.setPassword(request.getParameter("opass"));
		
		int status = AdminDao.validate(a);
		if(status==0)
		{
			response.sendRedirect("adminchangePassword.jsp?msg=Invalid Old password");			

		}
		else
		{
			String npass = request.getParameter("npass");
			String cpass = request.getParameter("cpass");
			if(!npass.equals(cpass))
			{
				response.sendRedirect("adminChangePassword.jsp?msg=password doesn't match");
			}
			else
			{
				a.setPassword(npass);
				int st = AdminDao.doChangePassword(a);
				if(st == 0 )
				{
					response.sendRedirect("adminChangePassword.jsp?msg=Error in Updation");
				}
				else
				{
					response.sendRedirect("adminWelcome.jsp?msg=Successfully Updated");
				}
			}
		}
	}
}
	
	


