/**
 *@name UserDaoImpl.java
 * 
 *@version 1.0 
 * 
 *@date 07-03-2017
 * 
 *@author EA7129
 * 
 *@copyright Cencosud. All rights reserved.
 */
package com.cencosud.administrator.test.dao;


import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

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

//import com.cencosud.administrator.core.enums.StatusEnum;
import com.cencosud.administrator.dao.CommerceDao;
import com.cencosud.administrator.dao.domain.Commerce;

/**
 * @description Clase CommerceTest que implementa pruebas Unitarias
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/administrator-testContext.xml"})
@TransactionConfiguration(transactionManager="transactionManager", defaultRollback=false)
public class CommerceTest{

	@Autowired
	private CommerceDao commerceDaoImpl;
	
	@Test
	@Transactional
    public void getCommercesTest() {
		List<Commerce> commerces = commerceDaoImpl.getCommerces(2);
		assertNotNull("Listado de comercios es null", commerces);
		assertFalse("No hay comercios", commerces.isEmpty());
		
    }
	
	@Test
	@Transactional
    public void getCommerceTest() {
		Long commerceId = new Long(2);
		try{
			Commerce commerce = commerceDaoImpl.getCommerce(commerceId);
			
			assertNotNull("Comercio es null", commerce);
			assertTrue("Comercio no valido", commerce.getId() == commerceId);
			
			
			assertNotNull("Activdad economica de comercio es null", commerce.getEconomicAcivity());
			
		}catch(Exception e){
			if(e instanceof DataException){
				Assert.fail(((DataException) e).getSQLException().getMessage());
			}else{
				Assert.fail(e.getMessage());
			}
		}
    }
	/*
	@Test
	@Transactional
    public void editCommerceTest() {
		Commerce commerce = commerceDaoImpl.getCommerce(new Long(1));
		
		commerce.setMnemonic("ZZZ");
		commerce.setActivationDate(new Date().getTime() / 1000L);
		
		EconomicActivity eA = new EconomicActivity();
		eA.setId(new Long(1));
		
		commerce.setEconomicAcivity(eA);
		
		
		try{
			commerceDaoImpl.editCommerce(commerce);
			assertTrue(true);
		}catch(Exception e){
			if(e instanceof DataException){
				Assert.fail("Data -> " + ((DataException) e).getSQLException().getMessage());
			}else{
				Assert.fail("Other -> " + e.getMessage());
			}
		}
    }
	@Test
	@Transactional
    public void deleteCommerceTest() {
		Long commerceId = new Long(1);
		try{
			
			commerceDaoImpl.deleteCommerce(commerceId);
			
			assertTrue(true);
			
		}catch(Exception e){
			if(e instanceof DataException){
				Assert.fail(((DataException) e).getSQLException().getMessage());
			}else{
				Assert.fail(e.getMessage());
			}
		}
    }
	*/
	@Test
	@Transactional
    public void updateStatusTest() {
		Long commerceId = new Long(1);
		try{
			commerceDaoImpl.updateStatus(commerceId, 0);
			assertTrue(true);
		}catch(Exception e){
			if(e instanceof DataException){
				Assert.fail(((DataException) e).getSQLException().getMessage());
			}else{
				Assert.fail(e.getMessage());
			}
		}
    }
	/*
	@Test
	@Transactional(readOnly=false)
    public void addCommerceTest() {
		Commerce commerce = new Commerce();
		
		commerce.setActivationDate(new Date().getTime() / 1000L);
		commerce.setBusinessLine("Venta de casitas");
		commerce.setMnemonic("BTK");
		commerce.setRut("80200100-2");
		
		EconomicActivity eA = new EconomicActivity();
		eA.setId(new Long(1));
		
		commerce.setEconomicAcivity(eA);
		

		try{
			commerceDaoImpl.addCommerce(commerce);
			assertTrue(true);
		}catch(Exception e){
			if(e instanceof DataException){
				Assert.fail(((DataException) e).getSQLException().getMessage());
			}else{
				Assert.fail(e.getMessage());
			}
		}
    }
    */
	
	@Test
	@Transactional
    public void getCommerceByMnemonicTest() {

		try{
			
			Commerce c_ = commerceDaoImpl.getCommerceByMnemonic("CCS");
				
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
			
			Commerce c_ = commerceDaoImpl.getCommerceByRut("6545553-6");
				
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