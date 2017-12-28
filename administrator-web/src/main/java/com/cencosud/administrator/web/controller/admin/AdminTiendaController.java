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

import com.cencosud.administrator.core.FlagServices;
import com.cencosud.administrator.core.TiendaServices;
import com.cencosud.administrator.dto.users.FlagDTO;
import com.cencosud.administrator.dto.users.TiendaDTO;
import com.cencosud.administrator.utils.OperationResult;
import com.cencosud.administrator.web.controller.base.BaseController;
import com.cencosud.administrator.web.controller.enums.MensajesResultado;
import com.cencosud.administrator.web.validator.AdminTiendaValidator;

/**
 * @author Jose
 *
 */
@Controller
public class AdminTiendaController extends BaseController {
	
	
	private static Logger log = Logger.getLogger(AdminPautaController.class);
	
	//controlador 
    @Autowired
    private MessageSource msgSrc;  
    @Autowired
    private AdminTiendaValidator validator;
    
    
    @Autowired
   	private TiendaServices tiendaServicesImpl;
    
    @Autowired
   	private FlagServices flagServicesImpl;
    
    
    private List<FlagDTO> flags;
    
    
    @RequestMapping(value = "admin/allTiendas", method = RequestMethod.GET)
   	public ModelAndView allTienda() {
    	log.info("Tienda:allTiendas");
   		List<TiendaDTO> tiendas = tiendaServicesImpl.getTiendas();
   		Map<String, Object> model = new HashMap<String, Object>();
   		model.put("tiendas", tiendas);
   		return new ModelAndView("role/admin/tienda/allTiendas", model);
   	}
    
    @RequestMapping(value = "admin/addTienda", method = RequestMethod.GET)
	public ModelAndView addTienda() {
		log.info("Tienda:addTienda");
		Map<String, Object> model = new HashMap<String, Object>();

		List<FlagDTO> flags = flagServicesImpl.getFlags();
		model.put("flags", flags);
		
		ModelAndView forward = new ModelAndView(
				"role/admin/tienda/addTienda", model);
		forward.addObject("newTienda", new TiendaDTO());
		return forward;
	}
	
	@RequestMapping(value = "admin/saveTienda", method = RequestMethod.POST)
	public ModelAndView saveTienda(
			@ModelAttribute("newTienda") TiendaDTO tienda,
			BindingResult result, SessionStatus status) {
		//GuardarTienda
		log.info("Tienda:saveTienda");
		Map<String, Object> model = new HashMap<String, Object>();
		ModelAndView forward;
		OperationResult resultado = null;
		String mensaje = "";
		int codigo = -1;

		validator.validateAdd(tienda, result);
		if (!result.hasErrors()) {

			try {
				resultado = tiendaServicesImpl.addTienda(tienda);
				tienda.setId(null);
			} catch (Exception e) {
				resultado = null;
				log.info("tienda:saveTienda", e);
			}

			if (resultado != null) {
				if (resultado.getResult() == OperationResult.SUCCESS) {
					mensaje = msgSrc.getMessage("admin.tienda.add.exito",
							null, null);
					codigo = MensajesResultado.EXITO.getCodigo();
				} else {
					mensaje = msgSrc.getMessage("admin.tienda.add.fracaso",
							null, null);
					codigo = MensajesResultado.FRACASO.getCodigo();
				}

				List<TiendaDTO> tiendas = tiendaServicesImpl.getTiendas();
				model.put("tiendas", tiendas);
				forward = new ModelAndView("role/admin/tienda/allTiendas",
						model);

			} else {
				mensaje = msgSrc.getMessage("admin.tienda.add.fracaso", null,
						null);
				codigo = MensajesResultado.FRACASO.getCodigo();
				forward = new ModelAndView("role/admin/tienda/addTienda",
						model);
			}

			forward.addObject("codMsg", codigo);
			forward.addObject("msg", mensaje);
		} else {
			flags = flagServicesImpl.getFlags();
			model.put("flags", flags);
			forward = new ModelAndView("role/admin/tienda/addTienda", model);
		}
		forward.addObject("errors", result.getAllErrors());
		return forward;
	}
	
