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

import com.cencosud.administrator.dao.BodegaCtlDao;
import com.cencosud.administrator.dao.domain.BodegaCtl;

/**
 * @description Clase ChannelTest que implementa pruebas Unitarias
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/administrator-testContext.xml"})
@TransactionConfiguration(transactionManager="transactionManager", defaultRollback=false)
public class BodegaCtlTest{

	@Autowired
	private BodegaCtlDao bodegaCtlDaoImpl;
	
	@Test
	@Transactional
    public void getBodegaCtlTest() {
		List<BodegaCtl> bodegas = bodegaCtlDaoImpl.getBodegaCtls();
		assertNotNull("Listado de bodegas ctl es null", bodegas);
		assertFalse("No hay bodegas ctl", bodegas.isEmpty());
		for(int i=0; i<bodegas.size(); i++){
			System.out.println(bodegas.get(i).getId());
		}
    }
	
}
