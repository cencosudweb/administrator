
/**
 *@name AdminUsersValidator.java
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

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.cencosud.administrator.web.utils.StringUtils;
import com.cencosud.administrator.core.UserServices;
import com.cencosud.administrator.core.util.PasswordValidator;
import com.cencosud.administrator.dto.users.QuestionAnswerDTO;
import com.cencosud.administrator.dto.users.UserDTO;
/**
  * @description Clase AdminUsersValidator que  valida el objeto User dado y en caso de errores de validación, registra aquellos con el objeto Errors dado
*/
@Component
public class AdminUsersValidator implements Validator {
	
	@Autowired
	private UserServices userServicesImpl;
	
	@Autowired
	private PasswordValidator passwordValidator;

	public boolean supports(Class<?> c) {
		return UserDTO.class.isAssignableFrom(c);
	}

	public void validateAdd(Object command, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "rut", "field.empty", "El campo es vacio");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "field.empty", "El campo es vacio");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "field.empty", "El campo es vacio");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "phone", "field.empty", "El campo es vacio");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "field.empty", "El campo es vacio");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email2", "field.empty", "El campo es vacio");
		
		UserDTO usuario = (UserDTO) command;
		
		if(StringUtils.isValidString(usuario.getUsername())){
			if(!StringUtils.isValidMinLength(usuario.getUsername(), 4)){
				errors.rejectValue("username", "field.min.length");
			}else{
				if(!StringUtils.isValidMaxLength(usuario.getUsername(), 10)){
					errors.rejectValue("username", "field.max.length");
				}else{
					if(!StringUtils.isAlfaNumerico(usuario.getUsername())){
						errors.rejectValue("username", "field.no.alfanumerico");	
					}else{
						UserDTO user = userServicesImpl.getUser(usuario.getUsername());
						if(user!=null){
							errors.rejectValue("username", "field.username.existe");	
						}	
					}
				}	
			}
		}
		
		if(StringUtils.isValidString(usuario.getRut())){
			if(!StringUtils.isValidMinLength(StringUtils.getDBRut(usuario.getRut()), 7)){
				errors.rejectValue("rut", "field.min.length");
			}else{
				if(!StringUtils.isValidMaxLength(StringUtils.getDBRut(usuario.getRut()), 11)){
					errors.rejectValue("rut", "field.max.length");
				}else{
					if(!StringUtils.isValidFullRut(usuario.getRut())){
						errors.rejectValue("rut", "field.rut");	
					}else{
						UserDTO find = userServicesImpl.getUserByRut(StringUtils.getDBRut(usuario.getRut()));
						if(find!=null){
							errors.rejectValue("rut", "admin.user.add.rut.existe");		
						}
					}
				}
			}
		}
		
		if(StringUtils.isValidString(usuario.getPhone())){
			if(!StringUtils.isValidMinLength(usuario.getRut(), 6)){
				errors.rejectValue("phone", "field.min.length");
			}else{
				if(!StringUtils.isValidMaxLength(usuario.getPhone(), 15)){
					errors.rejectValue("phone", "field.max.length");
				}else{
					if(!StringUtils.isValidPhone(usuario.getPhone())){
						errors.rejectValue("phone", "field.fono");	
					}
				}
			}
		}
		
		if(StringUtils.isValidString(usuario.getEmail()) && StringUtils.isValidString(usuario.getEmail2())){
			if(!StringUtils.isValidMinLength(usuario.getEmail(), 6)){
				errors.rejectValue("email", "field.min.length");
			}else{
				if(!StringUtils.isValidMaxLength(usuario.getEmail(), 45)){
					errors.rejectValue("email", "field.max.length");
				}else{
					if(!StringUtils.isValidMinLength(usuario.getEmail2(), 6)){
						errors.rejectValue("email2", "field.min.length");
					}else{
						if(!StringUtils.isValidMaxLength(usuario.getEmail2(), 45)){
							errors.rejectValue("email2", "field.max.length");
						}else{
							if(!usuario.getEmail().equals(usuario.getEmail2())){
								errors.rejectValue("email", "field.email.distinta");
								errors.rejectValue("email2", "field.email.distinta");
							}else{
								if(!StringUtils.isValidEmail(usuario.getEmail())){
									errors.rejectValue("email", "field.email");	
								}else{
									UserDTO user = userServicesImpl.getUserByEmail(usuario.getEmail());
									if(user!=null){
										errors.rejectValue("email", "field.email.existe");	
									}
								}
							}
						}
					}
				}
			}
		}
	}
	
	public void validateEdit(Object command, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "field.empty", "El campo es vacio");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "phone", "field.empty", "El campo es vacio");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "field.empty", "El campo es vacio");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email2", "field.empty", "El campo es vacio");
		
		UserDTO usuario = (UserDTO) command;
		
		if(StringUtils.isValidString(usuario.getPhone())){
			if(!StringUtils.isValidMinLength(usuario.getRut(), 6)){
				errors.rejectValue("phone", "field.min.length");
			}else{
				if(!StringUtils.isValidMaxLength(usuario.getPhone(), 15)){
					errors.rejectValue("phone", "field.max.length");
				}else{
					if(!StringUtils.isValidPhone(usuario.getPhone())){
						errors.rejectValue("phone", "field.fono");	
					}
				}
			}
		}
		
		if(StringUtils.isValidString(usuario.getEmail()) && StringUtils.isValidString(usuario.getEmail2())){
			if(!StringUtils.isValidMinLength(usuario.getEmail(), 6)){
				errors.rejectValue("email", "field.min.length");
			}else{
				if(!StringUtils.isValidMaxLength(usuario.getEmail(), 45)){
					errors.rejectValue("email", "field.max.length");
				}else{
					if(!StringUtils.isValidMinLength(usuario.getEmail2(), 6)){
						errors.rejectValue("email2", "field.min.length");
					}else{
						if(!StringUtils.isValidMaxLength(usuario.getEmail2(), 45)){
							errors.rejectValue("email2", "field.max.length");
						}else{
							if(!usuario.getEmail().equals(usuario.getEmail2())){
								errors.rejectValue("email", "field.email.distinta");
								errors.rejectValue("email2", "field.email.distinta");
							}else{
								if(!StringUtils.isValidEmail(usuario.getEmail())){
									errors.rejectValue("email", "field.email");	
								}else{
									UserDTO user = userServicesImpl.getUserByEmail(usuario.getEmail());
									if(user!=null && usuario.getId() != user.getId()){
										errors.rejectValue("email", "field.email.existe");	
									}
								}
							}
						}
					}
				}
			}
		}
	}
	
	public void validateResetPassword(Object command, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "field.empty", "El campo es vacio");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password2", "field.empty", "El campo es vacio");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "passwordActualReset", "field.empty", "El campo es vacio");
		
		UserDTO usuario = (UserDTO) command;
		
		if(StringUtils.isValidString(usuario.getPassword()) && StringUtils.isValidString(usuario.getPassword2())){
			if(!usuario.getPassword().equals(usuario.getPassword2())){
				errors.rejectValue("password", "field.password.distinta");
				errors.rejectValue("password2", "field.password.distinta");
			}else{
				if(!StringUtils.isValidMinLength(usuario.getPassword(), 6)){
					errors.rejectValue("password", "field.min.length");
					errors.rejectValue("password2", "field.min.length");
				}else{
					if(!StringUtils.isValidMaxLength(usuario.getPassword(), 10)){
						errors.rejectValue("password", "field.max.length");
						errors.rejectValue("password2", "field.max.length");
					}else{
						if(!passwordValidator.validate(usuario.getPassword())){
							errors.rejectValue("password", "no.robusta", passwordValidator.getMessageError());
							errors.rejectValue("password2", "no.robusta", passwordValidator.getMessageError());
						}
					}
				}
			}
		}
	}
	
	public void validateResetPasswordTemp(Object command, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "field.empty", "El campo es vacio");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password2", "field.empty", "El campo es vacio");
		
		UserDTO usuario = (UserDTO) command;
		
		if(StringUtils.isValidString(usuario.getPassword()) && StringUtils.isValidString(usuario.getPassword2())){
			if(!usuario.getPassword().equals(usuario.getPassword2())){
				errors.rejectValue("password", "field.password.distinta");
				errors.rejectValue("password2", "field.password.distinta");
			}else{
				if(!StringUtils.isValidMinLength(usuario.getPassword(), 6)){
					errors.rejectValue("password", "field.min.length");
					errors.rejectValue("password2", "field.min.length");
				}else{
					if(!StringUtils.isValidMaxLength(usuario.getPassword(), 10)){
						errors.rejectValue("password", "field.max.length");
						errors.rejectValue("password2", "field.max.length");
					}else{
						if(!passwordValidator.validate(usuario.getPassword())){
							errors.rejectValue("password2", passwordValidator.getMessageError());
						}
					}
				}
			}
		}
	}
	
	public void validateForgotPass(Object command, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "field.empty", "El campo es vacio");
		
		UserDTO usuario = (UserDTO) command;
		
		
		if(StringUtils.isAdminUser(usuario.getUsername())){
			errors.rejectValue("username", "field.admin.account.not.allowed");
		}else{
			if(StringUtils.isValidString(usuario.getUsername())){
				if(!StringUtils.isValidMinLength(usuario.getUsername(), 4)){
					errors.rejectValue("username", "field.min.length");
				}else{
					if(!StringUtils.isValidMaxLength(usuario.getUsername(), 45)){
						errors.rejectValue("username", "field.max.length");
					}
				}
			}
		}
	}
	
	public void validateSaveQuestionAnswerForgot(Object command, Errors errors) {
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "qas[0].valSel", "field.empty", "El campo es vacio");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "qas[1].valSel", "field.empty", "El campo es vacio");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "qas[2].valSel", "field.empty", "El campo es vacio");
		
		UserDTO usuario = (UserDTO) command;
		List<QuestionAnswerDTO> qas = usuario.getQas();
		
		//Largos
		for (int i = 0; i < qas.size(); i++) {
			if(qas.get(i)!=null){
				if(StringUtils.isValidString(qas.get(i).getAnswer())){
					if(!StringUtils.isValidMinLength(qas.get(i).getAnswer(), 4)){
						errors.rejectValue("qas["+i+"].valSel", "field.min.length");
					}else{
						if(!StringUtils.isValidMaxLength(qas.get(i).getAnswer(), 300)){
							errors.rejectValue("qas["+i+"].valSel", "field.max.length");
						}
					}
				}
			}
		}
	}

	public void validateSaveQuestionAnswer(Object command, Errors errors) {
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "qas[0].question", "field.empty", "El campo es vacio");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "qas[0].answer", "field.empty", "El campo es vacio");
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "qas[1].question", "field.empty", "El campo es vacio");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "qas[1].answer", "field.empty", "El campo es vacio");
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "qas[2].question", "field.empty", "El campo es vacio");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "qas[2].answer", "field.empty", "El campo es vacio");
		
		UserDTO usuario = (UserDTO) command;
		List<QuestionAnswerDTO> qas = usuario.getQas();
		
		//Largos
		boolean problemasLargos=false;
		for (int i = 0; i < qas.size(); i++) {
			if(qas.get(i)!=null){
				
				if(StringUtils.isValidString(qas.get(i).getQuestion())){
					if(!StringUtils.isValidMinLength(qas.get(i).getQuestion(), 4)){
						errors.rejectValue("qas["+i+"].question", "field.min.length");
						problemasLargos=true;
					}else{
						if(!StringUtils.isValidMaxLength(qas.get(i).getQuestion(), 300)){
							errors.rejectValue("qas["+i+"].question", "field.max.length");
							problemasLargos=true;
						}
					}
				}
				
				if(StringUtils.isValidString(qas.get(i).getAnswer())){
					if(!StringUtils.isValidMinLength(qas.get(i).getAnswer(), 4)){
						errors.rejectValue("qas["+i+"].answer", "field.min.length");
					}else{
						if(!StringUtils.isValidMaxLength(qas.get(i).getAnswer(), 300)){
							errors.rejectValue("qas["+i+"].answer", "field.max.length");
						}
					}
				}
			}else{
				problemasLargos=true;
				break;
			}
		}
		
		//Preguntas Repetidas
		if(!problemasLargos){
			QuestionAnswerDTO qa1, qa2, qa3;
			qa1 = qas.get(0);
			qa2 = qas.get(1);
			qa3 = qas.get(2);
			
			if(qa2.getQuestion().equalsIgnoreCase(qa1.getQuestion())){
				errors.rejectValue("qas[1].answer", "admin.user.qa.question.existe");
			}
			
			if(qa3.getQuestion().equalsIgnoreCase(qa2.getQuestion()) || qa3.getQuestion().equalsIgnoreCase(qa1.getQuestion())){
				errors.rejectValue("qas[2].answer", "admin.user.qa.question.existe");
			}
			
		}
	}
	
	
	public void validate(Object arg0, Errors arg1) {
		
	}
}
