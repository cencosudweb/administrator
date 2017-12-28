
/**
 *@name DateUtils.java
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

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

//import java.util.GregorianCalendar;
/**
 * @description Clase para formato de fecha
 */
public class DateUtils {
	
	public static String restarDiaFecha(String fechaCompromiso, String leadTimeTransport) {

		String date = null;
		SimpleDateFormat formatoDelTexto = new SimpleDateFormat("dd/MM/yyyy");

		if ("0".equals(leadTimeTransport)) {
			date = "0";
		} else {
			if ("".equals(leadTimeTransport) || leadTimeTransport != null) {
				date = "-" + leadTimeTransport;
			} else {
				date = "0";
			}
		}

		Date fecha = null;
		try {

			fecha = formatoDelTexto.parse(fechaCompromiso);

		} catch (ParseException ex) {

			ex.printStackTrace();
		}

		Calendar calendar = Calendar.getInstance();
		calendar.setTime(fecha); // Configuramos la fecha que se recibe
		calendar.add(Calendar.DAY_OF_MONTH, Integer.parseInt(date)); // numero
																		// de
																		// días
																		// a
																		// añadir,
																		// o
																		// restar
																		// en
																		// caso
																		// de
																		// días<0
		SimpleDateFormat formatoDeFecha = new SimpleDateFormat("dd/MM/yyyy");
		return formatoDeFecha.format(calendar.getTime());
	}
	
	public static String turnDatePd(String fecha) {

		if (fecha != null) {

			if (isFechaValida(fecha) == true) {
				if (fecha.isEmpty()) {
					return null;

				} else {

					String day = fecha.substring(0, 2);
					String month = fecha.substring(3, 5);
					String year = fecha.substring(6, 10);
					// String date = day+"/"+month+"/"+year;
					String date = year + "-" + month + "-" + day;

					return date;
				}

				// if(!fecha.isEmpty() ) {
				// return null;
				// } else {

			} else {
				return null;
			}

		} else {
			return null;
		}

		// return null;

	}
	
	public static String turnDate5(String fecha) {

		if (fecha != null) {
			// 20170731
			/*
			 * String day = fecha.substring(0, 2); String month =
			 * fecha.substring(3, 5); String year = fecha.substring(8, 10);
			 * String date = day+"/"+month+"/"+year;
			 */
			// 18/04/2017
			String day = fecha.substring(6, 8);
			String month = fecha.substring(4, 6);
			String year = fecha.substring(0, 4);
			// String date = day+"/"+month+"/"+year;
			String date = year + "-" + month + "-" + day;

			return date;
		} else {
			return null;
		}

		// return null;

	}


	public static String formatFecha(Date fecha, String format) {
		if (fecha != null) {
			SimpleDateFormat formato = new SimpleDateFormat(format);
			String cadenaFecha = formato.format(fecha);
			return cadenaFecha;
		} else {
			return "";
		}
	}

