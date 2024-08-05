package ams.controller;

import java.io.IOException;
import java.io.PrintWriter; 

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ams.model.AdminDao;
import ams.model.StudentDao;

@WebServlet("/ams.controller.DeleteSubject")
public class DeleteSubject extends HttpServlet 
{
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	   response.setContentType("text/html");
	   PrintWriter out = response.getWriter();
	   
	   String subject_id = request.getParameter("subject_id");
	   
	   int status = AdminDao.deleteSubject(subject_id);
	   if(status>0)
	   {
		   response.sendRedirect("deleteSubject.jsp?msg=Deleted");
	   }
	   else
	   {
		   response.sendRedirect("deleteSubject.jsp?msg=Delete failed");
	   }
	   
		
	}

}
