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

import com.cencosud.administrator.core.PadrinoServices;
import com.cencosud.administrator.dto.users.PadrinoDTO;
import com.cencosud.administrator.dto.users.TiendaDTO;
import com.cencosud.administrator.utils.OperationResult;


/**
 * @description Clase 
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/administrator-testContext.xml"})
@TransactionConfiguration(transactionManager="transactionManager", defaultRollback=false)
public class PadrinoServicesTest{

	@Autowired
	private PadrinoServices padrinoServicesImpl;
	
	//@Ignore
	@Test
	@Transactional
    public void getPadrinosTest() {
		TiendaDTO tienda = new TiendaDTO(new Long(1));
		List<PadrinoDTO> padrinos = padrinoServicesImpl.getPadrinos(tienda);
		
		assertNotNull("Listado de padrinos es null", padrinos);
		assertFalse("No hay canales", padrinos.isEmpty());
		
		
    }
	
	
	@Test
	@Transactional
    public void getPadrinDescosTest() {
		List<PadrinoDTO> padrinos = padrinoServicesImpl.getPadrinoDescs("Jose Luis (Externo - Empresa: ACL) Garrido");
		
		assertNotNull("Listado de padrinos es null", padrinos);
		assertFalse("No hay canales", padrinos.isEmpty());
		
		
    }
	
	
	
	
	//@Ignore
	@Test
	@Transactional
    public void deletePadrinoTest() {
		
		try{
			padrinoServicesImpl.deletePadrino(new Long(7));
			assertTrue(true);
		}catch(Exception e){
			Assert.fail(e.getMessage());
		}
    }
	
	
	//@Ignore
	@Test
	@Transactional(readOnly=false)
	public void addPadrinoTest() {
		PadrinoDTO padrino = new PadrinoDTO();
		//padrino.setId(new Long(1));
		padrino.setDescription("Test Padrino");
		
		
		TiendaDTO tienda = new TiendaDTO(new Long(1));
		padrino.setTienda(tienda);
		
		try{
			padrinoServicesImpl.addPadrino(padrino);
			assertTrue(true);
		}catch(Exception e){
			Assert.fail(e.getMessage());
		}
    }
	
	//@Ignore
	@Test
	@Transactional(readOnly=false)
    public void editPadrinoTest() {
		PadrinoDTO padrino = new PadrinoDTO();
		padrino.setId(new Long(1));
		
		padrino.setDescription("Padrino 1");
		
		TiendaDTO tienda = new TiendaDTO(new Long (1));
		padrino.setTienda(tienda);

		
		OperationResult result = padrinoServicesImpl.editPadrino(padrino);

		assertNotNull("Resultado de modificacion de padrino es nulo", result);
		assertTrue("Resultado de modificacion de padrino falla", OperationResult.SUCCESS == result.getResult());
		
	}
	
	
	@Test
	@Transactional
    public void getPadrinoByDescrioptionTest() {
		String description = "Jose Luis (Externo - Empresa: ACL) Garrido";
		try{
			PadrinoDTO padrino = padrinoServicesImpl.getPadrino(description);
			
			assertNotNull("Padrino es null", padrino);
			assertTrue("Padrino no valido", padrino.equals(padrino.getDescription()));
			
			assertTrue(true);
		}catch(Exception e){
			Assert.fail(e.getMessage());
		}
    }
	
		
}
