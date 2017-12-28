/**
 *@name AdminOrdenesController.java
 * 
 *@version 1.0 
 * 
 *@date 13-03-2017
 * 
 *@author EA7129
 * 
 *@copyright Cencosud. All rights reserved.
 */
package com.cencosud.administrator.web.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.MessageSource;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

//import com.cencosud.administrator.web.validator.AdminUsersValidator;
//import com.cencosud.administrator.core.CommerceServices;
//import com.cencosud.administrator.core.FinancialInstitutionServices;
//import com.cencosud.administrator.core.RoleServices;
import com.cencosud.administrator.core.UserServices;
import com.cencosud.administrator.dto.users.UserDTO;
/**
 * @description 
 */

@Controller
public class AdminOrdenesController {
	
	private static Logger log = Logger.getLogger(AdminUserController.class);

	//@Autowired
	//private MessageSource msgSrc;  
    @Autowired
	private UserServices userServicesImpl;
    //@Autowired
    //private FinancialInstitutionServices financialInstitutionServicesImpl;
    //@Autowired
    //private CommerceServices commerceServicesImpl;
    //@Autowired
    //private AdminUsersValidator validator;
    //@Autowired
    //private RoleServices roleServicesImpl;
    
    
    @RequestMapping(value = "admin/reporte", method = RequestMethod.GET)
    public ModelAndView reporte() {
		log.info("user:reporte");
		UserDTO principal = (UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		log.info("user:allUsers Usuario Actual "+principal.getUsername());
		List<UserDTO> users = userServicesImpl.getUsers();
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("users", users);
		return new ModelAndView("role/admin/reporte/reporte", model);
    }

}
