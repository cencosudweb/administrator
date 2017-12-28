/**
 * 
 */
package com.cencosud.administrator.web.validator;


import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.cencosud.administrator.dto.users.ContratanteDTO;
import com.cencosud.administrator.web.utils.StringUtils;

/**
 * @author EA7129
 *
 */

@Component
public class AdminContratanteValidator implements Validator {
	
	//@Autowired
	//private ContratanteServices contratanteServicesImpl;


	@Override
	public boolean supports(Class<?> c) {
		// TODO Auto-generated method stub
		return ContratanteDTO.class.isAssignableFrom(c);
	}
	
	public void validateAdd(Object command, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "description", "field.empty", "El campo es vacio");
		
		ContratanteDTO contratante = (ContratanteDTO) command;
		
		//TiendaDTO tienda2 = tiendaServicesImpl.getTienda(tienda.getDescription());
		//if(tienda2!=null){
		//	errors.rejectValue("description", "field.username.existe");	
		//}
		
		if(StringUtils.isValidString(contratante.getDescription())){
			if(!StringUtils.isValidMinLength(contratante.getDescription(), 4)){
				errors.rejectValue("description", "field.min.length");
			}else{
				if(!StringUtils.isValidMaxLength(contratante.getDescription(), 50)){
					errors.rejectValue("description", "field.max.length");
				}else{
					if(!StringUtils.isAlfaNumerico(contratante.getDescription())){
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
		
		ContratanteDTO contratante = (ContratanteDTO) command;
		
		if(StringUtils.isValidString(contratante.getDescription())){
			if(!StringUtils.isValidMinLength(contratante.getDescription(),5)){
				errors.rejectValue("description", "field.min.length");	
			}
		}
		
	}

	@Override
	public void validate(Object arg0, Errors arg1) {
		// TODO Auto-generated method stub
		
	}

}
