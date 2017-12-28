
/**
 *@name CommerceServicesImpl.java
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

import com.cencosud.administrator.core.CommerceServices;
import com.cencosud.administrator.core.util.DateConverter;
import com.cencosud.administrator.utils.OperationResult;
import com.cencosud.administrator.dao.CommerceDao;
import com.cencosud.administrator.dao.domain.Commerce;
import com.cencosud.administrator.dto.users.CommerceDTO;

/**
 * @description 
 */
@Repository
public class CommerceServicesImpl extends BaseServicesImpl implements CommerceServices {

	@Autowired
	private CommerceDao commerceDaoImpl;
	
	private static Logger log = Logger.getLogger(CommerceServicesImpl.class);

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<CommerceDTO> getCommerces(int status) {
		List<CommerceDTO> result = new ArrayList<CommerceDTO>();

		List<Commerce> commerces;
		try {

			commerces = commerceDaoImpl.getCommerces(status);
			result = (List<CommerceDTO>) mapper.map(commerces, List.class);

		} catch (Exception e) {
			log.error("Error inesperado", e);
		}

		return result;
	}

	@Override
	@Transactional
	public CommerceDTO getCommerce(Long commerceId) {
		CommerceDTO commerceDestination = null;
		try {
			Commerce commerceSource = commerceDaoImpl.getCommerce(commerceId);
			commerceDestination = mapper.map(commerceSource, CommerceDTO.class);
		} catch (Exception e) {
			log.error("Error inesperado", e);
		}
		return commerceDestination;
	}

	@Override
	@Transactional(readOnly = false)
	public OperationResult editCommerce(CommerceDTO commerce) {
		OperationResult result = new OperationResult();
		
		Commerce commerceDestination;
		try {
			
			commerceDestination = commerceDaoImpl.getCommerce(commerce.getId());
			if(StringUtils.isNotBlank(commerce.getBusinessLine()))
				commerceDestination.setBusinessLine(commerce.getBusinessLine());
			if(StringUtils.isNotBlank(commerce.getMnemonic()))
				commerceDestination.setMnemonic(commerce.getMnemonic());
			if(StringUtils.isNotBlank(commerce.getRut()))
				commerceDestination.setRut(commerce.getRut());
			if(commerce.getActivationDate() != null)
				commerceDestination.setActivationDate(DateConverter.longFromDate(commerce.getActivationDate()));
			
			commerceDaoImpl.editCommerce(commerceDestination);
			
			result.setResult(OperationResult.SUCCESS);
			result.setMessage("Commercio modificado exitosamente");

		} catch (Exception e) {
			log.error("Error inesperado", e);
			result.setExcepcion(e);
			result.setResult(OperationResult.ERROR);
			result.setMessage("Error al modificar comercio");
		}
		
		return result;

	}

	@Override
	@Transactional(readOnly = false)
	public OperationResult addCommerce(CommerceDTO commerce) {
		OperationResult result = new OperationResult();
		
		Commerce commerceDestination;
		try {
			
			commerceDestination = mapper.map(commerce, Commerce.class);
			commerceDaoImpl.addCommerce(commerceDestination);
			
			result.setResult(OperationResult.SUCCESS);
			result.setMessage("Comercio registrado exitosamente");

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
	public OperationResult deleteCommerce(Long commerceId) {
		OperationResult result = new OperationResult();
		
		try {
			commerceDaoImpl.deleteCommerce(commerceId);
			result.setResult(OperationResult.SUCCESS);
			result.setMessage("Comercio eliminado exitosamente");
			
		} catch (Exception e) {
			log.error("Error inesperado", e);
			result.setExcepcion(e);
			result.setResult(OperationResult.ERROR);
			result.setMessage("Error al eliminar comercio");
		}
		
		return result;
	}
	
	@Override
	@Transactional(readOnly = false)
	public OperationResult updateStatus(Long commerceId, int status) {
		OperationResult result = new OperationResult();
		try {
			commerceDaoImpl.updateStatus(commerceId, status);
			result.setResult(OperationResult.SUCCESS);
			result.setMessage("Estado del comercio actualizado exitosamente");
		} catch (Exception e) {
			log.error("Error inesperado", e);
			result.setExcepcion(e);
			result.setResult(OperationResult.ERROR);
			result.setMessage("Error al cambiar estado del comercio");
		}
		return result;
	}

	@Override
	@Transactional(readOnly = false)
	public CommerceDTO getCommerceByMnemonic(String mnemonic) {
		CommerceDTO commerceDestination = null;
		try {
			Commerce commerceSource = commerceDaoImpl.getCommerceByMnemonic(mnemonic);
			if(commerceSource!=null){
				commerceDestination = mapper.map(commerceSource, CommerceDTO.class);	
			}
		} catch (Exception e) {
			log.error("Error inesperado", e);
		}
		return commerceDestination;
	}

	@Override
	@Transactional(readOnly = false)
	public CommerceDTO getCommerceByRut(String rut) {
		CommerceDTO commerceDestination = null;
		try {
			Commerce commerceSource = commerceDaoImpl.getCommerceByRut(rut);
			if(commerceSource!=null){
				commerceDestination = mapper.map(commerceSource, CommerceDTO.class);	
			}
		} catch (Exception e) {
			log.error("Error inesperado", e);
		}
		return commerceDestination;
	}

	
	/*
	

	@Override
	@Transactional(readOnly = false)
	public OperationResult addUser(UserDTO user) {
		OperationResult result = new OperationResult();
		
		User userDestination;
		try {
			
			//generar password ramdom
			String ramdomPass = PasswordGenerator.randomPassword(8);
			user.setPassword(MD5HashingUtils.encrypt(ramdomPass));
			user.setPasswordNonEncripted(ramdomPass);
			user.setAttempts(UserDTO.MAX_ATTEMPTS);
			user.setStatus(StatusEnum.PENDING_CONFIRMATION.getCode());
			user.addRole(new RoleDTO(RoleEnum.ROLE_PENDING.getId()));
			
			userDestination = mapper.map(user, User.class);
			userDaoImpl.addUser(userDestination);
			
			//Si toda va bien, enviar mail
			administratorMailSender.sendPassword(user.getModel());
			
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
	public OperationResult editUser(UserDTO user) {
		OperationResult result = new OperationResult();
		
		User userDestination;
		try {
			userDestination = mapper.map(user, User.class);
			userDaoImpl.editUser(userDestination);
			
			result.setResult(OperationResult.SUCCESS);
			result.setMessage("Usuario modificado exitosamente");

		} catch (Exception e) {
			log.error("Error inesperado", e);
			result.setExcepcion(e);
			result.setResult(OperationResult.ERROR);
			result.setMessage("Error al modificar usuario");
		}
		
		return result;

	}
	*/
	

}
