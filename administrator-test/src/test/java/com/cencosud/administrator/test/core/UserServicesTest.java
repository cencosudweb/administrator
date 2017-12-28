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
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.cencosud.administrator.core.UserServices;
import com.cencosud.administrator.dto.users.UserDTO;

/**
 * @description Clase 
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/administrator-testContext.xml"})
@TransactionConfiguration(transactionManager="transactionManager", defaultRollback=false)
public class UserServicesTest{

	@Autowired
	private UserServices userServicesImpl;
	/*
	@Ignore
	@Test
	@Transactional(readOnly=false)
	public void addUserTest() {
		UserDTO user = new UserDTO();
		
		user.setUsername("1d_m22l__11");
		user.setPassword("1111");
		user.setStatus(1);
		user.setAttempts(0);
		user.setEmail("diego.sepulveda@ssasa.cl");
		user.setName("diego sepulveda11");
		user.setRut("1-9");
		user.setPhone("112121212");
		user.setTimePassExpiration(new Date());
		
		
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
	@Ignore
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
	@Test
	@Transactional
    public void getAllUserTest() {
		List<UserDTO> users = userServicesImpl.getUsers();
		assertNotNull("Listado usuarios es null", users);
		assertFalse("No hay usuarios", users.isEmpty());
		
    }
	@Ignore
	@Test
	@Transactional
    public void getAllUserTestEnabled() {
		List<UserDTO> users = userServicesImpl.getUsersByStatus(0);
		assertNotNull("Listado usuarios es null", users);
		assertFalse("No hay usuarios", users.isEmpty());
    }
	/*
	@Ignore
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
	@Ignore
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
	@Ignore
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
	@Ignore
	@Test
	@Transactional
    public void updateStatusTest() {
		Long userId = new Long(1);
		try{
			
			OperationResult result = userServicesImpl.updateStatus(userId, StatusEnum.BLOCKED_USER.getCode());
			
			assertNotNull("Resultado de cambio de password nulo", result);
			assertTrue("Resultado de cambio de password falla", OperationResult.SUCCESS == result.getResult());
			
			assertTrue(true);
		}catch(Exception e){
			Assert.fail(e.getMessage());
		}
    }
	*/
	
	@Test
	@Transactional
    public void getUserTest() {
		Long userId = new Long(3);
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
	/*
	@Test
	@Transactional
    public void getUserByRutTest() {
		String rut = "155678631";
		try{
			UserDTO user = userServicesImpl.getUserByRut(rut);
			
			assertNotNull("Usuario es null", user);
			assertTrue("Usuario no valido", rut.equals(user.getRut()));
			
			assertTrue(true);
		}catch(Exception e){
			Assert.fail(e.getMessage());
		}
    }
	*/
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
    }
	/*
	@Ignore
	@Test
	@Transactional
    public void addSecretQuestionsAnswersTest() {
		
		List<QuestionAnswerDTO> qas = new ArrayList<QuestionAnswerDTO>();
		qas.add(new QuestionAnswerDTO("p1","r1"));
		qas.add(new QuestionAnswerDTO("p2","r2"));
		
		OperationResult result = userServicesImpl.addSecretQuestionsAnswers(new Long(1), qas);
		
		assertNotNull("Resultado de agregar preguntas secretas es nulo", result);
		assertTrue("Resultado de agregar preguntas secretas falla", OperationResult.SUCCESS == result.getResult());
		
    }
    */
    
	
	
}
