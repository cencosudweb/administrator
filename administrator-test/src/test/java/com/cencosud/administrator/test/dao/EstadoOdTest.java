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

import com.cencosud.administrator.dao.EstadoOdDao;
import com.cencosud.administrator.dao.domain.EstadoOd;

/**
 * @description Clase ChannelTest que implementa pruebas Unitarias
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/administrator-testContext.xml"})
@TransactionConfiguration(transactionManager="transactionManager", defaultRollback=false)
public class EstadoOdTest{

	@Autowired
	private EstadoOdDao estadoOdDaoImpl;
	
	@Test
	@Transactional
    public void getEstadoOdsTest() {
		List<EstadoOd> estadoOds = estadoOdDaoImpl.getEstadoOds();
		assertNotNull("Listado de estado OD es null", estadoOds);
		assertFalse("No hay estado OD", estadoOds.isEmpty());
		/*for(int i=0; i<estadoOds.size(); i++){
			System.out.println(estadoOds.get(i).getId());
		}
		*/
    }
	
}
