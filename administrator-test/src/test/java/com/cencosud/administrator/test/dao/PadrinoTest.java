package com.cencosud.administrator.test.dao;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.util.List;

import org.hibernate.exception.DataException;
import org.junit.Assert;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.cencosud.administrator.dao.PadrinoDao;
import com.cencosud.administrator.dao.domain.Padrino;
import com.cencosud.administrator.dao.domain.Tienda;

/**
 * @description Clase ChannelTest que implementa pruebas Unitarias
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/administrator-testContext.xml" })
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = false)
public class PadrinoTest {

	@Autowired
	private PadrinoDao padrinoDaoImpl;

	@Test
	@Transactional
	public void getPadrinoTest() {
		Tienda tienda = null;// new Tienda(new Long(2));

		List<Padrino> padrinos = padrinoDaoImpl.getPadrinos(tienda);
		assertNotNull("Listado de padrinos es null", padrinos);
		assertFalse("No hay padrinos", padrinos.isEmpty());
		for (int i = 0; i < padrinos.size(); i++) {
			System.out.println(padrinos.get(i).getId());
		}
	}
	
	@Test
	@Transactional
	public void getPadrinoDescriptionssTest() {
		
		List<Padrino> padrinos = padrinoDaoImpl.getPadrinoDescs("Jose Luis (Externo - Empresa: ACL) Garrido");
		assertNotNull("Listado de padrinos es null", padrinos);
		assertFalse("No hay padrinos", padrinos.isEmpty());
		for (int i = 0; i < padrinos.size(); i++) {
			System.out.println(padrinos.get(i).getId());
		}
	}

	@Test
	@Transactional
	public void getPadrinoIdTest() {
		Padrino tiendas = padrinoDaoImpl.getPadrinosId(new Long(1));
		assertNotNull("Listado de canales es null", tiendas);

	}

	@Ignore
	@Test
	@Transactional(readOnly = false)
	public void addPadrinoTest() {

		Padrino padrino = new Padrino();
		padrino.setDescription("Test Padrino");

		Tienda tienda = new Tienda(new Long(1));
		padrino.setTienda(tienda);

		try {
			padrinoDaoImpl.addPadrino(padrino);
			assertTrue(true);
		} catch (Exception e) {
			if (e instanceof DataException) {
				Assert.fail(((DataException) e).getSQLException().getMessage());
			} else {
				Assert.fail(e.getMessage());
			}
		}
	}

	// @Ignore
	@Test
	@Transactional
	public void editPadrinoTest() {

		Padrino padrino = new Padrino();
		padrino.setId(new Long(1));

		padrino.setDescription("Padrinos 1");

		Tienda tienda = new Tienda(new Long(1));
		padrino.setTienda(tienda);

		try {
			padrinoDaoImpl.editPadrino(padrino);
			assertTrue(true);
		} catch (Exception e) {
			if (e instanceof DataException) {
				Assert.fail(((DataException) e).getSQLException().getMessage());
			} else {
				Assert.fail(e.getMessage());
			}
		}
	}

	// @Ignore
	@Test
	@Transactional
	public void deletePadrinoTest() {
		Long padrinoId = new Long(10);
		try {
			padrinoDaoImpl.deletePadrino(padrinoId);
			assertTrue(true);
		} catch (Exception e) {
			if (e instanceof DataException) {
				Assert.fail(((DataException) e).getSQLException().getMessage());
			} else {
				Assert.fail(e.getMessage());
			}
		}
	}
	
	
	@Test
	@Transactional
	public void getPadrinoDescriptionTest() {
		Padrino tiendas = padrinoDaoImpl.getPadrino("Jose Luis (Externo - Empresa: ACL) Garrido");
		assertNotNull("Listado de canales es null", tiendas);

	}


}