	public static Date obtenerFecha(String fecha, String format) {
		if (fecha != null) {
			SimpleDateFormat formatter = new SimpleDateFormat(format);
			try {
				return (Date) formatter.parse(fecha);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	/*
	 * public static String obtenerDate(String fecha) {
	 * 
	 * if(fecha != null){ String[] numerosComoArray = fecha.split("/"); for (int
	 * i = 0; i < numerosComoArray.length; i++) { //return
	 * numerosComoArray[2]+"-"+numerosComoArra//y[1]+"-"+numerosComoArray[0];
	 * return numerosComoArray[i]; } } return null;
	 * 
	 * }
	 */

	public static Date getFecha(String fecha, String fmt) {

		SimpleDateFormat sdf = new SimpleDateFormat(fmt);

		try {
			return sdf.parse(fecha);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public static String getFormatDay(String fecha) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		// String dateInString = "01/11/2014";

		try {

			Date date = formatter.parse(fecha);
			// System.out.println(date);
			// System.out.println(formatter.format(date));
			return formatter.format(date);

		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;

	}

	public static String getFormatDayInvert(String fecha) {
		SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
		// String dateInString = "01/11/2014";

		try {

			Date date = formatter.parse(fecha);
			// System.out.println(date);
			// System.out.println(formatter.format(date));
			return formatter.format(date);

		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;

	}

	public static String turnDate(String fecha) {

		if (fecha != null) {

			if (DateUtils.isFechaValida(fecha) == true) {
				if (fecha.isEmpty()) {
					return null;

				} else {
					String day = fecha.substring(0, 2);
					String month = fecha.substring(3, 5);
					String year = fecha.substring(6, 10);
					// String date = day+"/"+month+"/"+year;
					String date = year + "-" + month + "-" + day;

					return date;
				}

				// if(!fecha.isEmpty() ) {
				// return null;
				// } else {

			} else {
				return null;
			}

		} else {
			return null;
		}

		// return null;

	}

	public static String turnDate2(String fecha) {

		if (fecha != null) {

			if (DateUtils.isFechaValida(fecha) == true) {
				if (fecha.isEmpty()) {
					return null;

				} else {
					String day = fecha.substring(0, 2);
					String month = fecha.substring(3, 5);
					String year = fecha.substring(6, 10);
					// String date = day+"/"+month+"/"+year;
					String date = day + "/" + month + "/" + year;
					return date;
				}

				// if(!fecha.isEmpty() ) {
				// return null;
				// } else {

			} else {
				return null;
			}

		} else {
			return null;
		}

		// return null;

	}

	public static String turnDate3(String fecha) {

		if (fecha != null) {

			if (DateUtils.isFechaValida(fecha) == true) {
				if (fecha.isEmpty()) {
					return null;

				} else {

					// 18/04/2017
					String day = fecha.substring(0, 2);
					String month = fecha.substring(3, 5);
					String year = fecha.substring(6, 10);
					// String date = day+"/"+month+"/"+year;
					String date = year + "" + month + "" + day;

					return date;
				}

				// if(!fecha.isEmpty() ) {
				// return null;
				// } else {

			} else {
				return null;
			}

		} else {
			return null;
		}

		// return null;

	}
	
	
	public static String turnDateCtl(String fecha) {

		if (fecha != null) {

			if (DateUtils.isFechaValida(fecha) == true) {
				if (fecha.isEmpty()) {
					return null;

				} else {

					// 18/04/2017
					String day = fecha.substring(0, 2);
					String month = fecha.substring(3, 5);
					String year = fecha.substring(6, 10);
					// String date = day+"/"+month+"/"+year;
					String date = year + "-" + month + "-" + day;

					return date;
				}

				// if(!fecha.isEmpty() ) {
				// return null;
				// } else {

			} else {
				return null;
			}

		} else {
			return null;
		}

		// return null;

	}

	public static String turnDate4(String fecha) {

		if (fecha != null) {

			if (DateUtils.isFechaValida(fecha) == true) {
				if (fecha.isEmpty()) {
					return null;

				} else {

					// 18/04/2017
					/*
					 * String day = fecha.substring(0, 2); String month =
					 * fecha.substring(3, 5); String year = fecha.substring(8,
					 * 10); String date = day+"/"+month+"/"+year;
					 */
					// 18/04/2017
					String day = fecha.substring(0, 2);
					String month = fecha.substring(3, 5);
					String year = fecha.substring(6, 10);
					// String date = day+"/"+month+"/"+year;
					String date = year + "-" + month + "-" + day;

					return date;
				}

				// if(!fecha.isEmpty() ) {
				// return null;
				// } else {

			} else {
				return null;
			}

		} else {
			return null;
		}

		// return null;

	}

	public static String turnDateEditPauta(String fecha) {

		if (fecha != null) {

			if (DateUtils.isFechaValida2(fecha) == true) {
				if (fecha.isEmpty()) {
					return null;

				} else {
					// 2017-07-16
					String day = fecha.substring(8, 10);
					String month = fecha.substring(5, 7);
					String year = fecha.substring(0, 4);
					// String date = day+"/"+month+"/"+year;
					String date = day + "/" + month + "/" + year;

					return date;
				}

				// if(!fecha.isEmpty() ) {
				// return null;
				// } else {

			} else {
				return null;
			}

		} else {
			return null;
		}

		// return null;

	}

	public static String turnDateExport(String fecha) {
		String result = "";
		if ("".equals(fecha) || fecha == null) {
			return result = "";
		} else {
			// 2017-07-16
			String day = fecha.substring(8, 10);
			String month = fecha.substring(5, 7);
			String year = fecha.substring(0, 4);
			// String date = day+"/"+month+"/"+year;
			String date = day + "-" + month + "-" + year;

			return result = date;
		}

		// return null;

	}

	public static int restarDia(String sDia) {

		int dia = 0;
		String sFormato = "yyyyMMdd";
		Calendar diaAux = null;
		String sDiaAux = null;
		SimpleDateFormat df = null;

		try {

			diaAux = Calendar.getInstance();
			df = new SimpleDateFormat(sFormato);
			diaAux.setTime(df.parse(sDia));
			diaAux.add(Calendar.DAY_OF_MONTH, -8);
			sDiaAux = df.format(diaAux.getTime());
			dia = Integer.parseInt(sDiaAux);
		} catch (Exception e) {
			System.out.println("[restarDia]Exception:" + e.getMessage());
		}
		return dia;
	}

	public static int restarDiaExport(String sDia) {

		int dia = 0;
		String sFormato = "dd/MM/yyyy";
		Calendar diaAux = null;
		String sDiaAux = null;
		SimpleDateFormat df = null;

		try {

			diaAux = Calendar.getInstance();
			df = new SimpleDateFormat(sFormato);
			diaAux.setTime(df.parse(sDia));
			diaAux.add(Calendar.DAY_OF_MONTH, -8);
			sDiaAux = df.format(diaAux.getTime());
			dia = Integer.parseInt(sDiaAux);
		} catch (Exception e) {
			System.out.println("[restarDia]Exception:" + e.getMessage());
		}
		return dia;
	}

	public static String turnDate222222(String fecha) {

		if (fecha != null) {

			String day = fecha.substring(6, 8);
			String month = fecha.substring(4, 6);
			String year = fecha.substring(0, 4);
			String date = year + "-" + month + "-" + day;
			return date;

			// if(!fecha.isEmpty() ) {
			// return null;8
			// } else {

		} else {
			return null;
		}

		// return null;

	}

	public static String turnDate1111(String fecha) {

		if (fecha != null) {

			String day = fecha.substring(8, 10);
			String month = fecha.substring(5, 7);
			String year = fecha.substring(0, 4);
			String date = year + "" + month + "" + day;
			return date;

		} else {
			return null;
		}

		// return null;

	}

	public static String encode(String url) {
		if (url != null) {
			try {
				String encodedUrl = URLEncoder.encode(url, "UTF-8");
				return encodedUrl;
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}

	public static String strnumber(String number) {

		if (number != null && !number.equals("")) {
			if (number.substring(0, 1).equals("")) {
				System.out.println("=" + number.substring(0, 1));
				return number.substring(0, 1);
			}

			if (number.substring(0, 1).equals("2")) {
				System.out.println("SLM=" + number.substring(0, 1));
				return number.substring(0, 2);
			}

			if (number.substring(0, 2).equals("09")) {
				System.out.println("movil1");
				return number.substring(0, 2);
			}

			if (number.substring(0, 2).equals("02") || number.substring(0, 2).equals("03")
					|| number.substring(0, 2).equals("04") || number.substring(0, 2).equals("05")
					|| number.substring(0, 2).equals("06") || number.substring(0, 2).equals("07")) {
				System.out.println("LDN=" + number.substring(0, 3));
				return number.substring(0, 3);
			}

			if (number.substring(0, 1).equals("600")) {
				System.out.println("600=" + number.substring(0, 3));
				return number.substring(0, 3);
			}

			if (number.substring(0, 1).equals("8")) {
				System.out.println(" 800=" + number.substring(0, 3));
				return number.substring(0, 3);
			}
		} else {
			return null;
		}
		return null;
	}

	public static String getYearsActual() {
		Calendar cal = Calendar.getInstance();

		String annio = Integer.toString(cal.get(Calendar.YEAR));
		String month = Integer.toString(cal.get(Calendar.MONTH));
		String date = annio + "-" + month;
		return date;

	}

	public static String getPrimerDiaDelMes() {
		Calendar cal = Calendar.getInstance();
		cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH), cal.getActualMinimum(Calendar.DAY_OF_MONTH),
				cal.getMinimum(Calendar.HOUR_OF_DAY), cal.getMinimum(Calendar.MINUTE), cal.getMinimum(Calendar.SECOND));
		// return cal.getTime();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		// return cal.getTime();
		return formatter.format(cal.getTimeInMillis());
	}

	public static String getUltimoDiaDelMesAnterior() {
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.MONTH, -1);

		cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH), cal.getActualMaximum(Calendar.DAY_OF_MONTH),
				cal.getMaximum(Calendar.HOUR_OF_DAY), cal.getMaximum(Calendar.MINUTE), cal.getMaximum(Calendar.SECOND));
		// return cal.getTime();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		// return cal.getTime();
		return formatter.format(cal.getTimeInMillis());
	}

	public static String getPrimerDiaDelMesAnterior() {
		Calendar cal = Calendar.getInstance();
		cal.setLenient(true);
		cal.add(Calendar.MONTH, -1);

		cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH), cal.getActualMaximum(Calendar.DAY_OF_MONTH),
				cal.getMaximum(Calendar.HOUR_OF_DAY), cal.getMaximum(Calendar.MINUTE), cal.getMaximum(Calendar.SECOND));

		// format1=new java.text.SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-01");
		// return cal.getTime();
		return formatter.format(cal.getTimeInMillis());
	}

	public static String getPreviousDay() {
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, -1);
		Date date = cal.getTime();

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

		return formatter.format(date);
	}

