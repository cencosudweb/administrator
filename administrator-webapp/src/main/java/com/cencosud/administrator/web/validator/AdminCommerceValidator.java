
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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.cencosud.administrator.web.utils.StringUtils;
import com.cencosud.administrator.core.CommerceServices;
import com.cencosud.administrator.dto.users.CommerceDTO;

/**
 * @description Clase AdminCommerceValidator que  valida el objeto Comercio dado y en caso de errores de validación, registra aquellos con el objeto Errors dado
 */
@Component
public class AdminCommerceValidator implements Validator {
	
	@Autowired
	private CommerceServices commerceServicesImpl;

	public boolean supports(Class<?> c) {
		return CommerceDTO.class.isAssignableFrom(c);
	}

	public void validateAdd(Object command, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "rut", "field.empty", "El campo es vacio");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "businessLine", "field.empty", "El campo es vacio");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "mnemonic", "field.empty", "El campo es vacio");
		
		CommerceDTO commerce = (CommerceDTO) command;
		
		if(StringUtils.isValidString(commerce.getRut())){
			if(!StringUtils.isValidFullRut(commerce.getRut())){
				errors.rejectValue("rut", "field.rut");	
			}else{
				CommerceDTO find = commerceServicesImpl.getCommerceByRut(StringUtils.getDBRut(commerce.getRut()));
				if(find!=null){
					errors.rejectValue("rut", "admin.commerce.rut.existe");	
				}
			}
		}
		
		if(StringUtils.isValidString(commerce.getBusinessLine())){
			if(!StringUtils.isValidMinLength(commerce.getBusinessLine(),5)){
				errors.rejectValue("businessLine", "field.min.length");	
			}
		}
		
		if(StringUtils.isValidString(commerce.getMnemonic())){
			if(!StringUtils.isValidMinLength(commerce.getMnemonic(),3)){
				errors.rejectValue("mnemonic", "field.min.length");	
			}else{
				CommerceDTO find = commerceServicesImpl.getCommerceByMnemonic(commerce.getMnemonic());
				if(find!=null){
					errors.rejectValue("mnemonic", "admin.commerce.mnemonic.existe");	
				}
			}
		}
	}
	
	public void validateEdit(Object command, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "businessLine", "field.empty", "El campo es vacio");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "mnemonic", "field.empty", "El campo es vacio");
		
		CommerceDTO commerce = (CommerceDTO) command;
		
		if(StringUtils.isValidString(commerce.getBusinessLine())){
			if(!StringUtils.isValidMinLength(commerce.getBusinessLine(),5)){
				errors.rejectValue("businessLine", "field.min.length");	
			}
		}
		
		if(StringUtils.isValidString(commerce.getMnemonic())){
			if(!StringUtils.isValidMinLength(commerce.getMnemonic(),3)){
				errors.rejectValue("mnemonic", "field.min.length");	
			}else{
				CommerceDTO find = commerceServicesImpl.getCommerceByMnemonic(commerce.getMnemonic());
				if(find!=null && find.getId() != commerce.getId()){
					errors.rejectValue("mnemonic", "admin.commerce.mnemonic.existe");	
				}
			}
		}
	}

	public void validate(Object arg0, Errors arg1) {
		
	}
}
