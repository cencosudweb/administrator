
/**
 *@name HomeController.java
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

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cencosud.administrator.dto.users.RoleDTO;
import com.cencosud.administrator.dto.users.UserDTO;
/**
 * @description Clase controladora que direcciona a un rol de usuario 
 */
@Controller
public class HomeController /* extends BaseController*/{
	
    private static Logger log = Logger.getLogger(HomeController.class);

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView index() {
		log.info("index:inicio");
		Authentication a = SecurityContextHolder.getContext().getAuthentication();
		Map<String, Object> model = new HashMap<String, Object>();
		ModelAndView forward = null;

		if(a.getPrincipal() instanceof UserDTO ){
			UserDTO current = (UserDTO) a.getPrincipal();
			
			if(current!=null){
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
			}
			
			if(forward == null){
				forward = new ModelAndView("/login/sign-in", model);
			}
		}else{
			forward = new ModelAndView("login/sign-in", model);
		}
		
		return forward;
    }
    
    @RequestMapping(value = "**/admin/home", method = RequestMethod.GET)
    public ModelAndView homeAdmin(ModelMap model, Principal principal) {
		log.info("homeAdmin:inicio");
		UserDTO user = (UserDTO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		model.addAttribute("name", user.getName());
		model.addAttribute("user", user);
		return new ModelAndView("role/admin/home", model);
    }
    
    @RequestMapping(value = "**/commerce/home", method = RequestMethod.GET)
    public ModelAndView homeCommerce(ModelMap model, Principal principal) {
		log.info("homeCommerce:inicio");
		UserDTO user = (UserDTO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		model.addAttribute("user", user);
		return new ModelAndView("role/commerce/home", model);
    }
    
    @RequestMapping(value = "**/financial/home", method = RequestMethod.GET)
    public ModelAndView homeFinancialInstitucion(ModelMap model, Principal principal) {
		log.info("homeFinancialInstitucion:inicio");
		UserDTO user = (UserDTO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		model.addAttribute("user", user);
		return new ModelAndView("role/financial/home", model);
    }
}
