package ams.controller;

import java.util.Random;

public class GenerateOtp {

	public static char[] adminForgotPassword(int len) {
		System.out.println("Generating OTP using random():");
		System.out.println("Your new OTP is:");
		
		String numbers="123456789";
		Random r=new Random();
		char[] otp=new char[len];
		
		for(int i=0;i<len;i++)
		{
			otp[i]=numbers.charAt(r.nextInt(numbers.length()));
		}
	
		return otp;
	}

}
