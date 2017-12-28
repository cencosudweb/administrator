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

import com.cencosud.administrator.core.EstadoServices;
import com.cencosud.administrator.dto.users.EstadoDTO;

/**
 * @description Clase 
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/administrator-testContext.xml"})
@TransactionConfiguration(transactionManager="transactionManager", defaultRollback=false)
public class EstadoServicesTest{

	@Autowired
	private EstadoServices estadoServicesImpl;
	
	@Test
	@Transactional
    public void getEstadosTest() {
		
		List<EstadoDTO> estados = estadoServicesImpl.getEstados();
		
		assertNotNull("Listado de Estado es null", estados);
		assertFalse("No hay Estado", estados.isEmpty());
		
		
    }
	
	
	@Test
	@Transactional
    public void getEstadoIdsTest() {
		
		EstadoDTO estados = estadoServicesImpl.getEstadosId(new Long(1));
		
		assertNotNull("Listado de Estado es null", estados);
		
		
    }
	
	
}
