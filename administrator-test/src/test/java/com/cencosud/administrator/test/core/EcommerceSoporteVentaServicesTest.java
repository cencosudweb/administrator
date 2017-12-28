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

import java.util.List;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.cencosud.administrator.core.EcommerceSoporteVentaServices;
import com.cencosud.administrator.dto.users.EcommerceSoporteVentaDTO;

/**
 * @description Clase
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/administrator-testContext.xml" })
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = false)
public class EcommerceSoporteVentaServicesTest {

	@Autowired
	private EcommerceSoporteVentaServices ecommerceSoporteVentaServicesImpl;

	//@Ignore
	@Test
	@Transactional
	public void getEcommcerSoporteVentaCounts() {
		String fecha = "20171114";
		String sku = null;
		String canVend = null;
		String coddesp = "0";
		String estado = null;
		String estadoRelacion = "2";
		// int count =
		// ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaCounts(fecha,
		// estado);
		int count = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaCounts(fecha, estado, estadoRelacion,
				coddesp, canVend, sku);
		
 		int dif = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaCounts(fecha, "0", "1", null, null, null);
		System.out.println("dif: " + dif);

		assertNotNull("Cantidad de registros en null", count);
		System.out.println("Cantidad: " + count);

	}

	@Ignore
	@Test
	@Transactional
	public void getEcommerceSoporteVentaCountEomDifTest() {
		String coddesp = "0";
		String canVend = null;
		String estado = null;
		String subEstoc = "4";
		String sku = null;
		String estadoRelacion = "3";
		String fecha = "20170925";
		int count = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaEomDifCounts(fecha, estado,
				estadoRelacion, coddesp, canVend, subEstoc, sku);

		assertNotNull("Cantidad de diferencias en eom", count);
		System.out.println("cantidad diferencias Eom = " + count);

	}

	@Ignore
	@Test
	@Transactional
	public void getEcommerceSoporteVentaCountEomFindTest2() {
		//String sku = null;
		//String canVend = null;
		//String coddesp = "0";
		//String starttime = "20171024";
		//String estado = "3";
		//String subEstoc = null;
		//String estadoRelacion = "0";
		
 		int count = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaEomFindCounts("2017-01-01", "1", "3", "0", null, null, "99999999");

		
		assertNotNull("Cantidad soporte venta encontrados en Eom", count);
		System.out.println("cantidad soporte venta encontradas Eom = " + count);

	}

	@Ignore
	@Test
	@Transactional
	public void getEcommerceSoporteVentaCountsPosParisTest() {

		String estado = null;
		String canVend = "400";
		String estadoRelacion = "2";
		String coddesp = "0";
		String fecha = "20170925";
		String sku = null;
		int count = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaCountsPosParis(fecha, estado,
				estadoRelacion, coddesp, canVend, sku);

		assertNotNull("Cantidad de soporte venta Post Paris", count);
		System.out.println("cantidad soporte venta encontradas Eom = " + count);
	}

	@Ignore
	@Test
	@Transactional
	public void getEcommerceSoporteVentaCountEomDadTest() {

		String fecha = "20170925";
		String coddesp = null;
		String estado = "1";
		String canVend = null;
		String sku = null;
		String estadoRelacion = "3";
		String subEstoc = "1";
		int count = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaCountsEomDad(fecha, estado,
				estadoRelacion, coddesp, canVend, subEstoc, sku);

		assertNotNull("Cantidad soporte venta eom Dad", count);
		System.out.println("cantidad soporte venta eom Dad = " + count);
	}

	@Ignore
	@Test
	@Transactional
	public void getEcommerceSoporteVentaCountEomClickCollectTest() {

		String subEstoc = null;
		String canVend = null;
		String sku = null;
		String fecha = "20170925";
		String coddesp = null;
		String estadoRelacion = "0";
		String estado = "1";
		int count = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaCountsEomClikcCollect(fecha, estado,
				estadoRelacion, coddesp, canVend, subEstoc, sku);
		assertNotNull("Cantidad soporte venta eom Dad", count);
	}

	@Ignore
	@Test
	@Transactional
	public void getEcommerceSoporteVentaCountEomBopisTest() {
		String fecha = "20170925";
		String estado = "1";
		String estadoRelacion = "3";
		String sku = null;
		String canVend = null;
		String coddesp = null;
		String subEstoc = "3";
		int count = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaCountsEomBopis(fecha, estado,
				estadoRelacion, coddesp, canVend, subEstoc, sku);

		assertNotNull("Cantidad en soporte venta Eom Bopis", count);
		System.out.println("cantidad soporte venta eom Bopis = " + count);

	}

	@Ignore
	@Test
	@Transactional
	public void getEcommerceSoporteVentaWCountTest() {
		String estado = null;
		String coddesp = null;
		String sku = null;
		String estadoRelacion = "4";
		String fecha = "20171105";
		String canVend = null;
		int count = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaWmsCounts(fecha, estado, estadoRelacion,
				coddesp, canVend, sku);

		assertNotNull("Cantidad Wms", count);
		System.out.println("cantidad Wms = " + count);
	}
	
	//@Ignore
		@Test
		@Transactional
		public void getEcommerceSoporteVentaJda11CountTest() {
			String estado = null;
			String coddesp = null;
			String sku = null;
			String estadoRelacion = "4";
			String fecha = "20171105";
			String canVend = null;
			int count = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaJdaCounts(fecha, estado, estadoRelacion,
					coddesp, canVend, sku);

			assertNotNull("Cantidad Jda", count);
			System.out.println("cantidad Jda = " + count);
		}

	@Ignore
	@Test
	@Transactional
	public void getEcommerceSoporteVentaJdaCountTest() {

		// String coddesp = null;
		String fecha = "20170925";
		// String estadoRelacion = "5";
		// String canVend = null;
		// String estado = null;
		// String sku = null;
		// int count =
		// ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaJdaCounts(fecha,
		// estado, estadoRelacion, coddesp, canVend, sku);
		int count = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaWmsDifCounts(fecha, "1", "4", null, null,
				null);

		assertNotNull("Cantidad Jda", count);
		System.out.println("cantidad Jda = " + count);
	}

	@Ignore
	@Test
	@Transactional
	public void getEcommerceSoporteVentaWmsCountTest() {

		// String coddesp = null;
		String fecha = "20170925";
		// String estadoRelacion = "5";
		// String canVend = null;
		// String estado = null;
		// String sku = null;
		// int count =
		// ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaJdaCounts(fecha,
		// estado, estadoRelacion, coddesp, canVend, sku);
		int count = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaWmsDifCounts(fecha, "1", "4", null, null,
				null);

		assertNotNull("Cantidad Wms", count);
		System.out.println("cantidad Wms = " + count);
	}

	@Ignore
	@Test
	@Transactional
	public void getEcommerceSoporteVentaCountsPosParisClTest() {

		// String coddesp = null;
		String fecha = "20170920";
		// String estadoRelacion = "5";
		// String canVend = null;
		// String estado = null;
		// String sku = null;
		// int count =
		// ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaJdaCounts(fecha,
		// estado, estadoRelacion, coddesp, canVend, sku);
		// int count =
		// ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaCountsPosParisCl(fecha,
		// null, "2", "0", "32", "99999999");
		// Post Paris
		int count = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaCountsPosParis(fecha, null, "2", "0",
				"400", "99999999");

		assertNotNull("Cantidad Wms", count);
		System.out.println("cantidad Wms = " + count);
	}

	@Ignore
	@Test
	@Transactional
	public void getEcommerceSoporteVentaTest() {

		String fecha = "20171004";
		String estado = "0";
		String canVend = null;
		String estadoRelacion = "1";
		String coddesp = null;
		List<EcommerceSoporteVentaDTO> ecommerceSoporteVentas = ecommerceSoporteVentaServicesImpl
				.getEcommerceSoporteVentas(fecha, estado, estadoRelacion, coddesp, canVend, 0, 100);

		assertNotNull("Listado de soporte venta es null", ecommerceSoporteVentas);
		assertFalse("No hay soporte venta", ecommerceSoporteVentas.isEmpty());
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
		int count = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaPaginador(fecha, estado, estadoRelacion,
				coddesp, canVend);

		assertNotNull("contar de soporte venta es null", count);
	}

	@Ignore
	@Test
	@Transactional
	public void getEcommerceSoporteVentaEomDifsListTest() {

		String coddesp = "0";
		String sku = "99999999";
		String estadoRelacion = "3";
		String canVend = null;
		String subEstoc = "4";
		String fecha = "20170925";
		String estado = null;
		List<EcommerceSoporteVentaDTO> soporte = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaEomDifs(
				fecha, estado, estadoRelacion, coddesp, canVend, subEstoc, sku, 0, 1000000000);
		assertNotNull("Listado de soporte en venta Eom Diferencias", soporte);
	}

	@Ignore
	@Test
	@Transactional
	public void getEcommerceSoporteVentawMSTest() {
		List<EcommerceSoporteVentaDTO> ecommerceSoporteVentas = ecommerceSoporteVentaServicesImpl
				.getEcommerceSoporteVentaWmsDifs("201701004", "1", "4", null, null, null, null, 0, 1000000000);
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
		int contar = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaWmsDifPaginador("201701004", "1", "4",
				null, null, null, null);
		assertNotNull("Listado de ecommerce soporte venta es null", contar);
		// for(int i=0; i<ecommerceSoporteVentas.size(); i++){
		// System.out.println(ecommerceSoporteVentas.get(i).getId());
		// }
	}

	@Ignore
	@Test
	@Transactional
	public void getEcommerceSoporteVentaJdaDifsTest() {
		/*
		 * String estado = ""; String estadoRelacion = ""; String coddesp = "";
		 * String loloca = ""; String tipoEstadoOc = ""; String sku = "";
		 */

		List<EcommerceSoporteVentaDTO> ecommerceSoporteVentas = ecommerceSoporteVentaServicesImpl
				.getEcommerceSoporteVentaJdaDifs("20171004", "1", "4", null, null, null, null, 0, 10000000);

		assertNotNull("Listado de ecommerce soporte venta es null", ecommerceSoporteVentas);
		assertFalse("No hay canales", ecommerceSoporteVentas.isEmpty());

		// for(int i=0; i<ecommerceSoporteVentas.size(); i++){
		// System.out.println(ecommerceSoporteVentas.get(i).getId());
		// }
	}
	
	@Ignore
	@Test
	@Transactional
	public void getEcommerceSoporteVentaJdaDifPaginadorTest() {
		int ecommerceSoporteVentas = ecommerceSoporteVentaServicesImpl
				.getEcommerceSoporteVentaJdaDifPaginador("20171004", "1", "4", null, null, null, null);
		assertNotNull("Listado de ecommerce soporte venta es null", ecommerceSoporteVentas);
		// for(int i=0; i<ecommerceSoporteVentas.size(); i++){
		// System.out.println(ecommerceSoporteVentas.get(i).getId());
		// }
	}

}
