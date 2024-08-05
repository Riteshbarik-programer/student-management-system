package ams.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.*;

import ams.db.Student;
import ams.db.Teacher;
import ams.model.StudentDao;
import ams.model.TeacherDao;


@WebServlet("/ams.controller.UpdateTeacherPhoto")
public class UpdateTeacherPhoto extends HttpServlet {
	private ServletFileUpload uploader = null;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		DiskFileItemFactory fileFactory = new DiskFileItemFactory();
		String ctx = getServletContext().getRealPath("//profileimg");
		File f1 = new File(ctx);
		fileFactory.setRepository(f1);
		uploader = new ServletFileUpload(fileFactory);
		
		//out.write("<html><head></head><body>");
		try 
		{
			List<FileItem> fileItemsList = uploader.parseRequest(request);
			Iterator<FileItem> fileItemsIterator = fileItemsList.iterator();
			while(fileItemsIterator.hasNext())
			{
				//System.out.println("............a");
				FileItem fileItem = fileItemsIterator.next();
				if ( !fileItem.isFormField () )	
			    {   
					//System.out.println("............b");
					f1 = new File(ctx+"\\"+fileItem.getName());
					System.out.println(f1.getAbsolutePath());
					fileItem.write(f1);
					//out.write("File "+fileItem.getName()+ " uploaded successfully.");
					//out.write("<br>");
					String p1 = "profileimg\\"+f1.getName();
					
					/*RequestDispatcher rd = request.getRequestDispatcher("profile.jsp?filename="+p1);
					rd.include(request, response);
					*///out.println("<img src='"+p1+"' height='300px'/>");
					
					
			    }
			}
		}
		catch (Exception e) 
		{
			e.printStackTrace();
			out.write("Exception in uploading file.");
		}
		//out.write("</body></html>");
	    HttpSession session=request.getSession();
		Teacher u=new Teacher();
		
		String file_name="profileimg\\"+f1.getName();
		u.setEmailid((String)session.getAttribute("emailid"));
		u.setPhoto( "profileimg\\"+f1.getName());
		int status=TeacherDao.updatePhoto(u, file_name);
		if(status > 0)
		{
			response.sendRedirect("teacherViewProfile.jsp?msg=updated successfully in database" );
		}
		else
			response.sendRedirect("teacherViewProfile.jsp?msg=Not updated " );
		//System.out.println(f1.getAbsolutePath());
	}

}
