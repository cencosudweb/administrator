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

import com.cencosud.administrator.core.TipoVentaServices;
import com.cencosud.administrator.dto.users.TipoVentaDTO;

/**
 * 
 * @author jose
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/administrator-testContext.xml"})
@TransactionConfiguration(transactionManager="transactionManager", defaultRollback=false)
public class TipoVentaServicesTest{

	@Autowired
	private TipoVentaServices TipoVentaServicesImpl;
	
	@Test
	@Transactional
    public void getTipoVentasTest() {
		
		List<TipoVentaDTO> TipoVentas = TipoVentaServicesImpl.getTipoVentas();
		
		assertNotNull("Listado de canales es null", TipoVentas);
		assertFalse("No hay canales", TipoVentas.isEmpty());
		
		
    }
	
	
}
