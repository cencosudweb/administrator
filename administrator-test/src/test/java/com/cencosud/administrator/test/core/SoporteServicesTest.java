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

import com.cencosud.administrator.core.SoporteServices;
import com.cencosud.administrator.dto.users.SoporteDTO;
import com.cencosud.administrator.dto.users.ContratanteDTO;
import com.cencosud.administrator.utils.OperationResult;


/**
 * @description Clase 
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/administrator-testContext.xml"})
@TransactionConfiguration(transactionManager="transactionManager", defaultRollback=false)
public class SoporteServicesTest{

	@Autowired
	private SoporteServices SoporteServicesImpl;
	
	//@Ignore
	@Test
	@Transactional
    public void getSoportesTest() {
		
		
		ContratanteDTO Contratante = new ContratanteDTO(new Long(1));
		
		
		List<SoporteDTO> Soportes = SoporteServicesImpl.getSoportes(Contratante);
		
		assertNotNull("Listado de Soportes es null", Soportes);
		assertFalse("No hay canales", Soportes.isEmpty());
		
		
    }
	
	
	
	
	//@Ignore
	@Test
	@Transactional
    public void deleteSoporteTest() {
		
		try{
			SoporteServicesImpl.deleteSoporte(new Long(7));
			assertTrue(true);
		}catch(Exception e){
			Assert.fail(e.getMessage());
		}
    }
	
	
	//@Ignore
	@Test
	@Transactional(readOnly=false)
	public void addSoporteTest() {
		SoporteDTO Soporte = new SoporteDTO();
		//Soporte.setId(new Long(1));
		Soporte.setDescription("Test Soporte");
		
		
		ContratanteDTO contraparte = new ContratanteDTO(new Long(1));
		Soporte.setContraparte(contraparte);
		
		try{
			SoporteServicesImpl.addSoporte(Soporte);
			assertTrue(true);
		}catch(Exception e){
			Assert.fail(e.getMessage());
		}
    }
	
	//@Ignore
	@Test
	@Transactional(readOnly=false)
    public void editSoporteTest() {
		SoporteDTO Soporte = new SoporteDTO();
		Soporte.setId(new Long(1));
		
		Soporte.setDescription("Soporte 1");
		
		ContratanteDTO contraparte = new ContratanteDTO(new Long (1));
		Soporte.setContraparte(contraparte);

		
		
		OperationResult result = SoporteServicesImpl.editSoporte(Soporte);

		assertNotNull("Resultado de modificacion de Soporte es nulo", result);
		assertTrue("Resultado de modificacion de Soporte falla", OperationResult.SUCCESS == result.getResult());
		
	}
	
		
}
