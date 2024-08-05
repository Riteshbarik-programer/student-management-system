package ams.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ams.db.Student;
import ams.model.StudentDao;


@WebServlet("/ams.controller.AddStudent")
public class AddStudent extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		Student s = new Student();
		
		s.setName(request.getParameter("name"));
		s.setFathername(request.getParameter("fathername"));
		s.setMothername(request.getParameter("mothername"));
		s.setEmailid(request.getParameter("emailid"));
		s.setMobileno(request.getParameter("mobileno"));
		s.setAadharno(request.getParameter("aadharno"));
		s.setRegdno(request.getParameter("regdno"));
		s.setBranch(request.getParameter("branch"));
		s.setSession(request.getParameter("session"));
		s.setSemester(request.getParameter("semester"));
		s.setGender(request.getParameter("gender"));
		s.setDob(request.getParameter("dob"));
		s.setBlood_group(request.getParameter("blood_group"));
		s.setPermanent_country(request.getParameter("permanent_country"));
		s.setPermanent_state(request.getParameter("permanent_state"));
		s.setPermanent_city(request.getParameter("permanent_city"));
		s.setPermanent_district(request.getParameter("permanent_district"));
		s.setPermanent_landmark(request.getParameter("permanent_landmark"));
		s.setPermanent_pin(request.getParameter("permanent_pin"));
		s.setPresent_country(request.getParameter("present_country"));
		s.setPresent_state(request.getParameter("present_state"));
		s.setPresent_city(request.getParameter("present_city"));
		s.setPresent_district(request.getParameter("present_district"));
		s.setPresent_landmark(request.getParameter("present_landmark"));
		s.setPresent_pin(request.getParameter("present_pin"));
		
		
		
		int status = StudentDao.addStudent(s);
		if(status>0)
			response.sendRedirect("addStudent.jsp?msg=Registration Succesful");
		else
			response.sendRedirect("addStudent.jsp?msg=Registration Failed");
	}

}
