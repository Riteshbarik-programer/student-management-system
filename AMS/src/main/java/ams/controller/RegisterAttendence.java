package ams.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ams.db.StudentAttendance;
import ams.model.StudentAttendanceDao;

/**
 * Servlet implementation class RegisterAttendence
 */
@WebServlet("/ams.controller.RegisterAttendence")
public class RegisterAttendence extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String name = request.getParameter("name");
		String emailid = request.getParameter("emailid");
		String regdno = request.getParameter("regdno");
		String status = request.getParameter("status");
		
		HttpSession session = request.getSession();
		String branch = (String)session.getAttribute("branch");
		String semester = (String)session.getAttribute("semester");
		String subject = (String)session.getAttribute("subject");
		String attendancedate = (String)session.getAttribute("attendancedate");
		
		StudentAttendance sa = new StudentAttendance();
		sa.setName(name);
		sa.setEmailid(emailid);
		sa.setRegdno(regdno);
		sa.setStatus(status);
		sa.setBranch(branch);
		sa.setSemester(semester);
		sa.setSubject(subject);
		sa.setAttendancedate(attendancedate);
		
		int result = StudentAttendanceDao.takeAttendance(sa);
		response.sendRedirect("attendance2.jsp");
		
		
	}

}
