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

import com.cencosud.administrator.core.EstadoCumpleResumenServices;
import com.cencosud.administrator.dto.users.EstadoCumpleResumenDTO;

/**
 * 
 * @author jose
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/administrator-testContext.xml"})
@TransactionConfiguration(transactionManager="transactionManager", defaultRollback=false)
public class EstadoCumpleResumenServicesTest{

	@Autowired
	private EstadoCumpleResumenServices estadoCumpleResumenServicesImpl;
	
	@Test
	@Transactional
    public void getEstadoCumpleResumensTest() {
		
		List<EstadoCumpleResumenDTO> estados = estadoCumpleResumenServicesImpl.getEstadoCumpleResumens();
		
		assertNotNull("Listado de Estado es null", estados);
		assertFalse("No hay Estado", estados.isEmpty());
		
		
    }
	
	
}
