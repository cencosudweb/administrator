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

import com.cencosud.administrator.dao.EstadoCtlDao;
import com.cencosud.administrator.dao.domain.EstadoCtl;

/**
 * @description Clase ChannelTest que implementa pruebas Unitarias
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/administrator-testContext.xml"})
@TransactionConfiguration(transactionManager="transactionManager", defaultRollback=false)
public class EstadoCtlTest{

	@Autowired
	private EstadoCtlDao estadoCtlDaoImpl;
	
	@Test
	@Transactional
    public void getCommercesTest() {
		List<EstadoCtl> estadoCtls = estadoCtlDaoImpl.getEstadoCtls();
		assertNotNull("Listado de estado ctl es null", estadoCtls);
		assertFalse("No hay estado ctl", estadoCtls.isEmpty());
		for(int i=0; i<estadoCtls.size(); i++){
			System.out.println(estadoCtls.get(i).getId());
		}
    }
	
}
