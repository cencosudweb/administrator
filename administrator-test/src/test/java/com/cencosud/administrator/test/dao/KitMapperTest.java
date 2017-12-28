/**
 *@name FinancialInstitutionTest.java
 * 
 *@version 1.0 
 * 
 *@date 07-03-2017
 * 
 *@author EA7129
 * 
 *@copyright Cencosud. All rights reserved.
 */
package com.cencosud.administrator.test.dao;

import java.util.List;

import org.hibernate.exception.DataException;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.cencosud.administrator.dao.domain.Channel;
import com.cencosud.administrator.dao.domain.CumplimientoEstaticoWs;
import com.cencosud.administrator.dao.domain.SkuServicioWs;
import com.cencosud.administrator.dao.domain.SystemLog;
import com.cencosud.administrator.dao.domain.TipoGuia;
import com.cencosud.administrator.dao.domain.TipoOrden;
import com.cencosud.administrator.dao.domain.TipoVenta;
import com.cencosud.administrator.dao.domain.UrlCallback;
import com.cencosud.administrator.dao.domain.User;
import com.cencosud.administrator.dao.mapper.KitMapper;

/**
 * @description Clase KitMapperTest que implementa pruebas Unitarias
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/administrator-testContext.xml"})
public class KitMapperTest{

	@Autowired
	private KitMapper kitMapper;
	
	@Test
	@Transactional(readOnly=false)
    public void getUrlCallback() {
		try{
			UrlCallback urlCallback = kitMapper.getUrlCallback(new Long(1), new Long(1));
			
			Assert.assertNotNull("UrlCallback es Nulo", urlCallback);
		}catch(Exception e){
			if(e instanceof DataException){
				Assert.fail(((DataException) e).getSQLException().getMessage());
			}else{
				Assert.fail(e.getMessage());
			}
		}
    }
	
	
	@Test
	@Transactional(readOnly=false)
    public void getChannels() {
		try{
			Channel channels = kitMapper.getChannel(new Long(1));
			
			Assert.assertNotNull("Channels es Nulo", channels);
		}catch(Exception e){
			if(e instanceof DataException){
				Assert.fail(((DataException) e).getSQLException().getMessage());
			}else{
				Assert.fail(e.getMessage());
			}
		}
    }
	
	@Test
	@Transactional(readOnly=false)
    public void getUsers() {
		try{
			User users = kitMapper.getUser("admin", "e10adc3949ba59abbe56e057f20f883e");
			
			Assert.assertNotNull("Channels es Nulo", users);
		}catch(Exception e){
			if(e instanceof DataException){
				Assert.fail(((DataException) e).getSQLException().getMessage());
			}else{
				Assert.fail(e.getMessage());
			}
		}
    }
	
	@Test
	@Transactional(readOnly=false)
    public void getOrdenes() {
		try{
			List<TipoOrden> ordenes =  kitMapper.getTipoOrden();
			Assert.assertNotNull("Tipo Orden es Nulo", ordenes);
		}catch(Exception e){
			if(e instanceof DataException){
				Assert.fail(((DataException) e).getSQLException().getMessage());
			}else{
				Assert.fail(e.getMessage());
			}
		}
    }
	
	@Test
	@Transactional(readOnly=false)
    public void getTipoVentas() {
		try{
			List<TipoVenta> ventas =  kitMapper.getTipoVenta();
			Assert.assertNotNull("Tipo ventas es Nulo", ventas);
		}catch(Exception e){
			if(e instanceof DataException){
				Assert.fail(((DataException) e).getSQLException().getMessage());
			}else{
				Assert.fail(e.getMessage());
			}
		}
    }
	
	@Test
	@Transactional(readOnly=false)
    public void getTipoGuias() {
		try{
			List<TipoGuia> guias =  kitMapper.getTipoGuia();
			Assert.assertNotNull("Tipo Guias es Nulo", guias);
		}catch(Exception e){
			if(e instanceof DataException){
				Assert.fail(((DataException) e).getSQLException().getMessage());
			}else{
				Assert.fail(e.getMessage());
			}
		}
    }
	
	@Test
	@Transactional(readOnly=false)
    public void getCumplimientos() {
		try{
			CumplimientoEstaticoWs cumplimentos = kitMapper.getCumplimientoEstaticoWs("2017-09-25");
			Assert.assertNotNull("Cumplimientos es Nulo", cumplimentos);
		}catch(Exception e){
			if(e instanceof DataException){
				Assert.fail(((DataException) e).getSQLException().getMessage());
			}else{
				Assert.fail(e.getMessage());
			}
		}
    }
	
	
	@Test
	@Transactional(readOnly=false)
    public void getLog() {
		try{
			List<SystemLog> logs =  kitMapper.getLog();
			Assert.assertNotNull("Logs es Nulo", logs);
		}catch(Exception e){
			if(e instanceof DataException){
				Assert.fail(((DataException) e).getSQLException().getMessage());
			}else{
				Assert.fail(e.getMessage());
			}
		}
    }
	
	
	@Test
	@Transactional(readOnly=false)
    public void getSkuServicio() {
		try{
			SkuServicioWs cumplimentos = kitMapper.getSkuServicioWs(995353003);
			Assert.assertNotNull("Sku es Nulo", cumplimentos);
		}catch(Exception e){
			if(e instanceof DataException){
				Assert.fail(((DataException) e).getSQLException().getMessage());
			}else{
				Assert.fail(e.getMessage());
			}
		}
    }
	
}
