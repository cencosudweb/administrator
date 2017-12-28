
/**
 *@name LoginController.java
 * 
 *@version 1.0 
 * 
 *@date 07-03-2017
 * 
 *@author EA7129
 * 
 *@copyright Cencosud. All rights reserved.
 */
package com.cencosud.administrator.web.controller.home;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.cencosud.administrator.web.controller.enums.MensajesResultado;
import com.cencosud.administrator.web.validator.AdminUsersValidator;
import com.cencosud.administrator.core.QuestionServices;
import com.cencosud.administrator.core.UserServices;
import com.cencosud.administrator.core.util.MD5HashingUtils;
import com.cencosud.administrator.dto.users.QuestionAnswerDTO;
import com.cencosud.administrator.dto.users.QuestionDTO;
import com.cencosud.administrator.dto.users.RoleDTO;
import com.cencosud.administrator.dto.users.UserDTO;
import com.cencosud.administrator.utils.OperationResult;
/**
 * @description Clase controladora para el inicio de session  
 */
@Controller
public class LoginController {
	private static Logger log = Logger.getLogger(LoginController.class);
	
	@Autowired
    private MessageSource msgSrc;  
	
	@Autowired
	private UserServices userServicesImpl;
	
	@Autowired
	private QuestionServices questionServicesImpl;
	
    @Autowired
    private AdminUsersValidator validator;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(ModelMap model) {
		return "login/sign-in";
	}
	
	@RequestMapping(value = "/resetPasswordTemp", method = RequestMethod.GET)
	public ModelAndView resetPassword() {
		Map<String, Object> model = new HashMap<String, Object>();
		ModelAndView forward;
		
		Authentication a = SecurityContextHolder.getContext().getAuthentication();

		if(a.getPrincipal() instanceof UserDTO ){
			forward = new ModelAndView("login/reset", model);
			forward.addObject("newUserPass", new UserDTO());	
		}else{
			forward = new ModelAndView("login/sign-in", model);
		}
		
		return forward;
	}
	
	@RequestMapping(value = "/forgotPassword", method = RequestMethod.GET)
	public ModelAndView forgotPassword() {
		Map<String, Object> model = new HashMap<String, Object>();
		ModelAndView forward;
		
		forward = new ModelAndView("login/forgot-password", model);
		forward.addObject("newUserForgotPass", new UserDTO());	
		
		return forward;
	}
	
	@RequestMapping(value = "/showQuestionsForgot", method = RequestMethod.POST)
	public ModelAndView showQuestionsForgot(@ModelAttribute("newUserForgotPass") UserDTO user, BindingResult result, SessionStatus status) {
		log.info("user:showQuestionsForgot");
		Map<String, Object> model = new HashMap<String, Object>();
		ModelAndView forward;
		String mensaje = "";
		int codigo = -1;
		UserDTO usuario;
		
		validator.validateForgotPass(user, result);
		if(!result.hasErrors()){
			
			usuario = userServicesImpl.getUser(user.getUsername());
			if(usuario==null){
				usuario = userServicesImpl.getUserByEmail(user.getUsername());
			}
			
			if(usuario!=null){
				forward = new ModelAndView("login/show-secret-questions-forgot", model);
				forward.addObject("newUserForgotPassQA", usuario);
			}else{
				forward = new ModelAndView("login/forgot-password", model);
				mensaje=msgSrc.getMessage("login.forgot.credenciales.fracaso", null, null);
				codigo=MensajesResultado.FRACASO.getCodigo();
				forward.addObject("codMsg", codigo);
				forward.addObject("msg", mensaje);
				forward.addObject("newUserForgotPass", user);	
			}
			
		}else{
			forward = new ModelAndView("login/forgot-password", model);
			forward.addObject("errors", result.getAllErrors());
		}
		
		return forward;
	}
	
