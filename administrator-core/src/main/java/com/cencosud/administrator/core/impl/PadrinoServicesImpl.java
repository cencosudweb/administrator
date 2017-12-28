
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

import com.cencosud.administrator.core.PadrinoServices;
import com.cencosud.administrator.dao.PadrinoDao;
import com.cencosud.administrator.dao.domain.Padrino;
import com.cencosud.administrator.dao.domain.Tienda;
import com.cencosud.administrator.dto.users.PadrinoDTO;
import com.cencosud.administrator.dto.users.TiendaDTO;
import com.cencosud.administrator.utils.OperationResult;

/**
 * @description
 */
@Repository
public class PadrinoServicesImpl extends BaseServicesImpl implements PadrinoServices {

	@Autowired
	private PadrinoDao padrinoDaoImpl;

	private static Logger log = Logger.getLogger(PadrinoServicesImpl.class);

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<PadrinoDTO> getPadrinos(TiendaDTO tienda) {
		List<PadrinoDTO> result = new ArrayList<PadrinoDTO>();

		List<Padrino> padrinos;
		try {
			
			Tienda tiendas;
			if (tienda != null) {
				tiendas  = new Tienda(tienda.getId());
			} else {
				tiendas = null;
			}

			padrinos = padrinoDaoImpl.getPadrinos(tiendas);
			if (padrinos != null && !padrinos.isEmpty()) {
				result = (List<PadrinoDTO>) mapper.map(padrinos, List.class);
			}

		} catch (Exception e) {
			log.error("Error inesperado", e);
		}

		return result;
	}

	@Override
	@Transactional
	public PadrinoDTO getPadrinosId(Long id) {
		// TODO Auto-generated method stub
		PadrinoDTO padrinoDestination = null;
		try {
			Padrino padrinoSource = padrinoDaoImpl.getPadrinosId(id);
			if (padrinoSource != null)
				padrinoDestination = mapper.map(padrinoSource, PadrinoDTO.class);
		} catch (Exception e) {
			log.error("Error inesperado", e);
		}
		return padrinoDestination;
	}

	@Override
	@Transactional(readOnly = false)
	public OperationResult deletePadrino(Long padrinoId) {
		// TODO Auto-generated method stub
		OperationResult result = new OperationResult();

		try {
			padrinoDaoImpl.deletePadrino(padrinoId);

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
	public OperationResult addPadrino(PadrinoDTO padrino) {
		// TODO Auto-generated method stub
		OperationResult result = new OperationResult();

		Padrino padrinoDestination;
		try {

			// generar password ramdom
			// String ramdomPass = PasswordGenerator.randomPassword(123456);

			padrinoDestination = mapper.map(padrino, Padrino.class);
			padrinoDaoImpl.addPadrino(padrinoDestination);

			// Si toda va bien, enviar mail
			// administratorMailSender.sendPassword(user.getModel())/*.get(10,
			// TimeUnit.SECONDS)*/;

			result.setResult(OperationResult.SUCCESS);
			result.setMessage("Padrino registrado exitosamente");

		} catch (Exception e) {
			log.error("Error inesperado", e);
			result.setExcepcion(e);
			result.setResult(OperationResult.ERROR);
			result.setMessage("Error al registrar padrino");
		}

		return result;
	}

	@Override
	@Transactional(readOnly = false)
	public OperationResult editPadrino(PadrinoDTO padrino) {
		// TODO Auto-generated method stub
		OperationResult result = new OperationResult();

		Padrino padrinoDestination;
		try {
			padrinoDestination = padrinoDaoImpl.getPadrinosId(padrino.getId());
			if (StringUtils.isNotBlank(padrino.getDescription()))
				padrinoDestination.setDescription(padrino.getDescription());
			
			// pautaDestination.setNumeroRequerimiento(pauta.getNumeroRequerimiento());

			Tienda tienda = new Tienda(padrino.getTienda().getId());
			padrinoDestination.setTienda(tienda);
			padrinoDestination.setDescription(padrino.getDescription());

			
			padrinoDaoImpl.editPadrino(padrinoDestination);

			result.setResult(OperationResult.SUCCESS);
			result.setMessage("Padrino modificado exitosamente");

		} catch (Exception e) {
			log.error("Error inesperado", e);
			result.setExcepcion(e);
			result.setResult(OperationResult.ERROR);
			result.setMessage("Error al modificar padrino");
		}

		return result;
	}

	@Override
	@Transactional
	public PadrinoDTO getPadrino(String description) {
		// TODO Auto-generated method stub
		PadrinoDTO padrinoDestination = null;
		try {
			Padrino padrinoSource = padrinoDaoImpl.getPadrino(description);
			if(padrinoSource!=null)
				padrinoDestination = mapper.map(padrinoSource, PadrinoDTO.class);	
			
		} catch (Exception e) {
			log.error("Error inesperado", e);
		}
		return padrinoDestination;
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<PadrinoDTO> getPadrinoDescs(String description) {
		// TODO Auto-generated method stub
		List<PadrinoDTO> result = new ArrayList<PadrinoDTO>();

		List<Padrino> padrinos;
		try {
			
			
			padrinos = padrinoDaoImpl.getPadrinoDescs(description);
			if (padrinos != null && !padrinos.isEmpty()) {
				result = (List<PadrinoDTO>) mapper.map(padrinos, List.class);
			}

		} catch (Exception e) {
			log.error("Error inesperado", e);
		}

		return result;
	}

}
