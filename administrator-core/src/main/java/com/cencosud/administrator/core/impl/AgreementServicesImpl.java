
/**
 *@name AgreementServicesImpl.java
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

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.cencosud.administrator.core.AgreementServices;
import com.cencosud.administrator.utils.OperationResult;
import com.cencosud.administrator.dao.AgreementDao;
import com.cencosud.administrator.dao.domain.Agreement;
import com.cencosud.administrator.dto.users.AgreementDTO;

/**
 * @description 
 */
@Component(value="agreementServices")
@Repository
public class AgreementServicesImpl extends BaseServicesImpl implements AgreementServices {

	@Autowired
	private AgreementDao agreementDaoImpl;

	private static Logger log = Logger.getLogger(AgreementServicesImpl.class);

	@Override
	@Transactional(readOnly = false)
	public OperationResult updateStatus(Long agreementId, int status) {
		OperationResult result = new OperationResult();
		try {
			agreementDaoImpl.updateStatus(agreementId, status);
			result.setResult(OperationResult.SUCCESS);
			result.setMessage("Estado de la institucion financiera actualizado exitosamente");
		} catch (Exception e) {
			log.error("Error inesperado", e);
			result.setExcepcion(e);
			result.setResult(OperationResult.ERROR);
			result.setMessage("Error al cambiar estado de la institucion financiera");
		}
		return result;
	}

	@Override
	@Transactional
	public AgreementDTO getAgreement(Long agreementId) {
		AgreementDTO agreementDestination = null;
		try {
			Agreement agreementSource = agreementDaoImpl.getAgreement(agreementId);
			if(agreementSource != null)
				agreementDestination = mapper.map(agreementSource, AgreementDTO.class);
		} catch (Exception e) {
			log.error("Error inesperado", e);
		}
		return agreementDestination;
	}

	@Override
	@Transactional(readOnly = false)
	public OperationResult addAgreement(AgreementDTO agreement, Long idFI, Long idCommerce) {
		OperationResult result = new OperationResult();

		Agreement agreementDestination;
		try {

			agreementDestination = mapper.map(agreement, Agreement.class);
			if (agreementDestination != null) {
				agreementDaoImpl.addAgreement(agreementDestination);

				// agrega relacion 3-way
				agreementDaoImpl.addFIComerceAgreementRelationship(idFI, idCommerce, agreementDestination.getId());

				result.setResult(OperationResult.SUCCESS);
				result.setMessage("Convenio registrado exitosamente");
			}else{
				result.setResult(OperationResult.ERROR);
				result.setMessage("Error al registrar convenio");
			}

		} catch (Exception e) {
			log.error("Error inesperado", e);
			result.setExcepcion(e);
			result.setResult(OperationResult.ERROR);
			result.setMessage("Error al registrar convenio");
		}

		return result;
	}

	/**
	 * True si existe
	 */
	@Override
	@Transactional
	public boolean validateAgreementExist(Long fiId, Long commerceId) {
		boolean exist = false;
		try {
			exist = agreementDaoImpl.validateAgreementExist(fiId, commerceId);
		} catch (Exception e) {
			log.error("Error inesperado", e);
		}
		return exist;
	}

	@Override
	@Transactional(readOnly = false)
	public OperationResult editAgreement(AgreementDTO agreement) {
		OperationResult result = new OperationResult();

		Agreement agreementDestination;
		try {

			agreementDestination = mapper.map(agreement, Agreement.class);
			if (agreementDestination != null) {
				
				Agreement finalAgreement = agreementDaoImpl.getAgreement(agreement.getId());
				if(finalAgreement != null){
					
					//setear solo los datos necesarios para evitar fraude
					finalAgreement.setEndDate(agreementDestination.getEndDate());
					finalAgreement.setInitDate(agreementDestination.getInitDate());
					finalAgreement.addUrls(agreementDestination.getUrls());
					finalAgreement.setTimeLimit(agreementDestination.getTimeLimit());
					
					agreementDaoImpl.editAgreement(finalAgreement);

					result.setResult(OperationResult.SUCCESS);
					result.setMessage("Convenio modificado exitosamente");
				}else{
					result.setResult(OperationResult.ERROR);
					result.setMessage("Error al modificar convenio");
				}
				
			}else{
				result.setResult(OperationResult.ERROR);
				result.setMessage("Error al modificar convenio");
			}

		} catch (Exception e) {
			log.error("Error inesperado", e);
			result.setExcepcion(e);
			result.setResult(OperationResult.ERROR);
			result.setMessage("Error al registrar convenio");
		}

		return result;
	}
	



}
