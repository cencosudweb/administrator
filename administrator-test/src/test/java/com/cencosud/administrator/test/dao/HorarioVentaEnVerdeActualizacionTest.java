package com.cencosud.administrator.test.dao;


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

import com.cencosud.administrator.dao.HorarioVentaEnVerdeActualizacionDao;
import com.cencosud.administrator.dao.domain.HorarioVentaEnVerdeActualizacion;

/**
 * @description Clase ChannelTest que implementa pruebas Unitarias
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/administrator-testContext.xml"})
@TransactionConfiguration(transactionManager="transactionManager", defaultRollback=false)
public class HorarioVentaEnVerdeActualizacionTest{

	@Autowired
	private HorarioVentaEnVerdeActualizacionDao HorarioVentaEnVerdeActualizacionDaoImpl;
	
	@Test
	@Transactional
    public void getCommercesTest() {
		List<HorarioVentaEnVerdeActualizacion> channels = HorarioVentaEnVerdeActualizacionDaoImpl.getHorarioVentaEnVerdeActualizacions(0,1);
		assertNotNull("Listado de canales es null", channels);
		assertFalse("No hay canales", channels.isEmpty());
		for(int i=0; i<channels.size(); i++){
			System.out.println(channels.get(i).getId());
		}
    }
	
}