	@RequestMapping(value = "/resetForgotPass", method = RequestMethod.POST)
	public ModelAndView resetForgotPass(@ModelAttribute("newUserForgotPassQA") UserDTO user, BindingResult result, SessionStatus status) {
		log.info("user:resetForgotPass");
		Map<String, Object> model = new HashMap<String, Object>();
		ModelAndView forward = null;
		String mensaje="";
		int codigo=-1;
		OperationResult resultado;
		UserDTO usuario;
		boolean respuestasCorrectas=true;
		
		validator.validateSaveQuestionAnswerForgot(user, result);
		if(!result.hasErrors()){
			
			usuario = userServicesImpl.getUser(user.getId());
			List<QuestionAnswerDTO> qas = usuario.getQas();
			List<QuestionAnswerDTO> qasTmp =user.getQas();
			
			for (int i = 0; i < qas.size() && respuestasCorrectas; i++) {
				QuestionAnswerDTO qa = qas.get(i);
				for (int j = 0; j < qasTmp.size(); j++) {
					QuestionAnswerDTO qaTmp = qasTmp.get(j);
					
					if(qa.getId() == qaTmp.getId()){
						try {
							String encryptTmpAnswer = MD5HashingUtils.encrypt(qaTmp.getValSel());
							
							if(!qa.getAnswer().equals(encryptTmpAnswer)){
								respuestasCorrectas=false;
								break;
							}
						} catch (Exception e) {
							respuestasCorrectas=false;
							break;
						}
					}
				}
			}
			
			if(respuestasCorrectas){
				resultado = userServicesImpl.resetPassword(user.getId());
				if(resultado.getResult()==OperationResult.SUCCESS){
					mensaje=msgSrc.getMessage("reset.password.exito", null, null);
					codigo=MensajesResultado.EXITO.getCodigo();
				}else{
					mensaje=msgSrc.getMessage("reset.password.fracaso", null, null);
					codigo=MensajesResultado.FRACASO.getCodigo();
				}
				forward = new ModelAndView("login/sign-in", model);
			}else{
				forward = new ModelAndView("login/show-secret-questions-forgot", model);
				mensaje=msgSrc.getMessage("login.forgot.answer.fracaso", null, null);
				codigo=MensajesResultado.FRACASO.getCodigo();
				forward.addObject("newUserForgotPassQA", user);
			}

			forward.addObject("codMsg", codigo);
			forward.addObject("msg", mensaje);
		}else{
			forward = new ModelAndView("login/show-secret-questions-forgot", model);
			forward.addObject("errors", result.getAllErrors());
			forward.addObject("newUserForgotPassQA", user);
		}
		return forward;
	}
	
	
	@RequestMapping(value = "/saveResetPasswordTemp", method = RequestMethod.POST)
	public ModelAndView saveResetPassword(@ModelAttribute("newUserPass") UserDTO user, BindingResult result, SessionStatus status) {
		log.info("user:saveResetPasswordTemp");
		Map<String, Object> model = new HashMap<String, Object>();
		ModelAndView forward;
		OperationResult resultado;
		String mensaje = "";
		int codigo = -1;
		
		validator.validateResetPasswordTemp(user, result);
		if(!result.hasErrors()){
			UserDTO current = (UserDTO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			
			resultado = userServicesImpl.changePasswordLoggedUser(current.getId(), user.getPassword(), current.getPassword());
			
			if(resultado.getResult() == OperationResult.SUCCESS){
				mensaje=msgSrc.getMessage("login.reset.exito", null, null);
				codigo=MensajesResultado.EXITO.getCodigo();
				
				List<QuestionDTO> qs = questionServicesImpl.getQuestions();
				UserDTO usuarioLocal = new UserDTO(); 
				
				if(qs!=null && qs.size()>0){
					List<QuestionAnswerDTO> qas = new ArrayList<QuestionAnswerDTO>();
					for (int i = 0; i < 3; i++) {
						QuestionAnswerDTO qa = new QuestionAnswerDTO();
						qa.setQuestion(qs.get(0).getQuestion());
						qas.add(qa);
					}
					usuarioLocal.setQas(qas);
				}
				
				forward = new ModelAndView("login/secret-questions", model);
				forward.addObject("questions", qs);
				forward.addObject("newUserQA", usuarioLocal);
			}else{
				mensaje=msgSrc.getMessage("login.reset.fracaso", null, null);
				codigo=MensajesResultado.FRACASO.getCodigo();
				forward = new ModelAndView("login/reset", model);
			}
			
		}else{
			forward = new ModelAndView("login/reset", model);
			forward.addObject("errors", result.getAllErrors());
		}

		forward.addObject("codMsg", codigo);
		forward.addObject("msg", mensaje);
		
		return forward;
	}
	
	@RequestMapping(value = "/saveQuestionsAnswer", method = RequestMethod.POST)
	public ModelAndView saveQuestionsAnswer(@ModelAttribute("newUserQA") UserDTO user, BindingResult result, SessionStatus status) {
		log.info("user:saveQuestionsAnswer");
		Map<String, Object> model = new HashMap<String, Object>();
		ModelAndView forward = null;
		String mensaje="";
		int codigo=-1;
		
		validator.validateSaveQuestionAnswer(user, result);
		if(!result.hasErrors()){
			
			UserDTO current = (UserDTO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			
			OperationResult resultado = questionServicesImpl.addQuestionAnswer(current.getId(), user.getQas());
			
			if(resultado.getResult() == OperationResult.SUCCESS){
				mensaje=msgSrc.getMessage("admin.user.qa.question.add.exito", null, null);
				codigo=MensajesResultado.EXITO.getCodigo();
			}else{
				mensaje=msgSrc.getMessage("admin.user.qa.question.add.fracaso", null, null);
				codigo=MensajesResultado.FRACASO.getCodigo();
			}
			
			List<RoleDTO> roles = current.getRoles();
			
			for (int i = 0; i < roles.size(); i++) {
				RoleDTO rol = roles.get(i);
				if (rol.getRole().equals("ROLE_ADMIN")) {
		        	forward = new ModelAndView("/role/admin/home", model);
		        	break;
		        }else{
		            if (rol.getRole().equals("ROLE_USER_IF")) {
		            	forward = new ModelAndView("/role/financial/home", model);
		                 break;
		            }else{
		            	 if (rol.getRole().equals("ROLE_COMMERCE")) {
		            		 forward = new ModelAndView("/role/commerce/home", model);
		                    break;
		                 }
		            }
		        }
			}
			
			if(forward == null){
				forward = new ModelAndView("/login/sign-in", model);
			}
			
		}else{
			forward = new ModelAndView("login/secret-questions", model);
			forward.addObject("errors", result.getAllErrors());
			forward.addObject("questions", questionServicesImpl.getQuestions());
		}
		
		forward.addObject("codMsg", codigo);
		forward.addObject("msg", mensaje);
		
		return forward;
	}
	
	@RequestMapping(value = "/failAccountBlocked", method = RequestMethod.GET)
	public String failAccountBlocked(ModelMap model) {
		String mensaje=msgSrc.getMessage("login.fracaso.bloqueado", null, null);
		int codigo=MensajesResultado.FRACASO.getCodigo();
		model.addAttribute("codMsg", codigo);
		model.addAttribute("msg", mensaje);
		return "login/sign-in";
	}
	
	@RequestMapping(value = "/failLoginInvalidPassword", method = RequestMethod.GET)
	public String failLoginInvalidPassword(ModelMap model) {
		String mensaje=msgSrc.getMessage("login.fracaso.intentos", null, null);
		int codigo=MensajesResultado.FRACASO.getCodigo();
		model.addAttribute("codMsg", codigo);
		model.addAttribute("msg", mensaje);
		return "login/sign-in";
	}
	
	@RequestMapping(value = "/failLoginCredentials", method = RequestMethod.GET)
	public String failLoginCredentials(ModelMap model) {
		model.addAttribute("error", 1);
		String mensaje=msgSrc.getMessage("login.fracaso.credenciales", null, null);
		int codigo=MensajesResultado.FRACASO.getCodigo();
		model.addAttribute("codMsg", codigo);
		model.addAttribute("msg", mensaje);
		return "login/sign-in";
	}
	
	@RequestMapping(value = "/failLoginCredentialsExpired", method = RequestMethod.GET)
	public String failLoginCredentialsExpired(ModelMap model) {
		model.addAttribute("error", 1);
		String mensaje=msgSrc.getMessage("login.fracaso.expire", null, null);
		int codigo=MensajesResultado.FRACASO.getCodigo();
		model.addAttribute("codMsg", codigo);
		model.addAttribute("msg", mensaje);
		return "login/sign-in";
	}
	
	@RequestMapping(value = "/logoff", method = RequestMethod.GET)
	public String logoff(ModelMap model) {
		SecurityContextHolder.clearContext();
		return "login/sign-in";
	}
	
}