	public static boolean isFechaValida(String fecha) {
		try {
			SimpleDateFormat formatoFecha = new SimpleDateFormat("dd/MM/yyyy");
			// formatoFecha.setLenient(false);
			System.out.println("Hello World!" + formatoFecha.parse(fecha));
			formatoFecha.parse(fecha);

		} catch (ParseException e) {
			return false;
		}
		return true;
	}

	public static boolean isFechaValida2(String fecha) {
		try {
			SimpleDateFormat formatoFecha = new SimpleDateFormat("yyyy-MM-dd");
			// formatoFecha.setLenient(false);
			System.out.println("Hello World!" + formatoFecha.parse(fecha));
			formatoFecha.parse(fecha);

		} catch (ParseException e) {
			return false;
		}
		return true;
	}

	/*
	 * public static String formatDay(String fecha) { String result = null;
	 * //04-APR-17 String day = fecha.substring(0, 2); String month =
	 * fecha.substring(3, 6); String year = fecha.substring(7, 9); //String date
	 * = day+"/"+month+"/"+year; String mont = null; //return date;
	 * //System.out.println(""+month); switch (month) { case "ENE": mont = "01";
	 * break; case "FEB": mont = "02"; break; case "MAR": mont = "03"; break;
	 * case "APR": mont = "04"; break; case "MAY": mont = "05"; break; case
	 * "JUN": mont = "06"; break; case "JUL": mont = "07"; break; case "AGO":
	 * mont = "08"; break; case "SEP": mont = "09"; break; case "OCT": mont =
	 * "10"; break; case "NOV": mont = "11"; break; case "DIC": mont = "12";
	 * break; default: result = null; } String date = day+"/"+mont+"/"+year;
	 * return date;
	 * 
	 * }
	 */

