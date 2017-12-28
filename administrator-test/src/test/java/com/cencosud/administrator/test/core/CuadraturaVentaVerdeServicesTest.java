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

import com.cencosud.administrator.core.CuadraturaVentaVerdeServices;
import com.cencosud.administrator.dto.users.CuadraturaVentaVerdeDTO;

/**
 * @description Clase ChannelTest que implementa pruebas Unitarias
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/administrator-testContext.xml" })
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = false)
public class CuadraturaVentaVerdeServicesTest {

	@Autowired
	private CuadraturaVentaVerdeServices  CuadraturaVentaVerdeServicesImpl ;

	//@Ignore
	@Test
	@Transactional
	public void getEcommerceSoporteVentaTest() {
		
		String estadoRelacion = "1";
		String fechaIni = "2017-10-10 00:00:00";
		String fechaTer = "2017-10-10 23:59:59";

		List<CuadraturaVentaVerdeDTO> cuadraturaVentaVerde = CuadraturaVentaVerdeServicesImpl.getCuadraturaVentaVerde(fechaIni,fechaTer, estadoRelacion, 0, 100);
		assertNotNull("Listado de CuadraturaVentaVerde es null", cuadraturaVentaVerde);
		assertFalse("No hay CuadraturaVentaVerde", cuadraturaVentaVerde.isEmpty());
		// for(int i=0; i<ecommerceSoporteVentas.size(); i++){
		// System.out.println(ecommerceSoporteVentas.get(i).getId());
		// }
	}

	

	//@Ignore
	@Test
	@Transactional
	public void getgetCuadraturaVentaVerdeContarTest() {
		String fechaIni = "2017-10-10 00:00:00";
		String fechaTer = "2017-10-10 23:59:59";
		int calls = CuadraturaVentaVerdeServicesImpl.getCuadraturaVentaVerdeContar(fechaIni,fechaTer, "0");

		assertNotNull("Cantidad de llamadas es null", calls);
		System.out.println("=" + calls);

	}
	
	
	//@Ignore
	@Test
	@Transactional
	public void getCuadraturaVentaVerdePaginadorTest() {
		String fechaIni = "2017-10-10 00:00:00";
		String fechaTer = "2017-10-10 23:59:59";
		int calls = CuadraturaVentaVerdeServicesImpl.getCuadraturaVentaVerdePaginador(fechaIni,fechaTer, "0");

		assertNotNull("Cantidad de llamadas es null", calls);
		System.out.println("=" + calls);

	}

}
