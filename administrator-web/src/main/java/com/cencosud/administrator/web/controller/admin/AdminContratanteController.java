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
import com.cencosud.administrator.core.GerenteServices;
import com.cencosud.administrator.dto.users.ContratanteDTO;
import com.cencosud.administrator.dto.users.GerenteDTO;
import com.cencosud.administrator.utils.OperationResult;
import com.cencosud.administrator.web.controller.base.BaseController;
import com.cencosud.administrator.web.controller.enums.MensajesResultado;
import com.cencosud.administrator.web.validator.AdminContratanteValidator;

/**
 * @author EA7129
 *
 */
@Controller
public class AdminContratanteController extends BaseController {
	
	
	private static Logger log = Logger.getLogger(AdminContratanteController.class);

    @Autowired
    private MessageSource msgSrc;  
    //@Autowired
	//private UserServices userServicesImpl;
    //@Autowired
	//private FinancialInstitutionServices financialInstitutionServicesImpl;
    // @Autowired
	//private CommerceServices commerceServicesImpl;
    @Autowired
    private AdminContratanteValidator validator;
   // @Autowired
	//private RoleServices roleServicesImpl;
    
    //private List<FinancialInstitutionDTO> ifs;
    //private List<CommerceDTO> commerces;
    //private List<RoleDTO> roles;
    
   // @Autowired
   	//private PrioridadServices prioridadServicesImpl;
    //@Autowired
   	//private ReportadoServices reportadoServicesImpl;
    //@Autowired
   	//private AreaServices areaServicesImpl;
    //@Autowired
   	//private TiendaServices tiendaServicesImpl;
    //@Autowired
   	//private PadrinoServices padrinoServicesImpl;
    @Autowired
   	private GerenteServices gerenteServicesImpl;
    @Autowired
   	private ContratanteServices contratanteServicesImpl;
    //@Autowired
   	//private SoporteServices soporteServicesImpl;
    //@Autowired
   	//private PautaServices pautaServicesImpl;
    
    
    //@Autowired
	//private EconomicActivityServices economicAtivityServicesImpl;
    
    //private List<PrioridadDTO> prioridades;
    //private List<ReportadoDTO> reportados;
    //private List<AreaDTO> areas;
    //private List<TiendaDTO> tiendas;
    //private List<PadrinoDTO> padrinos;
    private List<GerenteDTO> gerentes;
    //private List<ContratanteDTO> contratantes;
    //private List<SoporteDTO> soportes;
    
    @RequestMapping(value = "admin/allContrapartes", method = RequestMethod.GET)
   	public ModelAndView allContratante() {
   		log.info("Tienda:allContrapartes");
   		List<ContratanteDTO> contrapartes = contratanteServicesImpl.getContratantes(null);
   		Map<String, Object> model = new HashMap<String, Object>();
   		model.put("contrapartes", contrapartes);
   		return new ModelAndView("role/admin/contraparte/allContrapartes", model);
   	}
    
    @RequestMapping(value = "admin/addContraparte", method = RequestMethod.GET)
	public ModelAndView addContratante() {
		log.info("Padrino:addContraparte");
		Map<String, Object> model = new HashMap<String, Object>();

	
		gerentes = gerenteServicesImpl.getGerentes(null);
		model.put("gerentes", gerentes);
		
		ModelAndView forward = new ModelAndView(
				"role/admin/contraparte/addContraparte", model);
		forward.addObject("newContraparte", new ContratanteDTO());
		return forward;
	}
	
	@RequestMapping(value = "admin/saveContraparte", method = RequestMethod.POST)
	public ModelAndView saveContratante(
			@ModelAttribute("newContraparte") ContratanteDTO contratante,
			BindingResult result, SessionStatus status) {
		log.info("Contratante:saveContraparte");
		Map<String, Object> model = new HashMap<String, Object>();
		ModelAndView forward;
		OperationResult resultado = null;
		String mensaje = "";
		int codigo = -1;

		validator.validateAdd(contratante, result);
		if (!result.hasErrors()) {

			try {
				
			
				resultado = contratanteServicesImpl.addContratante(contratante);
				
			} catch (Exception e) {
				resultado = null;
				log.info("tienda:saveContratante", e);
			}

			if (resultado != null) {
				if (resultado.getResult() == OperationResult.SUCCESS) {
					mensaje = msgSrc.getMessage("admin.contratante.add.exito",
							null, null);
					codigo = MensajesResultado.EXITO.getCodigo();
				} else {
					mensaje = msgSrc.getMessage("admin.contratante.add.fracaso",
							null, null);
					codigo = MensajesResultado.FRACASO.getCodigo();
				}

				List<ContratanteDTO> contrapartes = contratanteServicesImpl.getContratantes(null);
				model.put("contrapartes", contrapartes);
				forward = new ModelAndView("role/admin/contraparte/allContrapartes",
						model);

			} else {
				mensaje = msgSrc.getMessage("admin.contratante.add.fracaso", null,
						null);
				codigo = MensajesResultado.FRACASO.getCodigo();
				forward = new ModelAndView("role/admin/contraparte/addContraparte",
						model);
			}

			forward.addObject("codMsg", codigo);
			forward.addObject("msg", mensaje);
		} else {
			gerentes = gerenteServicesImpl.getGerentes(null);
			model.put("gerentes", gerentes);
			
			forward = new ModelAndView("role/admin/contraparte/addContraparte", model);
		}
		forward.addObject("errors", result.getAllErrors());
		return forward;
	}
	
