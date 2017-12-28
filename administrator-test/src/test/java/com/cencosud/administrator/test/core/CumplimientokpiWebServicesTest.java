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

import java.text.DecimalFormat;
import java.util.List;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.cencosud.administrator.core.CumplimientokpiWebServices;
import com.cencosud.administrator.dto.users.CumplimientokpiWebDTO;

/**
 * @description Clase
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/administrator-testContext.xml" })
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = false)
public class CumplimientokpiWebServicesTest {

	@Autowired
	private CumplimientokpiWebServices cumplimientokpiWebServicesImpl;

	@Ignore
	@Test
	@Transactional
	public void getCumplimientokpiWebsTest() {

		List<CumplimientokpiWebDTO> cumplimientokpiWebs = cumplimientokpiWebServicesImpl
				.getCumplimientokpiWebs("2017-05-31", "2017-05-31");

		assertNotNull("Listado de CumplimientokpiWeb es null", cumplimientokpiWebs);
		assertFalse("No hay CumplimientokpiWeb", cumplimientokpiWebs.isEmpty());

	}

	@Ignore
	@Test
	@Transactional
	public void getCumplimientokpiWebCounts() {
		// String fecha = "2017-08-21";
		int count = cumplimientokpiWebServicesImpl.getCumplimientokpiWebCounts("2017-06-01", "2017-06-01", null, null,
				null, null);
		assertNotNull("Cantidad de registros en null", count);
		System.out.println("Cantidad: " + count);

	}

	//@Ignore
	@Test
	@Transactional
	public void getCumpleokpiWebCountsTest() {
		// String fecha = "2017-08-21";
		int count = cumplimientokpiWebServicesImpl.getCumpleokpiWebCounts("2017-10-19", "2017-10-19", null, null, null,
				"1", null);

		assertNotNull("Cantidad de registros en null", count);
		System.out.println("Cantidad: " + count);

	}

	@Ignore
	@Test
	@Transactional
	public void getTotalkpiWebCounts() {
		int count = cumplimientokpiWebServicesImpl.getTotalkpiWebCounts("2017-10-18", "2017-10-18", null, null, null,
				null, null);
		assertNotNull("Total Cantidad de kpiweb  es null", count);
		System.out.println("Total=" + count);
	}
	
	@Ignore
	@Test
	@Transactional
	public void getCumplimientokpiWebPorcentaje() {
		//String fecha = "2017-08-21";
		int count = cumplimientokpiWebServicesImpl.getCumpleokpiWebCounts("2017-10-02", "2017-10-02", null, null, null,
				"3", null);
		int count2 = cumplimientokpiWebServicesImpl.getTotalkpiWebCounts("2017-10-02", "2017-10-02", null, null, null,
				null, null);
		
		
		
		float resultTotal = 0;
		if (count == 0 && count2 == 0) {
			System.out.println("-");
			resultTotal = 0;
		} else {
			resultTotal = ((float ) ( (float ) count / (float )count2) * 100);
			DecimalFormat df = new DecimalFormat("0.00"); 
			System.out.println("->"+df.format(resultTotal));
		}
		
		
		assertNotNull("Porcentaje de registros en null", resultTotal);
		System.out.println("Porcentaje: " + resultTotal);

	}

}
