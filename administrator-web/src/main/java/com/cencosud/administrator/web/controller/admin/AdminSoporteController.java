/**
 * 
 */
package com.cencosud.administrator.web.controller.admin;

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

import com.cencosud.administrator.core.ContratanteServices;
import com.cencosud.administrator.core.SoporteServices;
import com.cencosud.administrator.dto.users.ContratanteDTO;
import com.cencosud.administrator.dto.users.SoporteDTO;
import com.cencosud.administrator.utils.OperationResult;
import com.cencosud.administrator.web.controller.base.BaseController;
import com.cencosud.administrator.web.controller.enums.MensajesResultado;
import com.cencosud.administrator.web.validator.AdminSoporteValidator;

/**
 * @author EA7129
 *
 */
@Controller
public class AdminSoporteController extends BaseController {
	
	
	private static Logger log = Logger.getLogger(AdminSoporteController.class);

    @Autowired
    private MessageSource msgSrc;  
    @Autowired
    private AdminSoporteValidator validator;
    
    
    @Autowired
   	private ContratanteServices contratanteServicesImpl;
    @Autowired
   	private SoporteServices soporteServicesImpl;
    
    
    
   
    private List<ContratanteDTO> contratantes;
    
    @RequestMapping(value = "admin/allSoportes", method = RequestMethod.GET)
   	public ModelAndView allSoporte() {
   		log.info("Tienda:allSoportes");
   		List<SoporteDTO> soportes = soporteServicesImpl.getSoportes(null);
   		Map<String, Object> model = new HashMap<String, Object>();
   		model.put("soportes", soportes);
   		return new ModelAndView("role/admin/soporte/allSoportes", model);
   	}
    
    @RequestMapping(value = "admin/addSoporte", method = RequestMethod.GET)
	public ModelAndView addContratante() {
		log.info("Soporte:addSoporte");
		Map<String, Object> model = new HashMap<String, Object>();

	
		contratantes = contratanteServicesImpl.getContratantes(null);
		model.put("contratantes", contratantes);
		
		ModelAndView forward = new ModelAndView(
				"role/admin/soporte/addSoporte", model);
		forward.addObject("newSoporte", new SoporteDTO());
		return forward;
	}
	
	@RequestMapping(value = "admin/saveSoporte", method = RequestMethod.POST)
	public ModelAndView saveSoporte(
			@ModelAttribute("newSoporte") SoporteDTO soporte,
			BindingResult result, SessionStatus status) {
		log.info("Contratante:saveSoporte");
		Map<String, Object> model = new HashMap<String, Object>();
		ModelAndView forward;
		OperationResult resultado = null;
		String mensaje = "";
		int codigo = -1;

		validator.validateAdd(soporte, result);
		if (!result.hasErrors()) {

			try {
				
			
				resultado = soporteServicesImpl.addSoporte(soporte);
				
			} catch (Exception e) {
				resultado = null;
				log.info("tienda:saveContratante", e);
			}

			if (resultado != null) {
				if (resultado.getResult() == OperationResult.SUCCESS) {
					mensaje = msgSrc.getMessage("admin.soporte.add.exito",
							null, null);
					codigo = MensajesResultado.EXITO.getCodigo();
				} else {
					mensaje = msgSrc.getMessage("admin.soporte.add.fracaso",
							null, null);
					codigo = MensajesResultado.FRACASO.getCodigo();
				}

				List<SoporteDTO> soportes = soporteServicesImpl.getSoportes(null);
				model.put("soportes", soportes);
				forward = new ModelAndView("role/admin/soporte/allSoportes",
						model);

			} else {
				mensaje = msgSrc.getMessage("admin.soporte.add.fracaso", null,
						null);
				codigo = MensajesResultado.FRACASO.getCodigo();
				forward = new ModelAndView("role/admin/soporte/addSoporte",
						model);
			}

			forward.addObject("codMsg", codigo);
			forward.addObject("msg", mensaje);
		} else {
			contratantes = contratanteServicesImpl.getContratantes(null);
			model.put("contratantes", contratantes);
			
			forward = new ModelAndView("role/admin/soporte/addSoporte", model);
		}
		forward.addObject("errors", result.getAllErrors());
		return forward;
	}
	
