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

import com.cencosud.administrator.dao.EstadoCumpleDao;
import com.cencosud.administrator.dao.domain.EstadoCumple;

/**
 * 
 * @author Jose
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/administrator-testContext.xml"})
@TransactionConfiguration(transactionManager="transactionManager", defaultRollback=false)
public class EstadoCumpleTest{

	@Autowired
	private EstadoCumpleDao estadoCumpleDaoImpl;
	
	@Test
	@Transactional
    public void getEstadoCumpleTest() {
		List<EstadoCumple> estados = estadoCumpleDaoImpl.getEstadoCumples();
		assertNotNull("Listado de estados Cumple es null", estados);
		assertFalse("No hay estados Cumple", estados.isEmpty());
		
    }
	
}
