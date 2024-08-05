package ams.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import ams.db.TeacherLeave;
import ams.db.provider;


public class TeacherLeaveDao 
{
	public static int registerLeave(TeacherLeave tl) 
	{
		int status=0;
		
		try
		{
			Connection con=provider.getConnection();
			String sql="insert into teacherleave(regdno,emailid,t,f,reason) values(?,?,?,?,?) ";
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setString(1, tl.getRegdno());
			pst.setString(2,tl.getEmailid());
			pst.setString(3,tl.getTo());
			pst.setString(4,tl.getFrom());
			pst.setString(5,tl.getReason());
			status = pst.executeUpdate();
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	public static ArrayList<TeacherLeave> fetchTeacherLeave()
	{
		ArrayList<TeacherLeave> all = new ArrayList<TeacherLeave>();
		try
		{
			Connection con=provider.getConnection();
			String sql="select * from teacherleave";
			PreparedStatement pst=con.prepareStatement(sql);
			
			ResultSet rs = pst.executeQuery();
			while(rs.next())
			{
				TeacherLeave t1 = new TeacherLeave();
				t1.setRegdno(rs.getString("regdno"));
				t1.setEmailid(rs.getString("emailid"));
				t1.setTo(rs.getString("t"));
				t1.setFrom(rs.getString("f"));
				t1.setReason(rs.getString("reason"));
				t1.setStatus(rs.getString("status"));
				all.add(t1);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return all;
		
	}
	public static int doApprove(TeacherLeave tl)
	{
		int status=0;
		
		try
		{
			Connection con=provider.getConnection();
			String sql="update teacherleave set status=? where emailid=? and t=? ";
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setString(1, tl.getStatus());
			pst.setString(2,tl.getEmailid());
			pst.setString(3,tl.getTo());
			status = pst.executeUpdate();
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return status;

		}
	
}