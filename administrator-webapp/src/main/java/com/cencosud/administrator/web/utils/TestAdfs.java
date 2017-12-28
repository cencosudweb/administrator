/**
 * 
 */
package com.cencosud.administrator.web.utils;

import org.apache.commons.*;

import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

/**
 * @author EA7129
 *
 */
public class TestAdfs {
	
	
	public static String encrypt(String text) throws Exception {
		Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
		SecretKeySpec keyspec = 
	new SecretKeySpec("Customer_Token_Key".getBytes(), "AES");

	if (text == null || text.length() == 0)
	throw new Exception("Empty string");
	byte[] encrypted = null;
	try {
	cipher.init(Cipher.ENCRYPT_MODE, keyspec );
	encrypted = cipher.doFinal(text.getBytes());
	} catch (Exception e) {
	throw new Exception("[encrypt] " + e.getMessage());
	}
	//return Base64.encodeBase64String(encrypted);
	return text;
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
