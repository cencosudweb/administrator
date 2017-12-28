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

import com.cencosud.administrator.dao.TipoEstadoVentaEnVerdeDao;
import com.cencosud.administrator.dao.domain.TipoEstadoVentaEnVerde;

/**
 * @description Clase ChannelTest que implementa pruebas Unitarias
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/administrator-testContext.xml"})
@TransactionConfiguration(transactionManager="transactionManager", defaultRollback=false)
public class TipoEstadoVentaEnVerdeTest{

	@Autowired
	private TipoEstadoVentaEnVerdeDao tipoEstadoVentaEnVerdeDaoImpl;
	
	@Test
	@Transactional
    public void getTipoEstadoVentaEnVerdeTest() {
		List<TipoEstadoVentaEnVerde> tipovtavs = tipoEstadoVentaEnVerdeDaoImpl.getTipoEstadoVentaEnVerdes();
		assertNotNull("Listado de tipo venta en verde es null", tipovtavs);
		assertFalse("No hay tipo venta en verde", tipovtavs.isEmpty());
		for(int i=0; i<tipovtavs.size(); i++){
			System.out.println(tipovtavs.get(i).getId());
		}
    }
	
}
