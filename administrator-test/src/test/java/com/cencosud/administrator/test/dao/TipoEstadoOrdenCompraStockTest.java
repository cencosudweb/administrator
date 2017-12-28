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

import com.cencosud.administrator.dao.TipoEstadoOrdenCompraStockDao;
import com.cencosud.administrator.dao.domain.TipoEstadoOrdenCompraStock;

/**
 * @description Clase ChannelTest que implementa pruebas Unitarias
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/administrator-testContext.xml"})
@TransactionConfiguration(transactionManager="transactionManager", defaultRollback=false)
public class TipoEstadoOrdenCompraStockTest{

	@Autowired
	private TipoEstadoOrdenCompraStockDao tipoEstadoOrdenCompraStockDaoImpl;
	
	@Test
	@Transactional
    public void getTipoEstadoOrdenCompraStockTest() {
		List<TipoEstadoOrdenCompraStock> tipoEstadoStocks = tipoEstadoOrdenCompraStockDaoImpl.getTipoEstadoOrdenCompraStocks();
		assertNotNull("Listado de tipo orden compra es null", tipoEstadoStocks);
		assertFalse("No hay tipo venta en verde", tipoEstadoStocks.isEmpty());
		for(int i=0; i<tipoEstadoStocks.size(); i++){
			System.out.println(tipoEstadoStocks.get(i).getId());
		}
    }
	
}
