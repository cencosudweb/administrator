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

import com.cencosud.administrator.core.ContratanteServices;
import com.cencosud.administrator.dto.users.ContratanteDTO;
import com.cencosud.administrator.dto.users.GerenteDTO;
import com.cencosud.administrator.utils.OperationResult;


/**
 * @description Clase 
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/administrator-testContext.xml"})
@TransactionConfiguration(transactionManager="transactionManager", defaultRollback=false)
public class ContratanteServicesTest{

	@Autowired
	private ContratanteServices contratanteServicesImpl;
	
	//@Ignore
	@Test
	@Transactional
    public void getContratantesTest() {
		
		
		GerenteDTO gerente = new GerenteDTO(new Long(1));
		
		
		List<ContratanteDTO> Contratantes = contratanteServicesImpl.getContratantes(gerente);
		
		assertNotNull("Listado de Contratantes es null", Contratantes);
		assertFalse("No hay canales", Contratantes.isEmpty());
		
		
    }
	
	
	
	
	//@Ignore
	@Test
	@Transactional
    public void deleteContratanteTest() {
		
		try{
			contratanteServicesImpl.deleteContratante(new Long(7));
			assertTrue(true);
		}catch(Exception e){
			Assert.fail(e.getMessage());
		}
    }
	
	
	//@Ignore
	@Test
	@Transactional(readOnly=false)
	public void addContratanteTest() {
		ContratanteDTO contratante = new ContratanteDTO();
		//Contratante.setId(new Long(1));
		contratante.setDescription("Test Contratante");
		
		
		GerenteDTO gerente = new GerenteDTO(new Long(1));
		contratante.setGerente(gerente);
		
		try{
			contratanteServicesImpl.addContratante(contratante);
			assertTrue(true);
		}catch(Exception e){
			Assert.fail(e.getMessage());
		}
    }
	
	//@Ignore
	@Test
	@Transactional(readOnly=false)
    public void editContratanteTest() {
		ContratanteDTO contratante = new ContratanteDTO();
		contratante.setId(new Long(1));
		
		contratante.setDescription("Contratante 1");
		
		GerenteDTO gerente = new GerenteDTO(new Long (1));
		contratante.setGerente(gerente);

		
		
		OperationResult result = contratanteServicesImpl.editContratante(contratante);

		assertNotNull("Resultado de modificacion de Contratante es nulo", result);
		assertTrue("Resultado de modificacion de Contratante falla", OperationResult.SUCCESS == result.getResult());
		
	}
	
		
}
