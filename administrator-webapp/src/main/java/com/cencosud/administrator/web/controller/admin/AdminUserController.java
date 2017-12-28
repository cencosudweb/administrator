
/**
 *@name AdminUserController.java
 * 
 *@version 1.0 
 * 
 *@date 07-03-2017
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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.cencosud.administrator.web.controller.base.BaseController;
import com.cencosud.administrator.web.controller.enums.MensajesResultado;
import com.cencosud.administrator.web.utils.StringUtils;
import com.cencosud.administrator.web.validator.AdminUsersValidator;
import com.cencosud.administrator.core.CommerceServices;
import com.cencosud.administrator.core.FinancialInstitutionServices;
import com.cencosud.administrator.core.RoleServices;
import com.cencosud.administrator.core.UserServices;
import com.cencosud.administrator.core.enums.RoleEnum;
import com.cencosud.administrator.core.enums.StatusEnum;
import com.cencosud.administrator.dto.users.CommerceDTO;
import com.cencosud.administrator.dto.users.FinancialInstitutionDTO;
import com.cencosud.administrator.dto.users.RoleDTO;
import com.cencosud.administrator.dto.users.UserDTO;
import com.cencosud.administrator.utils.OperationResult;
/**
 * @description Clase controladora que administra los usuarios   
 */
@Controller
public class AdminUserController  extends BaseController{
	
    private static Logger log = Logger.getLogger(AdminUserController.class);

    @Autowired
    private MessageSource msgSrc;  
    @Autowired
	private UserServices userServicesImpl;
    @Autowired
	private FinancialInstitutionServices financialInstitutionServicesImpl;
    @Autowired
	private CommerceServices commerceServicesImpl;
    @Autowired
    private AdminUsersValidator validator;
    @Autowired
	private RoleServices roleServicesImpl;
    
    private List<FinancialInstitutionDTO> ifs;
    private List<CommerceDTO> commerces;
    private List<RoleDTO> roles;
    
