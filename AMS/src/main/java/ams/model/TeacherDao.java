package ams.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import ams.db.Student;
import ams.db.Teacher;
import ams.db.provider;
import ams.service.SendPassword;


public class TeacherDao {

	public static int addTeacher(Teacher t)
	{
		int status = 0;
		SendPassword p = new SendPassword();
		String password = p.sendTeacherPassword(t);
		
		try {

			Connection con = provider.getConnection();
			String sql = "insert into teacher(name,fathername,mothername,emailid,mobileno,aadharno,regdno,department,qualification,gender,dob,blood_group,permanent_country,permanent_state,permanent_city,permanent_district,permanent_landmark,permanent_pin,present_country,present_state,present_city,present_district,present_landmark,present_pin,password) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1,t.getName());
			pst.setString(2,t.getFathername());
			pst.setString(3,t.getMothername());
			pst.setString(4,t.getEmailid());
			pst.setString(5,t.getMobileno());
			pst.setString(6,t.getAadharno());
			pst.setString(7,t.getRegdno());
			pst.setString(8,t.getDepartment());
			pst.setString(9,t.getQualification());
			pst.setString(10,t.getGender() );
			pst.setString(11,t.getDob() );
			pst.setString(12,t.getBlood_group() );
			pst.setString(13,t.getPermanent_country() );
			pst.setString(14,t.getPermanent_state() );
			pst.setString(15,t.getPermanent_city());
			pst.setString(16,t.getPermanent_district() );
			pst.setString(17,t.getPermanent_landmark());
			pst.setString(18,t.getPermanent_pin() );
			pst.setString(19,t.getPresent_country() );
			pst.setString(20,t.getPresent_state() );
			pst.setString(21,t.getPresent_city());
			pst.setString(22,t.getPresent_district());
			pst.setString(23,t.getPresent_landmark() );
			pst.setString(24,t.getPresent_pin() );
			pst.setString(25,password);
			
			status = pst.executeUpdate();
			
		} 
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return status;
	}

	public static int validate(Teacher t) {
			
		int status=0;
		
		try 
		{
			Connection con = provider.getConnection();
			String sql = "select * from teacher where emailid=? and password=?";
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1,t.getEmailid());
			pst.setString(2,t.getPassword());
			
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

	public static int setOtp(Teacher t) 
	{
		int status = 0;
		try 
		{
			Connection con = provider.getConnection();
			String sql = "update teacher set otp=? where emailid=?";
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1,t.getOtp());
			pst.setString(2,t.getEmailid());
			
			status = pst.executeUpdate();
		} 
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return status;
	}

	public static Teacher getOtpAndPassword(Teacher t) {
		try {
			Connection con = provider.getConnection();
			String sql = "select otp,password from teacher where emailid=?";
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1,t.getEmailid());
			
			ResultSet rs = pst.executeQuery();
			if (rs.next()) 
			{
				t.setOtp(rs.getString(1));
				t.setPassword(rs.getString(2));
				
			}
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return t;
	}
	public static Teacher getDetails(String emailid) 
	{
	
		
		//System.out.println(emailid);
		Teacher t1 = null;
	
	try 
	{
		Connection con = provider.getConnection();
		String sql = "select * from teacher where emailid=?";
		PreparedStatement pst = con.prepareStatement(sql);
		pst.setString(1,emailid);
		
		ResultSet rs = pst.executeQuery();
		if(rs.next())
		{
			 t1 = new Teacher();
			t1.setEmailid(rs.getString("emailid"));
			t1.setName(rs.getString("name"));
			t1.setRegdno(rs.getString("regdno"));
			t1.setAadharno(rs.getString("aadharno"));
			t1.setBlood_group(rs.getString("blood_group"));
			t1.setDepartment(rs.getString("department"));
			t1.setDob(rs.getString("dob"));
			t1.setFathername(rs.getString("fathername"));
			t1.setGender(rs.getString("gender"));
			t1.setMobileno(rs.getString("mobileno"));
			t1.setPermanent_city(rs.getString("permanent_city"));
			t1.setPermanent_country(rs.getString("permanent_country"));
			t1.setPermanent_district(rs.getString("permanent_district"));
			t1.setPermanent_landmark(rs.getString("permanent_landmark"));
			t1.setPermanent_pin(rs.getString("permanent_pin"));
			t1.setPhoto(rs.getString("photo"));
			t1.setPresent_city(rs.getString("present_city"));
			t1.setPresent_country(rs.getString("present_country"));
			t1.setPresent_district(rs.getString("present_district"));
			t1.setPresent_landmark(rs.getString("present_landmark"));
			t1.setPresent_pin(rs.getString("present_pin"));
			t1.setPresent_state(rs.getString("present_state"));
			t1.setPermanent_state(rs.getString("permanent_state"));
			t1.setMothername(rs.getString("mothername"));
			t1.setQualification(rs.getString("qualification"));
		}
	}
	catch (Exception e) 
	{
		e.printStackTrace();
	}
		return t1;
}