	@RequestMapping(value = "admin/editSoporte", method = RequestMethod.GET)
	public ModelAndView editContratante(Long id) {
		log.info("Padrino:editSoporte");
		Map<String, Object> model = new HashMap<String, Object>();
		ModelAndView forward;

		SoporteDTO soporte = soporteServicesImpl.getSoportesId(id);

		if (soporte != null) {
			
			contratantes = contratanteServicesImpl.getContratantes(null);
			model.put("contratantes", contratantes);
			

			forward = new ModelAndView("role/admin/soporte/editSoporte",
					model);
			forward.addObject("editSoporte", soporte);
		} else {
			String mensaje = msgSrc.getMessage("soporte.noexiste", null, null);
			int codigo = MensajesResultado.FRACASO.getCodigo();
			List<ContratanteDTO> contratantes = contratanteServicesImpl.getContratantes(null);
			model.put("contratantes", contratantes);
			forward = new ModelAndView("role/admin/soporte/allSoportes", model);
			forward.addObject("codMsg", codigo);
			forward.addObject("msg", mensaje);
		}
		return forward;
	}

	@RequestMapping(value = "admin/saveEditSoporte", method = RequestMethod.POST)
	public ModelAndView saveEditContratante(
			@ModelAttribute("editSoporte") SoporteDTO soporte,
			BindingResult result, SessionStatus status) {
		log.info("Tienda:saveEditSoporte");
		Map<String, Object> model = new HashMap<String, Object>();
		ModelAndView forward;
		OperationResult resultado;
		String mensaje = "";
		int codigo = -1;

		validator.validateEdit(soporte, result);
		if (!result.hasErrors()) {
			resultado = soporteServicesImpl.editSoporte(soporte);

			if (resultado.getResult() == OperationResult.SUCCESS) {
				mensaje = msgSrc.getMessage("admin.soporte.edit.exito", null,
						null);
				codigo = MensajesResultado.EXITO.getCodigo();
			} else {
				mensaje = msgSrc.getMessage("admin.soporte.edit.fracaso",
						null, null);
				codigo = MensajesResultado.FRACASO.getCodigo();
			}

			List<SoporteDTO> soportes = soporteServicesImpl.getSoportes(null);
			model.put("soportes", soportes);
			forward = new ModelAndView("role/admin/soporte/allSoportes", model);
			forward.addObject("codMsg", codigo);
			forward.addObject("msg", mensaje);
		} else {
			
			contratantes = contratanteServicesImpl.getContratantes(null);
			model.put("contratantes", contratantes);
			
			forward = new ModelAndView("role/admin/soporte/editSoporte",
					model);
		}
		forward.addObject("errors", result.getAllErrors());
		return forward;
	}
	
	@RequestMapping(value = "admin/lockUnlockSoporte", method = RequestMethod.POST)
	public ModelAndView lockUnluckTienda(@RequestParam("id") Long id,
			@RequestParam("modo") String modo) {
		log.info("Contratante:lockUnlockSoporte");
		log.info("Contratante:Long " + id);
		log.info("Contratante:Modo " + modo);
		Map<String, Object> model = new HashMap<String, Object>();
		ModelAndView forward;
		OperationResult resultado = null;
		String mensaje = "";
		int codigo = -1;

		try {

			if ("U".equalsIgnoreCase(modo)) {
				resultado = soporteServicesImpl.deleteSoporte(id);
			} else {
				if ("L".equalsIgnoreCase(modo)) {
					resultado = soporteServicesImpl.deleteSoporte(id);
				}
			}

			if (resultado != null) {
				if (resultado.getResult() == OperationResult.SUCCESS) {
					mensaje = msgSrc.getMessage("admin.soporte.del.exito",
							null, null);
					codigo = MensajesResultado.EXITO.getCodigo();
				} else {
					mensaje = msgSrc.getMessage(
							"admin.soporte.del.fracaso", null, null);
					codigo = MensajesResultado.EXITO.getCodigo();
				}
			}

			List<SoporteDTO> soportes = soporteServicesImpl.getSoportes(null);
			model.put("soportes", soportes);

		} catch (Exception e) {
			log.error("Error al bloquear/desbloquear Contratante", e);
			mensaje = msgSrc.getMessage("admin.soporte.del.fracaso", null, null);
			codigo = MensajesResultado.EXITO.getCodigo();
		}

		forward = new ModelAndView("role/admin/soporte/allSoportes", model);
		forward.addObject("codMsg", codigo);
		forward.addObject("msg", mensaje);
		return forward;
	}

}
