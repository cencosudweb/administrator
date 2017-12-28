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

import com.cencosud.administrator.core.PadrinoServices;
import com.cencosud.administrator.core.TiendaServices;
import com.cencosud.administrator.dto.users.PadrinoDTO;
import com.cencosud.administrator.dto.users.TiendaDTO;
import com.cencosud.administrator.utils.OperationResult;
import com.cencosud.administrator.web.controller.base.BaseController;
import com.cencosud.administrator.web.controller.enums.MensajesResultado;
import com.cencosud.administrator.web.validator.AdminPadrinoValidator;

/**
 * @author EA7129
 *
 */
@Controller
public class AdminPadrinoController extends BaseController {
	
	
	private static Logger log = Logger.getLogger(AdminPadrinoController.class);

    @Autowired
    private MessageSource msgSrc;  
    //@Autowired
	//private UserServices userServicesImpl;
    //@Autowired
	//private FinancialInstitutionServices financialInstitutionServicesImpl;
    //@Autowired
	//private CommerceServices commerceServicesImpl;
    @Autowired
    private AdminPadrinoValidator validator;
    //@Autowired
	//private RoleServices roleServicesImpl;
    
    //private List<FinancialInstitutionDTO> ifs;
    //private List<CommerceDTO> commerces;
    //private List<RoleDTO> roles;
    
    @Autowired
   	private TiendaServices tiendaServicesImpl;
    @Autowired
   	private PadrinoServices padrinoServicesImpl;
    
    
    
    private List<TiendaDTO> tiendas;
    
    @RequestMapping(value = "admin/allPadrinos", method = RequestMethod.GET)
   	public ModelAndView allPadrino() {
   		log.info("Tienda:allPadrinos");
   		List<PadrinoDTO> padrinos = padrinoServicesImpl.getPadrinos(null);
   		Map<String, Object> model = new HashMap<String, Object>();
   		model.put("padrinos", padrinos);
   		return new ModelAndView("role/admin/padrino/allPadrinos", model);
   	}
    
    @RequestMapping(value = "admin/addPadrino", method = RequestMethod.GET)
	public ModelAndView addPadrino() {
		log.info("Padrino:addPadrino");
		Map<String, Object> model = new HashMap<String, Object>();

	
		tiendas = tiendaServicesImpl.getTiendas();
		model.put("tiendas", tiendas);
		
		ModelAndView forward = new ModelAndView(
				"role/admin/padrino/addPadrino", model);
		forward.addObject("newPadrino", new PadrinoDTO());
		return forward;
	}
	
	@RequestMapping(value = "admin/savePadrino", method = RequestMethod.POST)
	public ModelAndView savePadrino(
			@ModelAttribute("newPadrino") PadrinoDTO padrino,
			BindingResult result, SessionStatus status) {
		log.info("Tienda:savePadrino");
		Map<String, Object> model = new HashMap<String, Object>();
		ModelAndView forward;
		OperationResult resultado = null;
		String mensaje = "";
		int codigo = -1;

		validator.validateAdd(padrino, result);
		if (!result.hasErrors()) {

			try {
				
			
				resultado = padrinoServicesImpl.addPadrino(padrino);
				
			} catch (Exception e) {
				resultado = null;
				log.info("tienda:savePadrino", e);
			}

			if (resultado != null) {
				if (resultado.getResult() == OperationResult.SUCCESS) {
					mensaje = msgSrc.getMessage("admin.padrino.add.exito",
							null, null);
					codigo = MensajesResultado.EXITO.getCodigo();
				} else {
					mensaje = msgSrc.getMessage("admin.padrino.add.fracaso",
							null, null);
					codigo = MensajesResultado.FRACASO.getCodigo();
				}

				List<PadrinoDTO> padrinos = padrinoServicesImpl.getPadrinos(null);
				model.put("padrinos", padrinos);
				forward = new ModelAndView("role/admin/padrino/allPadrinos",
						model);

			} else {
				mensaje = msgSrc.getMessage("admin.padrino.add.fracaso", null,
						null);
				codigo = MensajesResultado.FRACASO.getCodigo();
				forward = new ModelAndView("role/admin/padrino/addPadrino",
						model);
			}

			forward.addObject("codMsg", codigo);
			forward.addObject("msg", mensaje);
		} else {
			tiendas = tiendaServicesImpl.getTiendas();
			model.put("tiendas", tiendas);
			
			forward = new ModelAndView("role/admin/padrino/addPadrino", model);
		}
		forward.addObject("errors", result.getAllErrors());
		return forward;
	}
	
