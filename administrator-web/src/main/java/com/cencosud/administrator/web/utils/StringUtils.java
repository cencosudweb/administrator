
/**
 *@name StringUtils.java
 * 
 *@version 1.0 
 * 
 *@date 07-03-2017
 * 
 *@author EA7129
 * 
 *@copyright Cencosud. All rights reserved.
 */
package com.cencosud.administrator.web.utils;

import java.math.BigDecimal;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
/**
 * @description Clase que genera funciones de utilidades   
 */
public class StringUtils {
	
	//private final static int numeroDeDecimales = 2;
	private final static int numeroDeDecimales1 = 1;
	
	private final static String PHONO = " +0123456789";
	private final static String DIGITS = " 0123456789";
	private final static String LETTERS =" abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
	private final static String ALFANUMERICO = DIGITS+LETTERS;
	private final static String ADMIN_USERNAME = "admin";
	
	// Formato 15567863-1 retorna true o false
	public static boolean validarRut(String rut){
		rut = rut.toUpperCase();
        int largo=rut.length();
        char digito=rut.charAt(largo-1);
        char val;
        if(rut.contains("-")){
        	rut=rut.substring(0, largo-2);	
        }
        else
        	rut=rut.substring(0, largo-1);
        int M=0,S=1,T=Integer.parseInt(rut);
        for(;T!=0;T/=10){
            S=(S+T%10*(9-M++%6))%11;
        }
        val=(char)(S!=0?S+47:75);
        if(digito == val){
            return true;
        }else{
            return false;
        }
    }
	
	public static String getDBRut(String rut){
		if(isValidString(rut) && rut.length() > 2){
			rut = rut.replace(".", "");
			rut = rut.replace("-", "");
			
			String rutEntero = rut.substring(0, rut.length()-1);
			String dv = rut.substring(rut.length()-1);
			return rutEntero+"-"+dv;
		}
		return "";
	}
	
	// Valida formato y digito
	public static boolean isValidFullRut(String rut){
		if(rut != null && rut.length() >= 8){
			Pattern p1 = Pattern.compile("^(\\d{1}|\\d{2})\\.(\\d{3}\\.\\d{3})-?([kK]{1}$|\\d{1}$)");
			Matcher m1 = p1.matcher(rut);
			
			Pattern p2 = Pattern.compile("^(\\d{7}|\\d{8})-?([kK]{1}$|\\d{1}$)");
			Matcher m2 = p2.matcher(rut);
			
			boolean res1 = m1.find();
			boolean res2 = m2.find();
			
			if (!res1 && !res2){
				return false;	
			}
			
		 	String remplazado=getDBRut(rut);
		 	
		 	
		 	return validarRut(remplazado);
			
		}
		return false;
	}
	
	public static boolean isValidString(String string){
		if(string!=null){
			string=string.trim();
			if(!"".equals(string) && !string.isEmpty()){
				return true;
			}else{
				return false;
			}
		}else{
			return false;
		}
	}
	
	public static boolean isAlfabetico(String texto){
		if(isValidString(texto)){
			int largo = texto.length();
			boolean isValid=true;
			for (int i = 0; i < largo; i++) {
				char c=texto.charAt(i);
				if (LETTERS.indexOf(c) != -1) {
					continue;
				}else{
					isValid=false;
					break;
				}
			}
			return isValid;
		}else{
			return false;
		}
	}

	public static boolean isValidAddress(String direction){
		boolean isValid = false;
		direction = direction.replace("#", "").replace(",", "").replace(".", "").replace(" ", "");
		if(isAlfaNumerico(direction)){
			isValid = true;
		}
		return isValid;
	}
	
	public static boolean isAlfaNumerico(String texto){
		if(isValidString(texto)){
			int largo = texto.length();
			boolean isValid=true;
			for (int i = 0; i < largo; i++) {
				char c=texto.charAt(i);
				if (ALFANUMERICO.indexOf(c) != -1) {
					continue;
				}else{
					isValid=false;
					break;
				}
			}
			return isValid;
		}else{
			return false;
		}
	}
	
	public static boolean isNumber(String number){
		try{
			Integer.parseInt(number);
			return true;
		}catch(NumberFormatException nbe){
			return false;
		}
	}
	
	public static boolean isDecimal(String number){
		try{
			Double.parseDouble(number);
			return true;
		}catch(NumberFormatException nbe){
			return false;
		}
	}
	
	public static boolean isValidPhone(String phone){
		
		int minLength = 6;
		int maxLenght = 14;
		
		if(phone.contains("+")){
			minLength = 10;
			maxLenght = 15;
		}
			
		phone = phone.replace(" ", "");
		
		if(isValidString(phone) && phone.length() >= minLength && phone.length() <= maxLenght){
			int largo = phone.length();
			int mas = 0;
			boolean isValid=true;
			for (int i = 0; i < largo; i++) {
				char c=phone.charAt(i);
				if (PHONO.indexOf(c) != -1) {
					if(c == '+'){
						mas++;
						if (mas > 1){
							isValid = false;
							break;
						}
						if(i != 0){
							isValid = false;
							break;
						}
					}
					continue;
				}else{
					isValid=false;
					break;
				}
			}
			return isValid;
		}else{
			return false;
		}
	}
	