	@RequestMapping(value = "admin/editContraparte", method = RequestMethod.GET)
	public ModelAndView editContratante(Long id) {
		log.info("Padrino:editContratante");
		Map<String, Object> model = new HashMap<String, Object>();
		ModelAndView forward;

		ContratanteDTO contratante = contratanteServicesImpl.getContratantesId(id);

		if (contratante != null) {
			
			gerentes = gerenteServicesImpl.getGerentes(null);
			model.put("gerentes", gerentes);
			

			forward = new ModelAndView("role/admin/contraparte/editContraparte",
					model);
			forward.addObject("editContraparte", contratante);
		} else {
			String mensaje = msgSrc.getMessage("contraparte.noexiste", null, null);
			int codigo = MensajesResultado.FRACASO.getCodigo();
			List<ContratanteDTO> contratantes = contratanteServicesImpl.getContratantes(null);
			model.put("contratantes", contratantes);
			forward = new ModelAndView("role/admin/contraparte/allContrapartes", model);
			forward.addObject("codMsg", codigo);
			forward.addObject("msg", mensaje);
		}
		return forward;
	}

	@RequestMapping(value = "admin/saveEditContraparte", method = RequestMethod.POST)
	public ModelAndView saveEditContratante(
			@ModelAttribute("editContraparte") ContratanteDTO contratante,
			BindingResult result, SessionStatus status) {
		log.info("Tienda:saveEditContratante");
		Map<String, Object> model = new HashMap<String, Object>();
		ModelAndView forward;
		OperationResult resultado;
		String mensaje = "";
		int codigo = -1;

		validator.validateEdit(contratante, result);
		if (!result.hasErrors()) {
			resultado = contratanteServicesImpl.editContratante(contratante);

			if (resultado.getResult() == OperationResult.SUCCESS) {
				mensaje = msgSrc.getMessage("admin.contratante.edit.exito", null,
						null);
				codigo = MensajesResultado.EXITO.getCodigo();
			} else {
				mensaje = msgSrc.getMessage("admin.contratante.edit.fracaso",
						null, null);
				codigo = MensajesResultado.FRACASO.getCodigo();
			}

			List<ContratanteDTO> contrapartes = contratanteServicesImpl.getContratantes(null);
			model.put("contrapartes", contrapartes);
			forward = new ModelAndView("role/admin/contraparte/allContrapartes", model);
			forward.addObject("codMsg", codigo);
			forward.addObject("msg", mensaje);
		} else {
			
			gerentes = gerenteServicesImpl.getGerentes(null);
			model.put("gerentes", gerentes);
			
			forward = new ModelAndView("role/admin/contraparte/editContraparte",
					model);
		}
		forward.addObject("errors", result.getAllErrors());
		return forward;
	}
	
	@RequestMapping(value = "admin/lockUnlockContraparte", method = RequestMethod.POST)
	public ModelAndView lockUnluckContratante(@RequestParam("id") Long id,
			@RequestParam("modo") String modo) {
		log.info("Contratante:lockUnlockContraparte");
		log.info("Contratante:Long " + id);
		log.info("Contratante:Modo " + modo);
		Map<String, Object> model = new HashMap<String, Object>();
		ModelAndView forward;
		OperationResult resultado = null;
		String mensaje = "";
		int codigo = -1;

		try {

			if ("U".equalsIgnoreCase(modo)) {
				resultado = contratanteServicesImpl.deleteContratante(id);
			} else {
				if ("L".equalsIgnoreCase(modo)) {
					resultado = contratanteServicesImpl.deleteContratante(id);
				}
			}

			if (resultado != null) {
				if (resultado.getResult() == OperationResult.SUCCESS) {
					mensaje = msgSrc.getMessage("admin.contratante.del.exito",
							null, null);
					codigo = MensajesResultado.EXITO.getCodigo();
				} else {
					mensaje = msgSrc.getMessage(
							"admin.contratante.del.fracaso", null, null);
					codigo = MensajesResultado.EXITO.getCodigo();
				}
			}

			List<ContratanteDTO> contrapartes = contratanteServicesImpl.getContratantes(null);
			model.put("contrapartes", contrapartes);

		} catch (Exception e) {
			log.error("Error al bloquear/desbloquear Contratante", e);
			mensaje = msgSrc.getMessage("admin.contratante.del.fracaso", null, null);
			codigo = MensajesResultado.EXITO.getCodigo();
		}

		forward = new ModelAndView("role/admin/contraparte/allContrapartes", model);
		forward.addObject("codMsg", codigo);
		forward.addObject("msg", mensaje);
		return forward;
	}

}
