/**
 *@name MD5HashingUtils.java
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

import java.security.MessageDigest;

import org.apache.commons.lang.StringUtils;

/**
 * @description 
 */
public class MD5HashingUtils {
	
	public static String encrypt(String password) throws Exception{
		String passwordEncripted = null;
		if(StringUtils.isNotBlank(password)){
		
			MessageDigest md = MessageDigest.getInstance("MD5");
	        md.update(password.getBytes());
	 
	        byte byteData[] = md.digest();
	 
	        //convert the byte to hex format method 1
	        StringBuffer sb = new StringBuffer();
	        for (int i = 0; i < byteData.length; i++) {
	         sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
	        }
	        passwordEncripted = sb.toString();
		}//TODO podriamos lanzar exception
	    return passwordEncripted;
               
	}
	
	/**
	 * Comnpara 2 passwords para determinar si la no encriptada genera el mismo hash de la encriptada
	 * @param passwordNonEncripted
	 * @param passwordEncripted
	 * @return
	 * @throws Exception
	 */
	public static boolean compare(String passwordNonEncripted, String passwordEncripted) throws Exception{
		
		
		if(StringUtils.isNotBlank(passwordNonEncripted) && StringUtils.isNotBlank(passwordEncripted) ){
			MessageDigest md = MessageDigest.getInstance("MD5");
	        md.update(passwordNonEncripted.getBytes());
	 
	        byte byteData[] = md.digest();
	 
	        //convert the byte to hex format method 1
	        StringBuffer sb = new StringBuffer();
	        for (int i = 0; i < byteData.length; i++) {
	         sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
	        }
	        
	        String passwordGenerated;
	        
	        passwordGenerated = sb.toString();
	        
	        return  passwordEncripted.equals(passwordGenerated);
		}
        
        
        return false;
        
       
        
	}

}
