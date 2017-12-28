/**
 *@name AgreementServicesTest.java
 * 
 *@version 1.0 
 * 
 *@date 07-03-2017
 * 
 *@author EA7129
 * 
 *@copyright Cencosud. All rights reserved.
 */
package com.cencosud.administrator.test.core;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.cencosud.administrator.core.CuadraturaVtavPdServices;
import com.cencosud.administrator.dto.users.CuadraturaVtavPdDTO;

/**
 * @description Clase
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/administrator-testContext.xml" })
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = false)
public class CuadraturaVtavPdServicesTest {
	
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
	
	public static String turnDate3(String fecha) {

		if (fecha != null) {

			if (isFechaValida(fecha) == true) {
				if (fecha.isEmpty()) {
					return null;

				} else {

					// 18/04/2017
					String day = fecha.substring(0, 2);
					String month = fecha.substring(3, 5);
					String year = fecha.substring(6, 10);
					// String date = day+"/"+month+"/"+year;
					String date = day + "-" + month + "-" + year;

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
																		// des
																		// días<0
		SimpleDateFormat formatoDeFecha = new SimpleDateFormat("dd/MM/yyyy");
		return formatoDeFecha.format(calendar.getTime());
	}

	@Autowired
	private CuadraturaVtavPdServices cuadraturaVtavPdServicesImpl;

	@Test
	@Transactional
	public void getCuadraturaVtavPdsTest() {

		//String dateInicio =  dateInicio;
		//out.println("dateInicio="+dateInicio);
		//String starttime = DateUtils.turnDate(dateInicio) != null?DateUtils.turnDate(dateInicio):DateUtils.turnDate(DateUtils.restarDiasFecha2(currentDate,"9"));
		//String endtime = DateUtils.turnDate(dateInicio) != null?DateUtils.turnDate(dateInicio):DateUtils.turnDate(currentDate);
		int tipo_venta = 1;
		int tipoNumeroDistribuicion = 2;
		int horario = 2;
		
		Date now = new Date();
 		SimpleDateFormat ft = new SimpleDateFormat ("dd/MM/yyyy");
 		String iFechaFin = ft.format(now);
 		System.out.println("iFechaFin="+ iFechaFin);
		
		
		String starttime = turnDate3(iFechaFin) != null?turnDate3(restarDiaFecha(iFechaFin,"8")):turnDate3(restarDiaFecha(iFechaFin,"8"));
		String endtime = turnDate3(iFechaFin) != null?turnDate3(restarDiaFecha(iFechaFin,"1")):turnDate3(restarDiaFecha(iFechaFin,"1"));

		System.out.println("1="+turnDate3(restarDiaFecha(iFechaFin,"1")));
		System.out.println("2="+ turnDate3(iFechaFin));
		System.out.println("starttime="+starttime);
		System.out.println("endtime="+endtime);

		List<CuadraturaVtavPdDTO> cuadraturaVtavPds = cuadraturaVtavPdServicesImpl
				.getCuadraturaVtavConPds("06-11-2017 00:00:00", "13-11-2017 23:59:59", tipo_venta,  tipoNumeroDistribuicion,  horario);
		//List<CuadraturaVtavPdDTO> cuadraturaVtavPds = cuadraturaVtavPdServicesImp.getCuadraturaVtavConPds(starttime+" 00:00:00", endtime+" 23:59:59", tipo_venta,  tipoNumeroDistribuicion,  horario);

		assertNotNull("Listado de cuadraturaVtavPds es null", cuadraturaVtavPds);
		assertFalse("No hay cuadraturaVtavPds", cuadraturaVtavPds.isEmpty());

	}
	
	
	@Test
	@Transactional
	public void getCountOdTest() {
		
		Date now = new Date();
 		SimpleDateFormat ft = new SimpleDateFormat ("dd/MM/yyyy");
 		String iFechaFin = ft.format(now);
 		
		int horario = 2;
		int tipo_numero_distribuicion = 2;
		int tipo_venta = 1;
		String starttime = turnDate3(iFechaFin) != null?turnDate3(restarDiaFecha(iFechaFin,"8")):turnDate3(restarDiaFecha(iFechaFin,"8"));
		String endtime = turnDate3(iFechaFin) != null?turnDate3(restarDiaFecha(iFechaFin,"1")):turnDate3(restarDiaFecha(iFechaFin,"1"));
		
		int calls1 = cuadraturaVtavPdServicesImpl.getCountConOd(starttime+" 00:00:00", endtime+" 23:59:59", tipo_venta, tipo_numero_distribuicion, horario);
		int calls2 = cuadraturaVtavPdServicesImpl.getCountSinOd(starttime+" 00:00:00", endtime+" 23:59:59", tipo_venta, tipo_numero_distribuicion, horario);
		System.out.println("calls1="+calls1);
		System.out.println("calls2="+calls2);
		assertNotNull("Cantidad de llamadas es null", calls1);

	}

	

}
