package ams.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ams.db.Teacher;
import ams.model.StudentDao;
import ams.model.TeacherDao;


@WebServlet("/ams.controller.AddTeacher")
public class AddTeacher extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		Teacher t = new Teacher();
		t.setname(request.getParameter("name"));
		t.setFathername(request.getParameter("fathername"));
		t.setMothername(request.getParameter("mothername"));
		t.setEmailid(request.getParameter("emailid"));
		t.setMobileno(request.getParameter("mobileno"));
		t.setAadharno(request.getParameter("aadharno"));
		t.setRegdno(request.getParameter("regdno"));
		t.setDepartment(request.getParameter("department"));
		t.setQualification(request.getParameter("qualification"));
		t.setGender(request.getParameter("gender"));
		t.setDob(request.getParameter("dob"));
		t.setBlood_group(request.getParameter("blood_group"));
		t.setPermanent_country(request.getParameter("permanent_country"));
		t.setPermanent_state(request.getParameter("permanent_state"));
		t.setPermanent_city(request.getParameter("permanent_city"));
		t.setPermanent_district(request.getParameter("permanent_district"));
		t.setPermanent_landmark(request.getParameter("permanent_landmark"));
		t.setPermanent_pin(request.getParameter("permanent_pin"));
		t.setPresent_country(request.getParameter("present_country"));
		t.setPresent_state(request.getParameter("present_state"));
		t.setPresent_city(request.getParameter("present_city"));
		t.setPresent_district(request.getParameter("present_district"));
		t.setPresent_landmark(request.getParameter("present_landmark"));
		t.setPresent_pin(request.getParameter("present_pin"));
		
		int status = TeacherDao.addTeacher(t);
		if(status>0)
			response.sendRedirect("addTeacher.jsp?msg=Registration Succesful");
		else
			response.sendRedirect("addTeacher.jsp?msg=Registration Failed");
		
	}

}
