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

import com.cencosud.administrator.dao.TipoGuiaDao;
import com.cencosud.administrator.dao.domain.TipoGuia;

/**
 * 
 * @author Jose
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/administrator-testContext.xml"})
@TransactionConfiguration(transactionManager="transactionManager", defaultRollback=false)
public class TipoGuiaTest{

	@Autowired
	private TipoGuiaDao TipoGuiaDaoImpl;
	
	@Test
	@Transactional
    public void getTipoGuiaTest() {
		List<TipoGuia> TipoGuias = TipoGuiaDaoImpl.getTipoGuias();
		assertNotNull("Listado de TipoGuia es null", TipoGuias);
		assertFalse("No hay TipoGuia", TipoGuias.isEmpty());
		
    }
	
}
