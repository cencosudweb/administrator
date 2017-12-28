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

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.cencosud.administrator.core.RoleServices;
import com.cencosud.administrator.dto.users.RoleDTO;
import com.cencosud.administrator.utils.OperationResult;

/**
 * @description Clase 
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/administrator-testContext.xml"})
@TransactionConfiguration(transactionManager="transactionManager", defaultRollback=false)
public class RoleServicesTest{

	@Autowired
	private RoleServices roleServicesImpl;
	
	/*
	@Ignore
	@Test
	@Transactional(readOnly=false)
    public void addRoleTest() {
		
		RoleDTO role = new RoleDTO();
		role.setRole("ROLE_TEST");
		
		OperationResult result = roleServicesImpl.addRole(role);
		
		assertNotNull("Resultado de insercion de perfil es nulo", result);
		assertTrue("Resultado de insercion de perfil falla", OperationResult.SUCCESS == result.getResult());
		
    }
    */
	
	@Test
	@Transactional(readOnly=false)
    public void addNullMappingRoleTest() {
		
		OperationResult result = roleServicesImpl.addRole(null);
		
		assertNotNull("Resultado de insercion de perfil es nulo", result);
		assertTrue("Resultado de insercion de perfil debio fallar", OperationResult.ERROR == result.getResult());
		
    }
	/*
	@Test
	@Transactional
    public void deleteRoleTest() {
		
		RoleDTO role = new RoleDTO();
		role.setRole("ROLE_TEST");
		
		OperationResult result = roleServicesImpl.deleteRole(role);
		
		assertNotNull("Resultado de eliminacion de perfil es nulo", result);
		assertTrue("Resultado de eliminacion de perfil falla", OperationResult.SUCCESS == result.getResult());
		
    }
    
	
	@Test
	@Transactional
    public void deleteNullMappingRoleTest() {
		
		OperationResult result = roleServicesImpl.deleteRole(null);
		
		assertNotNull("Resultado de eliminacion de perfil es nulo", result);
		assertTrue("Resultado de eliminacion deberia fallar", OperationResult.ERROR == result.getResult());
		
    }
	*/
	@Test
	@Transactional
    public void getRolesByUserTest() {
		
		Long userExist = new Long(1), userNonExist = new Long(-1);
		
		List<RoleDTO> roles = roleServicesImpl.getRolesByUser(userExist);
		
		assertNotNull("Listado roles es null para = " + userExist, roles);
		assertFalse("No hay roles para = " + userExist, roles.isEmpty());
		
		roles = roleServicesImpl.getRolesByUser(userNonExist);
		
		assertNotNull("Listado roles es null para = " + userNonExist, roles);
		assertTrue("Error, hay roles para = " + userNonExist, roles.isEmpty());
		
    }
	
	
	@Test
	@Transactional
    public void getRolesTest() {
		
		boolean includeAdmin = true;
		int tamanioConAdmin, tamanioSinAdmin;
		
		List<RoleDTO> roles = roleServicesImpl.getRoles(includeAdmin);
		
		assertNotNull("Listado roles es null cuando se incluye administrador", roles);
		assertFalse("No hay roles", roles.isEmpty());
		tamanioConAdmin = roles.size();
		
		roles = roleServicesImpl.getRoles(!includeAdmin);
		
		assertNotNull("Listado roles es null para cuano no se incluye administrador", roles);
		assertFalse("No hay roles", roles.isEmpty());
		tamanioSinAdmin = roles.size();
		
		assertTrue("Listado con roles de administrador debe ser mayor", tamanioConAdmin > tamanioSinAdmin);
		
    }
	
	/*
	@Test
	@Transactional(readOnly=false)
    public void addRoleForUserTest() {
		
		OperationResult result = roleServicesImpl.addRoleForUser(new Long(1), new Long(4));
		
		assertNotNull("Resultado de agregacion de rol es nulo", result);
		assertTrue("Resultado de agregacion deberia fallar", OperationResult.SUCCESS == result.getResult());
		
    }
	
	@Ignore
	@Test
	@Transactional(readOnly=false)
    public void deleteRoleForUser() {
		
		OperationResult result = roleServicesImpl.deleteRoleForUser(new Long(1), new Long(4));
		
		assertNotNull("Resultado de eliminacion de rol es nulo", result);
		assertTrue("Resultado de eliminacion fallar", OperationResult.SUCCESS == result.getResult());
		
    }
    */
	
}
