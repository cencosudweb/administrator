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

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.cencosud.administrator.dao.TimeLimitDao;
import com.cencosud.administrator.dao.domain.TimeLimit;

/**
 * @description Clase TimeLimitTest que implementa pruebas Unitarias
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/administrator-testContext.xml"})
@TransactionConfiguration(transactionManager="transactionManager", defaultRollback=false)
public class TimeLimitTest{

	@Autowired
	private TimeLimitDao timeLimitDaoImpl;
	
	@Test
	@Transactional
    public void getCommercesTest() {
		List<TimeLimit> timesLimit = timeLimitDaoImpl.getTimesLimit();
		assertNotNull("Listado de plazos es null", timesLimit);
		assertFalse("No hay plazos", timesLimit.isEmpty());
		
    }
	
}
