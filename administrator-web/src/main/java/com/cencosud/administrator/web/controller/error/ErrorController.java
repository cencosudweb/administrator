
/**
 *@name ErrorController.java
 * 
 *@version 1.0 
 * 
 *@date 07-03-2017
 * 
 *@author EA7129
 * 
 *@copyright Cencosud. All rights reserved.
 */
package com.cencosud.administrator.web.controller.error;
/**
 * @description Clase que direcciona pagian no existentes
 */
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ErrorController {

	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public String accessDenied(ModelMap model) {
		model.addAttribute("msg", "You don't have privileges to view this page!!!");
		SecurityContextHolder.clearContext();
		return "error/403";

	}
}
