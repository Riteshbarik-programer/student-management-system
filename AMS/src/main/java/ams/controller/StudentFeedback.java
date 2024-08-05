package ams.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ams.db.FeedbackStudent;
import ams.model.StudentFeedbackDao;

/**
 * Servlet implementation class StudentFeedback
 */
@WebServlet("/ams.controller.StudentFeedback")
public class StudentFeedback extends HttpServlet 
{
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String regdno = request.getParameter("regdno");
		String emailid = request.getParameter("emailid");
		String message = request.getParameter("message");
		
		FeedbackStudent fs = new FeedbackStudent();
	    fs.setRegdno(regdno);
	    fs.setEmailid(emailid);
	    fs.setMessage(message);
	    
	    int status = StudentFeedbackDao.registerFeedback(fs);
	    if(status>0)
		{
			response.sendRedirect("studentFeedback.jsp?msg=Feedback Registered");
		}
		else
			response.sendRedirect("studentFeedback.jsp?msg=Error in Sending");
	}

}