	public static String restarDiasFecha(String fechaCompromiso, String leadTimeTransport) {

		String date = null;
		SimpleDateFormat formatoDelTexto = new SimpleDateFormat("yyyy-MM");

		if ("0".equals(leadTimeTransport)) {
			date = "0";
		} else {
			if ("".equals(leadTimeTransport) || leadTimeTransport != null) {
				date = "-" + leadTimeTransport;
			} else {
				date = "0";
			}
		}

		Date fecha = null;
		try {

			fecha = formatoDelTexto.parse(fechaCompromiso);

		} catch (ParseException ex) {

			ex.printStackTrace();
		}

		Calendar calendar = Calendar.getInstance();
		calendar.setTime(fecha); // Configuramos la fecha que se recibe
		calendar.add(Calendar.MONTH, Integer.parseInt(date)); // numero de días
																// a añadir, o
																// restar en
																// caso de
																// días<0
		SimpleDateFormat formatoDeFecha = new SimpleDateFormat("yyyy-MM");
		return formatoDeFecha.format(calendar.getTime());
	}

	public static String restarDiasFecha2(String fechaCompromiso, String leadTimeTransport) {

		String date = null;
		SimpleDateFormat formatoDelTexto = new SimpleDateFormat("dd/MM/yyyy");

		if ("0".equals(leadTimeTransport)) {
			date = "0";
		} else {
			if ("".equals(leadTimeTransport) || leadTimeTransport != null) {
				date = "-" + leadTimeTransport;
			} else {
				date = "0";
			}
		}

		Date fecha = null;
		try {

			fecha = formatoDelTexto.parse(fechaCompromiso);

		} catch (ParseException ex) {

			ex.printStackTrace();
		}

		Calendar calendar = Calendar.getInstance();
		calendar.setTime(fecha); // Configuramos la fecha que se recibe
		calendar.add(Calendar.DAY_OF_MONTH, Integer.parseInt(date)); // numero
																		// de
																		// días
		// a añadir, o
		// restar en
		// caso de
		// días<0
		SimpleDateFormat formatoDeFecha = new SimpleDateFormat("dd/MM/yyyy");
		return formatoDeFecha.format(calendar.getTime());
	}

