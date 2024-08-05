package ams.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import ams.controller.StudentLeaveApplication;
import ams.db.LeaveApplication;
import ams.db.Student;
import ams.db.provider;

public class LeaveApplicationDao {

	
	public static int applyLeave(LeaveApplication l) 
	{
		int status=0;
		
		try 
		{
			Connection con = provider.getConnection();
			String sql = "insert into studentleave values(?,?,?,?,?,?)";
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1,l.getRegdno());
			pst.setString(2,l.getEmailid());
			pst.setString(3,l.getFrom());
			pst.setString(4, l.getTo());
			pst.setString(5,l.getReason());
			pst.setString(6,l.getStatus());
			status = pst.executeUpdate();
			
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
			return status;
	}
	public static ArrayList<LeaveApplication> fetchLeaveApplication()
	{
		ArrayList<LeaveApplication> all = new ArrayList<LeaveApplication>();
		try
		{
			Connection con=provider.getConnection();
			String sql="select * from studentLeave";
			PreparedStatement pst=con.prepareStatement(sql);
			
			ResultSet rs = pst.executeQuery();
			while(rs.next())
			{
				LeaveApplication s1 = new LeaveApplication();
			
				s1.setRegdno(rs.getString("regdno"));
				s1.setEmailid(rs.getString("emailid"));
				s1.setFrom(rs.getString("f"));
				s1.setTo(rs.getString("t"));
				s1.setReason(rs.getString("reason"));
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
	public static int doApprove(LeaveApplication sl) {

		int status=0;
		
		try 
		{
			Connection con = provider.getConnection();
			String sql = "update studentleave set status=? where emailid=? and to=?";
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1,sl.getStatus());
			pst.setString(2,sl.getEmailid());
			pst.setString(3,sl.getTo());	
			
			status = pst.executeUpdate();
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
			return status;
	}

}
