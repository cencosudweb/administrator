
/**
 *@name AdminFinancialValidator.java
 * 
 *@version 1.0 
 * 
 *@date 07-03-2017
 * 
 *@author EA7129
 * 
 *@copyright Cencosud. All rights reserved.
 */
package com.cencosud.administrator.web.validator;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.cencosud.administrator.web.utils.DateUtils;
import com.cencosud.administrator.web.utils.StringUtils;
import com.cencosud.administrator.core.FinancialInstitutionServices;
import com.cencosud.administrator.dto.users.AgreementDTO;
import com.cencosud.administrator.dto.users.FinancialInstitutionDTO;
import com.cencosud.administrator.dto.users.UrlCallbackDTO;

/**
 * @description Clase AdminFinancialValidator que  valida el objeto Financial dado y en caso de errores de validación, registra aquellos con el objeto Errors dado

 */
@Component
public class AdminFinancialValidator implements Validator {
	
	@Autowired
	private FinancialInstitutionServices financialServicesImpl;

	public boolean supports(Class<?> c) {
		return FinancialInstitutionDTO.class.isAssignableFrom(c);
	}

	public void validateAdd(Object command, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "rut", "field.empty", "El campo es vacio");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "businessLine", "field.empty", "El campo es vacio");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "mnemonic", "field.empty", "El campo es vacio");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "invocationPath", "field.empty", "El campo es vacio");
		
		FinancialInstitutionDTO financial = (FinancialInstitutionDTO) command;
		
		if(StringUtils.isValidString(financial.getRut())){
			if(!StringUtils.isValidFullRut(financial.getRut())){
				errors.rejectValue("rut", "field.rut");	
			}else{
				FinancialInstitutionDTO find = financialServicesImpl.getFIByRut(StringUtils.getDBRut(financial.getRut()));
				if(find!=null){
					errors.rejectValue("rut", "admin.financial.rut.existe");	
				}
			}
		}
		
		if(StringUtils.isValidString(financial.getBusinessLine())){
			if(!StringUtils.isValidMinLength(financial.getBusinessLine(),5)){
				errors.rejectValue("businessLine", "field.min.length");	
			}
		}
		
		if(StringUtils.isValidString(financial.getInvocationPath())){
			if(!StringUtils.isValidMinLength(financial.getInvocationPath(),5)){
				errors.rejectValue("invocationPath", "field.min.length");	
			}else{
				if(!StringUtils.isValidMaxLength(financial.getInvocationPath(),500)){
					errors.rejectValue("invocationPath", "field.max.length");	
				}
			}
		}
		
		if(StringUtils.isValidString(financial.getMnemonic())){
			if(!StringUtils.isValidMinLength(financial.getMnemonic(),3)){
				errors.rejectValue("mnemonic", "field.min.length");	
			}else{
				FinancialInstitutionDTO find = financialServicesImpl.getFIByMnemonic(financial.getMnemonic());
				if(find!=null){
					errors.rejectValue("rut", "admin.financial.mnemonic.existe");	
				}
			}
		}
	}
	
	public void validateEdit(Object command, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "businessLine", "field.empty", "El campo es vacio");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "mnemonic", "field.empty", "El campo es vacio");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "invocationPath", "field.empty", "El campo es vacio");
		
		FinancialInstitutionDTO financial = (FinancialInstitutionDTO) command;
		
		if(StringUtils.isValidString(financial.getBusinessLine())){
			if(!StringUtils.isValidMinLength(financial.getBusinessLine(),5)){
				errors.rejectValue("businessLine", "field.min.length");	
			}
		}
		
		if(StringUtils.isValidString(financial.getInvocationPath())){
			if(!StringUtils.isValidMinLength(financial.getInvocationPath(),5)){
				errors.rejectValue("invocationPath", "field.min.length");	
			}else{
				if(!StringUtils.isValidMaxLength(financial.getInvocationPath(),500)){
					errors.rejectValue("invocationPath", "field.max.length");	
				}
			}
		}
		
		if(StringUtils.isValidString(financial.getMnemonic())){
			if(!StringUtils.isValidMinLength(financial.getMnemonic(),3)){
				errors.rejectValue("mnemonic", "field.min.length");	
			}else{
				FinancialInstitutionDTO find = financialServicesImpl.getFIByMnemonic(financial.getMnemonic());
				if(find!=null && find.getId()!=financial.getId()){
					errors.rejectValue("mnemonic", "admin.financial.mnemonic.existe");	
				}
			}
		}
	}
	
	public void validateAddAgreement(Object command, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "agreementId", "field.empty", "El campo es vacio");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "initDateText", "field.empty", "El campo es vacio");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "endDateText", "field.empty", "El campo es vacio");
		
		AgreementDTO agreement = (AgreementDTO) command;
		
		if(StringUtils.isValidString(agreement.getAgreementId())){
			if(!StringUtils.isValidMinLength(agreement.getAgreementId(),5)){
				errors.rejectValue("agreementId", "field.min.length");	
			}
		}
		
		if(StringUtils.isValidString(agreement.getInitDateText()) && StringUtils.isValidString(agreement.getEndDateText())){
			Date fechaInicio = DateUtils.obtenerFecha(agreement.getInitDateText(), "dd/MM/yyyy");
			Date fechaFin = DateUtils.obtenerFecha(agreement.getEndDateText(), "dd/MM/yyyy");
			
			if(fechaInicio.getTime()>=fechaFin.getTime()){
				errors.rejectValue("initDateText", "admin.financial.agreement.fechas.fracaso");
				errors.rejectValue("endDateText", "admin.financial.agreement.fechas.fracaso");
			}
		}
		
		List<UrlCallbackDTO> urls = agreement.getUrls();
		
		if(urls!=null && urls.size()>0){
			boolean almenosUna=false;
			for (int i = 0; i < urls.size(); i++) {
				UrlCallbackDTO url = urls.get(i);
				if(url!=null){
					if(StringUtils.isValidString(url.getConfirmationPath()) && StringUtils.isValidString(url.getEndPath())){
						almenosUna=true;
					}
				}
			}
			
			if(almenosUna){
				for (int i = 0; i < urls.size(); i++) {
					UrlCallbackDTO url = urls.get(i);
					if(url!=null){
						if(StringUtils.isValidString(url.getConfirmationPath()) && StringUtils.isValidString(url.getEndPath()) && url.getChannel() != null){
							Long canal=url.getChannel().getId();
							if(-1 == canal.intValue()){
								errors.rejectValue("urls["+i+"].confirmationPath", "admin.financial.agreement.urls.channel");
							}
						}else{
							Long canal=url.getChannel().getId();
							if(-1 != canal.intValue()){
								errors.rejectValue("urls["+i+"].confirmationPath", "admin.financial.agreement.urls.url");
							}
						}
					}
				}
				
				Long canal1, canal2, canal3;
				
				canal1 = urls.get(0).getChannel().getId();
				canal2 = urls.get(1).getChannel().getId();
				canal3 = urls.get(2).getChannel().getId();
				
				if(canal1 == canal2 && canal1 != -1){
					errors.rejectValue("urls[1].confirmationPath", "admin.financial.agreement.urls.channel.repetido");
				}else{
					if(canal1 == canal3 && canal1 != -1){
						errors.rejectValue("urls[2].confirmationPath", "admin.financial.agreement.urls.channel.repetido");
					}else{
						if(canal2 == canal3 && canal2 != -1){
							errors.rejectValue("urls[2].confirmationPath", "admin.financial.agreement.urls.channel.repetido");
						}
					}
				}
				
			}else{
				errors.rejectValue("urls[0].confirmationPath", "admin.financial.agreement.urls.empty");
			}
			
		}else{
			errors.rejectValue("urls[0].confirmationPath", "admin.financial.agreement.urls.empty");
		}
		
	}

	public void validateEditAgreement(Object command, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "initDateText", "field.empty", "El campo es vacio");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "endDateText", "field.empty", "El campo es vacio");
		
		AgreementDTO agreement = (AgreementDTO) command;
		
		
		if(StringUtils.isValidString(agreement.getInitDateText()) && StringUtils.isValidString(agreement.getEndDateText())){
			Date fechaInicio = DateUtils.obtenerFecha(agreement.getInitDateText(), "dd/MM/yyyy");
			Date fechaFin = DateUtils.obtenerFecha(agreement.getEndDateText(), "dd/MM/yyyy");
			
			if(fechaInicio.getTime()>=fechaFin.getTime()){
				errors.rejectValue("initDateText", "admin.financial.agreement.fechas.fracaso");
				errors.rejectValue("endDateText", "admin.financial.agreement.fechas.fracaso");
			}
		}
		
		List<UrlCallbackDTO> urls = agreement.getUrls();
		
		if(urls!=null && urls.size()>0){
			boolean almenosUna=false;
			for (int i = 0; i < urls.size(); i++) {
				UrlCallbackDTO url = urls.get(i);
				if(url!=null){
					if(StringUtils.isValidString(url.getConfirmationPath()) && StringUtils.isValidString(url.getEndPath())){
						almenosUna=true;
					}
				}
			}
			
			if(almenosUna){
				for (int i = 0; i < urls.size(); i++) {
					UrlCallbackDTO url = urls.get(i);
					if(url != null){
						
						if(StringUtils.isValidString(url.getConfirmationPath()) && StringUtils.isValidString(url.getEndPath()) && url.getChannel() != null){
							Long canal=url.getChannel().getId();
							if(-1 == canal.intValue()){
								errors.rejectValue("urls["+i+"].confirmationPath", "admin.financial.agreement.urls.channel");
							}
						}else{
							Long canal=url.getChannel().getId();
							if(-1 != canal.intValue()){
								errors.rejectValue("urls["+i+"].confirmationPath", "admin.financial.agreement.urls.url");
							}
						}
					}
				}
				
			}else{
				errors.rejectValue("urls[0].confirmationPath", "admin.financial.agreement.urls.empty");
			}
			
		}else{
			errors.rejectValue("urls[0].confirmationPath", "admin.financial.agreement.urls.empty");
		}
		
	}
	
	public void validate(Object arg0, Errors arg1) {
		
	}
}
