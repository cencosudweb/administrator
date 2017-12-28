package com.cencosud.administrator.test.dao;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.util.List;

import org.hibernate.exception.DataException;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.cencosud.administrator.dao.GerenteDao;
import com.cencosud.administrator.dao.domain.Gerente;
import com.cencosud.administrator.dao.domain.Padrino;

/**
 * @description Clase ChannelTest que implementa pruebas Unitarias
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/administrator-testContext.xml" })
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = false)
public class GerenteTest {

	@Autowired
	private GerenteDao gerenteDaoImpl;

	@Test
	@Transactional
	public void getGerenteTest() {
		Padrino padrino = null;// new Tienda(new Long(2));

		List<Gerente> gerentes = gerenteDaoImpl.getGerentes(padrino);
		assertNotNull("Listado de Gerente es null", gerentes);
		assertFalse("No hay Gerente", gerentes.isEmpty());
		for (int i = 0; i < gerentes.size(); i++) {
			System.out.println(gerentes.get(i).getId());
		}
	}

	@Test
	@Transactional
	public void getPadrinoIdTest() {
		Gerente gerentes = gerenteDaoImpl.getGerentesId(new Long(1));
		assertNotNull("Listado de canales es null", gerentes);

	}

	//@Ignore
	@Test
	@Transactional(readOnly = false)
	public void addGerenteTest() {

		Gerente gerente = new Gerente();
		//gerente.setId(new Long(11));
		gerente.setDescription("Test Gerente");

		Padrino padrino = new Padrino(new Long(1));
		gerente.setPadrino(padrino);

		try {
			gerenteDaoImpl.addGerente(gerente);
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

		Gerente gerente = new Gerente();
		gerente.setId(new Long(1));

		gerente.setDescription("Gerente 1");

		Padrino padrino = new Padrino(new Long(1));
		gerente.setPadrino(padrino);

		try {
			gerenteDaoImpl.editGerente(gerente);
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
		Long gerenteId = new Long(10);
		try {
			gerenteDaoImpl.deleteGerente(gerenteId);
			assertTrue(true);
		} catch (Exception e) {
			if (e instanceof DataException) {
				Assert.fail(((DataException) e).getSQLException().getMessage());
			} else {
				Assert.fail(e.getMessage());
			}
		}
	}

}