	public static String DeStringADate(String fecha) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String dateInString = fecha;

		try {

			if ("".equals(dateInString) || dateInString == null) {
				return dateInString  = "";
			} else {
				Date date = formatter.parse(dateInString);
				return dateInString = formatter.format(date);
				// System.out.println(date);
			}

			// Date date = formatter.parse(dateInString);
			// return formatter.format(date);
			// System.out.println(date);
			// System.out.println(formatter.format(date));

		} catch (ParseException e) {
			e.printStackTrace();
		}
		return dateInString;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 * System.out.println("" + turnDateEditPauta("2017-05-01"));
		 * 
		 * DecimalFormatSymbols simbolos = new DecimalFormatSymbols();
		 * simbolos.setDecimalSeparator('.'); // Imprime: 3.4324 DecimalFormat
		 * formateador = new DecimalFormat("###.###"); // Imprime: 68,44%
		 * System.out.println(formateador.format(6844));
		 * System.out.println(StringUtils.Redondear("111111", 3));
		 */
		/*
		 * //System.out.println(restarDiaExport("20/10/2017"));
		 * System.out.println(restarDiasFecha("2017-10","1"));
		 * 
		 * 
		 * Date dNow = new Date(); SimpleDateFormat ft = new SimpleDateFormat
		 * ("dd/MM/yyyy"); String currentDate = ft.format(dNow); String
		 * dateInicio = null; //String dateInicio = dateInicio;
		 * //out.println("dateInicio="+dateInicio); String starttime =
		 * DateUtils.turnDate(dateInicio) !=
		 * null?DateUtils.turnDate(dateInicio):DateUtils.turnDate(
		 * restarDiasFecha2(currentDate,"8")); String endtime =
		 * DateUtils.turnDate(dateInicio) !=
		 * null?DateUtils.turnDate(dateInicio):DateUtils.turnDate(currentDate);
		 * System.out.println("="+starttime); System.out.println("="+endtime);
		 * 
		 * 
		 * System.out.println(restarDiasFecha2(currentDate,"8"));
		 */

		String date = "2017-10-15";

		System.out.println("===" + turnDateExport(""));

		System.out.println("===" + DeStringADate("2017-07-13"));

		System.out.println("===" + DateUtils.turnDateExport(String.valueOf(DateUtils.DeStringADate("2017-07-13"))));
		
		
		// user:currentDate=20/10/2017
		// user:starttime=2017-10-20

		// user:dateInicio=20/10/2017
		// user:currentDate=20/10/2017
		// user:starttime=2017-10-20

	}

}
