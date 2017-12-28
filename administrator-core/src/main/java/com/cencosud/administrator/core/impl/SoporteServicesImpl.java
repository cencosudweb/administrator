
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

import com.cencosud.administrator.core.SoporteServices;
import com.cencosud.administrator.dao.SoporteDao;
import com.cencosud.administrator.dao.domain.Contratante;
import com.cencosud.administrator.dao.domain.Soporte;
import com.cencosud.administrator.dto.users.ContratanteDTO;
import com.cencosud.administrator.dto.users.SoporteDTO;
import com.cencosud.administrator.utils.OperationResult;
/**
 * @description 
 */
@Repository
public class SoporteServicesImpl extends BaseServicesImpl implements SoporteServices{

	@Autowired
	private SoporteDao soporteDaoImpl;
	
	private static Logger log = Logger.getLogger(SoporteServicesImpl.class);
	
	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<SoporteDTO> getSoportes(ContratanteDTO contraparte) {
		List<SoporteDTO> result = new ArrayList<SoporteDTO>();
		
		List<Soporte> soportes;
		try {
			
			Contratante contratantes;
			if (contraparte != null) {
				contratantes  = new Contratante(contraparte.getId());
			} else {
				contratantes = null;
			}
			
			soportes = soporteDaoImpl.getSoportes(contratantes);
			if(soportes != null && !soportes.isEmpty()){
				result = (List<SoporteDTO>) mapper.map(soportes, List.class);
			}

		} catch (Exception e) {
			log.error("Error inesperado", e);
		}
		
		return result;
	}

	@Override
	@Transactional
	public SoporteDTO getSoportesId(Long id) {
		// TODO Auto-generated method stub
		SoporteDTO soporteDestination = null;
		try {
			Soporte soporteSource = soporteDaoImpl.getSoportesId(id);
			if(soporteSource!=null)
				soporteDestination = mapper.map(soporteSource, SoporteDTO.class);
		} catch (Exception e) {
			log.error("Error inesperado", e);
		}
		return soporteDestination;
	}


	@Override
	@Transactional(readOnly = false)
	public OperationResult deleteSoporte(Long soporteId) {
		// TODO Auto-generated method stub
		OperationResult result = new OperationResult();

		try {
			soporteDaoImpl.deleteSoporte(soporteId);

			result.setResult(OperationResult.SUCCESS);
			result.setMessage("Soporte eliminado exitosamente");

		} catch (Exception e) {
			log.error("Error inesperado", e);
			result.setExcepcion(e);
			result.setResult(OperationResult.ERROR);
			result.setMessage("Error al eliminar soporte");
		}

		return result;
	}

	@Override
	@Transactional(readOnly = false)
	public OperationResult addSoporte(SoporteDTO soporte) {
		// TODO Auto-generated method stub
		OperationResult result = new OperationResult();

		Soporte soporteDestination;
		try {

			// generar password ramdom
			// String ramdomPass = PasswordGenerator.randomPassword(123456);

			soporteDestination = mapper.map(soporte, Soporte.class);
			soporteDaoImpl.addSoporte(soporteDestination);

			// Si toda va bien, enviar mail
			// administratorMailSender.sendPassword(user.getModel())/*.get(10,
			// TimeUnit.SECONDS)*/;

			result.setResult(OperationResult.SUCCESS);
			result.setMessage("Soporte registrado exitosamente");

		} catch (Exception e) {
			log.error("Error inesperado", e);
			result.setExcepcion(e);
			result.setResult(OperationResult.ERROR);
			result.setMessage("Error al registrar soporte");
		}

		return result;
	}

	@Override
	@Transactional(readOnly = false)
	public OperationResult editSoporte(SoporteDTO soporte) {
		// TODO Auto-generated method stub
		OperationResult result = new OperationResult();

		Soporte soporteDestination;
		try {
			soporteDestination = soporteDaoImpl.getSoportesId(soporte.getId());
			if (StringUtils.isNotBlank(soporte.getDescription()))
				soporteDestination.setDescription(soporte.getDescription());
			
			// pautaDestination.setNumeroRequerimiento(pauta.getNumeroRequerimiento());

			Contratante contratante = new Contratante(soporte.getContraparte().getId());
			soporteDestination.setContraparte(contratante);

			
			soporteDaoImpl.editSoporte(soporteDestination);

			result.setResult(OperationResult.SUCCESS);
			result.setMessage("Soporte modificado exitosamente");

		} catch (Exception e) {
			log.error("Error inesperado", e);
			result.setExcepcion(e);
			result.setResult(OperationResult.ERROR);
			result.setMessage("Error al modificar Soporte");
		}

		return result;
	}

	
}
