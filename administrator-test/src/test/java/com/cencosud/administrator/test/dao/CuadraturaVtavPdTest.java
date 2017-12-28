package com.cencosud.administrator.test.dao;

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

import com.cencosud.administrator.dao.CuadraturaVtavPdDao;
import com.cencosud.administrator.dao.domain.CuadraturaVtavPd;

/**
 * @description Clase ChannelTest que implementa pruebas Unitarias
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/administrator-testContext.xml" })
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = false)
public class CuadraturaVtavPdTest {

	@Autowired
	private CuadraturaVtavPdDao cuadraturaVtavPdDaoImpl;
	
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
	

	//@Ignore
	@Test
	@Transactional
	public void getCumplimientokpiWebTest() {
		
		int tipo_venta = 0;
		int tipoNumeroDistribuicion = 0; 
		int horario = 0;
		
		Date now = new Date();
 		SimpleDateFormat ft = new SimpleDateFormat ("dd/MM/yyyy");
 		String iFechaFin = ft.format(now);
 		
 		
 		String starttime = turnDatePd(null) != null?turnDatePd(restarDiaFecha("05/12/2017","8")):turnDatePd(restarDiaFecha(iFechaFin,"8"));
		String endtime = turnDatePd(null) != null?turnDatePd(restarDiaFecha("05/12/2017","1")):turnDatePd(restarDiaFecha(iFechaFin,"1"));
		System.out.println("starttime="+starttime);
		System.out.println("endtime="+endtime);
		
		List<CuadraturaVtavPd> cuadraturaVtavPds = cuadraturaVtavPdDaoImpl.getCuadraturaVtavConPds(starttime+" 00:00:00", endtime+" 23:59:59", tipo_venta,  tipoNumeroDistribuicion,  horario);
		assertNotNull("Listado de cuadraturaVtavPds es null", cuadraturaVtavPds);
		assertFalse("No hay cuadraturaVtavPds", cuadraturaVtavPds.isEmpty());

		/*
		 for(int i=0; i<cuadraturaVtavPds.size(); i++){
			 System.out.println(cuadraturaVtavPds.get(i).getId()); 
		}
		*/
		
	}
	
	
	//@Ignore
	@Test
	@Transactional
	public void getEcommerceSoporteVentaCountTest() {
		//String starttime = "20170908";
		//String fechaTer = "20170908";
		int horario = 1;
		int tipo_numero_distribuicion = 1;
		int tipo_venta = 1;
		//String fechaIni = null;
		int calls = cuadraturaVtavPdDaoImpl.getCountConOd("06-11-2017 00:00:00", "13-11-2017 23:59:59", tipo_venta, tipo_numero_distribuicion, horario);

		assertNotNull("Cantidad de llamadas es null", calls);
		System.out.println("=" + calls);

	}
	
	

}
