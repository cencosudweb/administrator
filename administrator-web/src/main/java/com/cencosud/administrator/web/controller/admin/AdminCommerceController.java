/**
 *@name AdminCommerceController.java
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

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
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
import com.cencosud.administrator.web.validator.AdminCommerceValidator;
import com.cencosud.administrator.core.CommerceServices;
import com.cencosud.administrator.core.EconomicActivityServices;
import com.cencosud.administrator.core.enums.StatusEnum;
import com.cencosud.administrator.dto.users.CommerceDTO;
import com.cencosud.administrator.dto.users.EconomicActivityDTO;
import com.cencosud.administrator.utils.OperationResult;

/**
 * @description Clase controladora que administra el usuario comercial
 */
@Controller
public class AdminCommerceController extends BaseController {

	private static Logger log = Logger.getLogger(AdminCommerceController.class);

	@Autowired
	private MessageSource msgSrc;
	@Autowired
	private CommerceServices commerceServicesImpl;
	@Autowired
	private EconomicActivityServices economicAtivityServicesImpl;
	@Autowired
	private AdminCommerceValidator validator;

	private List<EconomicActivityDTO> activities;
	
	//@Autowired
	//private UserServices userServicesImpl;

	

	@RequestMapping(value = "admin/allCommerces", method = RequestMethod.GET)
	public ModelAndView allCommerce() {
		log.info("Commerce:allCommerces");
		List<CommerceDTO> commerces = commerceServicesImpl
				.getCommerces(StatusEnum.ALL_COMMERCE.getCode());
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("commerces", commerces);
		return new ModelAndView("role/admin/commerce/allCommerce", model);
	}

	@RequestMapping(value = "admin/addCommerce", method = RequestMethod.GET)
	public ModelAndView addCommerce() {
		log.info("Commerce:addCommerce");
		Map<String, Object> model = new HashMap<String, Object>();

		activities = economicAtivityServicesImpl.getActivities();
		model.put("actividades", activities);

		ModelAndView forward = new ModelAndView(
				"role/admin/commerce/addCommerce", model);
		forward.addObject("newCommerce", new CommerceDTO());
		return forward;
	}

	@RequestMapping(value = "admin/saveCommerce", method = RequestMethod.POST)
	public ModelAndView saveCommerce(
			@ModelAttribute("newCommerce") CommerceDTO commerce,
			BindingResult result, SessionStatus status) {
		log.info("Commerce:saveCommerce");
		Map<String, Object> model = new HashMap<String, Object>();
		ModelAndView forward;
		OperationResult resultado = null;
		String mensaje = "";
		int codigo = -1;

		validator.validateAdd(commerce, result);
		if (!result.hasErrors()) {
			commerce.setStatus(StatusEnum.UNBLOCKED_COMMERCE.getCode());
			commerce.setActivationDate(new Date());
			commerce.setRut(StringUtils.getDBRut(commerce.getRut()));

			try {
				resultado = commerceServicesImpl.addCommerce(commerce);
			} catch (Exception e) {
				resultado = null;
				log.info("Commerce:saveCommerce", e);
			}

			if (resultado != null) {
				if (resultado.getResult() == OperationResult.SUCCESS) {
					mensaje = msgSrc.getMessage("admin.commerce.add.exito",
							null, null);
					codigo = MensajesResultado.EXITO.getCodigo();
				} else {
					mensaje = msgSrc.getMessage("admin.commerce.add.fracaso",
							null, null);
					codigo = MensajesResultado.FRACASO.getCodigo();
				}

				List<CommerceDTO> commerces = commerceServicesImpl
						.getCommerces(StatusEnum.ALL_COMMERCE.getCode());
				model.put("commerces", commerces);
				forward = new ModelAndView("role/admin/commerce/allCommerce",
						model);

			} else {
				mensaje = msgSrc.getMessage("admin.commerce.add.fracaso", null,
						null);
				codigo = MensajesResultado.FRACASO.getCodigo();
				model.put("actividades", activities);
				forward = new ModelAndView("role/admin/commerce/addCommerce",
						model);
			}

			forward.addObject("codMsg", codigo);
			forward.addObject("msg", mensaje);
		} else {
			activities = economicAtivityServicesImpl.getActivities();
			model.put("actividades", activities);
			forward = new ModelAndView("role/admin/commerce/addCommerce", model);
		}
		forward.addObject("errors", result.getAllErrors());
		return forward;
	}

