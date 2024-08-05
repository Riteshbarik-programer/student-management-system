package ams.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ams.db.Student;
import ams.db.Subject;
import ams.model.AdminDao;
import ams.model.StudentDao;


@WebServlet("/sms.controller.AddSubject")
public class AddSubject extends HttpServlet 
{
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		Subject sub = new Subject();
		sub.setSubjectid(request.getParameter("subjectid"));
		sub.setSubjectname(request.getParameter("subjectname"));
		sub.setTeacherregdno(request.getParameter("teacherregdno"));
		sub.setSemester(request.getParameter("semester"));
		sub.setBranch(request.getParameter("branch"));
		
		
		int status = AdminDao.addSubject(sub);
		if(status>0)
			response.sendRedirect("addSubject.jsp?msg=Added Succesful");
		else
			response.sendRedirect("addSubject.jsp?msg=Added Failed");
	}

}
