package ams.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import ams.db.ChatStudent;
import ams.db.provider;
import ams.db.Student;
import ams.db.Teacher;

public class ChatStudentDao {

	public static boolean validate(ChatStudent user) {
		boolean status = false;
		String sql = "select * from student where emailid = ? and password = ?";
		String sql1="update User1 set status=1 where email = ? and password = ?";
		try 
		{
			Connection con = provider.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			PreparedStatement pst1 = con.prepareStatement(sql1);
			
			pst.setString(1, user.getEmailid());
			pst.setString(2, user.getPassword());
			ResultSet rs = pst.executeQuery();
			pst1.setString(1, user.getEmailid());
			pst1.setString(2, user.getPassword());
			ResultSet rs1=pst1.executeQuery();
			status = rs.next();
			//System.out.println(status);
			String name=rs.getString(1);
			user.setName(name);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return status;
		
	}
	public static ArrayList<Student> fetchStudent(){
		ArrayList<Student> all =new ArrayList<Student>();
		String sql = "select * from student";
		try {
		      Connection con = provider.getConnection();
		      PreparedStatement pst = con.prepareStatement(sql);
		      ResultSet rs = pst.executeQuery();
		      while(rs.next()){
		    	  Student u=new Student();
		    	  u.setName(rs.getString("name"));
		    	  u.setEmailid(rs.getString("emailid"));
		    	  u.setPassword(rs.getString("password"));
		    	  u.setStatus(rs.getString("status"));
		    	  all.add(u);
		      }
		}
		catch (Exception e) {
		      // TODO: handle exception
		      e.printStackTrace();
		    }
				return all;
		
	}
	
	public static ArrayList<Teacher> fetchTeacher(){
		ArrayList<Teacher> all =new ArrayList<Teacher>();
		String sql = "select * from teacher ";
		try {
		      Connection con = provider.getConnection();
		      PreparedStatement pst = con.prepareStatement(sql);
		       ResultSet rs = pst.executeQuery();
		      while(rs.next()){
		    	  Teacher u=new Teacher();
		    	  u.setName(rs.getString("name"));
		    	  u.setEmailid(rs.getString("emailid"));
		    	  u.setPassword(rs.getString("password"));
		    	  u.setStatus(rs.getString("status"));
		    	  all.add(u);
		      }
		}
		catch (Exception e) {
		      // TODO: handle exception
		      e.printStackTrace();
		    }
				return all;
		
	}
	
}
