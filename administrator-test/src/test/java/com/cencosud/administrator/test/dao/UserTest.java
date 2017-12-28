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

import static org.junit.Assert.*;

import java.util.List;

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

import com.cencosud.administrator.dao.UserDao;
import com.cencosud.administrator.dao.domain.Commerce;
import com.cencosud.administrator.dao.domain.QuestionAnswer;
import com.cencosud.administrator.dao.domain.User;

/**
 * @description Clase UserTest que implementa pruebas Unitarias
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/administrator-testContext.xml"})
@TransactionConfiguration(transactionManager="transactionManager", defaultRollback=false)
public class UserTest{

	@Autowired
	private UserDao userDaoImpl;
	
	/*
	@Ignore
	@Test
	@Transactional(readOnly=false)
    public void addUserTest() {
		User user = new User();
		user.setStatus(1);
		user.setUsername("tes_t_3_61");
		user.setPassword("1234");
		user.setAttempts(0);
		user.setPhone("11111111");
		user.setName("1122121");
		user.setEmail("asasasasa");
		user.setTimePassExpiration(0);
		user.setUsername("wwqqwqw");
		
		Role role = new Role();
		role.setRole("ROLE_DEMO");
		role.setId(new Long(1));
		
		Set<Role> roles = new HashSet<Role>();

		roles.add(role);
		
		//user.setRoles(roles);
		
		try{
			userDaoImpl.addUser(user);
			assertTrue(true);
		}catch(Exception e){
			if(e instanceof DataException){
				Assert.fail(((DataException) e).getSQLException().getMessage());
			}else{
				Assert.fail(e.getMessage());
			}
		}
    }
	@Ignore
	@Test
	@Transactional
    public void editUserNonExistTest() {
		User user = new User();
		user.setStatus(1);
		user.setId(new Long(-1));
		user.setUsername("test_nonexist");
		user.setPassword("5432");
		try{
			userDaoImpl.editUser(user);
			assertTrue(true);
		}catch(Exception e){
			if(e instanceof DataException){
				Assert.fail(((DataException) e).getSQLException().getMessage());
			}else{
				Assert.fail(e.getMessage());
			}
		}
		
    }
	@Ignore
	@Test
	@Transactional
    public void editUserTest() {
		User user = new User();
		user.setStatus(1);
		user.setId(new Long(5));
		user.setUsername("test_up");
		user.setPassword("5432");
		try{
			userDaoImpl.editUser(user);
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
    public void getAllUserTest() {
		List<User> users = userDaoImpl.getAllUsers();
		assertNotNull("Listado usuarios es null", users);
		assertFalse("No hay usuarios", users.isEmpty());
		assertNotNull("Listado roles de Usuario 0 es null", users.get(0).getRoles());
		assertFalse("Usuario 0 no tiene roles", users.get(0).getRoles().isEmpty());
		
    }
	@Ignore
	@Test
	@Transactional
    public void getAllUserTestEnabled() {
		List<User> users = userDaoImpl.getAllUsers(0);
		assertNotNull("Listado usuarios es null", users);
		assertFalse("No hay usuarios", users.isEmpty());
    }
	/*
	@Ignore
	@Test
	@Transactional
    public void deleteUserTest() {
		Long userID = new Long(3);
		try{
			userDaoImpl.deleteUser(userID);
			assertTrue(true);
		}catch(Exception e){
			if(e instanceof DataException){
				Assert.fail(((DataException) e).getSQLException().getMessage());
			}else{
				Assert.fail(e.getMessage());
			}
		}
    }
	@Ignore
	@Test
	@Transactional
    public void changePasswordTest() {
		Long userId = new Long(1);
		try{
			userDaoImpl.changePassword(userId, "0000");
			assertTrue(true);
		}catch(Exception e){
			if(e instanceof DataException){
				Assert.fail(((DataException) e).getSQLException().getMessage());
			}else{
				Assert.fail(e.getMessage());
			}
		}
    }
	@Ignore
	@Test
	@Transactional
    public void resetPasswordTest() {
		Long userId = new Long(1);
		try{
			userDaoImpl.resetPassword(userId, "0000", 0, 0,new Date().getTime() / 1000L);
			assertTrue(true);
		}catch(Exception e){
			if(e instanceof DataException){
				Assert.fail(((DataException) e).getSQLException().getMessage());
			}else{
				Assert.fail(e.getMessage());
			}
		}
    }
	
	@Ignore
	@Test
	@Transactional
    public void updateAttempsTest() {
		Long userId = new Long(1);
		try{
			userDaoImpl.updateAttempts(userId, 3);
			assertTrue(true);
		}catch(Exception e){
			if(e instanceof DataException){
				Assert.fail(((DataException) e).getSQLException().getMessage());
			}else{
				Assert.fail(e.getMessage());
			}
		}
    }
	@Ignore
	@Test
	@Transactional
    public void updateStatusTest() {
		Long userId = new Long(1);
		try{
			userDaoImpl.updateStatus(userId, 0);
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
    public void getUserTest() {
		Long userId = new Long(3);
		try{
			User user = userDaoImpl.getUser(userId);
			
			assertNotNull("Usuario es null", user);
			assertTrue("Usuario no valido", user.getId() == userId);
			
			Commerce c = user.getCommerces().iterator().next();
			System.out.println(c);
			
			QuestionAnswer qa = user.getQas().iterator().next();
			System.out.println(qa);
			
			
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
    public void getUserByUsernameTest() {
		String username = "admin", usernameNonExist = "admin_non_exist";
		try{
			User user = userDaoImpl.getUser(username);
			
			assertNotNull("Usuario es null", user);
			assertTrue("Usuario no valido", username.equals(user.getUsername()));
			
			user = userDaoImpl.getUser(usernameNonExist);
			assertTrue("Usuario deberia ser null", user == null);
			
		}catch(Exception e){
			if(e instanceof DataException){
				Assert.fail(((DataException) e).getSQLException().getMessage());
			}else{
				Assert.fail(e.getMessage());
			}
			e.printStackTrace();
		}
    }
	/*
	@Test
	@Transactional
    public void getUserByRutTest() {
		String rut = "155678631", rutNonExist = "admin_non_exist";
		try{
			User user = userDaoImpl.getUserByRut(rut);
			
			assertNotNull("Usuario es null", user);
			assertTrue("Usuario no valido", rut.equals(user.getRut()));
			
			user = userDaoImpl.getUserByRut(rutNonExist);
			assertTrue("Usuario deberia ser null", user == null);
			
		}catch(Exception e){
			if(e instanceof DataException){
				Assert.fail(((DataException) e).getSQLException().getMessage());
			}else{
				Assert.fail(e.getMessage());
			}
			e.printStackTrace();
		}
    }
    */
	/*
	@Test
	@Transactional
    public void getUserByEmailTest() {
		String email = "admin@orov.cl", emailNonExist = "admin_non_exist@orov.cl";
		try{
			User user = userDaoImpl.getUserByEmail(email);
			
			assertNotNull("Usuario es null", user);
			assertTrue("Usuario no valido", email.equals(user.getEmail()));
			
			user = userDaoImpl.getUserByEmail(emailNonExist);
			assertTrue("Usuario deberia ser null", user == null);
			
		}catch(Exception e){
			if(e instanceof DataException){
				Assert.fail(((DataException) e).getSQLException().getMessage());
			}else{
				Assert.fail(e.getMessage());
			}
			e.printStackTrace();
		}
    }
    */
	
	
	@Test
	@Transactional
    public void getValidateUsernameAvailabilityTest() {
		String usernameExist = "admin", usernameNonExist = "admin_non_exist";
		try{
			assertFalse("Username ingresado deberia estar NO disponible - " + usernameExist, userDaoImpl.validateUsernameAvailability(usernameExist));
			assertTrue("Username ingresado deberia estar disponible", userDaoImpl.validateUsernameAvailability(usernameNonExist));

		}catch(Exception e){
			if(e instanceof DataException){
				Assert.fail(((DataException) e).getSQLException().getMessage());
			}else{
				Assert.fail(e.getMessage());
			}
		}
    }
    
	
}
