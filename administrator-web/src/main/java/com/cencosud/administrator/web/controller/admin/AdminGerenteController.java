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

//import com.cencosud.administrator.core.AreaServices;
//import com.cencosud.administrator.core.ContratanteServices;
//import com.cencosud.administrator.core.EconomicActivityServices;
import com.cencosud.administrator.core.GerenteServices;
import com.cencosud.administrator.core.PadrinoServices;
//import com.cencosud.administrator.core.PautaServices;
//import com.cencosud.administrator.core.PrioridadServices;
//import com.cencosud.administrator.core.ReportadoServices;
//import com.cencosud.administrator.core.SoporteServices;
//import com.cencosud.administrator.core.TiendaServices;
//import com.cencosud.administrator.dto.users.AreaDTO;
//import com.cencosud.administrator.dto.users.CommerceDTO;
//import com.cencosud.administrator.dto.users.ContratanteDTO;
//import com.cencosud.administrator.dto.users.FinancialInstitutionDTO;
import com.cencosud.administrator.dto.users.GerenteDTO;
import com.cencosud.administrator.dto.users.PadrinoDTO;
//import com.cencosud.administrator.dto.users.PrioridadDTO;
//import com.cencosud.administrator.dto.users.ReportadoDTO;
//import com.cencosud.administrator.dto.users.RoleDTO;
//import com.cencosud.administrator.dto.users.SoporteDTO;
//import com.cencosud.administrator.dto.users.TiendaDTO;
import com.cencosud.administrator.utils.OperationResult;
import com.cencosud.administrator.web.controller.base.BaseController;
import com.cencosud.administrator.web.controller.enums.MensajesResultado;
import com.cencosud.administrator.web.validator.AdminGerenteValidator;

/**
 * @author EA7129
 *
 */
@Controller
public class AdminGerenteController extends BaseController {
	
	
	private static Logger log = Logger.getLogger(AdminGerenteController.class);

    @Autowired
    private MessageSource msgSrc;  
    //@Autowired
	//private UserServices userServicesImpl;
    //@Autowired
	//private FinancialInstitutionServices financialInstitutionServicesImpl;
    //@Autowired
	//private CommerceServices commerceServicesImpl;
    @Autowired
    private AdminGerenteValidator validator;
    //@Autowired
	//private RoleServices roleServicesImpl;
    
    //private List<FinancialInstitutionDTO> ifs;
    //private List<CommerceDTO> commerces;
    //private List<RoleDTO> roles;
    
    //@Autowired
   	//private PrioridadServices prioridadServicesImpl;
    //@Autowired
   	//private ReportadoServices reportadoServicesImpl;
    //@Autowired
   	//private AreaServices areaServicesImpl;
    //@Autowired
   	//private TiendaServices tiendaServicesImpl;
    @Autowired
   	private PadrinoServices padrinoServicesImpl;
    @Autowired
   	private GerenteServices gerenteServicesImpl;
    //@Autowired
   	//private ContratanteServices contratanteServicesImpl;
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
    private List<PadrinoDTO> padrinos;
    //private List<GerenteDTO> gerentes;
    //private List<ContratanteDTO> contratantes;
    //private List<SoporteDTO> soportes;
    
    @RequestMapping(value = "admin/allGerentes", method = RequestMethod.GET)
   	public ModelAndView allGerente() {
   		log.info("Tienda:allGerentes");
   		List<GerenteDTO> gerentes = gerenteServicesImpl.getGerentes(null);
   		Map<String, Object> model = new HashMap<String, Object>();
   		model.put("gerentes", gerentes);
   		return new ModelAndView("role/admin/gerente/allGerentes", model);
   	}
    
    @RequestMapping(value = "admin/addGerente", method = RequestMethod.GET)
	public ModelAndView addGerente() {
		log.info("Padrino:addGerente");
		Map<String, Object> model = new HashMap<String, Object>();

	
		padrinos = padrinoServicesImpl.getPadrinos(null);
		model.put("padrinos", padrinos);
		
		ModelAndView forward = new ModelAndView(
				"role/admin/gerente/addGerente", model);
		forward.addObject("newGerente", new GerenteDTO());
		return forward;
	}
	
	@RequestMapping(value = "admin/saveGerente", method = RequestMethod.POST)
	public ModelAndView saveGerente(
			@ModelAttribute("newGerente") GerenteDTO gerente,
			BindingResult result, SessionStatus status) {
		log.info("Tienda:saveGerente");
		Map<String, Object> model = new HashMap<String, Object>();
		ModelAndView forward;
		OperationResult resultado = null;
		String mensaje = "";
		int codigo = -1;

		validator.validateAdd(gerente, result);
		if (!result.hasErrors()) {

			try {
				
			
				resultado = gerenteServicesImpl.addGerente(gerente);
				
			} catch (Exception e) {
				resultado = null;
				log.info("tienda:saveGerente", e);
			}

			if (resultado != null) {
				if (resultado.getResult() == OperationResult.SUCCESS) {
					mensaje = msgSrc.getMessage("admin.gerente.add.exito",
							null, null);
					codigo = MensajesResultado.EXITO.getCodigo();
				} else {
					mensaje = msgSrc.getMessage("admin.gerente.add.fracaso",
							null, null);
					codigo = MensajesResultado.FRACASO.getCodigo();
				}

				List<GerenteDTO> gerentes = gerenteServicesImpl.getGerentes(null);
				model.put("gerentes", gerentes);
				forward = new ModelAndView("role/admin/gerente/allGerentes",
						model);

			} else {
				mensaje = msgSrc.getMessage("admin.gerente.add.fracaso", null,
						null);
				codigo = MensajesResultado.FRACASO.getCodigo();
				forward = new ModelAndView("role/admin/gerente/addGerente",
						model);
			}

			forward.addObject("codMsg", codigo);
			forward.addObject("msg", mensaje);
		} else {
			padrinos = padrinoServicesImpl.getPadrinos(null);
			model.put("padrinos", padrinos);
			
			forward = new ModelAndView("role/admin/gerente/addGerente", model);
		}
		forward.addObject("errors", result.getAllErrors());
		return forward;
	}
	
