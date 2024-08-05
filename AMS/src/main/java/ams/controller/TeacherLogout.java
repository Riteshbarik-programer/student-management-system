package ams.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ams.model.TeacherDao;


@WebServlet("/ams.controller.TeacherLogout")
public class TeacherLogout extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String emailid = (String)session.getAttribute("emailid");
		
		int status = TeacherDao.setStatus(emailid);
		if(status>0)
		{
		session.invalidate();
		
		response.sendRedirect("index.jsp?msg=Logout Successful");
		}
	}

}
