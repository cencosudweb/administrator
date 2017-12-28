package com.cencosud.administrator.test.dao;


import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.util.List;

import org.hibernate.exception.DataException;
import org.junit.Assert;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.cencosud.administrator.dao.PautaDao;
import com.cencosud.administrator.dao.domain.Area;
import com.cencosud.administrator.dao.domain.Contratante;
import com.cencosud.administrator.dao.domain.Estado;
import com.cencosud.administrator.dao.domain.Gerente;
import com.cencosud.administrator.dao.domain.Padrino;
import com.cencosud.administrator.dao.domain.Pauta;
import com.cencosud.administrator.dao.domain.Prioridad;
import com.cencosud.administrator.dao.domain.Reportado;
import com.cencosud.administrator.dao.domain.Soporte;
import com.cencosud.administrator.dao.domain.Tienda;

/**
 * @description Clase ChannelTest que implementa pruebas Unitarias
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/administrator-testContext.xml"})
@TransactionConfiguration(transactionManager="transactionManager", defaultRollback=false)
public class PautaTest{

	@Autowired
	private PautaDao pautaDaoImpl;
	
	//@Ignore
	@Test
	@Transactional
    public void getCommercesTest() {
		List<Pauta> pautas = pautaDaoImpl.getPautas();
		assertNotNull("Listado de canales es null", pautas);
		assertFalse("No hay pautas", pautas.isEmpty());
		
    }
	@Ignore
	@Test
	@Transactional
    public void getPautas2Test() {
		Tienda tienda = null;// new Tienda(new Long(2));
		Padrino padrino = null;//new Padrino(new Long(2));
		Gerente gerente = null;//new Gerente(new Long(2)); 
		Contratante contratante = null;//new Contratante(new Long(2));
		Soporte soporte = null;//new Soporte(new Long(2));
		Estado estado = null;//new Soporte(new Long(2));
		String fecha = null;
		
		
		
		List<Pauta> pautas = pautaDaoImpl.getPautas(tienda, padrino, gerente, contratante, soporte, estado, fecha, 0, 100);
		for(int i=0; i<pautas.size(); i++){
			System.out.println("==="+pautas.get(i).getId());
		}
		assertNotNull("Listado de pautas2 es null", pautas);
		assertFalse("No hay pautas2", pautas.isEmpty());
		
    }
	@Ignore
	@Test
	@Transactional
    public void getPautasCountTest() {
		Tienda tienda = null;// new Tienda(new Long(2));
		Padrino padrino = null;//new Padrino(new Long(2));
		Gerente gerente = null;//new Gerente(new Long(2)); 
		Contratante contratante = null;//new Contratante(new Long(2));
		Soporte soporte = null;//new Soporte(new Long(2));
		Estado estado = null;//new Soporte(new Long(2));
		String  starttime = null;
		

		int pautas = pautaDaoImpl.getCountPautas(tienda, padrino, gerente, contratante, soporte, estado, starttime);
		System.out.println("coutn="+pautas);
		assertNotNull("Cantidad de pautas es null", pautas);
		
		
    }
	
	@Ignore
	@Test
	@Transactional
    public void getPautaTest() {
		Long pautaId = new Long(3);
		try{
			Pauta pauta = pautaDaoImpl.getPauta(pautaId);
			
			assertNotNull("Usuario es null", pauta);
			assertTrue("Usuario no valido", pauta.getId() == pautaId);
			
			//Commerce c = user.getCommerces().iterator().next();
			//System.out.println(c);
			
			//QuestionAnswer qa = user.getQas().iterator().next();
			//System.out.println(qa);
			
			
		}catch(Exception e){
			if(e instanceof DataException){
				Assert.fail(((DataException) e).getSQLException().getMessage());
			}else{
				Assert.fail(e.getMessage());
			}
		}
    }
	
	
	@Ignore
	@Test
	@Transactional
    public void deletePautaTest() {
		Long pautaID = new Long(7);
		try{
			pautaDaoImpl.deletePauta(pautaID);
			assertTrue(true);
		}catch(Exception e){
			if(e instanceof DataException){
				Assert.fail(((DataException) e).getSQLException().getMessage());
			}else{
				Assert.fail(e.getMessage());
			}
		}
    }
	
	
	@Ignore
	@Test
	@Transactional(readOnly=false)
    public void addPautaTest() {
		
		
		
		Pauta pauta = new Pauta();
		//pauta.setId(new Long(7));
		pauta.setNumeroRequerimiento(1);
		
		Prioridad prioridad = new Prioridad(new Long (1));
		pauta.setPrioridad(prioridad);
		
		pauta.setDescripcionIssue("xxx");
		
		Reportado reportado = new Reportado(new Long (1));
		pauta.setReportado(reportado);
		
		Area area = new Area(new Long (1));
		pauta.setArea(area);
		
		pauta.setObservacion("xxxxx");
		
		Tienda tienda = new Tienda(new Long (103));
		pauta.setTienda(tienda);
		
		Padrino padrino = new Padrino(new Long (53));
		pauta.setPadrino(padrino);
		
		Gerente gerente = new Gerente(new Long (1));
		pauta.setGerente(gerente);
		
		
		Soporte soporte = new Soporte(new Long (1));
		pauta.setSoporte(soporte);
		
		Contratante contratante = new Contratante(new Long (1));
		pauta.setContratante(contratante);
		
		Estado estado = new Estado(new Long (1));
		pauta.setEstado(estado);
		
		pauta.setFechaVisita("2017-07-18");
		//user.setRoles(roles);
		
		pauta.setTicketCu("hhhhhhhhhhhhhhh");
		
		try{
			pautaDaoImpl.addPauta(pauta);
			assertTrue(true);
		}catch(Exception e){
			if(e instanceof DataException){
				Assert.fail(((DataException) e).getSQLException().getMessage());
			}else{
				Assert.fail(e.getMessage());
			}
		}
    }
	
	//@Ignore
	@Test
	@Transactional
    public void editPautaTest() {
		
		
		
		Pauta pauta = new Pauta();
		pauta.setId(new Long(206));
		
		pauta.setNumeroRequerimiento(206);
		
		Prioridad prioridad = new Prioridad(new Long (1));
		pauta.setPrioridad(prioridad);
		pauta.setDescripcionIssue("AAAA2");
		
		Reportado reportado = new Reportado(new Long (1));
		pauta.setReportado(reportado);
		
		Area area = new Area(new Long (1));
		pauta.setArea(area);
		
		pauta.setObservacion("OOOOO2");
		
		Tienda tienda = new Tienda(new Long (1));
		pauta.setTienda(tienda);
		
		Padrino padrino = new Padrino(new Long (322));
		pauta.setPadrino(padrino);
		
		Gerente gerente = new Gerente(new Long (1));
		pauta.setGerente(gerente);
		
		
		Soporte soporte = new Soporte(new Long (1));
		pauta.setSoporte(soporte);
		
		Contratante contratante = new Contratante(new Long (1));
		pauta.setContratante(contratante);
		
		Estado estado = new Estado(new Long (1));
		pauta.setEstado(estado);
		
		pauta.setFechaVisita("2017-07-16");
		//user.setRoles(roles);
		
		pauta.setTicketCu("sssssssss" != null?"aaaaaaa":"bbbbbbbbbbbb");
		
		try{
			pautaDaoImpl.editPauta(pauta);
			assertTrue(true);
		}catch(Exception e){
			if(e instanceof DataException){
				Assert.fail(((DataException) e).getSQLException().getMessage());
			}else{
				Assert.fail(e.getMessage());
			}
		}
    }
	
	@Ignore
	@Test
	@Transactional
    public void getPautaRandomTest() {
		int pautas = pautaDaoImpl.getPautaRandom(847);
		System.out.println("random="+pautas);
		assertNotNull("Cantidad de pautas es null", pautas);
		
		
    }
	
	
	
}
