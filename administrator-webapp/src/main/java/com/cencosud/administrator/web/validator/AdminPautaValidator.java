
/**
 *@name AdminCommerceValidator.java
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

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.cencosud.administrator.dto.users.PautaDTO;
import com.cencosud.administrator.web.utils.StringUtils;

/**
 * @description Clase AdminCommerceValidator que  valida el objeto Comercio dado y en caso de errores de validación, registra aquellos con el objeto Errors dado
 */
@Component
public class AdminPautaValidator implements Validator {
	
	//@Autowired
	//private PautaServices pautaServicesImpl;

	public boolean supports(Class<?> c) {
		return PautaDTO.class.isAssignableFrom(c);
	}

	public void validateAdd(Object command, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "descripcionIssue", "field.empty", "El campo es vacio");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "observacion", "field.empty", "El campo es vacio");
		
		PautaDTO pauta = (PautaDTO) command;
		if(StringUtils.isValidString(pauta.getDescripcionIssue())){
			if(!StringUtils.isValidMinLength(pauta.getDescripcionIssue(),5)){
				errors.rejectValue("descripcionIssue", "field.min.length");	
			}
		}
		
		if(StringUtils.isValidString(pauta.getObservacion())){
			if(!StringUtils.isValidMinLength(pauta.getObservacion(),3)){
				errors.rejectValue("observacion", "field.min.length");	
			}
		}
		/*
		if(StringUtils.isValidString(String.valueOf(pauta.getTienda().getDescription()))){
			if(!StringUtils.isValidMinLength(pauta.getObservacion(),1)){
				errors.rejectValue("tienda", "field.min.length");	
			}
		}
		*/
		
		
	}
	
	public void validateEdit(Object command, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "descripcionIssue", "field.empty", "El campo es vacio");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "observacion", "field.empty", "El campo es vacio");
		
		PautaDTO pauta = (PautaDTO) command;
		
		if(StringUtils.isValidString(pauta.getDescripcionIssue())){
			if(!StringUtils.isValidMinLength(pauta.getDescripcionIssue(),5)){
				errors.rejectValue("descripcionIssue", "field.min.length");	
			}
		}
		
		if(StringUtils.isValidString(pauta.getObservacion())){
			if(!StringUtils.isValidMinLength(pauta.getObservacion(),3)){
				errors.rejectValue("observacion", "field.min.length");	
			}
		}
	}

	public void validate(Object arg0, Errors arg1) {
		
	}
}
