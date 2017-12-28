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

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.cencosud.administrator.core.TimeLimitServices;
import com.cencosud.administrator.dto.users.TimeLimitDTO;

/**
 * @description Clase 
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/administrator-testContext.xml"})
@TransactionConfiguration(transactionManager="transactionManager", defaultRollback=false)
public class TimeLimitServicesTest{

	@Autowired
	private TimeLimitServices timeLimitServicesImpl;
	
	@Test
	@Transactional
    public void getTimesLimitTest() {
		
		List<TimeLimitDTO> timesLimit = timeLimitServicesImpl.getTimesLimit();
		
		assertNotNull("Listado de plazos es null", timesLimit);
		assertFalse("No hay plazos", timesLimit.isEmpty());
		
		
    }
	
}
