package ams.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import ams.db.FeedbackStudent;
import ams.db.provider;

public class StudentFeedbackDao {

	public static int registerFeedback(FeedbackStudent fs) 
	{
		int status=0;
		
		try 
		{
			Connection con = provider.getConnection();
			String sql = "insert into studentfeedback values(?,?,?)";
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1,fs.getRegdno());
			pst.setString(2,fs.getEmailid());
			pst.setString(3,fs.getMessage());
			
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
	public static ArrayList<FeedbackStudent> fetchViewStudentFeedback()
	{
		ArrayList<FeedbackStudent> all = new ArrayList<FeedbackStudent>();
		try
		{
			Connection con=provider.getConnection();
			String sql="select * from studentfeedback";
			PreparedStatement pst=con.prepareStatement(sql);
			
			ResultSet rs = pst.executeQuery();
			while(rs.next())
			{
				FeedbackStudent fs = new FeedbackStudent();
			
				fs.setRegdno(rs.getString("emailid"));
				fs.setEmailid(rs.getString("regdno"));
				fs.setMessage(rs.getString("message"));
				all.add(fs);
				System.out.println(fs);
				
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return all;
		
	}

}
