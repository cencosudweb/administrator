
/**
 *@name AccountController.java
 * 
 *@version 1.0 
 * 
 *@date 07-03-2017
 * 
 *@author EA7129
 * 
 *@copyright Cencosud. All rights reserved.
 */
package com.cencosud.administrator.web.controller.account;

import java.security.Principal;
import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
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
import com.cencosud.administrator.web.utils.AdminUtils;
import com.cencosud.administrator.web.validator.AdminUsersValidator;
import com.cencosud.administrator.core.UserServices;
import com.cencosud.administrator.dto.users.UserDTO;
import com.cencosud.administrator.utils.OperationResult;
/**
 * @description Clase controladora para el acceso a las cuenta de usuario   
 */
@Controller
public class AccountController /* extends BaseController*/{
	
    private static Logger log = Logger.getLogger(AccountController.class);
    
    @Autowired
    private AdminUsersValidator validatorEdit;
    @Autowired
    private MessageSource msgSrc;  
    @Autowired
	private UserServices userServicesImpl;
    
    @RequestMapping(value = "/*/profile", method = RequestMethod.GET)
    public ModelAndView miCuenta(ModelMap model, Principal principal) {
		log.info("account:profile");
		UserDTO user = (UserDTO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		user.setEmail2(user.getEmail());
		model.addAttribute("newUser", user);
		model.addAttribute("user", user);
		return new ModelAndView("account/profile", model);
    }
    
    @RequestMapping(value = "/*/saveEditProfile", method = RequestMethod.POST)
    public ModelAndView saveEditProfile(@ModelAttribute("newUser") UserDTO user, BindingResult result, SessionStatus status) {
		log.info("account:saveEditUser");
		Map<String, Object> model = new HashMap<String, Object>();
		ModelAndView forward;
		String mensaje, pathHome;
		int codigo;
		OperationResult resultado;
		
		validatorEdit.validate(user, result);
		if(!result.hasErrors()){
			resultado=userServicesImpl.editUser(user);
			
			if(resultado.getResult()==OperationResult.SUCCESS){
				UserDTO principal = (UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
				pathHome = AdminUtils.getPathHomeRole(principal.getRoles());
				forward = new ModelAndView(pathHome, model);
				mensaje=msgSrc.getMessage("profile.edit.exito", null, null);
				codigo=MensajesResultado.EXITO.getCodigo();
			}else{
				forward = new ModelAndView("account/profile", model);
				mensaje=msgSrc.getMessage("profile.edit.fracaso", null, null);
				codigo=MensajesResultado.FRACASO.getCodigo();
			}
			
			forward.addObject("codMsg", codigo);
			forward.addObject("msg", mensaje);
		}else{
			forward = new ModelAndView("account/profile", model);
		}
		forward.addObject("errors", result.getAllErrors());
		return forward;
    }
    
    @RequestMapping(value = "/*/resetMyPassword", method = RequestMethod.GET)
    public ModelAndView resetPassword(ModelMap model, Principal principal) {
		log.info("account:profile");
		UserDTO user = (UserDTO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		model.addAttribute("newUser", user);
		return new ModelAndView("account/reset_password", model);
    }
    
    @RequestMapping(value = "/*/saveResetMyPassword", method = RequestMethod.POST)
    public ModelAndView saveResetMyPassword(@ModelAttribute("newUser") UserDTO user, BindingResult result, SessionStatus status) {
		log.info("account:saveResetMyPassword");
		Map<String, Object> model = new HashMap<String, Object>();
		ModelAndView forward;
		String mensaje, pathHome;
		int codigo;
		OperationResult resultado;
		
		validatorEdit.validateResetPassword(user, result);
		if(!result.hasErrors()){
			resultado=userServicesImpl.changePassword(user.getId(), user.getPassword(), user.getPasswordActualReset());
			
			if(resultado.getResult()==OperationResult.SUCCESS){
				UserDTO principal = (UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
				pathHome = AdminUtils.getPathHomeRole(principal.getRoles());
				forward = new ModelAndView(pathHome, model);
				mensaje=msgSrc.getMessage("profile.password.change.exito", null, null);
				codigo=MensajesResultado.EXITO.getCodigo();
			}else{
				forward = new ModelAndView("account/reset_password", model);
				mensaje=msgSrc.getMessage("profile.password.change.fracaso", null, null);
				codigo=MensajesResultado.FRACASO.getCodigo();
			}
			
			forward.addObject("codMsg", codigo);
			forward.addObject("msg", mensaje);
		}else{
			forward = new ModelAndView("account/reset_password", model);
		}
		forward.addObject("errors", result.getAllErrors());
		return forward;
    }
    
}
