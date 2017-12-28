
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

import com.cencosud.administrator.core.ContratanteServices;
import com.cencosud.administrator.dao.ContratanteDao;
import com.cencosud.administrator.dao.domain.Contratante;
import com.cencosud.administrator.dao.domain.Gerente;
import com.cencosud.administrator.dto.users.ContratanteDTO;
import com.cencosud.administrator.dto.users.GerenteDTO;
import com.cencosud.administrator.utils.OperationResult;
/**
 * @description 
 */
@Repository
public class ContratanteServicesImpl extends BaseServicesImpl implements ContratanteServices{

	@Autowired
	private ContratanteDao contratanteDaoImpl;
	
	private static Logger log = Logger.getLogger(ContratanteServicesImpl.class);
	
	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<ContratanteDTO> getContratantes(GerenteDTO gerente) {
		List<ContratanteDTO> result = new ArrayList<ContratanteDTO>();
		
		List<Contratante> contratantes;
		try {
			
			Gerente Gerentes;
			if (gerente != null) {
				Gerentes  = new Gerente(gerente.getId());
			} else {
				Gerentes = null;
			}
			
			contratantes = contratanteDaoImpl.getContratantes(Gerentes);
			if(contratantes != null && !contratantes.isEmpty()){
				result = (List<ContratanteDTO>) mapper.map(contratantes, List.class);
			}

		} catch (Exception e) {
			log.error("Error inesperado", e);
		}
		
		return result;
	}

	@Override
	@Transactional
	public ContratanteDTO getContratantesId(Long id) {
		// TODO Auto-generated method stub
		ContratanteDTO contratanteDestination = null;
		try {
			Contratante contratanteSource = contratanteDaoImpl.getContratantesId(id);
			if(contratanteSource!=null)
				contratanteDestination = mapper.map(contratanteSource, ContratanteDTO.class);
		} catch (Exception e) {
			log.error("Error inesperado", e);
		}
		return contratanteDestination;
	}
	
	
	@Override
	@Transactional(readOnly = false)
	public OperationResult deleteContratante(Long contratanteId) {
		// TODO Auto-generated method stub
		OperationResult result = new OperationResult();

		try {
			contratanteDaoImpl.deleteContratante(contratanteId);

			result.setResult(OperationResult.SUCCESS);
			result.setMessage("Contratante eliminado exitosamente");

		} catch (Exception e) {
			log.error("Error inesperado", e);
			result.setExcepcion(e);
			result.setResult(OperationResult.ERROR);
			result.setMessage("Error al eliminar Contratante");
		}

		return result;
	}

	@Override
	@Transactional(readOnly = false)
	public OperationResult addContratante(ContratanteDTO contratante) {
		// TODO Auto-generated method stub
		OperationResult result = new OperationResult();

		Contratante contratanteDestination;
		try {

			// generar password ramdom
			// String ramdomPass = PasswordGenerator.randomPassword(123456);

			contratanteDestination = mapper.map(contratante, Contratante.class);
			contratanteDaoImpl.addContratante(contratanteDestination);

			// Si toda va bien, enviar mail
			// administratorMailSender.sendPassword(user.getModel())/*.get(10,
			// TimeUnit.SECONDS)*/;

			result.setResult(OperationResult.SUCCESS);
			result.setMessage("Contratante registrado exitosamente");

		} catch (Exception e) {
			log.error("Error inesperado", e);
			result.setExcepcion(e);
			result.setResult(OperationResult.ERROR);
			result.setMessage("Error al registrar contratante");
		}

		return result;
	}

	@Override
	@Transactional(readOnly = false)
	public OperationResult editContratante(ContratanteDTO contratante) {
		// TODO Auto-generated method stub
		OperationResult result = new OperationResult();

		Contratante contratanteDestination;
		try {
			contratanteDestination = contratanteDaoImpl.getContratantesId(contratante.getId());
			if (StringUtils.isNotBlank(contratante.getDescription()))
				contratanteDestination.setDescription(contratante.getDescription());
			
			// pautaDestination.setNumeroRequerimiento(pauta.getNumeroRequerimiento());

			Gerente gerente = new Gerente(contratante.getGerente().getId());
			contratanteDestination.setGerente(gerente);

			
			contratanteDaoImpl.editContratante(contratanteDestination);

			result.setResult(OperationResult.SUCCESS);
			result.setMessage("Contratante modificado exitosamente");

		} catch (Exception e) {
			log.error("Error inesperado", e);
			result.setExcepcion(e);
			result.setResult(OperationResult.ERROR);
			result.setMessage("Error al modificar contratante");
		}

		return result;
	}

	
}
