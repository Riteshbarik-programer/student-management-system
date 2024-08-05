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


@WebServlet("/ams.controller.StudentAttendanceDate")
public class StudentAttendanceDate extends HttpServlet 
{
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String attendancedate = request.getParameter("attendancedate");
		HttpSession session = request.getSession();
		session.setAttribute("attendancedate", attendancedate);
			response.sendRedirect("studentViewAttendance2.jsp");
	}

}