	@RequestMapping(value = "admin/editTienda", method = RequestMethod.GET)
	public ModelAndView editTienda(Long id) {
		log.info("Tienda:editTienda");
		Map<String, Object> model = new HashMap<String, Object>();
		ModelAndView forward;

		TiendaDTO tienda = tiendaServicesImpl.getTiendasId(id);

		if (tienda != null) {
			
			flags = flagServicesImpl.getFlags();
			model.put("flags", flags);

			forward = new ModelAndView("role/admin/tienda/editTienda",
					model);
			forward.addObject("editTienda", tienda);
		} else {
			String mensaje = msgSrc.getMessage("tienda.noexiste", null, null);
			int codigo = MensajesResultado.FRACASO.getCodigo();
			List<TiendaDTO> tiendas = tiendaServicesImpl.getTiendas();
			model.put("tiendas", tiendas);
			forward = new ModelAndView("role/admin/tienda/allTiendas", model);
			forward.addObject("codMsg", codigo);
			forward.addObject("msg", mensaje);
		}
		return forward;
	}

	@RequestMapping(value = "admin/saveEditTienda", method = RequestMethod.POST)
	public ModelAndView saveEditTienda(
			@ModelAttribute("editTienda") TiendaDTO tienda,
			BindingResult result, SessionStatus status) {
		log.info("Tienda:saveEditTienda");
		Map<String, Object> model = new HashMap<String, Object>();
		ModelAndView forward;
		OperationResult resultado;
		String mensaje = "";
		int codigo = -1;
		
		//Comentario de controlar errores

		validator.validateEdit(tienda, result);
		if (!result.hasErrors()) {
			resultado = tiendaServicesImpl.editTienda(tienda);

			if (resultado.getResult() == OperationResult.SUCCESS) {
				mensaje = msgSrc.getMessage("admin.tienda.edit.exito", null,
						null);
				codigo = MensajesResultado.EXITO.getCodigo();
			} else {
				mensaje = msgSrc.getMessage("admin.tienda.edit.fracaso",
						null, null);
				codigo = MensajesResultado.FRACASO.getCodigo();
			}

			List<TiendaDTO> tiendas = tiendaServicesImpl.getTiendas();
			model.put("tiendas", tiendas);
			forward = new ModelAndView("role/admin/tienda/allTiendas", model);
			forward.addObject("codMsg", codigo);
			forward.addObject("msg", mensaje);
		} else {
			
			flags = flagServicesImpl.getFlags();
			model.put("flags", flags);
			
			forward = new ModelAndView("role/admin/tienda/editTienda",
					model);
		}
		forward.addObject("errors", result.getAllErrors());
		return forward;
	}
	
	@RequestMapping(value = "admin/lockUnlockTienda", method = RequestMethod.POST)
	public ModelAndView lockUnluckTienda(@RequestParam("id") Long id,
			@RequestParam("modo") String modo) {
		log.info("Tienda:lockUnlockTienda");
		log.info("Tienda:Long " + id);
		log.info("Tienda:Modo " + modo);
		Map<String, Object> model = new HashMap<String, Object>();
		ModelAndView forward;
		OperationResult resultado = null;
		String mensaje = "";
		int codigo = -1;

		try {

			if ("U".equalsIgnoreCase(modo)) {
				resultado = tiendaServicesImpl.deleteTienda(id);
			} else {
				if ("L".equalsIgnoreCase(modo)) {
					resultado = tiendaServicesImpl.deleteTienda(id);
				}
			}

			if (resultado != null) {
				if (resultado.getResult() == OperationResult.SUCCESS) {
					mensaje = msgSrc.getMessage("admin.tienda.del.exito",
							null, null);
					codigo = MensajesResultado.EXITO.getCodigo();
				} else {
					mensaje = msgSrc.getMessage(
							"admin.tienda.del.fracaso", null, null);
					codigo = MensajesResultado.EXITO.getCodigo();
				}
			}

			List<TiendaDTO> tiendas = tiendaServicesImpl.getTiendas();
			model.put("tiendas", tiendas);

		} catch (Exception e) {
			log.error("Error al bloquear/desbloquear Tienda", e);
			mensaje = msgSrc.getMessage("admin.tienda.del.fracaso", null, null);
			codigo = MensajesResultado.EXITO.getCodigo();
		}

		forward = new ModelAndView("role/admin/tienda/allTiendas", model);
		forward.addObject("codMsg", codigo);
		forward.addObject("msg", mensaje);
		return forward;
	}

}
