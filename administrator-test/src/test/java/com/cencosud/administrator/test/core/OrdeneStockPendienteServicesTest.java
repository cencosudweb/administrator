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
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.cencosud.administrator.core.OrdeneStockPendienteServices;
import com.cencosud.administrator.dto.users.OrdeneStockPendienteDTO;

/**
 * @description Clase 
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/administrator-testContext.xml"})
@TransactionConfiguration(transactionManager="transactionManager", defaultRollback=false)
public class OrdeneStockPendienteServicesTest{

	@Autowired
	private OrdeneStockPendienteServices ordeneStockPendienteServicesImpl;
	
	@Test
	@Transactional
    public void getOrdeneStockPendientesTest() {
		
		int limit = 1000000000;
		int start = 0;

		String pedido = null;
		int orden = 0;
		String nroDeLinea = null;
		//String statCode = null;
		String cantidadPendiente = null;
		String bodega = null;
		String doDtlStatus = null;
		String tipoOrden = null;
		int estado = 0;
		
		Date dNow = new Date();
		SimpleDateFormat ft = new SimpleDateFormat ("dd/MM/yyyy");
		String currentDate = ft.format(dNow);
		String dateInicio = "19/12/2017";
		//String dateInicio =  dateInicio;
		//out.println("dateInicio="+dateInicio);
		//String starttime = turnDate(dateInicio) != null?turnDate(dateInicio):turnDate(currentDate);
		//String endtime = turnDate(dateInicio) != null?turnDate(dateInicio):turnDate(currentDate);
		String starttime = turnDate(dateInicio) != null?turnDate(dateInicio):turnDate(currentDate);
		String endtime = turnDate(dateInicio) != null?turnDate(dateInicio):turnDate(currentDate);
		
		//out.println("starttime"+starttime);

		System.out.println("starttime="+starttime);
		System.out.println("endtime="+endtime);
		
		List<OrdeneStockPendienteDTO> ordenes = ordeneStockPendienteServicesImpl.getOrdeneStockPendientes(starttime+" 00:00:00", endtime+" 23:59:59", 0, null, null, null, null, null, null, null, 0, "NO", 0, 1000000000);
		
		assertNotNull("Listado de ordenes es null", ordenes);
		assertFalse("No hay ordenes", ordenes.isEmpty());
		
		
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
	
}
