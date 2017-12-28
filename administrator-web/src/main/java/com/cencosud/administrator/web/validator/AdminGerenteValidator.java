/**
 * 
 */
package com.cencosud.administrator.web.validator;


import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.cencosud.administrator.dto.users.GerenteDTO;
import com.cencosud.administrator.web.utils.StringUtils;

/**
 * @author EA7129
 *
 */

@Component
public class AdminGerenteValidator implements Validator {
	
	//@Autowired
	//private GerenteServices gerenteServicesImpl;


	@Override
	public boolean supports(Class<?> c) {
		// TODO Auto-generated method stub
		return GerenteDTO.class.isAssignableFrom(c);
	}
	
	public void validateAdd(Object command, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "description", "field.empty", "El campo es vacio");
		
		GerenteDTO gerente = (GerenteDTO) command;
		
		//TiendaDTO tienda2 = tiendaServicesImpl.getTienda(tienda.getDescription());
		//if(tienda2!=null){
		//	errors.rejectValue("description", "field.username.existe");	
		//}
		
		if(StringUtils.isValidString(gerente.getDescription())){
			if(!StringUtils.isValidMinLength(gerente.getDescription(), 4)){
				errors.rejectValue("description", "field.min.length");
			}else{
				if(!StringUtils.isValidMaxLength(gerente.getDescription(), 50)){
					errors.rejectValue("description", "field.max.length");
				}else{
					if(!StringUtils.isAlfaNumerico(gerente.getDescription())){
						errors.rejectValue("description", "field.no.alfanumerico");	
					}/*else{
						TiendaDTO tienda1 = tiendaServicesImpl.getTienda(tienda.getDescription());
						if(tienda1!=null){
							errors.rejectValue("description", "field.username.existe");	
						}	
					}*/
				}	
			}
		}
		
		
		
	}
	
	public void validateEdit(Object command, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "description", "field.empty", "El campo es vacio");
		
		GerenteDTO gerente = (GerenteDTO) command;
		
		if(StringUtils.isValidString(gerente.getDescription())){
			if(!StringUtils.isValidMinLength(gerente.getDescription(),5)){
				errors.rejectValue("description", "field.min.length");	
			}
		}
		
	}

	@Override
	public void validate(Object arg0, Errors arg1) {
		// TODO Auto-generated method stub
		
	}

}
