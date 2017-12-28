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
import static org.junit.Assert.assertTrue;

import java.util.List;

import org.junit.Assert;
import org.junit.Ignore;
//import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.cencosud.administrator.core.PautaServices;
import com.cencosud.administrator.dto.users.AreaDTO;
import com.cencosud.administrator.dto.users.ContratanteDTO;
import com.cencosud.administrator.dto.users.EstadoDTO;
import com.cencosud.administrator.dto.users.GerenteDTO;
import com.cencosud.administrator.dto.users.PadrinoDTO;
import com.cencosud.administrator.dto.users.PautaDTO;
import com.cencosud.administrator.dto.users.PrioridadDTO;
import com.cencosud.administrator.dto.users.ReportadoDTO;
import com.cencosud.administrator.dto.users.SoporteDTO;
import com.cencosud.administrator.dto.users.TiendaDTO;
import com.cencosud.administrator.utils.OperationResult;


/**
 * @description Clase 
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/administrator-testContext.xml"})
@TransactionConfiguration(transactionManager="transactionManager", defaultRollback=false)
public class PautaServicesTest{

	@Autowired
	private PautaServices pautaServicesImpl;
	
	//@Ignore
	@Test
	@Transactional
    public void getPautasTest() {
		
		List<PautaDTO> pautas = pautaServicesImpl.getPautas();
		
		assertNotNull("Listado de canales es null", pautas);
		assertFalse("No hay canales", pautas.isEmpty());
		
		
    }
	@Ignore
	@Test
	@Transactional
    public void getPautas2Test() {
		/*
		TiendaDTO tienda = new TiendaDTO(new Long(1));
		PadrinoDTO padrino = new PadrinoDTO(new Long(1));
		GerenteDTO gerente = new GerenteDTO(new Long(1)); 
		ContratanteDTO contratante = new ContratanteDTO(new Long(1));
		SoporteDTO soporte = new SoporteDTO(new Long(1));
		String starttime = "2017-08-08";
		*/
		
		TiendaDTO tienda = null;
		PadrinoDTO padrino = null;
		GerenteDTO gerente = null; 
		ContratanteDTO contratante = null;
		SoporteDTO soporte = null;
		EstadoDTO estado = null;
		String starttime = null;
		
		
		
		
		List<PautaDTO> pautas = pautaServicesImpl.getPautas(tienda, padrino, gerente, contratante, soporte, estado, starttime, 0, 100);
		assertNotNull("Listado de pautas2 es null", pautas);
		assertFalse("No hay pautas2", pautas.isEmpty());
		
		
		
    }
	
	@Ignore
	@Test
	@Transactional
    public void getPautasCountTest() {
		TiendaDTO tienda = new TiendaDTO(new Long(2));
		PadrinoDTO padrino = new PadrinoDTO(new Long(2));
		GerenteDTO gerente = new GerenteDTO(new Long(2)); 
		ContratanteDTO contratante = new ContratanteDTO(new Long(2));
		SoporteDTO soporte = new SoporteDTO(new Long(2));
		EstadoDTO estado = new EstadoDTO(new Long(1));
		String starttime = null;
		
		
		
		int pautas = pautaServicesImpl.getCountPautas(tienda, padrino, gerente, contratante, soporte, estado, starttime);
		System.out.println("pautas="+pautas);	
		
		assertNotNull("Cantidad de llamadas es null", pautas);
		
    }
	
	@Ignore
	@Test
	@Transactional
    public void deletePautaTest() {
		
		try{
			pautaServicesImpl.deletePauta(new Long(1));
			assertTrue(true);
		}catch(Exception e){
			Assert.fail(e.getMessage());
		}
    }
	
	
	@Ignore
	@Test
	@Transactional(readOnly=false)
	public void addPautaTest() {
		PautaDTO pauta = new PautaDTO();
		//pauta.setId(new Long(160));
		pauta.setNumeroRequerimiento(1);
		
		PrioridadDTO prioridad = new PrioridadDTO(new Long (1));
		pauta.setPrioridad(prioridad);
		
		pauta.setDescripcionIssue("xxx1");
		
		ReportadoDTO reportado = new ReportadoDTO(new Long (1));
		pauta.setReportado(reportado);
		
		AreaDTO area = new AreaDTO(new Long (1));
		pauta.setArea(area);
		
		pauta.setObservacion("xxxxx1");
		
		TiendaDTO tienda = new TiendaDTO(new Long (1));
		pauta.setTienda(tienda);
		
		PadrinoDTO padrino = new PadrinoDTO(new Long (322));
		pauta.setPadrino(padrino);
		
		GerenteDTO gerente = new GerenteDTO(new Long (1));
		pauta.setGerente(gerente);
		
		
		SoporteDTO soporte = new SoporteDTO(new Long (1));
		pauta.setSoporte(soporte);
		
		ContratanteDTO contratante = new ContratanteDTO(new Long (1));
		pauta.setContratante(contratante);
		
		EstadoDTO estado = new EstadoDTO(new Long (1));
		pauta.setEstado(estado);
		
		pauta.setFechaVisita("2017-07-18");
		//user.setRoles(roles);
		
		pauta.setTicketCu(null!= null?"aaaaaaa":"bbbbbbbbbbbb");
		
		try{
			pautaServicesImpl.addPauta(pauta);
			assertTrue(true);
		}catch(Exception e){
			Assert.fail(e.getMessage());
		}
    }
	
	//@Ignore
	@Test
	@Transactional(readOnly=false)
    public void editPautaTest() {
		PautaDTO pauta = new PautaDTO();
		pauta.setId(new Long(206));
		
		pauta.setNumeroRequerimiento(111);
		
		PrioridadDTO prioridad = new PrioridadDTO(new Long (1));
		pauta.setPrioridad(prioridad);

		pauta.setDescripcionIssue("DESC1");
		
		ReportadoDTO reportado = new ReportadoDTO(new Long (1));
		pauta.setReportado(reportado);
		
		AreaDTO area = new AreaDTO(new Long (1));
		pauta.setArea(area);
		
		pauta.setObservacion("OBBB1");
		
		TiendaDTO tienda = new TiendaDTO(new Long (1));
		pauta.setTienda(tienda);
		
		PadrinoDTO padrino = new PadrinoDTO(new Long (322));
		pauta.setPadrino(padrino);
		
		GerenteDTO gerente = new GerenteDTO(new Long (1));
		pauta.setGerente(gerente);
		
		
		SoporteDTO soporte = new SoporteDTO(new Long (1));
		pauta.setSoporte(soporte);
		
		ContratanteDTO contratante = new ContratanteDTO(new Long (1));
		pauta.setContratante(contratante);
		
		EstadoDTO estado = new EstadoDTO(new Long (1));
		pauta.setEstado(estado);
		
		pauta.setFechaVisita2("2017-07-18");
		
		pauta.setTicketCu(null!= null?"aaaaaaa":"bbbbbbbbbbbb");
		
		
		OperationResult result = pautaServicesImpl.editPauta(pauta);

		assertNotNull("Resultado de modificacion de pauta es nulo", result);
		assertTrue("Resultado de modificacion de pauta falla", OperationResult.SUCCESS == result.getResult());
		
	}
	
	@Ignore
	@Test
	@Transactional
    public void getPautaTest() {
		PautaDTO pautas = pautaServicesImpl.getPauta(new Long(3));
		assertNotNull("Listado de pautas id es null", pautas);
		
		
		
    }
	
	@Ignore
	@Test
	@Transactional
    public void getPautaCountRandomTest() {
	
		
		
		int pautas = pautaServicesImpl.getPautaRandom(1);
		System.out.println("pautas1111="+pautas);	
		
		assertNotNull("Cantidad de random es null", pautas);
		
    }
	
	
	
		
}
