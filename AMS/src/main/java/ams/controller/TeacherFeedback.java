package ams.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ams.db.FeedbackStudent;
import ams.db.FeedbackTeacher;
import ams.model.StudentFeedbackDao;
import ams.model.TeacherFeedbackDao;

/**
 * Servlet implementation class StudentFeedback
 */
@WebServlet("/ams.controller.TeacherFeedback")
public class TeacherFeedback extends HttpServlet 
{
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String regdno = request.getParameter("regdno");
		String emailid = request.getParameter("emailid");
		String message = request.getParameter("message");
		
		FeedbackTeacher ts = new FeedbackTeacher();
	    ts.setRegdno(regdno);
	    ts.setEmailid(emailid);
	    ts.setMessage(message);
	    
	    int status = TeacherFeedbackDao.registerFeedback(ts);
	    if(status>0)
		{
			response.sendRedirect("teacherFeedback.jsp?msg=Feedback Registered");
		}
		else
			response.sendRedirect("teacherFeedback.jsp?msg=Error in Sending");
	}

}