	@RequestMapping(value = "admin/editCommerce", method = RequestMethod.GET)
	public ModelAndView editCommerce(Long id) {
		log.info("Commerce:editCommerce");
		Map<String, Object> model = new HashMap<String, Object>();
		ModelAndView forward;

		CommerceDTO commerce = commerceServicesImpl.getCommerce(id);

		if (commerce != null) {
			activities = economicAtivityServicesImpl.getActivities();
			model.put("actividades", activities);

			forward = new ModelAndView("role/admin/commerce/editCommerce",
					model);
			forward.addObject("editCommerce", commerce);
		} else {
			String mensaje = msgSrc.getMessage("commerce.noexiste", null, null);
			int codigo = MensajesResultado.FRACASO.getCodigo();
			List<CommerceDTO> commerces = commerceServicesImpl
					.getCommerces(StatusEnum.ALL_COMMERCE.getCode());
			model.put("commerces", commerces);
			forward = new ModelAndView("role/admin/commerce/allCommerce", model);
			forward.addObject("codMsg", codigo);
			forward.addObject("msg", mensaje);
		}
		return forward;
	}

	@RequestMapping(value = "admin/saveEditCommerce", method = RequestMethod.POST)
	public ModelAndView saveEditCommerce(
			@ModelAttribute("editCommerce") CommerceDTO commerce,
			BindingResult result, SessionStatus status) {
		log.info("Commerce:saveEditCommerce");
		Map<String, Object> model = new HashMap<String, Object>();
		ModelAndView forward;
		OperationResult resultado;
		String mensaje = "";
		int codigo = -1;

		validator.validateEdit(commerce, result);
		if (!result.hasErrors()) {
			resultado = commerceServicesImpl.editCommerce(commerce);

			if (resultado.getResult() == OperationResult.SUCCESS) {
				mensaje = msgSrc.getMessage("admin.commerce.edit.exito", null,
						null);
				codigo = MensajesResultado.EXITO.getCodigo();
			} else {
				mensaje = msgSrc.getMessage("admin.commerce.edit.fracaso",
						null, null);
				codigo = MensajesResultado.FRACASO.getCodigo();
			}

			List<CommerceDTO> commerces = commerceServicesImpl
					.getCommerces(StatusEnum.ALL_COMMERCE.getCode());
			model.put("commerces", commerces);
			forward = new ModelAndView("role/admin/commerce/allCommerce", model);
			forward.addObject("codMsg", codigo);
			forward.addObject("msg", mensaje);
		} else {
			activities = economicAtivityServicesImpl.getActivities();
			model.put("actividades", activities);
			forward = new ModelAndView("role/admin/commerce/editCommerce",
					model);
		}
		forward.addObject("errors", result.getAllErrors());
		return forward;
	}

	@RequestMapping(value = "admin/lockUnlockCommerce", method = RequestMethod.POST)
	public ModelAndView lockUnluckCommerce(@RequestParam("id") Long id,
			@RequestParam("modo") String modo) {
		log.info("Commerce:lockUnlockCommerce");
		log.info("Commerce:Long " + id);
		log.info("Commerce:Modo " + modo);
		Map<String, Object> model = new HashMap<String, Object>();
		ModelAndView forward;
		OperationResult resultado = null;
		String mensaje = "";
		int codigo = -1;

		try {

			if ("U".equalsIgnoreCase(modo)) {
				resultado = commerceServicesImpl.updateStatus(id,
						StatusEnum.UNBLOCKED_COMMERCE.getCode());
			} else {
				if ("L".equalsIgnoreCase(modo)) {
					resultado = commerceServicesImpl.updateStatus(id,
							StatusEnum.BLOCKED_COMMERCE.getCode());
				}
			}

			if (resultado != null) {
				if (resultado.getResult() == OperationResult.SUCCESS) {
					mensaje = msgSrc.getMessage("admin.commerce.estado.exito",
							null, null);
					codigo = MensajesResultado.EXITO.getCodigo();
				} else {
					mensaje = msgSrc.getMessage(
							"admin.commerce.estado.fracaso", null, null);
					codigo = MensajesResultado.EXITO.getCodigo();
				}
			}

			List<CommerceDTO> commerces = commerceServicesImpl
					.getCommerces(StatusEnum.ALL_COMMERCE.getCode());
			model.put("commerces", commerces);

		} catch (Exception e) {
			log.error("Error al bloquear/desbloquear commerce", e);
			mensaje = msgSrc.getMessage("admin.commerce.estado.fracaso", null,
					null);
			codigo = MensajesResultado.EXITO.getCodigo();
		}

		forward = new ModelAndView("role/admin/commerce/allCommerce", model);
		forward.addObject("codMsg", codigo);
		forward.addObject("msg", mensaje);
		return forward;
	}
	
	

}
