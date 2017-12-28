
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

import com.cencosud.administrator.core.TiendaServices;
import com.cencosud.administrator.dao.TiendaDao;
import com.cencosud.administrator.dao.domain.Flag;
import com.cencosud.administrator.dao.domain.Tienda;
import com.cencosud.administrator.dto.users.TiendaDTO;
import com.cencosud.administrator.utils.OperationResult;

/**
 * @description
 */
@Repository
public class TiendaServicesImpl extends BaseServicesImpl implements TiendaServices {

	@Autowired
	private TiendaDao tiendaDaoImpl;

	private static Logger log = Logger.getLogger(TiendaServicesImpl.class);

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<TiendaDTO> getTiendas() {
		List<TiendaDTO> result = new ArrayList<TiendaDTO>();

		List<Tienda> tiendas;
		try {

			tiendas = tiendaDaoImpl.getTiendas();
			if (tiendas != null && !tiendas.isEmpty()) {
				result = (List<TiendaDTO>) mapper.map(tiendas, List.class);
			}

		} catch (Exception e) {
			log.error("Error inesperado", e);
		}

		return result;
	}

	@Override
	@Transactional
	public TiendaDTO getTiendasId(Long id) {
		TiendaDTO tiendaDestination = null;
		try {
			Tienda tiendaSource = tiendaDaoImpl.getTiendasId(id);
			if (tiendaSource != null)
				tiendaDestination = mapper.map(tiendaSource, TiendaDTO.class);
		} catch (Exception e) {
			log.error("Error inesperado", e);
		}
		return tiendaDestination;
	}

	@Override
	@Transactional(readOnly = false)
	public OperationResult deleteTienda(Long tiendaId) {
		// TODO Auto-generated method stub
		OperationResult result = new OperationResult();

		try {
			tiendaDaoImpl.deleteTienda(tiendaId);

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
	public OperationResult addTienda(TiendaDTO tienda) {
		// TODO Auto-generated method stub
		OperationResult result = new OperationResult();

		Tienda tiendaDestination;
		try {

			// generar password ramdom
			// String ramdomPass = PasswordGenerator.randomPassword(123456);

			tiendaDestination = mapper.map(tienda, Tienda.class);
			tiendaDaoImpl.addTienda(tiendaDestination);

			// Si toda va bien, enviar mail
			// administratorMailSender.sendPassword(user.getModel())/*.get(10,
			// TimeUnit.SECONDS)*/;

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
	public OperationResult editTienda(TiendaDTO tienda) {
		// TODO Auto-generated method stub
		OperationResult result = new OperationResult();

		Tienda tiendaDestination;
		try {
			
			tiendaDestination = tiendaDaoImpl.getTiendasId(tienda.getId());
			if (StringUtils.isNotBlank(tienda.getDescription()))
				tiendaDestination.setDescription(tienda.getDescription());
			
			
			Flag flag = new Flag(tienda.getFlag().getId());
			tiendaDestination.setFlag(flag);
			tiendaDestination.setDescription(tienda.getDescription());

			tiendaDaoImpl.editTienda(tiendaDestination);

			result.setResult(OperationResult.SUCCESS);
			result.setMessage("Tienda modificado exitosamente");

		} catch (Exception e) {
			log.error("Error inesperado", e);
			result.setExcepcion(e);
			result.setResult(OperationResult.ERROR);
			result.setMessage("Error al modificar tienda");
		}

		return result;
	}
	
	
	


	@Override
	@Transactional
	public TiendaDTO getTienda(String description) {
		// TODO Auto-generated method stub
		TiendaDTO tiendaDestination = null;
		try {
			Tienda tiendaSource = tiendaDaoImpl.getTiendas(description);
			if(tiendaSource!=null)
				tiendaDestination = mapper.map(tiendaSource, TiendaDTO.class);	
			
		} catch (Exception e) {
			log.error("Error inesperado", e);
		}
		return tiendaDestination;
	}

}
