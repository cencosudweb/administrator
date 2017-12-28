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

import com.cencosud.administrator.dao.SoporteDao;
import com.cencosud.administrator.dao.domain.Soporte;
import com.cencosud.administrator.dao.domain.Contratante;

/**
 * @description Clase ChannelTest que implementa pruebas Unitarias
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/administrator-testContext.xml" })
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = false)
public class SoporteTest {

	@Autowired
	private SoporteDao soporteDaoImpl;

	@Test
	@Transactional
	public void getSoporteTest() {
		Contratante Contratante = null;// new Tienda(new Long(2));

		List<Soporte> Soportes = soporteDaoImpl.getSoportes(Contratante);
		assertNotNull("Listado de Soporte es null", Soportes);
		assertFalse("No hay Soporte", Soportes.isEmpty());
		for (int i = 0; i < Soportes.size(); i++) {
			System.out.println(Soportes.get(i).getId());
		}
	}

	@Test
	@Transactional
	public void getContratanteIdTest() {
		Soporte Soportes = soporteDaoImpl.getSoportesId(new Long(1));
		assertNotNull("Listado de canales es null", Soportes);

	}

	//@Ignore
	@Test
	@Transactional(readOnly = false)
	public void addSoporteTest() {

		Soporte soporte = new Soporte();
		//Soporte.setId(new Long(11));
		soporte.setDescription("Test Soporte");

		Contratante contraparte = new Contratante(new Long(1));
		soporte.setContraparte(contraparte);

		try {
			soporteDaoImpl.addSoporte(soporte);
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
	public void editContratanteTest() {

		Soporte Soporte = new Soporte();
		Soporte.setId(new Long(1));

		Soporte.setDescription("Soporte 1");

		Contratante Contratante = new Contratante(new Long(1));
		Soporte.setContraparte(Contratante);

		try {
			soporteDaoImpl.editSoporte(Soporte);
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
	public void deleteContratanteTest() {
		Long SoporteId = new Long(10);
		try {
			soporteDaoImpl.deleteSoporte(SoporteId);
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
