package com.cencosud.administrator.test.dao;

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

import com.cencosud.administrator.dao.CumplimientoDao;
import com.cencosud.administrator.dao.domain.Cumplimiento;

/**
 * @description Clase ChannelTest que implementa pruebas Unitarias
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/administrator-testContext.xml" })
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = false)
public class CumplimientoTest {

	@Autowired
	private CumplimientoDao cumplimientoDaoImpl;

	//@Ignore
	@Test
	@Transactional
	public void getCumplimientokpiWebTest() {
		List<Cumplimiento> cumplimientokpiWebs = cumplimientoDaoImpl.getCumplimientos("2017-10-12", "2017-10-20");
		assertNotNull("Listado de cumplimientokpiWebs es null", cumplimientokpiWebs);
		assertFalse("No hay cumplimientokpiWebs", cumplimientokpiWebs.isEmpty());

		/*
		 * for(int i=0; i<cumplimientokpiWebs.size(); i++){
		 * System.out.println(cumplimientokpiWebs.get(i).getId()); }
		 */
	}
	
	

}