	public static int doChangePassword(Teacher t) {
		
		int status = 0 ;
		try
		{
			Connection con = provider.getConnection();
			String sql = "update teacher set password=? where emailid=?";
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, t.getPassword());
			pst.setString(2, t.getEmailid());
			
			status = pst.executeUpdate();
					
		} 
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return status;
	}
	public static ArrayList<Teacher> fetchTeacher()
	{
		ArrayList<Teacher> all = new ArrayList<Teacher>();
		try
		{
			Connection con=provider.getConnection();
			String sql="select * from teacher";
			PreparedStatement pst=con.prepareStatement(sql);
			
			ResultSet rs = pst.executeQuery();
			while(rs.next())
			{
				Teacher t1 = new Teacher();
				t1.setName(rs.getString("name"));
				t1.setRegdno(rs.getString("regdno"));
				t1.setEmailid(rs.getString("emailid"));
				t1.setPhoto(rs.getString("photo"));
				all.add(t1);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return all;
		
	}

	public static int deleteTeacher(String emailid) 
	{
		int status = 0;
		try 
		{
		   Connection con = provider.getConnection();
		   String sql = "delete from teacher where emailid=?";
		   PreparedStatement pst = con.prepareStatement(sql);
		   
		   pst.setString(1, emailid);
		   
		   status=pst.executeUpdate();
		   
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return status;
	}

	public static int updateTeacher(Teacher t)
	{
		int status = 0;
		SendPassword p = new SendPassword();
		String password = p.sendTeacherPassword(t);
		
		try {

			Connection con = provider.getConnection();
			String sql = "update teacher set name=?,fathername=?,mothername=?,mobileno=?,aadharno=?,regdno=?,department=?,qualification=?,gender=?,dob=?,blood_group=?,permanent_country=?,permanent_state=?,permanent_city=?,permanent_district=?,permanent_landmark=?,permanent_pin=?,present_country=?,present_state=?,present_city=?,present_district=?,present_landmark=?,present_pin=? where emailid=?";
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1,t.getName());
			pst.setString(2,t.getFathername());
			pst.setString(3,t.getMothername());
			
			pst.setString(4,t.getMobileno());
			pst.setString(5,t.getAadharno());
			pst.setString(6,t.getRegdno());
			pst.setString(7,t.getDepartment());
			pst.setString(8,t.getQualification());
			pst.setString(9,t.getGender() );
			pst.setString(10,t.getDob() );
			pst.setString(11,t.getBlood_group() );
			pst.setString(12,t.getPermanent_country() );
			pst.setString(13,t.getPermanent_state() );
			pst.setString(14,t.getPermanent_city());
			pst.setString(15,t.getPermanent_district() );
			pst.setString(16,t.getPermanent_landmark());
			pst.setString(17,t.getPermanent_pin() );
			pst.setString(18,t.getPresent_country() );
			pst.setString(19,t.getPresent_state() );
			pst.setString(20,t.getPresent_city());
			pst.setString(21,t.getPresent_district());
			pst.setString(22,t.getPresent_landmark() );
			pst.setString(23,t.getPresent_pin() );
			pst.setString(24,t.getEmailid());
			
			status = pst.executeUpdate();
			
		} 
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return status;
	}
	
	public static int setStatus(String emailid) {
		int status = 0;
		try
		{
			Connection con=provider.getConnection();
			String sql="update teacher set status=null where emailid=?";
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setString(1,emailid);
			
			status = pst.executeUpdate();	
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public static int setStatus1(String emailid) {
		int status = 0;
		try
		{
			Connection con=provider.getConnection();
			String sql="update teacher set status='1' where emailid=?";
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setString(1,emailid);
			
			status = pst.executeUpdate();	
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	public static int updatePhoto(Teacher u, String file_name) 
	{
		int status=0;
		try{
			Connection con=provider.getConnection();
			String sql="update teacher set photo=? where emailid=?";
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setString(1, u.getPhoto());
			pst.setString(2, u.getEmailid());
			status=pst.executeUpdate();
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return status;
	}
}



	
	


