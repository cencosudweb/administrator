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

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.cencosud.administrator.core.CumplimientoServices;
import com.cencosud.administrator.dto.users.CumplimientoDTO;
//import com.cencosud.administrator.web.utils.DateUtils;
/**
 * @description Clase
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/administrator-testContext.xml" })
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = false)
public class CumplimientoServicesTest {

	@Autowired
	private CumplimientoServices cumplimientoServicesImpl;

	@Test
	@Transactional
	public void getCumplimientokpiWebsTest() {

		//Date dNow = new Date();
		//SimpleDateFormat ft = new SimpleDateFormat ("dd/MM/yyyy");
		//String currentDate = ft.format(dNow);
		//String dateInicio = null;
		//String dateInicio =  dateInicio;
		//out.println("dateInicio="+dateInicio);
		//String starttime = DateUtils.turnDate(dateInicio) != null?DateUtils.turnDate(dateInicio):DateUtils.turnDate(DateUtils.restarDiasFecha2(currentDate,"9"));
		//String endtime = DateUtils.turnDate(dateInicio) != null?DateUtils.turnDate(dateInicio):DateUtils.turnDate(currentDate);
		String starttime = "2017-10-12";
		String endtime = "2017-10-20";

		System.out.println("="+starttime);
		System.out.println("="+endtime);
		

		List<CumplimientoDTO> cumplimientokpiWebs = cumplimientoServicesImpl
				.getCumplimientos(starttime+" 00:00:00", endtime+" 23:59:59");

		assertNotNull("Listado de CumplimientokpiWeb es null", cumplimientokpiWebs);
		assertFalse("No hay CumplimientokpiWeb", cumplimientokpiWebs.isEmpty());

	}

	

}