    @RequestMapping(value = "admin/allUsers", method = RequestMethod.GET)
    public ModelAndView users() {
		log.info("user:allUsers");
		UserDTO principal = (UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		log.info("user:allUsers Usuario Actual "+principal.getUsername());
		List<UserDTO> users = userServicesImpl.getUsers();
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("users", users);
		return new ModelAndView("role/admin/user/allUsers", model);
    }

    @RequestMapping(value = "admin/addUser", method = RequestMethod.GET)
    public ModelAndView user() {
		log.info("user:addUser");
		Map<String, Object> model = new HashMap<String, Object>();
		
		ifs = financialInstitutionServicesImpl.getFIs(StatusEnum.UNBLOCKED_FINANCIAL.getCode());
		model.put("ifs", ifs);
		
		commerces = commerceServicesImpl.getCommerces(StatusEnum.UNBLOCKED_COMMERCE.getCode());
		model.put("commerces", commerces);
		
		roles = roleServicesImpl.getRoles(false);
		model.put("roles", roles);
		
		//IF por defecto al crear usuario
		UserDTO userDTO = new UserDTO();
		userDTO.setTypeSelected(RoleEnum.ROLE_USER_IF.getId().intValue());
		
		ModelAndView forward= new ModelAndView("role/admin/user/addUser", model);
		forward.addObject("newUser", userDTO);
		return forward;
    }
    
    @RequestMapping(value = "admin/saveUser", method = RequestMethod.POST)
    public ModelAndView save(@ModelAttribute("newUser") UserDTO user, BindingResult result, SessionStatus status) {
		log.info("user:saveUser");
		Map<String, Object> model = new HashMap<String, Object>();
		ModelAndView forward;
		OperationResult resultado;
		String mensaje = "";
		int codigo = -1;
		
		validator.validateAdd(user, result);
		if(!result.hasErrors()){

			if(user.getTypeSelected() == RoleEnum.ROLE_USER_IF.getId().intValue()){
				user.setCommerces(null);
			}else{
				user.setFis(null);
			}
				
			user.setRut(StringUtils.getDBRut(user.getRut()));
			user.setPhone(user.getPhone());

			resultado = userServicesImpl.addUser(user);
			
			if(resultado.getResult() == OperationResult.SUCCESS){
				mensaje=msgSrc.getMessage("admin.user.add.exito", null, null);
				codigo=MensajesResultado.EXITO.getCodigo();
			}else{
				mensaje=msgSrc.getMessage("admin.user.add.fracaso", null, null);
				codigo=MensajesResultado.FRACASO.getCodigo();
			}
			
			List<UserDTO> users = userServicesImpl.getUsers();
			model.put("users", users);
			
			forward = new ModelAndView("role/admin/user/allUsers", model);
			forward.addObject("codMsg", codigo);
			forward.addObject("msg", mensaje);
		}else{
			model.put("ifs", ifs);
			model.put("commerces", commerces);
			model.put("roles", roles);
			model.put("typeSelected", user.getTypeSelected());
			forward = new ModelAndView("role/admin/user/addUser", model);
			forward.addObject("newUser", user);
		}
		forward.addObject("errors", result.getAllErrors());
		return forward;
    }
    
    @RequestMapping(value = "admin/editarUsuario", method = RequestMethod.GET)
    public ModelAndView editarUsuario(Long id) {
		log.info("user:editarUsuario");
		log.info("user:Long "+id);
		Map<String, Object> model = new HashMap<String, Object>();
		ModelAndView forward;

		UserDTO usuario = userServicesImpl.getUser(id);
		if(usuario!=null){
			usuario.setEmail2(usuario.getEmail());
			forward = new ModelAndView("role/admin/user/editUser", model);
			forward.addObject("newUser", usuario);
		}else{
			String mensaje=msgSrc.getMessage("usuario.noexiste", null, null);
			int codigo=MensajesResultado.FRACASO.getCodigo();
			List<UserDTO> users = userServicesImpl.getUsers();
			model.put("users", users);
			forward = new ModelAndView("role/admin/user/allUsers", model);
			forward.addObject("codMsg", codigo);
			forward.addObject("msg", mensaje);
		}
		return forward;
    }
    
    @RequestMapping(value = "admin/saveEditUser", method = RequestMethod.POST)
    public ModelAndView saveEditUser(@ModelAttribute("newUser") UserDTO user, BindingResult result, SessionStatus status) {
		log.info("user:saveUser");
		Map<String, Object> model = new HashMap<String, Object>();
		ModelAndView forward;
		
		OperationResult resultado;
		String mensaje = "";
		int codigo = -1;
		
		validator.validateEdit(user, result);
		if(!result.hasErrors()){
			
			resultado = userServicesImpl.editUser(user);
			
			if(resultado.getResult() == OperationResult.SUCCESS){
				mensaje=msgSrc.getMessage("admin.user.edit.exito", null, null);
				codigo=MensajesResultado.EXITO.getCodigo();
			}else{
				mensaje=msgSrc.getMessage("admin.user.edit.fracaso", null, null);
				codigo=MensajesResultado.FRACASO.getCodigo();
			}
			
			List<UserDTO> users = userServicesImpl.getUsers();
			model.put("users", users);
			
			forward = new ModelAndView("role/admin/user/allUsers", model);
			forward.addObject("codMsg", codigo);
			forward.addObject("msg", mensaje);
		}else{
			forward = new ModelAndView("role/admin/user/editUser", model);
		}
		forward.addObject("errors", result.getAllErrors());
		return forward;
    }
    
    
    @RequestMapping(value = "admin/resetPassword", method = RequestMethod.GET)
    public ModelAndView resetPassword(Long id) {
		log.info("user:resetPassword");
		log.info("user:Long "+id);
		Map<String, Object> model = new HashMap<String, Object>();
		ModelAndView forward;
		String mensaje;
		OperationResult result;
		int codigo;
		
		try {
			result = userServicesImpl.resetPassword(id);
			if(result.getResult()==OperationResult.SUCCESS){
				mensaje=msgSrc.getMessage("reset.password.exito", null, null);
				codigo=MensajesResultado.EXITO.getCodigo();
			}else{
				mensaje=msgSrc.getMessage("reset.password.fracaso", null, null);
				codigo=MensajesResultado.FRACASO.getCodigo();
			}
			
			List<UserDTO> users = userServicesImpl.getUsers();
			model.put("users", users);
			
		} catch (Exception e) {
			mensaje=msgSrc.getMessage("reset.password.fracaso", null, null);
			codigo=MensajesResultado.FRACASO.getCodigo();
			log.error("Error al resetear password");
			log.error(e);
		}
		
		forward = new ModelAndView("role/admin/user/allUsers", model);
		forward.addObject("codMsg", codigo);
		forward.addObject("msg", mensaje);
		return forward;
    }
    
    @RequestMapping(value = "admin/lockUnlockUser", method = RequestMethod.POST)
    public ModelAndView lockUnluckUser(@RequestParam("id") Long id, @RequestParam("modo")String modo) {
		log.info("user:lockUnlockUser");
		log.info("user:Long "+id);
		log.info("user:Modo "+modo);
		Map<String, Object> model = new HashMap<String, Object>();
		ModelAndView forward;
		OperationResult resultado = null;
		String mensaje = "";
		int codigo = -1;
		
		try {
			
			if("U".equalsIgnoreCase(modo)){
				resultado=userServicesImpl.updateStatus(id, StatusEnum.UNBLOCKED_USER.getCode());	
				userServicesImpl.updateAttempts(id, UserDTO.MAX_ATTEMPTS);
			}else{
				if("L".equalsIgnoreCase(modo)){
					resultado=userServicesImpl.updateStatus(id, StatusEnum.BLOCKED_USER.getCode());
					userServicesImpl.updateAttempts(id, 0);
				}
			}
			
			if(resultado!=null){
				if(resultado.getResult() == OperationResult.SUCCESS){
					mensaje=msgSrc.getMessage("admin.user.estado.exito", null, null);
					codigo=MensajesResultado.EXITO.getCodigo();
				}else{
					mensaje=msgSrc.getMessage("admin.user.estado.fracaso", null, null);
					codigo=MensajesResultado.EXITO.getCodigo();
				}
			}
			
			List<UserDTO> users = userServicesImpl.getUsers();
			model.put("users", users);
		} catch (Exception e) {
			log.error("Error al bloquear/desbloquear usuario",e);
			mensaje=msgSrc.getMessage("admin.user.estado.fracaso", null, null);
			codigo=MensajesResultado.EXITO.getCodigo();
		}
		
		forward = new ModelAndView("role/admin/user/allUsers", model);
		forward.addObject("codMsg", codigo);
		forward.addObject("msg", mensaje);
		return forward;
    }
    
   

}
