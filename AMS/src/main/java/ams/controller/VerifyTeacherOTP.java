package ams.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ams.db.Admin;
import ams.db.Student;
import ams.db.Teacher;
import ams.model.AdminDao;
import ams.model.StudentDao;
import ams.model.TeacherDao;
import ams.service.SendPassword;

/**
 * Servlet implementation class VerifyAdminOTP
 */
@WebServlet("/ams.controller.VerifyTeacherOTP")
public class VerifyTeacherOTP extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String emailid = request.getParameter("emailid");
		String otp = request.getParameter("otp");
		
		Teacher t = new Teacher();
		t.setEmailid(emailid);
		
		Teacher db =TeacherDao.getOtpAndPassword(t);
		
		if (db.getOtp().equals(otp)) 
		{
			SendPassword.sendTeacherPassword(db);
			response.sendRedirect("index.jsp?msg=password Sent");
		}
		else
			response.sendRedirect("teacherVerify.jsp?msg=Verify code Mismatch");

		
	}

}
