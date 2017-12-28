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

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.cencosud.administrator.dao.EconomicActivityDao;
import com.cencosud.administrator.dao.domain.EconomicActivity;

/**
 * @description Clase EconomicActivityTest que implementa pruebas Unitarias
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/administrator-testContext.xml"})
@TransactionConfiguration(transactionManager="transactionManager", defaultRollback=false)
public class EconomicActivityTest{

	@Autowired
	private EconomicActivityDao economicActivityDaoImpl;
	
	
	@Test
	@Transactional
    public void getAllUserTest() {
		List<EconomicActivity> users = economicActivityDaoImpl.getActivities();
		assertNotNull("Listado de activity es null", users);
		assertFalse("No hay actividades", users.isEmpty());
    }
}
