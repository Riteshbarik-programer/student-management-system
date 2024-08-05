package ams.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import ams.db.Admin;
import ams.db.Student;
import ams.db.Subject;
import ams.db.provider;

public class AdminDao {

	public static int validate(Admin a) 
	{
		
		int status=0;
		
		try 
		{
			Connection con = provider.getConnection();
			String sql = "select * from admin where emailid=? and password=?";
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1,a.getEmailid());
			pst.setString(2,a.getPassword());
			
			ResultSet rs = pst.executeQuery();
			if(rs.next())
				status=1;
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
			return status;
	}

	public static int setOtp(Admin a) 
	{
		
	int status = 0;
	try 
	{
		Connection con = provider.getConnection();
		String sql = "update admin set otp=? where emailid=?";
		PreparedStatement pst = con.prepareStatement(sql);
		pst.setString(1,a.getOtp());
		pst.setString(2,a.getEmailid());
		
		status = pst.executeUpdate();
	} 
	catch (Exception e)
	{
		e.printStackTrace();
	}
	return status;
	}

	
	public static Admin getOtpAndPassword(Admin a) {
		try {
			Connection con = provider.getConnection();
			String sql = "select otp,password from admin where emailid=?";
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1,a.getEmailid());
			
			ResultSet rs = pst.executeQuery();
			if (rs.next()) 
			{
				a.setOtp(rs.getString(1));
				a.setPassword(rs.getString(2));
				
			}
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return a;
	}

	

	public static int doChangePassword(Admin a) {
		int status = 0 ;
		try
		{
			Connection con = provider.getConnection();
			String sql = "update admin set password=? where emailid=?";
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, a.getPassword());
			pst.setString(2, a.getEmailid());
			
			status = pst.executeUpdate();
					
		} 
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return status;
	}
	
	public static int addSubject(Subject sub) 
	{
		int status = 0 ;
		try 
		{
			Connection con = provider.getConnection();
			String sql = "insert into subject values(?,?,?,?,?)";
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, sub.getSubjectid());
			pst.setString(2, sub.getSubjectname());
			pst.setString(3, sub.getTeacherregdno());
			pst.setString(4, sub.getSemester());
			pst.setString(5, sub.getBranch());
			status = pst.executeUpdate();
			
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return status;
	}
	public static ArrayList<Subject> fetchSubject()
	{
		ArrayList<Subject> all = new ArrayList<Subject>();
		try
		{
			Connection con=provider.getConnection();
			String sql="select * from subject";
			PreparedStatement pst=con.prepareStatement(sql);
			
			ResultSet rs = pst.executeQuery();
			while(rs.next())
			{
				Subject s1 = new Subject();
				s1.setSubjectid(rs.getString(1));
				s1.setSubjectname(rs.getString(2));
				s1.setTeacherregdno(rs.getString(3));
				s1.setSemester(rs.getString(4));
				s1.setBranch(rs.getString(5));
				all.add(s1);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return all;
		
	}

	public static int deleteSubject(String subject_id) 
	{
		int status = 0;
		try 
		{
		   Connection con = provider.getConnection();
		   String sql = "delete from subject where subject_id=?";
		   PreparedStatement pst = con.prepareStatement(sql);
		   
		   pst.setString(1, subject_id);
		   
		   status=pst.executeUpdate();
		   
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return status;
	}

}
