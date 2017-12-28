/**
 *@name SystemLogTest.java
 * 
 *@version 1.0 
 * 
 *@date 04-05-2017
 * 
 *@author EA7129
 * 
 *@copyright Cencosud. All rights reserved.
 */
package com.cencosud.administrator.test.dao;


import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.SimpleDateFormat;
import java.util.Date;
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

//import com.cencosud.administrator.core.enums.LogEnum;
import com.cencosud.administrator.dao.SystemLogDao;
import com.cencosud.administrator.dao.domain.SystemLog;

/**
 * @description 
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/administrator-testContext.xml"})
@TransactionConfiguration(transactionManager="transactionManager", defaultRollback=false)
public class SystemLogTest {
	
	@Autowired
	private SystemLogDao systemLogDaoImpl;
	
	@Test
	@Transactional
    public void getSystemLogTest() {
		List<SystemLog> estados = systemLogDaoImpl.getSystemLog(1,null,0, 1000);
		assertNotNull("Listado de estados System es null", estados);
		assertFalse("No hay estados System", estados.isEmpty());
    }
	
	
	@Test
	@Transactional
    public void getSystemLogIdTest() {
		Long systemLogId = new Long(1);
		try{
			SystemLog systemLog = systemLogDaoImpl.getSystemLogId(systemLogId);
			
			assertNotNull("Log es null", systemLog);
			//assertTrue("Log no valido", systemLog.getId() == systemLogId);
			
			//System.out.println(systemLog);
			
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
    public void addSystemLogTest() {
		String ipAddress = null;
		try {
			ipAddress = InetAddress.getLocalHost().getHostAddress();
		} catch (UnknownHostException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			ipAddress = null;
		}
		
		//1- User Logged In  Fron End - User Logeado in to  Fron End
		//2- User Expiradas In Fron End - User Credenciales Expiradas in to  Fron End
		//3- User bloqueada In  Fron End - User cuenta bloqueada in to  Fron End
		//4- User Invalida In  Fron End - User Password invalida in to  Fron End
		//5- User Not Exists In  Fron End - User Password No Existe in to  Fron End

		
		Date now = new Date();
		SimpleDateFormat ft = new SimpleDateFormat ("YYYY-MM-dd HH:mm:ss");
		String currentDate = ft.format(now);
		
		try{
			String action = "User Logged In  Fron End";
			String tablename = "-";
			String pagename = "-";
			int loglevel = 1;
			String description = "User Logged in to  Fron End";
			String ipaddress = ipAddress;
			//Long idUser = new Long(1);
			String data = "-";
			int iduser = 0;
			String creationdate = String.valueOf(currentDate);
			systemLogDaoImpl.addSystemLog(iduser, loglevel, action, description, data, tablename, pagename, ipaddress, creationdate);
//			systemLogDaoImpl.addSystemLog(idUser, loglevel, action, description, data, tablename, pagename, ipaddress);
			//systemLogDaoImpl.addSystemLog(systemLog);
			assertTrue(true);
		}catch(Exception e){
			if(e instanceof DataException){
				Assert.fail(((DataException) e).getSQLException().getMessage());
			}else{
				Assert.fail(e.getMessage());
			}
		}
    }
    
	
	@Test
	@Transactional
    public void getSystemLogCountTest() {
		Long systemLogs = systemLogDaoImpl.getCounts(3, "Alexis Enrique Morales Diaz");
		assertNotNull("Listado logs es null", systemLogs);
		System.out.println("="+systemLogs);
    }
    

}
