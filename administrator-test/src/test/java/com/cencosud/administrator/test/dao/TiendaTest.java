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

import com.cencosud.administrator.dao.TiendaDao;
import com.cencosud.administrator.dao.domain.Flag;
import com.cencosud.administrator.dao.domain.Tienda;

/**
 * @description Clase ChannelTest que implementa pruebas Unitarias
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/administrator-testContext.xml" })
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = false)
public class TiendaTest {

	@Autowired
	private TiendaDao tiendaDaoImpl;

	@Test
	@Transactional
	public void getTiendasTest() {
		List<Tienda> tiendas = tiendaDaoImpl.getTiendas();
		assertNotNull("Listado de canales es null", tiendas);
		assertFalse("No hay canales", tiendas.isEmpty());
		for (int i = 0; i < tiendas.size(); i++) {
			System.out.println(tiendas.get(i).getId());
		}
	}

	@Test
	@Transactional
	public void getTiendasIdTest() {
		Tienda tiendas = tiendaDaoImpl.getTiendasId(new Long(1));
		assertNotNull("Listado de canales es null", tiendas);

	}

	// @Ignore
	@Test
	@Transactional(readOnly = false)
	public void addTiendaTest() {

		Tienda tienda = new Tienda();
		tienda.setDescription("test A");
		
		Flag flag = new Flag(new Long(1));
		tienda.setFlag(flag);
		
		
		// tienda.setId(new Long(7));
		// tienda.setNumeroRequerimiento(1);

		// Prioridad prioridad = new Prioridad(new Long(1));
		// pauta.setPrioridad(prioridad);

		// tienda.setFechaVisita("2017-07-18");
		// user.setRoles(roles);

		try {
			tiendaDaoImpl.addTienda(tienda);
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
		public void editTiendaTest() {

			Tienda tienda = new Tienda();
			tienda.setId(new Long(146));
			tienda.setDescription("Tienda 11");
			//tienda.setNumeroRequerimiento(1113);
			
			Flag flag = new Flag(new Long(1));
			tienda.setFlag(flag);

			//Prioridad prioridad = new Prioridad(new Long(2));
			//pauta.setPrioridad(prioridad);
			//pauta.setDescripcionIssue("AAAA2");

			
			// user.setRoles(roles);

			try {
				tiendaDaoImpl.editTienda(tienda);
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
	public void deleteTiendaTest() {
		Long tiendaID = new Long(3);
		try {
			tiendaDaoImpl.deleteTienda(tiendaID);
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
