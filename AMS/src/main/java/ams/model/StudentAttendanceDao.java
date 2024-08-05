package ams.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import ams.db.Student;
import ams.db.StudentAttendance;
import ams.db.provider;

public class StudentAttendanceDao {

	public static int takeAttendance(StudentAttendance sa) 
	{
		int status=0;
		
		try
		{
			Connection con=provider.getConnection();
			String sql="insert into studentattendence values(?,?,?,?,?,?,?,?)";
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setString(1, sa.getAttendancedate());
			pst.setString(2,sa.getBranch());
			pst.setString(3,sa.getSemester());
			pst.setString(4,sa.getSubject());
			
			pst.setString(5,sa.getEmailid());
			pst.setString(6,sa.getRegdno());
			pst.setString(7,sa.getStatus());
			pst.setString(8,sa.getName());
			status = pst.executeUpdate();
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	
	public static String getStatus(String emailid,String branch,String semester,String subject,String attendancedate) 
	{
		String status = null;
		
		try
		{
			System.out.println("=============================");
			System.out.println(emailid);
			System.out.println(branch);
			System.out.println(subject);
			System.out.println(semester);
			System.out.println(attendancedate);
			System.out.println("======");
			
			
			Connection con=provider.getConnection();
			String sql="select status from studentattendence where emailid='"+emailid+"' and subject='"+subject+"' and semester='"+semester+"' and attendancedate='"+attendancedate+"'";
			System.out.println(sql);
			PreparedStatement pst=con.prepareStatement(sql);
			
			ResultSet rs= pst.executeQuery();
			if(rs.next())
			{
				status = rs.getString(1);
				System.out.println(status+"sssssssss=================");
			}
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	
	public static ArrayList<StudentAttendance> fetchAttendanceSubject( Student s,String emailid,  String subject)
	{
		ArrayList<StudentAttendance> all = new ArrayList<StudentAttendance>();
		try
		{
			Connection con=provider.getConnection();
			String sql="select * from studentattendence where emailid=? and  semester=? and subject=?";
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setString(1, emailid);
			pst.setString(2, s.getSemester());
			pst.setString(3, subject);
			
			ResultSet rs = pst.executeQuery();
			while(rs.next())
			{
				StudentAttendance s1 = new StudentAttendance();
				s1.setName(rs.getString("name"));
				s1.setRegdno(rs.getString("regdno"));
				s1.setEmailid(rs.getString("emailid"));
				s1.setStatus(rs.getString("status"));
				s1.setSubject(rs.getString("subject"));
				s1.setAttendancedate(rs.getString("attendancedate"));
				all.add(s1);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return all;
		
	}
	
	public static ArrayList<StudentAttendance> fetchAttendanceDate( Student s,String emailid,  String attendancedate)
	{
		ArrayList<StudentAttendance> all = new ArrayList<StudentAttendance>();
		try
		{
			Connection con=provider.getConnection();
			String sql="select * from studentattendence where emailid=? and  semester=? and attendancedate=?";
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setString(1, emailid);
			pst.setString(2, s.getSemester());
			pst.setString(3, attendancedate);
			
			ResultSet rs = pst.executeQuery();
			while(rs.next())
			{
				StudentAttendance s1 = new StudentAttendance();
				s1.setName(rs.getString("name"));
				s1.setRegdno(rs.getString("regdno"));
				s1.setEmailid(rs.getString("emailid"));
				s1.setStatus(rs.getString("status"));
				s1.setSubject(rs.getString("subject"));
				all.add(s1);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return all;
		
	}
	public static ArrayList<StudentAttendance> fetchStudentAttendence(String branch, String semester,String subject,String attendencedate)
	{
		ArrayList<StudentAttendance> all = new ArrayList<StudentAttendance>();
		try
		{
			System.out.println(branch);
			System.out.println(semester);
			Connection con=provider.getConnection();
			String sql="select * from studentattendence where branch=? and semester=? and subject=? and attendancedate=?";
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setString(1, branch);
			pst.setString(2, semester);
			pst.setString(3, subject);
			pst.setString(4, attendencedate);
			ResultSet rs = pst.executeQuery();
			while(rs.next())
			{
				StudentAttendance s1 = new StudentAttendance();
				s1.setName(rs.getString("name"));
				s1.setRegdno(rs.getString("regdno"));
				s1.setEmailid(rs.getString("emailid"));
				s1.setStatus(rs.getString("status"));
				all.add(s1);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return all;
		
	}
}