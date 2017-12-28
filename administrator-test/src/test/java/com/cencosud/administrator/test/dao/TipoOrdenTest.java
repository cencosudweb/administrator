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

import com.cencosud.administrator.dao.TipoOrdenDao;
import com.cencosud.administrator.dao.domain.TipoOrden;

/**
 * 
 * @author Jose
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/administrator-testContext.xml"})
@TransactionConfiguration(transactionManager="transactionManager", defaultRollback=false)
public class TipoOrdenTest{

	@Autowired
	private TipoOrdenDao TipoOrdenDaoImpl;
	
	@Test
	@Transactional
    public void getTipoOrdenTest() {
		List<TipoOrden> TipoOrdens = TipoOrdenDaoImpl.getTipoOrdens();
		assertNotNull("Listado de TipoOrden es null", TipoOrdens);
		assertFalse("No hay TipoOrden", TipoOrdens.isEmpty());
		
    }
	
}
