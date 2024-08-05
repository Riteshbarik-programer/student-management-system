package ams.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ams.db.Student;

import ams.model.AdminDao;
import ams.model.StudentDao;


@WebServlet("/ams.controller.ViewAttendance")
public class ViewAttendance extends HttpServlet 
{
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String attendancedate = request.getParameter("attendancedate");
		HttpSession session = request.getSession();
		session.setAttribute("attendancedate", attendancedate);
		session.setAttribute("semester", request.getParameter("semester"));
		session.setAttribute("subject", request.getParameter("subject"));
		session.setAttribute("branch", request.getParameter("branch"));
		
		System.out.println(request.getParameter("attendancedate"));
		System.out.println(request.getParameter("semester"));
		System.out.println(request.getParameter("subject"));
		System.out.println(request.getParameter("branch"));
			response.sendRedirect("teacherViewAttendance2.jsp");
	}

}
