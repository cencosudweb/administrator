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

import com.cencosud.administrator.dao.ClienteRetiraDao;
import com.cencosud.administrator.dao.domain.ClienteRetira;

/**
 * 
 * @author Jose
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/administrator-testContext.xml"})
@TransactionConfiguration(transactionManager="transactionManager", defaultRollback=false)
public class ClienteRetiraTest{

	@Autowired
	private ClienteRetiraDao clienteRetiraDaoImpl;
	
	@Test
	@Transactional
    public void getClienteRetiraTest() {
		List<ClienteRetira> clienteRetiras = clienteRetiraDaoImpl.getClienteRetiras();
		assertNotNull("Listado de canales es null", clienteRetiras);
		assertFalse("No hay canales", clienteRetiras.isEmpty());
		
    }
	
}
