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

import com.cencosud.administrator.dao.TipoVentaDao;
import com.cencosud.administrator.dao.domain.TipoVenta;

/**
 * 
 * @author Jose
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/administrator-testContext.xml"})
@TransactionConfiguration(transactionManager="transactionManager", defaultRollback=false)
public class TipoVentaTest{

	@Autowired
	private TipoVentaDao TipoVentanDaoImpl;
	
	@Test
	@Transactional
    public void getTipoVentanTest() {
		List<TipoVenta> TipoVentans =TipoVentanDaoImpl.getTipoVentas();
		assertNotNull("Listado de canales es null", TipoVentans);
		assertFalse("No hay canales", TipoVentans.isEmpty());
		
    }
	
}
