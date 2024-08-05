package ams.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ams.db.Admin;
import ams.model.AdminDao;
import ams.service.SendPassword;

/**
 * Servlet implementation class VerifyAdminOTP
 */
@WebServlet("/ams.controller.VerifyAdminOTP")
public class VerifyAdminOTP extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String emailid = request.getParameter("emailid");
		String otp = request.getParameter("otp");
		
		Admin a = new Admin();
		a.setEmailid(emailid);
		
		Admin db =AdminDao.getOtpAndPassword(a);
		
		if (db.getOtp().equals(otp)) 
		{
			SendPassword.sendAdminPassword(db);
			response.sendRedirect("index.jsp?msg=password Sent");
		}
		else
			response.sendRedirect("adminVerify.jsp?msg=Verify code Mismatch");

		
	}

}
