/**
 *@name AgreementServicesTest.java
 * 
 *@version 1.0 
 * 
 *@date 07-03-2017
 * 
 *@author EA7129
 * 
 *@copyright Cencosud. All rights reserved.
 */
package com.cencosud.administrator.test.core;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.util.List;

import org.junit.Assert;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.cencosud.administrator.core.TiendaServices;
import com.cencosud.administrator.dto.users.FlagDTO;
import com.cencosud.administrator.dto.users.TiendaDTO;
import com.cencosud.administrator.utils.OperationResult;

/**
 * @description Clase
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/administrator-testContext.xml" })
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = false)
public class TiendaServicesTest {

	@Autowired
	private TiendaServices tiendaServicesImpl;

	@Test
	@Transactional
	public void getTiendasTest() {

		List<TiendaDTO> tiendas = tiendaServicesImpl.getTiendas();

		assertNotNull("Listado de canales es null", tiendas);
		assertFalse("No hay canales", tiendas.isEmpty());

	}
	@Ignore
	@Test
	@Transactional
	public void getTiendasIdTest() {

		TiendaDTO tiendas = tiendaServicesImpl.getTiendasId(new Long(1));

		assertNotNull("Listado de canales es null", tiendas);

	}

	@Ignore
	@Test
	@Transactional
	public void deleteTiendaTest() {

		try {

			tiendaServicesImpl.deleteTienda(new Long(6));
			assertTrue(true);
		} catch (Exception e) {
			Assert.fail(e.getMessage());
		}
	}
	@Ignore
	@Test
	@Transactional(readOnly = false)
	public void addTiendaTest() {
		TiendaDTO tienda = new TiendaDTO();
		//tienda.setId(new Long(7));
		tienda.setDescription("Test");
		
		
		FlagDTO flag = new FlagDTO(new Long(2));
		tienda.setFlag(flag);

		try {
			tiendaServicesImpl.addTienda(tienda);
			assertTrue(true);
		} catch (Exception e) {
			Assert.fail(e.getMessage());
		}
	}

	@Ignore
	@Test
	@Transactional(readOnly = false)
	public void editTiendaTest() {
		TiendaDTO tienda = new TiendaDTO();
		tienda.setId(new Long(146));
		tienda.setDescription("Tienda 12");
		
		FlagDTO flag = new FlagDTO(new Long(2));
		tienda.setFlag(flag);
		
		OperationResult result = tiendaServicesImpl.editTienda(tienda);

		assertNotNull("Resultado de modificacion de tienda es nulo", result);
		assertTrue("Resultado de modificacion de tienda falla", OperationResult.SUCCESS == result.getResult());

	}

}
