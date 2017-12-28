/**
 *@name AdminSystemLogController.java
 * 
 *@version 1.0 
 * 
 *@date 08-05-2017
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
import org.springframework.context.MessageSource;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cencosud.administrator.web.controller.base.BaseController;
import com.cencosud.administrator.web.controller.enums.MensajesResultado;
//import com.cencosud.administrator.web.validator.AdminUsersValidator;
//import com.cencosud.administrator.core.CommerceServices;
//import com.cencosud.administrator.core.FinancialInstitutionServices;
//import com.cencosud.administrator.core.RoleServices;
import com.cencosud.administrator.core.SystemLogServices;
import com.cencosud.administrator.core.UserServices;
import com.cencosud.administrator.core.util.PageNate;
import com.cencosud.administrator.dto.users.SystemLogDTO;
import com.cencosud.administrator.dto.users.UserDTO;


/**
 * @description 
 */

@Controller
public class AdminSystemLogController extends BaseController {
	
	private static Logger log = Logger.getLogger(AdminUserController.class);

    @Autowired
    private MessageSource msgSrc;  
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
    
    
    @Autowired
	private SystemLogServices systemLogServicesImpl;
    
    @RequestMapping(value = "admin/allLogs", method = RequestMethod.GET)
    public ModelAndView users(Integer p,  String idUser, String description) {
		log.info("user:allUsers");
		UserDTO principal = (UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		log.info("user:allUsers Usuario Actual "+principal.getUsername());
		List<UserDTO> users = userServicesImpl.getUsers();
		Map<String, Object> model = new HashMap<String, Object>();
		ModelAndView forward;
		
		String idUser1 = idUser != null?idUser:"0";
		String description1 = description != null || !"".equals(description)?description:null;

		log.info("p"+p);
		log.info("user:idUser1"+idUser1);
		log.info("user:description:"+description1);
		
		log.info("user:idUser1_2"+Integer.parseInt(idUser1));
		
		Long total;
		
		total = systemLogServicesImpl.getCounts(Integer.parseInt(idUser1), description1);
		log.info("total:"+total);
		
		int pagelimit1 = 0;
		int pagelimit = pagelimit1 > 0?pagelimit1:25;
		
		int p1 = p != null?p:1;
		log.info("user:p"+p);
		
		String qstr = "";
		if (idUser != null)
			qstr += "&idUser="+idUser;
		else
			qstr += "";
		
		if (description != null)
			qstr += "&description="+description;
		else
			qstr += "";
		
		log.info("qstr:"+qstr);
		
		
		
		PageNate pageNate = new PageNate(total, p1, pagelimit, "");
		pageNate.setURL("allLogs", qstr);
		log.info("start:"+pageNate.getStart());
		log.info("limit:"+pageNate.getLimit());
		log.info("numpages:"+pageNate.getNumPages());
		log.info("pagelinks:"+pageNate.getPageLinks());
		
		//List<SystemLogDTO> logs = systemLogServicesImpl.getSystemLog(pageNate.getStart(), pageNate.getLimit());
		List<SystemLogDTO> logs = systemLogServicesImpl.getSystemLog(Integer.parseInt(idUser1), description1, pageNate.getStart(), pageNate.getLimit());
		
		if(logs != null){
			
			forward = new ModelAndView("role/admin/log/allLogs", model);
			forward.addObject("record", total);
			forward.addObject("p", p);
			forward.addObject("user", principal);
			forward.addObject("users", users);
			forward.addObject("logs", logs);
			forward.addObject("numpages", pageNate.getNumPages());
			forward.addObject("pagelinks", pageNate.getPageLinks());
			
		} else {
			String mensaje=msgSrc.getMessage("admin.log.noexiste", null, null);
			int codigo=MensajesResultado.FRACASO.getCodigo();
			
			forward = new ModelAndView("role/admin/log/allLogs", model);
			forward.addObject("user", principal);
			forward.addObject("users", users);
			forward.addObject("codMsg", codigo);
			forward.addObject("msg", mensaje);
		}
		return forward;
		//model.put("users", users);
		//return new ModelAndView("role/admin/log/allLogs", model);
    }

}
