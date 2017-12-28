/**
 * 
 */
package com.cencosud.administrator.web.utils;

/**
 * @author ea7129
 *
 */
public class Test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		String estado = "1";
		String estado2 = !"All".equals(estado) && estado != null?estado:"9";
		String bogeda = null;
		String bodega2 = bogeda != "All"  || bogeda != null?bogeda:"9";
		
		int encontrados = 1;//Integer.parseInt(estado2);
		int bodegas = 1;//Integer.parseInt(bodega2);
		System.out.println(""+estado2);
		System.out.println(""+bodegas);

	}

}