	@RequestMapping(value = "admin/editPadrino", method = RequestMethod.GET)
	public ModelAndView editPadrino(Long id) {
		log.info("Padrino:editPadrino");
		Map<String, Object> model = new HashMap<String, Object>();
		ModelAndView forward;

		PadrinoDTO padrino = padrinoServicesImpl.getPadrinosId(id);

		if (padrino != null) {
			
			tiendas = tiendaServicesImpl.getTiendas();
			model.put("tiendas", tiendas);
			

			forward = new ModelAndView("role/admin/padrino/editPadrino",
					model);
			forward.addObject("editPadrino", padrino);
		} else {
			String mensaje = msgSrc.getMessage("padrino.noexiste", null, null);
			int codigo = MensajesResultado.FRACASO.getCodigo();
			List<PadrinoDTO> padrinos = padrinoServicesImpl.getPadrinos(null);
			model.put("padrinos", padrinos);
			forward = new ModelAndView("role/admin/padrino/allPadrinos", model);
			forward.addObject("codMsg", codigo);
			forward.addObject("msg", mensaje);
		}
		return forward;
	}

	@RequestMapping(value = "admin/saveEditPadrino", method = RequestMethod.POST)
	public ModelAndView saveEditPadrino(
			@ModelAttribute("editPadrino") PadrinoDTO padrino,
			BindingResult result, SessionStatus status) {
		log.info("Tienda:saveEditPadrino");
		Map<String, Object> model = new HashMap<String, Object>();
		ModelAndView forward;
		OperationResult resultado;
		String mensaje = "";
		int codigo = -1;

		validator.validateEdit(padrino, result);
		if (!result.hasErrors()) {
			resultado = padrinoServicesImpl.editPadrino(padrino);

			if (resultado.getResult() == OperationResult.SUCCESS) {
				mensaje = msgSrc.getMessage("admin.padrino.edit.exito", null,
						null);
				codigo = MensajesResultado.EXITO.getCodigo();
			} else {
				mensaje = msgSrc.getMessage("admin.padrino.edit.fracaso",
						null, null);
				codigo = MensajesResultado.FRACASO.getCodigo();
			}

			List<PadrinoDTO> padrinos = padrinoServicesImpl.getPadrinos(null);
			model.put("padrinos", padrinos);
			forward = new ModelAndView("role/admin/padrino/allPadrinos", model);
			forward.addObject("codMsg", codigo);
			forward.addObject("msg", mensaje);
		} else {
			
			tiendas = tiendaServicesImpl.getTiendas();
			model.put("tiendas", tiendas);
			
			forward = new ModelAndView("role/admin/padrino/editPadrino",
					model);
		}
		forward.addObject("errors", result.getAllErrors());
		return forward;
	}
	
	@RequestMapping(value = "admin/lockUnlockPadrino", method = RequestMethod.POST)
	public ModelAndView lockUnluckPadrino(@RequestParam("id") Long id,
			@RequestParam("modo") String modo) {
		log.info("Tienda:lockUnlockPadrino");
		log.info("Tienda:Long " + id);
		log.info("Tienda:Modo " + modo);
		Map<String, Object> model = new HashMap<String, Object>();
		ModelAndView forward;
		OperationResult resultado = null;
		String mensaje = "";
		int codigo = -1;

		try {

			if ("U".equalsIgnoreCase(modo)) {
				resultado = padrinoServicesImpl.deletePadrino(id);
			} else {
				if ("L".equalsIgnoreCase(modo)) {
					resultado = padrinoServicesImpl.deletePadrino(id);
				}
			}

			if (resultado != null) {
				if (resultado.getResult() == OperationResult.SUCCESS) {
					mensaje = msgSrc.getMessage("admin.padrino.del.exito",
							null, null);
					codigo = MensajesResultado.EXITO.getCodigo();
				} else {
					mensaje = msgSrc.getMessage(
							"admin.padrino.del.fracaso", null, null);
					codigo = MensajesResultado.EXITO.getCodigo();
				}
			}

			List<PadrinoDTO> padrinos = padrinoServicesImpl.getPadrinos(null);
			model.put("padrinos", padrinos);

		} catch (Exception e) {
			log.error("Error al bloquear/desbloquear Tienda", e);
			mensaje = msgSrc.getMessage("admin.padrino.del.fracaso", null, null);
			codigo = MensajesResultado.EXITO.getCodigo();
		}

		forward = new ModelAndView("role/admin/padrino/allPadrinos", model);
		forward.addObject("codMsg", codigo);
		forward.addObject("msg", mensaje);
		return forward;
	}

}
