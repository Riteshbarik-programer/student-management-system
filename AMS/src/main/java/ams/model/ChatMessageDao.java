package ams.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import ams.db.ChatMessage;
import ams.db.provider;

public class ChatMessageDao {


	public static ResultSet rs1  = null;
	public static ResultSet rs2  = null;
	public static int addMessage(ChatMessage msg) {
		int status=0;
		try
		{
			Connection con=provider.getConnection();
			String sql="insert into chatmessages (sender,receiver,message,time) values (?,?,?,?)";
			PreparedStatement pst= con.prepareStatement(sql);
			pst.setString(3,msg.getMessage());
			pst.setString(1,msg.getSender());
			pst.setString(2,msg.getReceiver());
			pst.setTimestamp(4, msg.getTime());
			rs1 =pst.executeQuery();
			if (rs1.next()) 
			{
				System.out.println("done : ");
				status=1;
				
				
			}
			rs1.close();
			 
		      pst.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return status;
	}
	
	public static ArrayList<ChatMessage> fetchMessage(ChatMessage msg){
		ArrayList<ChatMessage> all =new ArrayList<ChatMessage>();
		String sql = "select * from chatmessages where (sender=? OR sender=?) AND (receiver=? OR receiver=?) order by time asc";
		try {
		      Connection con = provider.getConnection();
		      PreparedStatement pst = con.prepareStatement(sql);
		      pst.setString(1, msg.getReceiver());
		      pst.setString(2, msg.getSender());
		      pst.setString(3, msg.getReceiver());
		      pst.setString(4, msg.getSender());
		      
		      rs2 = pst.executeQuery();
		      while(rs2.next()){
		    	  ChatMessage u=new ChatMessage();
		    	  u.setSender(rs2.getString(1));
		    	  u.setReceiver(rs2.getString(2));
		    	 u.setMessage(rs2.getString(3));
		    	 u.setTime(rs2.getTimestamp(4));
		    	  all.add(u);
		      }
		      //System.out.println("Hello now closing the ResultSet .........................: ");
		     
		      rs2.close();
		      
		      pst.close();
		      
		}
		catch (Exception e) {
		      // TODO: handle exception
		      e.printStackTrace();
		    }
				return all;
		
	}

}
