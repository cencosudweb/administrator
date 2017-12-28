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

import com.cencosud.administrator.core.VentaEmpresaServices;
import com.cencosud.administrator.dto.users.VentaEmpresaDTO;

/**
 * 
 * @author jose
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/administrator-testContext.xml"})
@TransactionConfiguration(transactionManager="transactionManager", defaultRollback=false)
public class VentaEmpresaServicesTest{

	@Autowired
	private VentaEmpresaServices VentaEmpresaServicesImpl;
	
	@Test
	@Transactional
    public void getVentaEmpresasTest() {
		
		List<VentaEmpresaDTO> VentaEmpresas = VentaEmpresaServicesImpl.getVentaEmpresas();
		
		assertNotNull("Listado de canales es null", VentaEmpresas);
		assertFalse("No hay canales", VentaEmpresas.isEmpty());
		
		
    }
	
	
}
