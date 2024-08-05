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
 * Servlet implementation class AdminForgotPassword
 */
@WebServlet("/ams.controller.TeacherForgotPassword")
public class TeacherForgotPassword extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String emailid = request.getParameter("emailid");
		Teacher t = new Teacher();
		t.setEmailid(emailid);

		char[] otp = GenerateOtp.adminForgotPassword(5);
		String otp1 = String.valueOf(otp);
		t.setOtp(otp1);
		SendPassword p = new SendPassword();
		p.sendTeacherForgotPassword(t);
		
		int status =TeacherDao.setOtp(t);
		
		response.sendRedirect("teacherVerify.jsp?emailid="+emailid);
		
		
	}

}
