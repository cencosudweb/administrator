/**
 * 
 */
package com.cencosud.administrator.web.validator;


//import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

//import com.invoicings.billing.core.ChannelServices;
import com.cencosud.administrator.dto.users.ChannelDTO;
import com.cencosud.administrator.web.utils.StringUtils;
/**
 * @author jose
 *
 */

@Component
public class AdminChannelValidator implements Validator {
	
	//@Autowired
	//private ChannelServices channelServicesImpl;
	

	@Override
	public boolean supports(Class<?> c) {
		// TODO Auto-generated method stub
		return ChannelDTO.class.isAssignableFrom(c);
	}
	
	public void validateAdd(Object command, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "description", "field.empty", "El campo es vacio");
		
		ChannelDTO channel = (ChannelDTO) command;

		
		if(StringUtils.isValidString(channel.getDescription())){
			if(!StringUtils.isValidMinLength(channel.getDescription(), 4)){
				errors.rejectValue("description", "field.min.length");
			}else{
				if(!StringUtils.isValidMaxLength(channel.getDescription(), 25)){
					errors.rejectValue("description", "field.max.length");
				}else{
					if(!StringUtils.isAlfaNumerico(channel.getDescription())){
						errors.rejectValue("description", "field.no.alfanumerico");	
					}
					
				}	
			}
		}
		
	
		
		
	
		
	}
	
	public void validateEdit(Object command, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "description", "field.empty", "El campo es vacio");
		
		ChannelDTO channel = (ChannelDTO) command;

		
		if(StringUtils.isValidString(channel.getDescription())){
			if(!StringUtils.isValidMinLength(channel.getDescription(), 4)){
				errors.rejectValue("description", "field.min.length");
			}else{
				if(!StringUtils.isValidMaxLength(channel.getDescription(), 25)){
					errors.rejectValue("description", "field.max.length");
				}else{
					if(!StringUtils.isAlfaNumerico(channel.getDescription())){
						errors.rejectValue("description", "field.no.alfanumerico");	
					}
					
				}	
			}
		}
		
		
		
	}

	@Override
	public void validate(Object arg0, Errors arg1) {
		// TODO Auto-generated method stub
		
	}

}
