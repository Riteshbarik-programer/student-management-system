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
 * Servlet implementation class VerifyAdminOTP
 */
@WebServlet("/ams.controller.VerifyStudentOTP")
public class VerifyStudentOTP extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String emailid = request.getParameter("emailid");
		String otp = request.getParameter("otp");
		
		Student s = new Student();
		s.setEmailid(emailid);
		
		Student db =StudentDao.getOtpAndPassword(s);
		
		if (db.getOtp().equals(otp)) 
		{
			SendPassword.sendStudentPassword(db);
			response.sendRedirect("index.jsp?msg=password Sent");
		}
		else
			response.sendRedirect("studentVerify.jsp?msg=Verify code Mismatch");

		
	}

}
