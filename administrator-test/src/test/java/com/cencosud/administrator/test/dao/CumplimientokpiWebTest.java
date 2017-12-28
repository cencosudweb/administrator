package com.cencosud.administrator.test.dao;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.cencosud.administrator.dao.CumplimientoKpiWebDao;
import com.cencosud.administrator.dao.domain.CumplimientokpiWeb;

/**
 * @description Clase ChannelTest que implementa pruebas Unitarias
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/administrator-testContext.xml" })
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = false)
public class CumplimientokpiWebTest {

	@Autowired
	private CumplimientoKpiWebDao cumplimientokpiWebDaoImpl;

	@Ignore
	@Test
	@Transactional
	public void getCumplimientokpiWebTest() {
		List<CumplimientokpiWeb> cumplimientokpiWebs = cumplimientokpiWebDaoImpl.getCumplimientoKpiWebs("2017-06-01", "2017-06-01");
		assertNotNull("Listado de cumplimientokpiWebs es null", cumplimientokpiWebs);
		assertFalse("No hay cumplimientokpiWebs", cumplimientokpiWebs.isEmpty());

		/*
		 * for(int i=0; i<cumplimientokpiWebs.size(); i++){
		 * System.out.println(cumplimientokpiWebs.get(i).getId()); }
		 */
	}
	
	@Ignore
	@Test
	@Transactional
	public void getEcommerceSoporteVentaCountTest() {
		int calls = cumplimientokpiWebDaoImpl.getCumplimientokpiWebCounts(	"2017-06-01", "2017-06-01", null, null, null, null);

		assertNotNull("Cantidad de kpiweb  es null", calls);
		System.out.println("=" + calls);

	}
	
	
	//@Ignore
	@Test
	@Transactional
	public void getCumpleokpiWebCounts() {
		String orden = null;
		String tipo_orden = "111";
		
		if (!"".equals(tipo_orden)) {
			System.out.println("ok");
			orden = tipo_orden;
		} else {
			System.out.println("no ok");
			orden = null;
		}
		
		
		int calls = cumplimientokpiWebDaoImpl.getCumpleokpiWebCounts("2017-10-02", "2017-10-02", orden, null, null, "1", null);
		assertNotNull("Cantidad de kpiweb  es null", calls);
		System.out.println("=" + calls);

	}
	
	//@Ignore
		@Test
		@Transactional
		public void getTotalkpiWebCounts() {
			int calls = cumplimientokpiWebDaoImpl.getTotalkpiWebCounts("2017-10-02", "2017-10-02", null, null, null, null, null);
			assertNotNull("Total Cantidad de kpiweb  es null", calls);
			System.out.println("=" + calls);
		}

}
