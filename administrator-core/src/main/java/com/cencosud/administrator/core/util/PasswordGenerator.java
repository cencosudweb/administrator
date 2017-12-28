/**
 *@name PasswordGenerator.java
 * 
 *@version 1.0 
 * 
 *@date 07-03-2017
 * 
 *@author EA7129
 * 
 *@copyright Cencosud. All rights reserved.
 */
package com.cencosud.administrator.core.util;

import java.util.Random;

/**
 * @description 
 */
public class PasswordGenerator {
	
	static final String AB = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
	static final String AB2 = "0123456789";

	static Random rnd = new Random();

	 public static String randomPassword(int len) 
	 {
	    StringBuilder sb = new StringBuilder( len );
	    for( int i = 0; i < len; i++ ) 
	       sb.append( AB.charAt( rnd.nextInt(AB.length()) ) );
	    return sb.toString();
	 }
	 
	 public static String randomPassword2(int len) 
	 {
	    StringBuilder sb = new StringBuilder( len );
	    for( int i = 0; i < len; i++ ) 
	       sb.append( AB2.charAt( rnd.nextInt(AB2.length()) ) );
	    return sb.toString();
	 }
	 
	 public static int randomNumber(int len) 
	 {
		 int numeroAleatorio = (int) (Math.random()*len+1);

	    return numeroAleatorio;
	 }
	 
	 public static void main(String[] args) {
			// TODO Auto-generated method stub
		 int numeroAleatorio = (int) (Math.random()*10000000+1);
		 System.out.print("1="+randomPassword2(1));
		 System.out.print("2="+randomNumber(1000));
		 System.out.print("3="+numeroAleatorio);
		 
		}

}
