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

import com.cencosud.administrator.core.ClienteRetiraServices;
import com.cencosud.administrator.dto.users.ClienteRetiraDTO;

/**
 * 
 * @author jose
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/administrator-testContext.xml"})
@TransactionConfiguration(transactionManager="transactionManager", defaultRollback=false)
public class ClienteRetiraServicesTest{

	@Autowired
	private ClienteRetiraServices clienteRetiraServicesImpl;
	
	@Test
	@Transactional
    public void getClienteRetirasTest() {
		
		List<ClienteRetiraDTO> clienteRetiras = clienteRetiraServicesImpl.getClienteRetiras();
		
		assertNotNull("Listado de ClienteRetira es null", clienteRetiras);
		assertFalse("No hay ClienteRetira", clienteRetiras.isEmpty());
		
		
    }
	
	
}
