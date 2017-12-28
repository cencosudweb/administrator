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
import static org.junit.Assert.assertTrue;

import java.util.List;

import org.junit.Assert;
//import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.cencosud.administrator.core.GerenteServices;
import com.cencosud.administrator.dto.users.GerenteDTO;
import com.cencosud.administrator.dto.users.PadrinoDTO;
import com.cencosud.administrator.utils.OperationResult;


/**
 * @description Clase 
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/administrator-testContext.xml"})
@TransactionConfiguration(transactionManager="transactionManager", defaultRollback=false)
public class GerenteServicesTest{

	@Autowired
	private GerenteServices gerenteServicesImpl;
	
	//@Ignore
	@Test
	@Transactional
    public void getGerentesTest() {
		
		
		PadrinoDTO padrino = new PadrinoDTO(new Long(1));
		
		
		List<GerenteDTO> Gerentes = gerenteServicesImpl.getGerentes(padrino);
		
		assertNotNull("Listado de Gerentes es null", Gerentes);
		assertFalse("No hay canales", Gerentes.isEmpty());
		
		
    }
	
	
	
	
	//@Ignore
	@Test
	@Transactional
    public void deleteGerenteTest() {
		
		try{
			gerenteServicesImpl.deleteGerente(new Long(7));
			assertTrue(true);
		}catch(Exception e){
			Assert.fail(e.getMessage());
		}
    }
	
	
	//@Ignore
	@Test
	@Transactional(readOnly=false)
	public void addGerenteTest() {
		GerenteDTO gerente = new GerenteDTO();
		//Gerente.setId(new Long(1));
		gerente.setDescription("Test Gerente");
		
		
		PadrinoDTO tienda = new PadrinoDTO(new Long(1));
		gerente.setPadrino(tienda);
		
		try{
			gerenteServicesImpl.addGerente(gerente);
			assertTrue(true);
		}catch(Exception e){
			Assert.fail(e.getMessage());
		}
    }
	
	//@Ignore
	@Test
	@Transactional(readOnly=false)
    public void editGerenteTest() {
		GerenteDTO gerente = new GerenteDTO();
		gerente.setId(new Long(1));
		
		gerente.setDescription("Gerente 1");
		
		PadrinoDTO tienda = new PadrinoDTO(new Long (1));
		gerente.setPadrino(tienda);

		
		
		OperationResult result = gerenteServicesImpl.editGerente(gerente);

		assertNotNull("Resultado de modificacion de Gerente es nulo", result);
		assertTrue("Resultado de modificacion de Gerente falla", OperationResult.SUCCESS == result.getResult());
		
	}
	
		
}
