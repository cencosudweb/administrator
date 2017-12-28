package com.cencosud.administrator.test.dao;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.cencosud.administrator.dao.EcommerceSoporteVentaDao;
import com.cencosud.administrator.dao.domain.EcommerceSoporteVenta;

/**
 * @description Clase ChannelTest que implementa pruebas Unitarias
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/administrator-testContext.xml" })
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = false)
public class EcommerceSoporteVentaTest {

	@Autowired
	private EcommerceSoporteVentaDao ecommerceSoporteVentaDaoImpl;

	@Ignore
	@Test
	@Transactional
	public void getEcommerceSoporteVentaTest() {
		List<EcommerceSoporteVenta> ecommerceSoporteVentas = ecommerceSoporteVentaDaoImpl
				.getEcommerceSoporteVentas("20171004", "0");
		assertNotNull("Listado de ecommerce soporte venta es null", ecommerceSoporteVentas);
		assertFalse("No hay canales", ecommerceSoporteVentas.isEmpty());
		// for(int i=0; i<ecommerceSoporteVentas.size(); i++){
		// System.out.println(ecommerceSoporteVentas.get(i).getId());
		// }
	}

	

	@Ignore
	@Test
	@Transactional
	public void getEcommerceSoporteVentaCountTest() {
		String starttime = "20170908";
		int calls = ecommerceSoporteVentaDaoImpl.getEcommerceSoporteVentaCounts(starttime, "0");

		assertNotNull("Cantidad de llamadas es null", calls);
		System.out.println("=" + calls);

	}

	@Ignore
	@Test
	@Transactional
	public void getEcommerceSoporteVentaCountTest2() {
		String starttime = "20170925";

		// String fecha, String estado, String estadoRelacion, String coddesp,
		// String canVend

		int calls = ecommerceSoporteVentaDaoImpl.getEcommerceSoporteVentaCounts(starttime, null, "2", "0", null,
				"99999999");

		assertNotNull("Soprote venta 2 es null", calls);
		System.out.println("Total111=" + calls);

	}

	@Ignore
	@Test
	@Transactional
	public void getEcommerceSoporteVentaEomFindCountTest() {
		String starttime = "20170925";
		int calls = ecommerceSoporteVentaDaoImpl.getEcommerceSoporteVentaEomFindCounts(starttime, "1", "3", "0", null,
				null, null);

		assertNotNull("Cantidad de llamadas es null", calls);
		System.out.println("=" + calls);

	}

	@Ignore
	@Test
	@Transactional
	public void getEcommerceSoporteVentaCountEomDadTest() {
		String fecha = "20170925";
		String estado = "1";
		String estadoRelacion = "3";
		String coddesp = null;
		String canVend = null;
		String subEstoc = "3";
		String sku = null;

		int calls = ecommerceSoporteVentaDaoImpl.getEcommerceSoporteVentaCountsEomDad(fecha, estado, estadoRelacion,
				coddesp, canVend, subEstoc, sku);

		assertNotNull("Cantidad de llamadas es null", calls);
		System.out.println("=" + calls);

	}

	@Ignore
	@Test
	@Transactional
	public void getEcommerceSoporteVentaCountWmsTest2() {
		String starttime = "20170925";

		// String fecha, String estado, String estadoRelacion, String coddesp,
		// String canVend
		int calls = ecommerceSoporteVentaDaoImpl.getEcommerceSoporteVentaWmsCounts(starttime, null, "4", null, null,
				null);

		assertNotNull("Soprote venta Wms es null", calls);
		System.out.println("Total111=" + calls);

	}

	@Ignore
	@Test
	@Transactional
	public void getEcommerceSoporteVentaCountJdaTest2() {
		String starttime = "20170925";

		// String fecha, String estado, String estadoRelacion, String coddesp,
		// String canVend

		int calls = ecommerceSoporteVentaDaoImpl.getEcommerceSoporteVentaJdaCounts(starttime, null, "5", null, null,
				null);

		assertNotNull("Soprote venta jda es null", calls);
		System.out.println("Total111=" + calls);

	}

	
	@Ignore
	@Test
	@Transactional
	public void getcantSoporteVentaWmsDifTest() {
		String starttime = "20170925";
		int calls = ecommerceSoporteVentaDaoImpl.getEcommerceSoporteVentaWmsDifCounts(starttime, "1", "4", null, null,
				null);

		assertNotNull("Cantidad de llamadas es null", calls);
		System.out.println("=" + calls);

	}

	@Ignore
	@Test
	@Transactional
	public void getcantSoporteVentaJdaDifTest() {
		String starttime = "20170925";
		int calls = ecommerceSoporteVentaDaoImpl.getEcommerceSoporteVentaJdaDifCounts(starttime, "1", "4", null, null,
				null);

		assertNotNull("Cantidad de llamadas es null", calls);
		System.out.println("=" + calls);

	}

	@Ignore
	@Test
	@Transactional
	public void getcantTestTest() {
		String starttime = "20170925";
		// int calls =
		// ecommerceSoporteVentaDaoImpl.getEcommerceSoporteVentaCountsPosJhonson(starttime,
		// null, "2", "0", "400", "99999999");
		// Post Jhonson
		// int calls =
		// ecommerceSoporteVentaDaoImpl.getEcommerceSoporteVentaCountsPosJhonson(starttime,
		// null, "2", "0", "400", "99999999");
		// Post Paris
		// int calls =
		// ecommerceSoporteVentaDaoImpl.getEcommerceSoporteVentaCountsPosParis(starttime,
		// null, "2", "0", "400", "99999999");
		// Paris.cl
		// int calls =
		// ecommerceSoporteVentaDaoImpl.getEcommerceSoporteVentaCountsPosParisCl(starttime,
		// null, "2", "0", "32", "99999999");
		// Diferencias Soporte Ventas VS Ecommerce
		// int calls =
		// ecommerceSoporteVentaDaoImpl.getEcommerceSoporteVentaCounts(starttime,
		// "0", "1", null, null, null);

		// dif
		int calls = ecommerceSoporteVentaDaoImpl.getEcommerceSoporteVentaEomDifCounts(starttime, "0", "3", "0", null,
				null, "99999999");
		// bopis
		// int calls =
		// ecommerceSoporteVentaDaoImpl.getEcommerceSoporteVentaCountsEomDad(starttime,
		// "1", "3", "0", null, "1", "99999999");
		// clickAndCollect
		// int calls =
		// ecommerceSoporteVentaDaoImpl.getEcommerceSoporteVentaCountsEomDad(starttime,"1",
		// "3", "0", null, "2", "99999999");
		// Dad
		// int calls =
		// ecommerceSoporteVentaDaoImpl.getEcommerceSoporteVentaCountsEomDad(starttime,
		// "1", "3", "0", null, "3", "99999999");

		assertNotNull("Cantidad de llamadas es null", calls);
		System.out.println("=" + calls);

	}

	@Ignore
	@Test
	@Transactional
	public void getEcommerceSoporteVentaTest2() {
		List<EcommerceSoporteVenta> ecommerceSoporteVentas = ecommerceSoporteVentaDaoImpl
				.getEcommerceSoporteVentas("20171004", "0", "1", null, null, 0, 1000);
		assertNotNull("Listado de ecommerce soporte venta es null", ecommerceSoporteVentas);
		assertFalse("No hay canales", ecommerceSoporteVentas.isEmpty());
		// for(int i=0; i<ecommerceSoporteVentas.size(); i++){
		// System.out.println(ecommerceSoporteVentas.get(i).getId());
		// }
	}
	@Ignore
	@Test
	@Transactional
	public void getEcommerceSoporteVentaPaginadorTest() {

		String fecha = "20171004";
		String estado = "0";
		String canVend = null;
		String estadoRelacion = "1";
		String coddesp = null;
		int count  = ecommerceSoporteVentaDaoImpl
				.getEcommerceSoporteVentaPaginador(fecha, estado, estadoRelacion, coddesp, canVend);

		assertNotNull("contar de soporte venta es null", count);
	}
	
	@Ignore
	@Test
	@Transactional
	public void getEcommerceSoporteVentaEomDifTest2() {
		List<EcommerceSoporteVenta> ecommerceSoporteVentas = ecommerceSoporteVentaDaoImpl
				.getEcommerceSoporteVentaEomDifs("20171004", "1", "4", null, null, null, null, 0, 1000000000);
		assertNotNull("Listado de ecommerce soporte venta Eom dif es null", ecommerceSoporteVentas);
		assertFalse("No hay canales", ecommerceSoporteVentas.isEmpty());
		/*for (int i = 0; i < ecommerceSoporteVentas.size(); i++) {
			System.out.println(ecommerceSoporteVentas.get(i).getId());
		}
		*/
	}
	
	@Ignore
	@Test
	@Transactional
	public void getEcommerceSoporteVentawMSTest() {
		List<EcommerceSoporteVenta> ecommerceSoporteVentas = ecommerceSoporteVentaDaoImpl
				.getEcommerceSoporteVentaWmsDifs("20171004", "1", "4", null, null, null, null, 0, 1000000000);
		assertNotNull("Listado de ecommerce soporte venta es null", ecommerceSoporteVentas);
		assertFalse("No hay canales", ecommerceSoporteVentas.isEmpty());
		// for(int i=0; i<ecommerceSoporteVentas.size(); i++){
		// System.out.println(ecommerceSoporteVentas.get(i).getId());
		// }
	}
	@Ignore
	@Test
	@Transactional
	public void getEcommerceSoporteVentaWmsDifPaginadorTest() {
		int ecommerceSoporteVentas = ecommerceSoporteVentaDaoImpl
				.getEcommerceSoporteVentaWmsDifPaginador("20171004", "1", "4", null, null, null, null);
		assertNotNull("Listado de ecommerce soporte venta es null", ecommerceSoporteVentas);
		// for(int i=0; i<ecommerceSoporteVentas.size(); i++){
		// System.out.println(ecommerceSoporteVentas.get(i).getId());
		// }
	}
	
	
	//@Ignore
	@Test
	@Transactional
	public void getEcommerceSoporteVentaJdaDifsTest() {
		/*
		String estado = "";
		String estadoRelacion = "";
		String coddesp = "";
		String loloca = ""; 
		String tipoEstadoOc = ""; 
		String sku  = "";
		*/
		
		List<EcommerceSoporteVenta> ecommerceSoporteVentas = ecommerceSoporteVentaDaoImpl.getEcommerceSoporteVentaJdaDifs("20171004", "1", "4", null, null, null, null, 0, 10000000);
		
		assertNotNull("Listado de ecommerce soporte venta es null", ecommerceSoporteVentas);
		assertFalse("No hay canales", ecommerceSoporteVentas.isEmpty());
		
		// for(int i=0; i<ecommerceSoporteVentas.size(); i++){
		// System.out.println(ecommerceSoporteVentas.get(i).getId());
		// }
	}
	
	@Test
	@Transactional
	public void getEcommerceSoporteVentaJdaDifPaginadorTest() {
		int ecommerceSoporteVentas = ecommerceSoporteVentaDaoImpl
				.getEcommerceSoporteVentaJdaDifPaginador("20171004", "1", "4", null, null, null, null);
		assertNotNull("Listado de ecommerce soporte venta es null", ecommerceSoporteVentas);
		// for(int i=0; i<ecommerceSoporteVentas.size(); i++){
		// System.out.println(ecommerceSoporteVentas.get(i).getId());
		// }
	}
	
	



}
