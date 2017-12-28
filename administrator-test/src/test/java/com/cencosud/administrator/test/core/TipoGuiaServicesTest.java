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

import com.cencosud.administrator.core.TipoGuiaServices;
import com.cencosud.administrator.dto.users.TipoGuiaDTO;

/**
 * 
 * @author jose
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/administrator-testContext.xml"})
@TransactionConfiguration(transactionManager="transactionManager", defaultRollback=false)
public class TipoGuiaServicesTest{

	@Autowired
	private TipoGuiaServices tipoGuiaServicesImpl;
	
	@Test
	@Transactional
    public void getTipoGuiasTest() {
		
		List<TipoGuiaDTO> tipoGuias = tipoGuiaServicesImpl.getTipoGuias();
		
		assertNotNull("Listado de TipoGuia es null", tipoGuias);
		assertFalse("No hay TipoGuia", tipoGuias.isEmpty());
		
		
    }
	
	
}
