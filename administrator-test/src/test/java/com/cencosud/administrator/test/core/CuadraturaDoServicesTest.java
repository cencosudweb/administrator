package com.cencosud.administrator.test.core;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.cencosud.administrator.core.CuadraturaCtlServices;
import com.cencosud.administrator.dto.users.CuadraturaCtlDTO;

/**
 * @description Clase ChannelTest que implementa pruebas Unitarias
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/administrator-testContext.xml" })
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = false)
public class CuadraturaDoServicesTest {

	@Autowired
	private CuadraturaCtlServices cuadraturaCtlServicesImpl;

	//@Ignore
	@Test
	@Transactional
	public void getCuadraturaCtlTest() {
		
		Date dNow = new Date();
		SimpleDateFormat ft = new SimpleDateFormat ("dd/MM/yyyy");
		String currentDate = ft.format(dNow);
		String dateInicio = null;
		
		String starttime = turnDate(dateInicio) != null?turnDate(dateInicio):turnDate(currentDate);
		String endtime = turnDate(dateInicio) != null?turnDate(dateInicio):turnDate(currentDate);
		
		System.out.println("starttime="+starttime);
		System.out.println("endtime="+endtime);
		
		int carga = 0;
		int start = 0;
		int limit = 100000000;

		
		int estado = 0;
		String tipo = null;
		int tranNbr = 0;
		String bogeda = "12";
		List<CuadraturaCtlDTO> counts = cuadraturaCtlServicesImpl.getCuadraturaCtls(carga, bogeda, 0, starttime+" 00:00:00", endtime+" 23:59:59", tipo, tranNbr, estado, start, limit);
		assertNotNull("Listado de counts es null", counts);
		assertFalse("No hay counts", counts.isEmpty());

		
	}
	
	@Test
	@Transactional
	public void getEcommerceSoporteVentaCountTest() {
		Date dNow = new Date();
		SimpleDateFormat ft = new SimpleDateFormat ("dd/MM/yyyy");
		String currentDate = ft.format(dNow);
		String dateInicio = null;
		
		String starttime = turnDate(dateInicio) != null?turnDate(dateInicio):turnDate(currentDate);
		String endtime = turnDate(dateInicio) != null?turnDate(dateInicio):turnDate(currentDate);
		
		System.out.println("starttime="+starttime);
		System.out.println("endtime="+endtime);
		
		int carga = 0;
		
		
		int estado = 0;
		String tipo = null;
		int tranNbr = 0;
		String bogeda = "12";
		int counts = cuadraturaCtlServicesImpl.getCuadraturaCtlContar(carga, bogeda, 0, starttime+" 00:00:00", endtime+" 23:59:59", tipo, tranNbr, estado);
		assertNotNull("Listado de counts es null", counts);

	}
	
	public static String turnDate(String fecha) {

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

	
	
	

}