	@RequestMapping(value = "admin/editGerente", method = RequestMethod.GET)
	public ModelAndView editGerente(Long id) {
		log.info("Padrino:editGerente");
		Map<String, Object> model = new HashMap<String, Object>();
		ModelAndView forward;

		GerenteDTO gerente = gerenteServicesImpl.getGerentesId(id);

		if (gerente != null) {
			
			padrinos = padrinoServicesImpl.getPadrinos(null);
			model.put("padrinos", padrinos);
			

			forward = new ModelAndView("role/admin/gerente/editGerente",
					model);
			forward.addObject("editGerente", gerente);
		} else {
			String mensaje = msgSrc.getMessage("gerente.noexiste", null, null);
			int codigo = MensajesResultado.FRACASO.getCodigo();
			List<GerenteDTO> gerentes = gerenteServicesImpl.getGerentes(null);
			model.put("gerentes", gerentes);
			forward = new ModelAndView("role/admin/gerente/allGerentes", model);
			forward.addObject("codMsg", codigo);
			forward.addObject("msg", mensaje);
		}
		return forward;
	}

	@RequestMapping(value = "admin/saveEditGerente", method = RequestMethod.POST)
	public ModelAndView saveEditGerente(
			@ModelAttribute("editGerente") GerenteDTO gerente,
			BindingResult result, SessionStatus status) {
		log.info("Tienda:saveEditGerente");
		Map<String, Object> model = new HashMap<String, Object>();
		ModelAndView forward;
		OperationResult resultado;
		String mensaje = "";
		int codigo = -1;

		validator.validateEdit(gerente, result);
		if (!result.hasErrors()) {
			resultado = gerenteServicesImpl.editGerente(gerente);

			if (resultado.getResult() == OperationResult.SUCCESS) {
				mensaje = msgSrc.getMessage("admin.gerente.edit.exito", null,
						null);
				codigo = MensajesResultado.EXITO.getCodigo();
			} else {
				mensaje = msgSrc.getMessage("admin.gerente.edit.fracaso",
						null, null);
				codigo = MensajesResultado.FRACASO.getCodigo();
			}

			List<GerenteDTO> gerentes = gerenteServicesImpl.getGerentes(null);
			model.put("gerentes", gerentes);
			forward = new ModelAndView("role/admin/gerente/allGerentes", model);
			forward.addObject("codMsg", codigo);
			forward.addObject("msg", mensaje);
		} else {
			
			padrinos = padrinoServicesImpl.getPadrinos(null);
			model.put("padrinos", padrinos);
			
			forward = new ModelAndView("role/admin/gerente/editGerente",
					model);
		}
		forward.addObject("errors", result.getAllErrors());
		return forward;
	}
	
	@RequestMapping(value = "admin/lockUnlockGerente", method = RequestMethod.POST)
	public ModelAndView lockUnluckGerente(@RequestParam("id") Long id,
			@RequestParam("modo") String modo) {
		log.info("Gerente:lockUnlockGerente");
		log.info("Gerente:Long " + id);
		log.info("Gerente:Modo " + modo);
		Map<String, Object> model = new HashMap<String, Object>();
		ModelAndView forward;
		OperationResult resultado = null;
		String mensaje = "";
		int codigo = -1;

		try {

			if ("U".equalsIgnoreCase(modo)) {
				resultado = gerenteServicesImpl.deleteGerente(id);
			} else {
				if ("L".equalsIgnoreCase(modo)) {
					resultado = gerenteServicesImpl.deleteGerente(id);
				}
			}

			if (resultado != null) {
				if (resultado.getResult() == OperationResult.SUCCESS) {
					mensaje = msgSrc.getMessage("admin.gerente.del.exito",
							null, null);
					codigo = MensajesResultado.EXITO.getCodigo();
				} else {
					mensaje = msgSrc.getMessage(
							"admin.gerente.del.fracaso", null, null);
					codigo = MensajesResultado.EXITO.getCodigo();
				}
			}

			List<GerenteDTO> gerentes = gerenteServicesImpl.getGerentes(null);
			model.put("gerentes", gerentes);

		} catch (Exception e) {
			log.error("Error al bloquear/desbloquear Tienda", e);
			mensaje = msgSrc.getMessage("admin.gerente.del.fracaso", null, null);
			codigo = MensajesResultado.EXITO.getCodigo();
		}

		forward = new ModelAndView("role/admin/gerente/allGerentes", model);
		forward.addObject("codMsg", codigo);
		forward.addObject("msg", mensaje);
		return forward;
	}

}
