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


@WebServlet("/ams.controller.AdminLogin")
public class AdminLogin extends HttpServlet 
{
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		
	String emailid = request.getParameter("emailid");
		String password = request.getParameter("password");
		
		Admin a =new Admin();
		a.setEmailid(emailid);
		a.setPassword(password);
		
		int status = AdminDao.validate(a);
		if(status>0)
		{
			HttpSession session = request.getSession();
			session.setAttribute("emailid",emailid);
			response.sendRedirect("adminWelcome.jsp?msg=Login Success");
			
		}
		else
		{
			response.sendRedirect("index.jsp?msg=Invalid Emailid or password");
		}
		
	}

}
