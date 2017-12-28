/**
 *@name FinancialInstitutionTest.java
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

import java.util.Date;

import org.hibernate.exception.DataException;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.cencosud.administrator.dao.FinancialInstitutionDao;
//import com.cencosud.administrator.dao.UserDao;
import com.cencosud.administrator.dao.domain.FinancialInstitution;

/**
 * @description Clase FinancialInstitutionTest que implementa pruebas Unitarias
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/administrator-testContext.xml"})
@TransactionConfiguration(transactionManager="transactionManager", defaultRollback=false)
public class FinancialInstitutionTest{

	@Autowired
	private FinancialInstitutionDao financialInstitutionDaoImpl;
	
	//@Autowired
	//private UserDao userDaoImpl;
	/*
	@Test
	@Transactional(readOnly=false)
    public void addFITest() {
		FinancialInstitution fi = new FinancialInstitution();
		
		fi.setActivationDate(new Date().getTime() / 1000L);
		fi.setBusinessLine("Banca movil");
		fi.setMnemonic("BTK");
		fi.setRut("80200100-2");
		
		
		User user = userDaoImpl.getUser("admin");
		
		Set<User> users = new HashSet<User>();

		users.add(user);
		
		fi.setUsers(users);
		

		try{
			financialInstitutionDaoImpl.addFI(fi);
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
    public void editFiTest() {
		FinancialInstitution fi = new FinancialInstitution();
		
		fi.setActivationDate(new Date().getTime() / 1000L);
		fi.setBusinessLine("Banco de Chile");
		fi.setMnemonic("BCHL");
		fi.setActivationDate(new Long(1366721511));
		fi.setStatus(0);
		fi.setInvocationPath("-");
		fi.setRut("8394623-7");
		fi.setId(new Long(3));
		
		try{
			financialInstitutionDaoImpl.editFI(fi);
			assertTrue(true);
		}catch(Exception e){
			if(e instanceof DataException){
				Assert.fail("Data -> " + ((DataException) e).getSQLException().getMessage());
			}else{
				Assert.fail("Other -> " + e.getMessage());
			}
		}
		
    }
	/*
	@Test
	@Transactional
    public void getFIsTest() {
		List<FinancialInstitution> FIs = financialInstitutionDaoImpl.getFIs(1);
		assertNotNull("Listado de IF es null", FIs);
		assertFalse("No hay IF", FIs.isEmpty());
		
    }
    */
	
	@Test
	@Transactional
    public void updateStatusTest() {
		Long fisId = new Long(1);
		try{
			financialInstitutionDaoImpl.updateStatus(fisId, 0);
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
	@Transactional
    public void deleteUserTest() {
		Long fiID = new Long(3);
		try{
			financialInstitutionDaoImpl.deleteFI(fiID);
			assertTrue(true);
		}catch(Exception e){
			Assert.fail(e.getMessage());
		}
    }
	
	@Test
	@Transactional(readOnly=false)
    public void crudFITest() {
		FinancialInstitution fi = new FinancialInstitution();
		
		fi.setActivationDate(new Date().getTime() / 1000L);
		fi.setBusinessLine("Banca WEB");
		fi.setMnemonic("BTK");
		fi.setRut("80200100-3");

		try{
			financialInstitutionDaoImpl.addFI(fi);
			
			FinancialInstitution fi_ = financialInstitutionDaoImpl.getFI(fi.getId());
				
			fi_.setBusinessLine("Banca WEB_up");
			
			financialInstitutionDaoImpl.editFI(fi_);
			
			financialInstitutionDaoImpl.deleteFI(fi_.getId());
			
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
    public void getFITest() {

		try{
			
			FinancialInstitution fi_ = financialInstitutionDaoImpl.getFI(new Long(1));
				
			assertNotNull("IF es null", fi_);
			
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
    public void getFIByMnemonicTest() {

		try{
			
			FinancialInstitution fi_ = financialInstitutionDaoImpl.getFIByMnemonic("BSTR");
				
			assertNotNull("IF es null para nemotecnico dado", fi_);
			
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
    public void getFIByRutTest() {

		try{
			
			FinancialInstitution fi_ = financialInstitutionDaoImpl.getFIByRut("99887766");
				
			assertNotNull("IF es null para rut dado", fi_);
			
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
