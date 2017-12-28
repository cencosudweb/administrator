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

import org.hibernate.exception.DataException;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.cencosud.administrator.core.FinancialInstitutionServices;
import com.cencosud.administrator.dto.users.FinancialInstitutionDTO;

/**
 * @description Clase 
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/administrator-testContext.xml"})
@TransactionConfiguration(transactionManager="transactionManager", defaultRollback=false)
public class FinancialInstitutionServicesTest{

	@Autowired
	private FinancialInstitutionServices financialInstitutionServicesImpl;
	
	@Test
	@Transactional
    public void getFITest() {

		try{
			
			FinancialInstitutionDTO fi_ = financialInstitutionServicesImpl.getFI(new Long(1));
				
			assertNotNull("IF es null para id dado", fi_);
			
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
			
			FinancialInstitutionDTO fi_ = financialInstitutionServicesImpl.getFIByMnemonic("BSTR");
				
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
	@Ignore
	@Test
	@Transactional
    public void getFIByRutTest() {

		try{
			
			FinancialInstitutionDTO fi_ = financialInstitutionServicesImpl.getFIByRut("99887766");
				
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
	
	@Test
	@Transactional
    public void getAllUserTest() {
		List<UserDTO> users = userServicesImpl.getUsers();
		assertNotNull("Listado usuarios es null", users);
		assertFalse("No hay usuarios", users.isEmpty());
		
    }
	
	@Test
	@Transactional
    public void getAllUserTestEnabled() {
		List<UserDTO> users = userServicesImpl.getUsersByStatus(0);
		assertNotNull("Listado usuarios es null", users);
		assertFalse("No hay usuarios", users.isEmpty());
    }
	
	@Test
	@Transactional
    public void deleteUserTest() {
		
		try{
			userServicesImpl.deleteUser(new Long(3));
			assertTrue(true);
		}catch(Exception e){
			Assert.fail(e.getMessage());
		}
    }
	
	@Test
	@Transactional
    public void changePasswordTest() {
		Long userId = new Long(1);
		try{
			
			OperationResult result = userServicesImpl.changePassword(userId, "1234", "0000");
			
			assertNotNull("Resultado de cambio de password nulo", result);
			assertTrue("Resultado de cambio de password falla", OperationResult.SUCCESS == result.getResult());
			
			assertTrue(true);
		}catch(Exception e){
			Assert.fail(e.getMessage());
		}
    }
	
	@Test
	@Transactional
    public void updateAttempsTest() {
		Long userId = new Long(1);
		try{
			
			OperationResult result = userServicesImpl.updateAttempts(userId, 4);
			
			assertNotNull("Resultado de actualizacion de numero de intento es nulo", result);
			assertTrue("Resultado de actualizacion de numero de intento falla", OperationResult.SUCCESS == result.getResult());
			
			assertTrue(true);
		}catch(Exception e){
			Assert.fail(e.getMessage());
		}
    }
	
	@Test
	@Transactional
    public void updateStatusTest() {
		Long userId = new Long(1);
		try{
			
			OperationResult result = userServicesImpl.updateStatus(userId, UserDTO.BLOCKED_USER);
			
			assertNotNull("Resultado de cambio de password nulo", result);
			assertTrue("Resultado de cambio de password falla", OperationResult.SUCCESS == result.getResult());
			
			assertTrue(true);
		}catch(Exception e){
			Assert.fail(e.getMessage());
		}
    }
	
	
	@Test
	@Transactional
    public void getUserTest() {
		Long userId = new Long(1);
		try{
			UserDTO user = userServicesImpl.getUser(userId);
			
			assertNotNull("Usuario es null", user);
			assertTrue("Usuario no valido", user.getId() == userId);
			
			assertTrue(true);
		}catch(Exception e){
			Assert.fail(e.getMessage());
		}
    }
	
	@Test
	@Transactional
    public void getUserByUsernameTest() {
		String username = "admin";
		try{
			UserDTO user = userServicesImpl.getUser(username);
			
			assertNotNull("Usuario es null", user);
			assertTrue("Usuario no valido", username.equals(user.getUsername()));
			
			assertTrue(true);
		}catch(Exception e){
			Assert.fail(e.getMessage());
		}
    }
	
	@Test
	@Transactional
    public void getValidateUsernameAvailabilityTest() {
		String usernameExist = "admin", usernameNonExist = "admin_non_exist";
		try{
			assertFalse("Username ingresado deberia estar NO disponible - " + usernameExist, userServicesImpl.validateUsernameAvailability(usernameExist));
			assertTrue("Username ingresado deberia estar disponible", userServicesImpl.validateUsernameAvailability(usernameNonExist));

		}catch(Exception e){
			Assert.fail(e.getMessage());
		}
    }*/
}
