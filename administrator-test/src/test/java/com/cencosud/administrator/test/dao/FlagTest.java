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

import com.cencosud.administrator.dao.FlagDao;
import com.cencosud.administrator.dao.domain.Flag;

/**
 * @description Clase ChannelTest que implementa pruebas Unitarias
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/administrator-testContext.xml"})
@TransactionConfiguration(transactionManager="transactionManager", defaultRollback=false)
public class FlagTest{

	@Autowired
	private FlagDao flagDaoImpl;
	
	@Test
	@Transactional
    public void getFlagsTest() {
		List<Flag> flags = flagDaoImpl.getFlags();
		assertNotNull("Listado de Flag es null", flags);
		assertFalse("No hay canales", flags.isEmpty());
		for(int i=0; i<flags.size(); i++){
			System.out.println(flags.get(i).getId());
		}
    }
	
}
