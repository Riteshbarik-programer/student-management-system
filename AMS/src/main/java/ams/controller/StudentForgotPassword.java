package ams.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ams.db.Admin;
import ams.db.Student;
import ams.model.AdminDao;
import ams.model.StudentDao;
import ams.service.SendPassword;

/**
 * Servlet implementation class AdminForgotPassword
 */
@WebServlet("/ams.controller.StudentForgotPassword")
public class StudentForgotPassword extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String emailid = request.getParameter("emailid");
		Student s = new Student();
		s.setEmailid(emailid);

		char[] otp = GenerateOtp.adminForgotPassword(5);
		String otp1 = String.valueOf(otp);
		s.setOtp(otp1);
		SendPassword p = new SendPassword();
		p.sendStudentForgotPassword(s);
		
		int status =StudentDao.setOtp(s);
		
		response.sendRedirect("studentVerify.jsp?emailid="+emailid);
		
		
	}

}
