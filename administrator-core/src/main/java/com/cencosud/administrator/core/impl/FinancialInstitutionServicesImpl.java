
/**
 *@name FinancialInstitutionServicesImpl.java
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
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.cencosud.administrator.core.FinancialInstitutionServices;
import com.cencosud.administrator.core.util.DateConverter;
import com.cencosud.administrator.utils.OperationResult;
import com.cencosud.administrator.dao.FinancialInstitutionDao;
import com.cencosud.administrator.dao.domain.Agreement;
import com.cencosud.administrator.dao.domain.Commerce;
import com.cencosud.administrator.dao.domain.FinancialInstitution;
import com.cencosud.administrator.dto.users.AgreementDTO;
import com.cencosud.administrator.dto.users.CommerceAgreementDTO;
import com.cencosud.administrator.dto.users.CommerceDTO;
import com.cencosud.administrator.dto.users.FinancialInstitutionDTO;

/**
 * @description 
 */
@Repository
public class FinancialInstitutionServicesImpl extends BaseServicesImpl implements FinancialInstitutionServices {

	@Autowired
	private FinancialInstitutionDao financialInstitutionDaoImpl;

	private static Logger log = Logger.getLogger(FinancialInstitutionServicesImpl.class);

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<FinancialInstitutionDTO> getFIs(int status) {
		List<FinancialInstitutionDTO> result = new ArrayList<FinancialInstitutionDTO>();

		List<FinancialInstitution> fis;
		try {

			fis = financialInstitutionDaoImpl.getFIs(status);
			result = (List<FinancialInstitutionDTO>) mapper.map(fis, List.class);

		} catch (Exception e) {
			log.error("Error inesperado", e);
		}

		return result;
	}

	@Override
	@Transactional
	public FinancialInstitutionDTO getFI(Long fiId) {
		FinancialInstitutionDTO fiDestination = null;
		try {
			FinancialInstitution fiSource = financialInstitutionDaoImpl.getFI(fiId);
			if (fiSource != null) {
				fiDestination = mapper.map(fiSource, FinancialInstitutionDTO.class);
				setCommerceAgreement(fiDestination, fiSource);
			}
		} catch (Exception e) {
			log.error("Error inesperado", e);
		}
		return fiDestination;
	}

	@Override
	@Transactional
	public FinancialInstitutionDTO getFIByMnemonic(String mnemonic) {
		FinancialInstitutionDTO fiDestination = null;
		try {
			FinancialInstitution fiSource = financialInstitutionDaoImpl.getFIByMnemonic(mnemonic);
			if (fiSource != null) {
				fiDestination = mapper.map(fiSource, FinancialInstitutionDTO.class);
				setCommerceAgreement(fiDestination, fiSource);
			}
		} catch (Exception e) {
			log.error("Error inesperado", e);
		}
		return fiDestination;
	}

	@Override
	@Transactional
	public FinancialInstitutionDTO getFIByRut(String rut) {
		FinancialInstitutionDTO fiDestination = null;
		try {
			FinancialInstitution fiSource = financialInstitutionDaoImpl.getFIByRut(rut);
			if (fiSource != null) {
				fiDestination = mapper.map(fiSource, FinancialInstitutionDTO.class);
				setCommerceAgreement(fiDestination, fiSource);
			}
		} catch (Exception e) {
			log.error("Error inesperado", e);
		}
		return fiDestination;
	}

	@Override
	@Transactional(readOnly = false)
	public OperationResult addFI(FinancialInstitutionDTO fi) {
		OperationResult result = new OperationResult();

		FinancialInstitution fiDestination;
		try {

			fiDestination = mapper.map(fi, FinancialInstitution.class);
			financialInstitutionDaoImpl.addFI(fiDestination);

			result.setResult(OperationResult.SUCCESS);
			result.setMessage("Institucion financiera registrada exitosamente");

		} catch (Exception e) {
			log.error("Error inesperado", e);
			result.setExcepcion(e);
			result.setResult(OperationResult.ERROR);
			result.setMessage("Error al registrar institucion financiera");
		}

		return result;
	}

	@Override
	@Transactional(readOnly = false)
	public OperationResult deleteFI(Long fiId) {
		OperationResult result = new OperationResult();

		try {
			financialInstitutionDaoImpl.deleteFI(fiId);

			result.setResult(OperationResult.SUCCESS);
			result.setMessage("institucion financiera eliminada exitosamente");

		} catch (Exception e) {
			log.error("Error inesperado", e);
			result.setExcepcion(e);
			result.setResult(OperationResult.ERROR);
			result.setMessage("Error al eliminar institucion financiera");
		}

		return result;
	}

	@Override
	@Transactional(readOnly = false)
	public OperationResult editFI(FinancialInstitutionDTO fi) {
		OperationResult result = new OperationResult();

		FinancialInstitution fiDestination;
		try {

			fiDestination = financialInstitutionDaoImpl.getFI(fi.getId());
			if (StringUtils.isNotBlank(fi.getBusinessLine()))
				fiDestination.setBusinessLine(fi.getBusinessLine());
			if (StringUtils.isNotBlank(fi.getMnemonic()))
				fiDestination.setMnemonic(fi.getMnemonic());
			if (StringUtils.isNotBlank(fi.getRut()))
				fiDestination.setRut(fi.getRut());
			if (fi.getActivationDate() != null)
				fiDestination.setActivationDate(DateConverter.longFromDate(fi.getActivationDate()));
			if (StringUtils.isNotBlank(fi.getInvocationPath()))
				fiDestination.setInvocationPath(fi.getInvocationPath());
			
			financialInstitutionDaoImpl.editFI(fiDestination);

			result.setResult(OperationResult.SUCCESS);
			result.setMessage("Institucion financiera modificada exitosamente");

		} catch (Exception e) {
			log.error("Error inesperado", e);
			result.setExcepcion(e);
			result.setResult(OperationResult.ERROR);
			result.setMessage("Error al modificar institucion financiera");
		}

		return result;
	}

	@Override
	@Transactional(readOnly = false)
	public OperationResult updateStatus(Long fiId, int status) {
		OperationResult result = new OperationResult();
		try {
			financialInstitutionDaoImpl.updateStatus(fiId, status);
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

	@SuppressWarnings("rawtypes")
	private void setCommerceAgreement(FinancialInstitutionDTO fiDTO, FinancialInstitution fi){
		
		Iterator itS = fi.getCommerces().entrySet().iterator();
		while (itS.hasNext()) {
			Map.Entry e = (Map.Entry)itS.next();
			
			Agreement agreement = (Agreement) e.getKey();
			AgreementDTO agreementDTO = null;
			if(agreement != null)
				agreementDTO = mapper.map(agreement, AgreementDTO.class);
			
			Commerce commerce =  (Commerce) e.getValue();
			CommerceDTO commerceDTO = null;
			if(commerce != null)
				commerceDTO = mapper.map(commerce, CommerceDTO.class);
			
			fiDTO.addCommerceAgreement(new CommerceAgreementDTO(commerceDTO, agreementDTO));
		}
		
	}

}
