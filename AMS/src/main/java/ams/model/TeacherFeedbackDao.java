package ams.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import ams.db.FeedbackTeacher;
import ams.db.provider;

public class TeacherFeedbackDao {

	public static int registerFeedback(FeedbackTeacher ts) 
	{
		int status = 0;
		
		try 
		{
			Connection con = provider.getConnection();
			String sql = "insert into teacherfeedback values(?,?,?)";
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1,ts.getRegdno());
			pst.setString(2,ts.getEmailid());
			pst.setString(3,ts.getMessage());
			
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
	public static ArrayList<FeedbackTeacher> fetchViewTeacherFeedback()
	{
		ArrayList<FeedbackTeacher> all = new ArrayList<FeedbackTeacher>();
		try
		{
			Connection con=provider.getConnection();
			String sql="select * from teacherfeedback";
			PreparedStatement pst=con.prepareStatement(sql);
			
			ResultSet rs = pst.executeQuery();
			while(rs.next())
			{
				FeedbackTeacher ft = new FeedbackTeacher();
			
				ft.setRegdno(rs.getString("redgno"));
				ft.setEmailid(rs.getString("emailid"));
				ft.setMessage(rs.getString("message"));
				all.add(ft);
				System.out.println(ft);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return all;
	}

}


