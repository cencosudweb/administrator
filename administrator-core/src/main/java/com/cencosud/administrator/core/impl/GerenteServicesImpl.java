
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

import com.cencosud.administrator.core.GerenteServices;
import com.cencosud.administrator.dao.GerenteDao;
import com.cencosud.administrator.dao.domain.Gerente;
import com.cencosud.administrator.dao.domain.Padrino;
import com.cencosud.administrator.dto.users.GerenteDTO;
import com.cencosud.administrator.dto.users.PadrinoDTO;
import com.cencosud.administrator.utils.OperationResult;
/**
 * @description 
 */
@Repository
public class GerenteServicesImpl extends BaseServicesImpl implements GerenteServices{

	@Autowired
	private GerenteDao gerenteDaoImpl;
	
	private static Logger log = Logger.getLogger(GerenteServicesImpl.class);
	
	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<GerenteDTO> getGerentes(PadrinoDTO padrino) {
		List<GerenteDTO> result = new ArrayList<GerenteDTO>();
		
		List<Gerente> gerentes;
		try {
			Padrino padrinos;
			if (padrino != null) {
				padrinos  = new Padrino(padrino.getId());
			} else {
				padrinos = null;
			}
			
			gerentes = gerenteDaoImpl.getGerentes(padrinos);
			if(gerentes != null && !gerentes.isEmpty()){
				result = (List<GerenteDTO>) mapper.map(gerentes, List.class);
			}

		} catch (Exception e) {
			log.error("Error inesperado", e);
		}
		
		return result;
	}

	@Override
	@Transactional
	public GerenteDTO getGerentesId(Long id) {
		// TODO Auto-generated method stub
		GerenteDTO gerenteDestination = null;
		try {
			Gerente gerenteSource = gerenteDaoImpl.getGerentesId(id);
			if(gerenteSource!=null)
				gerenteDestination = mapper.map(gerenteSource, GerenteDTO.class);
		} catch (Exception e) {
			log.error("Error inesperado", e);
		}
		return gerenteDestination;
	}
	
	
	@Override
	@Transactional(readOnly = false)
	public OperationResult deleteGerente(Long gerenteId) {
		// TODO Auto-generated method stub
		OperationResult result = new OperationResult();

		try {
			gerenteDaoImpl.deleteGerente(gerenteId);

			result.setResult(OperationResult.SUCCESS);
			result.setMessage("Gerente eliminado exitosamente");

		} catch (Exception e) {
			log.error("Error inesperado", e);
			result.setExcepcion(e);
			result.setResult(OperationResult.ERROR);
			result.setMessage("Error al eliminar gerente");
		}

		return result;
	}

	@Override
	@Transactional(readOnly = false)
	public OperationResult addGerente(GerenteDTO gerente) {
		// TODO Auto-generated method stub
		OperationResult result = new OperationResult();

		Gerente gerenteDestination;
		try {

			// generar password ramdom
			// String ramdomPass = PasswordGenerator.randomPassword(123456);

			gerenteDestination = mapper.map(gerente, Gerente.class);
			gerenteDaoImpl.addGerente(gerenteDestination);

			// Si toda va bien, enviar mail
			// administratorMailSender.sendPassword(user.getModel())/*.get(10,
			// TimeUnit.SECONDS)*/;

			result.setResult(OperationResult.SUCCESS);
			result.setMessage("Gerente registrado exitosamente");

		} catch (Exception e) {
			log.error("Error inesperado", e);
			result.setExcepcion(e);
			result.setResult(OperationResult.ERROR);
			result.setMessage("Error al registrar gerente");
		}

		return result;
	}

	@Override
	@Transactional(readOnly = false)
	public OperationResult editGerente(GerenteDTO gerente) {
		// TODO Auto-generated method stub
		OperationResult result = new OperationResult();

		Gerente gerenteDestination;
		try {
			gerenteDestination = gerenteDaoImpl.getGerentesId(gerente.getId());
			if (StringUtils.isNotBlank(gerente.getDescription()))
				gerenteDestination.setDescription(gerente.getDescription());
			
			// pautaDestination.setNumeroRequerimiento(pauta.getNumeroRequerimiento());

			Padrino padrino = new Padrino(gerente.getPadrino().getId());
			gerenteDestination.setPadrino(padrino);

			
			gerenteDaoImpl.editGerente(gerenteDestination);

			result.setResult(OperationResult.SUCCESS);
			result.setMessage("Gerente modificado exitosamente");

		} catch (Exception e) {
			log.error("Error inesperado", e);
			result.setExcepcion(e);
			result.setResult(OperationResult.ERROR);
			result.setMessage("Error al modificar gerente");
		}

		return result;
	}

	
}
