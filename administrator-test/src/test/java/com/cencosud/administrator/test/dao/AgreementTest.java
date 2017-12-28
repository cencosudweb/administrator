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


import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import org.hibernate.exception.DataException;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.cencosud.administrator.dao.AgreementDao;
import com.cencosud.administrator.dao.domain.Agreement;

/**
 * @description Clase AgreementDao que implementa pruebas Unitarias
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/administrator-testContext.xml"})
@TransactionConfiguration(transactionManager="transactionManager", defaultRollback=false)
public class AgreementTest{

	@Autowired
	private AgreementDao agreementDaoImpl;
	/*
	@Test
	@Transactional(readOnly=false)
    public void addAgreementTest() {
		Agreement a = new Agreement();
		
		a.setEndDate(new Date().getTime() / 1000L);
		a.setAgreementId("A200");
		a.setInitDate(new Date().getTime() / 1000L);
		a.setTimeLimit(new TimeLimit(new Long(1)));
		
		Set<UrlCallback> urls = new HashSet<UrlCallback>();

		UrlCallback url = new UrlCallback();
		url.setChannel(new Channel(new Long(1)));
		url.setEndPath("m.lalala.cl?end=");
		url.setConfirmationPath("m.lalala.cl?conf=");
		urls.add(url);
		a.setUrls(urls);
		
		try{
			//intento insertar convenio
			agreementDaoImpl.addAgreement(a);
			
			//conpruebo que insercion es exitosa
			Agreement a_ = agreementDaoImpl.getAgreement(a.getId());
			assertNotNull("Convenio es null", a_);
			
			
			
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
    public void getAgreementTest() {

		try{
			
			Agreement a_ = agreementDaoImpl.getAgreement(new Long(1));
				
			System.out.println(a_.getUrls().iterator().next());
			
			assertNotNull("Agreement es null", a_);
			
			//assertFalse("No hay IF", FIs.isEmpty());
			
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
    public void updateStatusTest() {
		Long agreementId = new Long(1);
		try{
			agreementDaoImpl.updateStatus(agreementId, 0);
			assertTrue(true);
		}catch(Exception e){
			if(e instanceof DataException){
				Assert.fail(((DataException) e).getSQLException().getMessage());
			}else{
				Assert.fail(e.getMessage());
			}
		}
    }
	
	
	@Test
	@Transactional(readOnly=false)
    public void addIFComerceAgreementRelationshipTest() {
		

		try{
			agreementDaoImpl.addFIComerceAgreementRelationship(new Long(1), new Long(1), new Long(1));
			assertTrue(true);
		}catch(Exception e){
			if(e instanceof DataException){
				Assert.fail(((DataException) e).getSQLException().getMessage());
			}else{
				Assert.fail(e.getMessage());
			}
		}
    }
    
	
	
	@Test
	@Transactional(readOnly=false)
    public void validateAgreementExistTest() {
		

		try{
			boolean result = agreementDaoImpl.validateAgreementExist(new Long(1), new Long(1));
			assertTrue("Relacion con convenio no existe",result);
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
    public void editAgreementTest() {

		try{
			
			Agreement a = agreementDaoImpl.getAgreement(new Long(1));
			
			assertNotNull("Convenio es null", a);
			
			a.setAgreementId("A292");
			a.setTimeLimit(new TimeLimit(new Long(2)));
			
			Set<UrlCallback> urls = new HashSet<UrlCallback>();

			UrlCallback url = new UrlCallback();
			url.setChannel(new Channel(new Long(2)));
			url.setEndPath("m.lalala.cl?end=");
			url.setConfirmationPath("m.lalala.cl?conf=");
			url.setAgreementId(a.getId());
			
			urls.add(url);
			
			a.addUrls(urls);
			
			agreementDaoImpl.editAgreement(a);
			
			
		}catch(Exception e){
			if(e instanceof DataException){
				Assert.fail(((DataException) e).getSQLException().getMessage());
			}else{
				Assert.fail(e.getMessage());
			}
		}
    }
    */
    
	
}
