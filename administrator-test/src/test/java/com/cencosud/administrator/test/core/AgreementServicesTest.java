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

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import org.hibernate.exception.DataException;
import org.junit.Assert;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.cencosud.administrator.core.AgreementServices;
import com.cencosud.administrator.dto.users.AgreementDTO;

/**
 * @description Clase 
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/administrator-testContext.xml"})
@TransactionConfiguration(transactionManager="transactionManager", defaultRollback=false)
public class AgreementServicesTest{

	@Autowired
	private AgreementServices agreementServicesImpl;
	
	@Ignore
	@Test
	@Transactional
    public void getAgreementTest() {

		try{
			
			AgreementDTO fi_ = agreementServicesImpl.getAgreement(new Long(1));
				
			assertNotNull("Convenio es null", fi_);
			
		}catch(Exception e){
			if(e instanceof DataException){
				Assert.fail(((DataException) e).getSQLException().getMessage());
			}else{
				Assert.fail(e.getMessage());
			}
		}
    }
	/*
	@Ignore
	@Test
	@Transactional(readOnly=false)
	public void addAgreementTest() {
		AgreementDTO a = new AgreementDTO();
		
		a.setEndDate(new Date());
		a.setAgreementId("A255");
		a.setInitDate(new Date());
		a.setTimeLimit(new TimeLimitDTO(new Long(1)));
		
		List<UrlCallbackDTO> urls = new ArrayList<UrlCallbackDTO>();

		UrlCallbackDTO url = new UrlCallbackDTO();
		url.setChannel(new ChannelDTO(new Long(1)));
		url.setEndPath("www.demo.cl?end=");
		url.setConfirmationPath("www.demo.cl?conf=");
		
		urls.add(url);
		
		a.setUrls(urls);
		
		try{
			OperationResult result = agreementServicesImpl.addAgreement(a, new Long(1), new Long(1));

			assertNotNull("Resultado de agregacion de convenio es null", result);
			assertTrue("Resultado de agregacion de convenio falla", OperationResult.SUCCESS == result.getResult());
			
		}catch(Exception e){
			Assert.fail(e.getMessage());
		}
    }
    */
	@Ignore
	@Test
	@Transactional
    public void validateAgreementExistTest() {

		try{
			
			boolean result = agreementServicesImpl.validateAgreementExist(new Long(1), new Long(1));
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
	@Transactional(readOnly=false)
	public void addUserTest() {
		UserDTO user = new UserDTO();
		user.setStatus(1);
		user.setUsername("test___91");
		user.setEmail("diego.sepulveda@taisachile.cl");
		user.setName("diego sepulveda");
		user.setRut("1-9");
		
		RoleDTO role = new RoleDTO();
		role.setId(new Long(1));
		
		List<RoleDTO> roles = new ArrayList<RoleDTO>();
		roles.add(role);
		
		user.setRoles(roles);
		
		try{
			userServicesImpl.addUser(user);
			assertTrue(true);
		}catch(Exception e){
			Assert.fail(e.getMessage());
		}
    }
	
	@Test
	@Transactional(readOnly=false)
	public void addUserNullMappingTest() {
		
		OperationResult result = userServicesImpl.addUser(null);
		
		assertNotNull("Resultado de insercion de usuario es nulo", result);
		assertTrue("Resultado de insercion de usuario debio fallar", OperationResult.ERROR == result.getResult());
		
    }
	
	@Test
	@Transactional
    public void editUserTest() {
		UserDTO user = new UserDTO();
		user.setStatus(1);
		user.setUsername("test_");
		user.setPassword("5432");
		OperationResult result = userServicesImpl.editUser(user);

		assertNotNull("Resultado de modificacion de usuario es nulo", result);
		assertTrue("Resultado de modificacion de usuario falla", OperationResult.SUCCESS == result.getResult());
		
	}
	*/
	
	
}
