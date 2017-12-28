
/**
 *@name ChannelServicesImpl.java
 * 
 *@version 1.0 
 * 
 *@date 07-03-2017
 * 
 *@author EA7129
 * 
 *@copyright Cencosud. All rights reserved.
 */
package com.cencosud.administrator.core.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.cencosud.administrator.core.PautaServices;
//import com.cencosud.administrator.core.util.PasswordGenerator;
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
import com.cencosud.administrator.dto.users.ContratanteDTO;
import com.cencosud.administrator.dto.users.EstadoDTO;
import com.cencosud.administrator.dto.users.GerenteDTO;
import com.cencosud.administrator.dto.users.PadrinoDTO;
import com.cencosud.administrator.dto.users.PautaDTO;
import com.cencosud.administrator.dto.users.SoporteDTO;
import com.cencosud.administrator.dto.users.TiendaDTO;
import com.cencosud.administrator.utils.OperationResult;
/**
 */
@Repository
public class PautaServicesImpl extends BaseServicesImpl implements PautaServices{

	@Autowired
	private PautaDao pautaDaoImpl;
	
	private static Logger log = Logger.getLogger(PautaServicesImpl.class);
	
	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<PautaDTO> getPautas() {
		List<PautaDTO> result = new ArrayList<PautaDTO>();
		
		List<Pauta> pautas;
		try {
			
			pautas = pautaDaoImpl.getPautas();
			if(pautas != null && !pautas.isEmpty()){
				result = (List<PautaDTO>) mapper.map(pautas, List.class);
			}

		} catch (Exception e) {
			log.error("Error inesperado", e);
		}
		
		return result;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<PautaDTO> getPautas(TiendaDTO tienda, PadrinoDTO padrino, GerenteDTO gerente, ContratanteDTO contratante,
			SoporteDTO soporte, EstadoDTO estado, String fecha, int start, int limit) {
		// TODO Auto-generated method stub
		List<PautaDTO> result = new ArrayList<PautaDTO>();
		
		List<Pauta> pautas;
		try {
			
			
			Tienda tiendas;
			if (tienda != null) {
				tiendas  = new Tienda(tienda.getId());
			} else {
				tiendas = null;
			}
			
			Padrino padrinos;
			if (padrino != null) {
				padrinos  = new Padrino(padrino.getId());
			} else {
				padrinos = null;
			}
			
			Gerente gerentes;
			if (gerente != null) {
				gerentes  = new Gerente(gerente.getId());
			} else {
				gerentes = null;
			}
			
			Contratante contratantes;
			if (contratante != null) {
				contratantes  = new Contratante(contratante.getId());
			} else {
				contratantes = null;
			}
			
			Soporte soportes;
			if (soporte != null) {
				soportes  =  new Soporte(soporte.getId());
			} else {
				soportes = null;
			}
			
			
			Estado estados;
			if (estado != null) {
				estados  =  new Estado(estado.getId());
			} else {
				estados = null;
			}
			/*
			Tienda tiendas = new Tienda(tienda.getId());
			Padrino padrinos = new Padrino(padrino.getId());
			Gerente gerentes = new Gerente(gerente.getId());
			Contratante contratantes = new Contratante(contratante.getId());
			Soporte soportes = new Soporte(soporte.getId());
			*/

			
			pautas = pautaDaoImpl.getPautas(tiendas, padrinos, gerentes, contratantes, soportes, estados, fecha, start, limit);
			if(pautas != null && !pautas.isEmpty()){
				result = (List<PautaDTO>) mapper.map(pautas, List.class);
			}

		} catch (Exception e) {
			log.error("Error inesperado", e);
		}
		
		return result;	
	}

	@Override
	@Transactional
	public int getCountPautas(TiendaDTO tienda, PadrinoDTO padrino, GerenteDTO gerente, ContratanteDTO contratante,
			SoporteDTO soporte, EstadoDTO estado, String starttime) {
		// TODO Auto-generated method stub
		Integer result;
		
		try {
			
			Tienda tiendas;
			if (tienda != null) {
				tiendas  = new Tienda(tienda.getId());
			} else {
				tiendas = null;
			}
			
			Padrino padrinos;
			if (padrino != null) {
				padrinos  = new Padrino(padrino.getId());
			} else {
				padrinos = null;
			}
			
			Gerente gerentes;
			if (gerente != null) {
				gerentes  = new Gerente(gerente.getId());
			} else {
				gerentes = null;
			}
			
			Contratante contratantes;
			if (contratante != null) {
				contratantes  = new Contratante(contratante.getId());
			} else {
				contratantes = null;
			}
			
			Soporte soportes;
			if (soporte != null) {
				soportes  =  new Soporte(soporte.getId());
			} else {
				soportes = null;
			}
			
			
			Estado estados;
			if (estado != null) {
				estados  =  new Estado(estado.getId());
			} else {
				estados = null;
			}
			
			/*
			Tienda tiendas = new Tienda(tienda.getId());
			Padrino padrinos = new Padrino(padrino.getId());
			Gerente gerentes = new Gerente(gerente.getId());
			Contratante contratantes = new Contratante(contratante.getId());
			Soporte soportes = new Soporte(soporte.getId());
			*/
			result = pautaDaoImpl.getCountPautas(tiendas, padrinos, gerentes, contratantes, soportes, estados, starttime);
		} catch (Exception e) {
			log.error("Error inesperado", e);
			result = (Integer) 0;
		}
		
		return result;
	}
	
	@Override
	@Transactional
	public PautaDTO getPauta(Long pautaId) {
		PautaDTO pautaDestination = null;
		try {
			Pauta pautaSource = pautaDaoImpl.getPauta(pautaId);
			if(pautaSource!=null)
				pautaDestination = mapper.map(pautaSource, PautaDTO.class);
		} catch (Exception e) {
			log.error("Error inesperado", e);
		}
		return pautaDestination;
	}

	@Override
	@Transactional(readOnly = false)
	public OperationResult deletePauta(Long pautaId) {
		// TODO Auto-generated method stub
		OperationResult result = new OperationResult();
		
		try {
			pautaDaoImpl.deletePauta(pautaId);
			
			result.setResult(OperationResult.SUCCESS);
			result.setMessage("Usuario eliminado exitosamente");
			
		} catch (Exception e) {
			log.error("Error inesperado", e);
			result.setExcepcion(e);
			result.setResult(OperationResult.ERROR);
			result.setMessage("Error al eliminar usuario");
		}
		
		return result;
	}
	
	
	@Override
	@Transactional(readOnly = false)
	public OperationResult addPauta(PautaDTO pauta) {
		OperationResult result = new OperationResult();
		
		Pauta pautaDestination;
		try {
			
			//generar password ramdom
			//String ramdomPass = PasswordGenerator.randomPassword(123456);
			
		
			pautaDestination = mapper.map(pauta, Pauta.class);
			pautaDaoImpl.addPauta(pautaDestination);
			
			//Si toda va bien, enviar mail
			//administratorMailSender.sendPassword(user.getModel())/*.get(10, TimeUnit.SECONDS)*/;
			
			result.setResult(OperationResult.SUCCESS);
			result.setMessage("Usuario registrado exitosamente");

		} catch (Exception e) {
			log.error("Error inesperado", e);
			result.setExcepcion(e);
			result.setResult(OperationResult.ERROR);
			result.setMessage("Error al registrar producto");
		}
		
		return result;
	}

	

	@Override
	@Transactional(readOnly = false)
	public OperationResult editPauta(PautaDTO pauta) {
		// TODO Auto-generated method stub
		OperationResult result = new OperationResult();
		
		Pauta pautaDestination;
		try {
			pautaDestination = pautaDaoImpl.getPauta(pauta.getId());
			if(StringUtils.isNotBlank(pauta.getDescripcionIssue()))
				pautaDestination.setDescripcionIssue(pauta.getDescripcionIssue());
			if(StringUtils.isNotBlank(pauta.getObservacion()))
				pautaDestination.setObservacion(pauta.getObservacion());
			//if(StringUtils.isNotBlank(pauta.getTicketCu()))
				pautaDestination.setTicketCu(pauta.getTicketCu());

			//pautaDestination.setNumeroRequerimiento(pauta.getNumeroRequerimiento());
			
			Prioridad prioridad = new Prioridad(pauta.getPrioridad().getId());
			pautaDestination.setPrioridad(prioridad);
			pautaDestination.setDescripcionIssue(pauta.getDescripcionIssue());
			
			Reportado reportado = new Reportado(pauta.getReportado().getId());
			pautaDestination.setReportado(reportado);
			
			Area area = new Area(pauta.getArea().getId());
			pautaDestination.setArea(area);
			
			pauta.setObservacion(pauta.getObservacion());
			
			Tienda tienda = new Tienda(pauta.getTienda().getId());
			pautaDestination.setTienda(tienda);
			
			Padrino padrino = new Padrino(pauta.getPadrino().getId());
			pautaDestination.setPadrino(padrino);
			
			Gerente gerente = new Gerente(pauta.getGerente().getId());
			pautaDestination.setGerente(gerente);
			
			
			Soporte soporte = new Soporte(pauta.getSoporte().getId());
			pautaDestination.setSoporte(soporte);
			
			Contratante contratante = new Contratante(pauta.getContratante().getId());
			pautaDestination.setContratante(contratante);
			
			Estado estado = new Estado(pauta.getEstado().getId());
			pautaDestination.setEstado(estado);
			
			pautaDestination.setFechaVisita(pauta.getFechaVisita2());
						
			pautaDaoImpl.editPauta(pautaDestination);
			
			result.setResult(OperationResult.SUCCESS);
			result.setMessage("Pauta modificado exitosamente");

		} catch (Exception e) {
			log.error("Error inesperado", e);
			result.setExcepcion(e);
			result.setResult(OperationResult.ERROR);
			result.setMessage("Error al modificar pauta");
		}
		
		return result;
	}

	@Override
	@Transactional
	public int getPautaRandom(int random) {
		// TODO Auto-generated method stub
		Integer result;
		
		try {
			result = pautaDaoImpl.getPautaRandom(random);
		} catch (Exception e) {
			log.error("Error inesperado", e);
			result = (Integer) 0;
		}
		
		return result;
	}
}
