/**
 * 
 */
package com.cencosud.administrator.web.utils;

import com.cencosud.administrator.web.constantes.Constantes;

import com.cencosud.administrator.web.utils.InicializarMIS;

/**
 * @author ea7129
 *
 */
public class App {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		InicializarMIS inicializarMIS = new InicializarMIS();
		try {
			inicializarMIS.init();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		//notificacionServices = new NotificacionServices();
		
		InicializarMIS.getPropiedad("jdbc.dialect");
		System.out.println(""+InicializarMIS.getPropiedad("jdbc.dialect"));

	}

}
