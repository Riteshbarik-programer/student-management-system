package ams.controller;

import java.io.IOException;
import java.io.PrintWriter; 

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ams.model.StudentDao;
import ams.model.TeacherDao;

@WebServlet("/ams.controller.DeleteTeacher")
public class DeleteTeacher extends HttpServlet 
{
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	   response.setContentType("text/html");
	   PrintWriter out = response.getWriter();
	   
	   String emailid = request.getParameter("emailid");
	   
	   int status = TeacherDao.deleteTeacher(emailid);
	   if(status>0)
	   {
		   response.sendRedirect("deleteTeacher.jsp?msg=Deleted");
	   }
	   else
	   {
		   response.sendRedirect("deleteTeacher.jsp?msg=Delete failed");
	   }
	   
		
	}

}
