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

import com.cencosud.administrator.dao.RoleDao;
import com.cencosud.administrator.dao.domain.Role;

/**
 * @description Clase RoleTest que implementa pruebas Unitarias
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/administrator-testContext.xml"})
@TransactionConfiguration(transactionManager="transactionManager", defaultRollback=false)
public class RoleTest{

	@Autowired
	private RoleDao roleDaoImpl;
	/*
	@Test
	@Transactional(readOnly=false)
    public void addRoleTest() {
		
		Role role = new Role();
//		role.setUserId(new Long(10));
		role.setRole("ROLE_TEST");
		
		try {
			roleDaoImpl.addRole(role);
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
    public void deleteRoleTest() {
		
		Role role = new Role();
//		role.setUserId(new Long(10));
		role.setRole("ROLE_TEST");
		
		try {
			roleDaoImpl.deleteRole(role);
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
    public void getRolesByUserTest() {
		
		Long userExist = new Long(1), userNonExist = new Long(-1);
		
		List<Role> roles = roleDaoImpl.getRolesByUser(userExist);
		
		assertNotNull("Listado roles es null para = " + userExist, roles);
		assertFalse("No hay roles para Usuario " + userExist, roles.isEmpty());
		
		roles = roleDaoImpl.getRolesByUser(userNonExist);
		
		assertNotNull("Listado roles es null para = " + userNonExist, roles);
		assertTrue("Error, hay roles para = " + userNonExist, roles.isEmpty());
		
    }
	
	/*
	@Test
	@Transactional
    public void getRolesTest() {
		
		boolean includeAdmin = true;
		int tamanioConAdmin, tamanioSinAdmin;
		
		Role role = new Role();
		role.setRole("ROLE_ADMIN");
		role.setId(new Long(1));
		role.setDescription("OROV");
		
		List<Role> roles = roleDaoImpl.getRoles(false);
		
		assertNotNull("Listado roles es null cuando se incluye administrador", roles);
		assertFalse("No hay roles", roles.isEmpty());
		tamanioConAdmin = roles.size();
		
		roles = roleDaoImpl.getRoles(!includeAdmin);
		
		assertNotNull("Listado roles es null para cuano no se incluye administrador", roles);
		assertFalse("No hay roles", roles.isEmpty());
		tamanioSinAdmin = roles.size();
		
		assertTrue("Listado con roles de administrador debe ser mayor", tamanioConAdmin > tamanioSinAdmin);
		
		
		
		
    }
	*/
	
	
	@Test
	@Transactional(readOnly=false)
    public void addRoleForUserTest() {
		
		try {
			roleDaoImpl.addRoleForUser(new Long(1), new Long(4));
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
    public void deleteRoleForUser() {
		
		try {
			roleDaoImpl.deleteRoleForUser(new Long(1), new Long(4));
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
