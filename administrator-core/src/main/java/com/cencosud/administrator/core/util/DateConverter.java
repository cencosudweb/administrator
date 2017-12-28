/**
 *@name DateConverter.java
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

import java.util.Calendar;
import java.util.Date;

/**
 * @description Clase que convierte de fecha a tipo long
 */
public class DateConverter {
	
	public static Date dateFromLong(long longTypeDate) {
		return new Date(longTypeDate * 1000L);
	}

	public static long longFromDate(Date date) {
		if (date != null) {
			return date.getTime() / 1000L;
		}
		return -1;
	}

	/**
	 * Agrega x horas a la fecha actual para generar tiempo de expiracion
	 */
	public static Date getTimePassExiration(int hoursAddExpiration) {

		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		cal.add(Calendar.HOUR_OF_DAY, hoursAddExpiration);
		return cal.getTime();
	}
	
	public static long getLongTimePassExiration(int hoursAddExpiration) {

		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		cal.add(Calendar.HOUR_OF_DAY, hoursAddExpiration);
		return cal.getTimeInMillis() / 1000L ;
	}

	public static void main(String[] args) {
		System.out.println("Hello World!");

		Date date = new Date();
		System.out.println(date);
		long dateL = longFromDate(date);
		System.out.println(dateL);
		System.out.println(dateFromLong(dateL));

	}

}