	public static boolean isValidMinLength(String s, int largo){
		if(s!=null){
			if(s.length() >= largo){
				return true;
			}
		}
		return false;
	}
	
	public static boolean isValidMaxLength(String s, int largo){
		System.out.println(s);
		System.out.println(largo);
		System.out.println(s.length());
		if(s!=null){
			if(s.length() <= largo){
				return true;
			}
		}
		return false;
	}
	
	public static boolean isValidEmail(String mail){
		if(mail != null && mail.length() > 0){
			Pattern pat = null;
	        Matcher mat = null;
	        pat = Pattern.compile("^([0-9a-zA-Z]([-.\\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\\w]*[0-9a-zA-Z]\\.)+[a-zA-Z]{2,9})$");
	        mat = pat.matcher(mail);
	        if (mat.find()) {
	            return true;
	        }else{
	            return false;
	        }        
		}
		return false;
	}
	
	public static String capitalize(String s) {
		  if (s == null || s.length() == 0) {
		    return "";
		  }
		  char first = s.charAt(0);
		  if (Character.isUpperCase(first)) {
		    return s;
		  } else {
		    return Character.toUpperCase(first) + s.substring(1);
		  }
	} 
	
	public static String safeTrim(String cadena){
		if(cadena!=null){
			return cadena.trim();
		}
		return "";
	}
	
	public static String safeUpper(String cadena){
		if(cadena!=null){
			return cadena.toUpperCase();
		}
		return "";
	}
	
	public static String safeString(String cadena){
		if(cadena!=null){
			return cadena;
		}
		return "";
	}
	
	public static boolean isAdminUser(String username){
		return ADMIN_USERNAME.equalsIgnoreCase(safeTrim(username));
	}
	
	public static String ColocarDecimales(String texto) {
	    int lugar = texto.indexOf(".");
	    if (lugar != -1) {
	      String t1 = texto.substring(0, lugar);
	      String t2 = texto.substring(lugar + 1, texto.length());
	      if (t2.length() < numeroDeDecimales1) {
	        for (int i = t2.length(); i < numeroDeDecimales1; i++) {
	          t2 = t2 + "0";
	        }
	      }
	      else {
	        t2 = t2.substring(0, numeroDeDecimales1);
	      }
	      texto = t1 + "." + t2;
	    }
	    else {
	      String decimal = "";
	      for (int i = 0; i < numeroDeDecimales1; i++) {
	        decimal = decimal + 0;
	      }
	      texto = texto + "." + decimal;
	    }
	    return (texto);
	}
	
	public static  String Redondear(String valor, int decimales) {
		// TODO Auto-generated method stub
		BigDecimal numero;
	    String resultado = "";
	    String signo = "";

	    if ( (valor != null) && (valor.compareTo("") != 0)) {
	      if (valor.indexOf(",") != -1) {
	        valor = valor.replace(',', '.');
	      }
	      if (valor.substring(0, 1).compareTo("-") == 0) {
	        signo = "-";
	        valor = valor.substring(1, valor.length());
	      }
	      numero = new BigDecimal(valor);
	      resultado = numero.setScale(decimales, BigDecimal.ROUND_HALF_UP).toString();
	      return (signo + resultado);
	    }
	    else {
	      return ("");
	    }
	}

	
//	// Formato 15567863k retorna "15.567.863-k"
//	public static String getRutFormato(String rut){
//		try{
//	        String FRut[] = new String[5];
//	
//	        if (String.valueOf(rut).length() == 9) {
//	            FRut[0] = String.valueOf(rut).substring(0, 2);
//	            FRut[1] = String.valueOf(rut).substring(2, 5);
//	            FRut[2] = String.valueOf(rut).substring(5, 8);
//	            FRut[3] = String.valueOf(rut).substring(8, 9);
//	        }
//	
//	        if (String.valueOf(rut).length() ==  8 )  {
//	            FRut[0] = String.valueOf(rut).substring(0, 1);
//	            FRut[1] = String.valueOf(rut).substring(1, 4);
//	            FRut[2] = String.valueOf(rut).substring(4, 7);
//	            FRut[3] = String.valueOf(rut).substring(7, 8);
//	        }
//	        return String.valueOf(FRut[0] + "." + FRut[1] + "." + FRut[2] + "-" + FRut[3]);
//		}catch (Exception e) {
//		}
//		return rut;
//    }
	
	public static void main(String[] args) {
		System.out.println(isValidMinLength("123456789012345678901",20));
		System.out.println(isValidMaxLength("123456789012345678901",20));
	}
}
