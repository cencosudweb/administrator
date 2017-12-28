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

import com.cencosud.administrator.dao.ContratanteDao;
import com.cencosud.administrator.dao.domain.Contratante;
import com.cencosud.administrator.dao.domain.Gerente;

/**
 * @description Clase ChannelTest que implementa pruebas Unitarias
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/administrator-testContext.xml" })
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = false)
public class ContratanteTest {

	@Autowired
	private ContratanteDao contratanteDaoImpl;

	@Test
	@Transactional
	public void getContratanteTest() {
		Gerente gerente = null;// new Tienda(new Long(2));

		List<Contratante> Contratantes = contratanteDaoImpl.getContratantes(gerente);
		assertNotNull("Listado de Contratante es null", Contratantes);
		assertFalse("No hay Contratante", Contratantes.isEmpty());
		for (int i = 0; i < Contratantes.size(); i++) {
			System.out.println(Contratantes.get(i).getId());
		}
	}

	@Test
	@Transactional
	public void getPadrinoIdTest() {
		Contratante Contratantes = contratanteDaoImpl.getContratantesId(new Long(1));
		assertNotNull("Listado de canales es null", Contratantes);

	}

	//@Ignore
	@Test
	@Transactional(readOnly = false)
	public void addContratanteTest() {

		Contratante contratante = new Contratante();
		//Contratante.setId(new Long(11));
		contratante.setDescription("Test Contratante");

		Gerente gerente = new Gerente(new Long(1));
		contratante.setGerente(gerente);

		try {
			contratanteDaoImpl.addContratante(contratante);
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

		Contratante contratante = new Contratante();
		contratante.setId(new Long(1));

		contratante.setDescription("Contratante 1");

		Gerente gerente = new Gerente(new Long(1));
		contratante.setGerente(gerente);

		try {
			contratanteDaoImpl.editContratante(contratante);
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
		Long ContratanteId = new Long(10);
		try {
			contratanteDaoImpl.deleteContratante(ContratanteId);
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
