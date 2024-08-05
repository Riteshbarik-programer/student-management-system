package ams.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ams.db.Student;
import ams.db.Teacher;
import ams.model.AdminDao;
import ams.model.StudentDao;
import ams.model.TeacherDao;


@WebServlet("/ams.controller.TeacherLogin")
public class TeacherLogin extends HttpServlet {


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	String emailid = request.getParameter("emailid");
	String password = request.getParameter("password");
	System.out.println(emailid);
	System.out.println(password);
	Teacher t = new Teacher();
	t.setEmailid(emailid);
	t.setPassword(password);
	int status = TeacherDao.validate(t);
	if(status>0)
	{
		HttpSession session = request.getSession();
		session.setAttribute("emailid",emailid);
		int result = TeacherDao.setStatus1(emailid);
		if(result>0)
		response.sendRedirect("teacherWelcome.jsp?msg=Login Success");
		
	}
	else
	{
		response.sendRedirect("index.jsp?msg=Invalid Emailid or password");
	}
	}

}
