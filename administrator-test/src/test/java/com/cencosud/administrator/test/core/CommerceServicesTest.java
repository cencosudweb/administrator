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

import java.util.Date;
import java.util.List;

import org.hibernate.exception.DataException;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.cencosud.administrator.core.CommerceServices;
import com.cencosud.administrator.core.enums.StatusEnum;
import com.cencosud.administrator.dto.users.CommerceDTO;
import com.cencosud.administrator.utils.OperationResult;

/**
 * @description Clase 
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/administrator-testContext.xml"})
@TransactionConfiguration(transactionManager="transactionManager", defaultRollback=false)
public class CommerceServicesTest{

	@Autowired
	private CommerceServices commerceServicesImpl;
	
	
	@Test
	@Transactional
    public void getCommerceTest() {
		
		//Long commerceExist = new Long(2);
		Long commerceExist = new Long(1);
		
		
		CommerceDTO commerce = commerceServicesImpl.getCommerce(commerceExist);
		
		assertNotNull("Comercio es null", commerce);
		assertTrue("Comercio no valido", commerce.getId() == commerceExist);
		
    }
	
	
	
	@Test
	@Transactional
    public void getCommercesTest() {
		
		List<CommerceDTO> commerces = commerceServicesImpl.getCommerces(StatusEnum.UNBLOCKED_COMMERCE.getCode());
		
		assertNotNull("Listado de comercios es null", commerces);
		assertFalse("No hay roles", commerces.isEmpty());
		
    }
	
	
	@Test
	@Transactional
    public void editUserTest() {
		
		CommerceDTO commerce = new CommerceDTO();
		commerce.setId(new Long(1));
		commerce.setMnemonic("ZZZ");
		commerce.setActivationDate(new Date());
		
		OperationResult result = commerceServicesImpl.editCommerce(commerce);
		
		assertNotNull("Resultado de modificacion de comercio es nulo", result);
		assertTrue("Resultado de modificacion de comercio falla", OperationResult.SUCCESS == result.getResult());
		
	}
	/*
	@Test
	@Transactional(readOnly=false)
    public void addCommerceTest() {
		
		CommerceDTO commerce = new CommerceDTO();
		
		commerce.setActivationDate(new Date());
		commerce.setBusinessLine("Venta de casitas2");
		commerce.setMnemonic("BTK");
		commerce.setRut("80200100-2");
		
		EconomicActivityDTO eA = new EconomicActivityDTO();
		eA.setId(new Long(1));
		
		commerce.setEconomicAcivity(eA);
		
		OperationResult result = commerceServicesImpl.addCommerce(commerce);
		
		assertNotNull("Resultado de insercion de comercio es nulo", result);
		assertTrue("Resultado de insercion de comercio falla", OperationResult.SUCCESS == result.getResult());
		
    }
    */
	
	@Test
	@Transactional
    public void getCommerceByMnemonicTest() {

		try{
			
			CommerceDTO c_ = commerceServicesImpl.getCommerceByMnemonic("ZZZ");
				
			assertNotNull("Comercio es null para nemotecnico dado", c_);
			
		}catch(Exception e){
			if(e instanceof DataException){
				Assert.fail(((DataException) e).getSQLException().getMessage());
			}else{
				Assert.fail(e.getMessage());
			}
		}
    }
	
	@Test
	@Transactional
    public void getCommerceByRutTest() {

		try{
			
			CommerceDTO c_ = commerceServicesImpl.getCommerceByRut("9820490-3");
				
			assertNotNull("Comercio es null para rut dado", c_);
			
		}catch(Exception e){
			if(e instanceof DataException){
				Assert.fail(((DataException) e).getSQLException().getMessage());
			}else{
				Assert.fail(e.getMessage());
			}
		}
    }
	
}
