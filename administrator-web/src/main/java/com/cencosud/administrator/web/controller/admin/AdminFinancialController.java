
/**
 *@name AdminFinancialController.java
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
import org.springframework.beans.factory.annotation.Qualifier;
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
import com.cencosud.administrator.web.utils.AdminUtils;
import com.cencosud.administrator.web.utils.DateUtils;
import com.cencosud.administrator.web.utils.StringUtils;
import com.cencosud.administrator.web.validator.AdminFinancialValidator;
import com.cencosud.administrator.core.AgreementServices;
import com.cencosud.administrator.core.ChannelServices;
import com.cencosud.administrator.core.CommerceServices;
import com.cencosud.administrator.core.FinancialInstitutionServices;
import com.cencosud.administrator.core.TimeLimitServices;
import com.cencosud.administrator.core.enums.StatusEnum;
import com.cencosud.administrator.dto.users.AgreementDTO;
import com.cencosud.administrator.dto.users.ChannelDTO;
import com.cencosud.administrator.dto.users.CommerceDTO;
import com.cencosud.administrator.dto.users.FinancialInstitutionDTO;
import com.cencosud.administrator.dto.users.TimeLimitDTO;
import com.cencosud.administrator.utils.OperationResult;
/**
 * @description Clase controladora que administra el usuario de la institucion financiera   
 */
@Controller
public class AdminFinancialController  extends BaseController{
	
    private static Logger log = Logger.getLogger(AdminFinancialController.class);

    @Autowired
    private MessageSource msgSrc;  
    @Autowired
	private FinancialInstitutionServices financialInstitutionServicesImpl;
    @Autowired
    @Qualifier ("agreementServices")
    private AgreementServices agreementServices;
    @Autowired
	private CommerceServices commerceServicesImpl;
    @Autowired
	private TimeLimitServices timeLimitServicesImpl;
    @Autowired
	private ChannelServices channelServicesImpl;
    @Autowired
    private AdminFinancialValidator validator;
    
    private FinancialInstitutionDTO currentFinancial;
    
    @RequestMapping(value = "admin/allFinancial", method = RequestMethod.GET)
    public ModelAndView allFinancial() {
		log.info("financial:allFinancial");
		List<FinancialInstitutionDTO> financials = financialInstitutionServicesImpl.getFIs(StatusEnum.ALL_FINANCIAL.getCode());
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("fis", financials);
		return new ModelAndView("role/admin/financial/allFinancial", model);
    }

    @RequestMapping(value = "admin/addFinancial", method = RequestMethod.GET)
    public ModelAndView addFinancial() {
		log.info("financial:addFinancial");
		Map<String, Object> model = new HashMap<String, Object>();
		ModelAndView forward= new ModelAndView("role/admin/financial/addFinancial", model);
		forward.addObject("newFinancial", new FinancialInstitutionDTO());
		return forward;
    }
    
    @RequestMapping(value = "admin/saveFinancial", method = RequestMethod.POST)
    public ModelAndView saveFinancial(@ModelAttribute("newFinancial") FinancialInstitutionDTO financial, BindingResult result, SessionStatus status) {
		log.info("financial:saveFinancial");
		Map<String, Object> model = new HashMap<String, Object>();
		ModelAndView forward;
		OperationResult resultado;
		String mensaje;
		int codigo;
		
		validator.validateAdd(financial, result);
		if(!result.hasErrors()){
			
			financial.setStatus(StatusEnum.UNBLOCKED_FINANCIAL.getCode());
			financial.setActivationDate(new Date());
			financial.setRut(StringUtils.getDBRut(financial.getRut()));
			
			resultado = financialInstitutionServicesImpl.addFI(financial);
			
			if(resultado.getResult()==OperationResult.SUCCESS){
				mensaje=msgSrc.getMessage("admin.financial.add.exito", null, null);
				codigo=MensajesResultado.EXITO.getCodigo();
			}else{
				mensaje=msgSrc.getMessage("admin.financial.add.fracaso", null, null);
				codigo=MensajesResultado.FRACASO.getCodigo();
			}

			List<FinancialInstitutionDTO> financials = financialInstitutionServicesImpl.getFIs(StatusEnum.ALL_FINANCIAL.getCode());
			model.put("fis", financials);
			
			forward = new ModelAndView("role/admin/financial/allFinancial", model);
			forward.addObject("codMsg", codigo);
			forward.addObject("msg", mensaje);
		}else{
			forward = new ModelAndView("role/admin/financial/addFinancial", model);
		}
		forward.addObject("errors", result.getAllErrors());
		return forward;
    }
    
    @RequestMapping(value = "admin/editFinancial", method = RequestMethod.GET)
    public ModelAndView editFinancial(Long id) {
		log.info("financial:editFinancial");
		Map<String, Object> model = new HashMap<String, Object>();
		ModelAndView forward;

		FinancialInstitutionDTO financial = financialInstitutionServicesImpl.getFI(id);
		
		if(financial!=null){
			forward = new ModelAndView("role/admin/financial/editFinancial", model);
			forward.addObject("editFinancial", financial);
		}else{
			String mensaje=msgSrc.getMessage("financial.noexiste", null, null);
			int codigo=MensajesResultado.FRACASO.getCodigo();
			List<FinancialInstitutionDTO> financials = financialInstitutionServicesImpl.getFIs(StatusEnum.ALL_FINANCIAL.getCode());
			model.put("fis", financials);
			forward = new ModelAndView("role/admin/financial/allFinancial", model);
			forward.addObject("codMsg", codigo);
			forward.addObject("msg", mensaje);
		}
		return forward;
    }
    
    @RequestMapping(value = "admin/saveEditFinancial", method = RequestMethod.POST)
    public ModelAndView saveEditFinancial(@ModelAttribute("editFinancial") FinancialInstitutionDTO financial, BindingResult result, SessionStatus status) {
		log.info("financial:saveEditFinancial");
		Map<String, Object> model = new HashMap<String, Object>();
		ModelAndView forward;
		OperationResult resultado;
		String mensaje = "";
		int codigo = -1;
		
		validator.validateEdit(financial, result);
		if(!result.hasErrors()){
			resultado = financialInstitutionServicesImpl.editFI(financial);
			
			if(resultado.getResult() == OperationResult.SUCCESS){
				mensaje=msgSrc.getMessage("admin.financial.edit.exito", null, null);
				codigo=MensajesResultado.EXITO.getCodigo();
			}else{
				mensaje=msgSrc.getMessage("admin.financial.edit.fracaso", null, null);
				codigo=MensajesResultado.FRACASO.getCodigo();
			}
			
			List<FinancialInstitutionDTO> financials = financialInstitutionServicesImpl.getFIs(StatusEnum.ALL_FINANCIAL.getCode());
			model.put("fis", financials);
			forward = new ModelAndView("role/admin/financial/allFinancial", model);
			forward.addObject("codMsg", codigo);
			forward.addObject("msg", mensaje);
		}else{
			forward = new ModelAndView("role/admin/financial/editFinancial", model);
		}
		forward.addObject("errors", result.getAllErrors());
		return forward;
    }
    
    @RequestMapping(value = "admin/lockUnlockFinancial", method = RequestMethod.POST)
    public ModelAndView lockUnlockFinancial(@RequestParam("id") Long id, @RequestParam("modo")String modo) {
		log.info("financial:lockUnlockFinancial");
		log.info("financial:Long "+id);
		log.info("financial:Modo "+modo);
		Map<String, Object> model = new HashMap<String, Object>();
		ModelAndView forward;
		OperationResult resultado = null;
		String mensaje = "";
		int codigo = -1;
		
		try {
			
			if("U".equalsIgnoreCase(modo)){
				resultado = financialInstitutionServicesImpl.updateStatus(id, StatusEnum.UNBLOCKED_FINANCIAL.getCode());	
			}else{
				if("L".equalsIgnoreCase(modo)){
					resultado = financialInstitutionServicesImpl.updateStatus(id, StatusEnum.BLOCKED_FINANCIAL.getCode());
				}
			}
			
			if(resultado!=null){
				if(resultado.getResult() == OperationResult.SUCCESS){
					mensaje=msgSrc.getMessage("admin.financial.estado.exito", null, null);
					codigo=MensajesResultado.EXITO.getCodigo();
				}else{
					mensaje=msgSrc.getMessage("admin.financial.estado.fracaso", null, null);
					codigo=MensajesResultado.EXITO.getCodigo();
				}
			}
			
			List<FinancialInstitutionDTO> financials = financialInstitutionServicesImpl.getFIs(StatusEnum.ALL_FINANCIAL.getCode());
			model.put("fis", financials);
			
		} catch (Exception e) {
			log.error("Error al bloquear/desbloquear usuario",e);
			mensaje=msgSrc.getMessage("admin.financial.estado.fracaso", null, null);
			codigo=MensajesResultado.EXITO.getCodigo();
		}
		
		forward = new ModelAndView("role/admin/financial/allFinancial", model);
		forward.addObject("codMsg", codigo);
		forward.addObject("msg", mensaje);
		return forward;
    }
    
    @RequestMapping(value = "admin/allAgreement", method = RequestMethod.GET)
    public ModelAndView allAgreement(Long id) {
		log.info("financial:allAgreement");
		Map<String, Object> model = new HashMap<String, Object>();
		ModelAndView forward;

		if(id!=null){
			currentFinancial = financialInstitutionServicesImpl.getFI(id);	
		}
		
		if(currentFinancial!=null){
			forward = new ModelAndView("role/admin/financial/allAgreement", model);
			forward.addObject("financial", currentFinancial);
		}else{
			String mensaje=msgSrc.getMessage("financial.noexiste", null, null);
			int codigo=MensajesResultado.FRACASO.getCodigo();
			List<FinancialInstitutionDTO> financials = financialInstitutionServicesImpl.getFIs(StatusEnum.ALL_FINANCIAL.getCode());
			model.put("fis", financials);
			forward = new ModelAndView("role/admin/financial/allFinancial", model);
			forward.addObject("codMsg", codigo);
			forward.addObject("msg", mensaje);
		}
		return forward;
    }
    
    @RequestMapping(value = "admin/lockUnlockAgreement", method = RequestMethod.POST)
    public ModelAndView lockUnlockAgreement(@RequestParam("idAgreement") Long idAgreement, @RequestParam("idFinancial") Long idFinancial, @RequestParam("modo")String modo) {
		log.info("financial:lockUnlockAgreement");
		log.info("financial:idAgreement "+idAgreement);
		log.info("financial:idFinancial "+idFinancial);
		log.info("financial:Modo "+modo);
		Map<String, Object> model = new HashMap<String, Object>();
		ModelAndView forward = null;
		OperationResult resultado = null;
		String mensaje = "";
		int codigo = -1;
		
		try {
			
			if("U".equalsIgnoreCase(modo)){
				resultado = agreementServices.updateStatus(idAgreement, StatusEnum.UNBLOCKED_AGREEMENT.getCode());	
			}else{
				if("L".equalsIgnoreCase(modo)){
					resultado = agreementServices.updateStatus(idAgreement, StatusEnum.BLOCKED_AGREEMENT.getCode());
				}
			}
			
			if(resultado!=null){
				if(resultado.getResult() == OperationResult.SUCCESS){
					mensaje=msgSrc.getMessage("admin.financial.agreement.estado.exito", null, null);
					codigo=MensajesResultado.EXITO.getCodigo();
				}else{
					mensaje=msgSrc.getMessage("admin.financial.agreement.estado.fracaso", null, null);
					codigo=MensajesResultado.EXITO.getCodigo();
				}
			}
			
			FinancialInstitutionDTO financial = financialInstitutionServicesImpl.getFI(idFinancial);
			
			if(financial!=null){
				forward = new ModelAndView("role/admin/financial/allAgreement", model);
				forward.addObject("financial", financial);
			}else{
				//Si por algun motivo no se puede recuperar el financial se retorna a allFinancial con un mensaje
				mensaje=msgSrc.getMessage("financial.noexiste", null, null);
				codigo=MensajesResultado.FRACASO.getCodigo();
				List<FinancialInstitutionDTO> financials = financialInstitutionServicesImpl.getFIs(StatusEnum.ALL_FINANCIAL.getCode());
				model.put("fis", financials);
				forward = new ModelAndView("role/admin/financial/allFinancial", model);
			}
			
		} catch (Exception e) {
			log.error("Error al bloquear/desbloquear financial",e);
			mensaje=msgSrc.getMessage("admin.financial.estado.fracaso", null, null);
			codigo=MensajesResultado.EXITO.getCodigo();
		}
		
		forward.addObject("codMsg", codigo);
		forward.addObject("msg", mensaje);
		return forward;
    }
    
    @RequestMapping(value = "admin/addAgreement", method = RequestMethod.GET)
    public ModelAndView addAgreement() {
    	if(currentFinancial!=null){
    		log.info("financial:addAgreement "+currentFinancial.getId());	
    	}else{
    		log.info("financial:addAgreement "+currentFinancial);
    	}
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		List<CommerceDTO> commerces = commerceServicesImpl.getCommerces(StatusEnum.UNBLOCKED_COMMERCE.getCode());
		List<TimeLimitDTO> plazos = timeLimitServicesImpl.getTimesLimit();
		List<ChannelDTO> canales = channelServicesImpl.getChannels(); 
		
		ModelAndView forward= new ModelAndView("role/admin/financial/addAgreement", model);
		forward.addObject("newAgreement", new AgreementDTO());
		forward.addObject("financial", currentFinancial);
		forward.addObject("commerces", commerces);
		forward.addObject("plazos", plazos);
		forward.addObject("canales", canales);
		return forward;
    }
    
    @RequestMapping(value = "admin/saveAddAgreement", method = RequestMethod.POST)
    public ModelAndView saveAddAgreement(@ModelAttribute("newAgreement") AgreementDTO agreement, BindingResult result, SessionStatus status) {
		log.info("financial:newAgreement");
		Map<String, Object> model = new HashMap<String, Object>();
		ModelAndView forward;
		OperationResult resultado = null;
		String mensaje = "";
		int codigo = -1;
		
		validator.validateAddAgreement(agreement, result);
		if(!result.hasErrors()){
			
			boolean existeConvenio = agreementServices.validateAgreementExist(currentFinancial.getId(), agreement.getCommerceId());
			
			if(existeConvenio){
				currentFinancial = financialInstitutionServicesImpl.getFI(currentFinancial.getId());
				forward = new ModelAndView("role/admin/financial/allAgreement", model);
				forward.addObject("financial", currentFinancial);
				mensaje=msgSrc.getMessage("admin.financial.agreement.add.existe", null, null);
				codigo=MensajesResultado.FRACASO.getCodigo();
			}else{
				//Limpiar Urls
				agreement.setUrls(AdminUtils.cleanUrls(agreement.getUrls()));
				
				Date fechaInicio = DateUtils.obtenerFecha(agreement.getInitDateText(), "dd/MM/yyyy");
				Date fechaFin = DateUtils.obtenerFecha(agreement.getEndDateText(), "dd/MM/yyyy");
				agreement.setInitDate(fechaInicio);
				agreement.setEndDate(fechaFin);
				agreement.setStatus(StatusEnum.UNBLOCKED_AGREEMENT.getCode());
			
				resultado = agreementServices.addAgreement(agreement,currentFinancial.getId(), agreement.getCommerceId());
				
				if(resultado.getResult() == OperationResult.SUCCESS){
					mensaje=msgSrc.getMessage("admin.financial.agreement.add.exito", null, null);
					codigo=MensajesResultado.EXITO.getCodigo();
				}else{
					mensaje=msgSrc.getMessage("admin.financial.agreement.add.fracaso", null, null);
					codigo=MensajesResultado.FRACASO.getCodigo();
				}
				
				if(currentFinancial!=null){
					currentFinancial = financialInstitutionServicesImpl.getFI(currentFinancial.getId());
					
					forward = new ModelAndView("role/admin/financial/allAgreement", model);
					forward.addObject("financial", currentFinancial);
				}else{
					mensaje=msgSrc.getMessage("financial.noexiste", null, null);
					codigo=MensajesResultado.FRACASO.getCodigo();
					List<FinancialInstitutionDTO> financials = financialInstitutionServicesImpl.getFIs(StatusEnum.ALL_FINANCIAL.getCode());
					model.put("fis", financials);
					forward = new ModelAndView("role/admin/financial/allFinancial", model);
					forward.addObject("codMsg", codigo);
					forward.addObject("msg", mensaje);
				}
			}
			
			forward.addObject("codMsg", codigo);
			forward.addObject("msg", mensaje);
		}else{
			List<CommerceDTO> commerces = commerceServicesImpl.getCommerces(StatusEnum.UNBLOCKED_COMMERCE.getCode());
			List<TimeLimitDTO> plazos = timeLimitServicesImpl.getTimesLimit();
			List<ChannelDTO> canales = channelServicesImpl.getChannels(); 
			forward = new ModelAndView("role/admin/financial/addAgreement", model);
			forward.addObject("financial", currentFinancial);
			forward.addObject("commerces", commerces);
			forward.addObject("plazos", plazos);
			forward.addObject("canales", canales);
		}
		forward.addObject("errors", result.getAllErrors());
		return forward;
    }
    
    @RequestMapping(value = "admin/editAgreement", method = RequestMethod.GET)
    public ModelAndView editAgreement(Long id, Long ifId) {
		log.info("financial:editAgreement");
		Map<String, Object> model = new HashMap<String, Object>();
		ModelAndView forward;

		AgreementDTO agreement = agreementServices.getAgreement(id);
		
		if(agreement!=null){
			forward = new ModelAndView("role/admin/financial/editAgreement", model);
			
			agreement.setIfId(ifId);
			
			List<TimeLimitDTO> plazos = timeLimitServicesImpl.getTimesLimit();
			List<ChannelDTO> canales = channelServicesImpl.getChannels(); 
			
//			forward.addObject("commerces", commerces);
			forward.addObject("plazos", plazos);
			forward.addObject("canales", canales);
			
			forward.addObject("editAgreement", agreement);
		}else{
			String mensaje=msgSrc.getMessage("agreement.noexiste", null, null);
			int codigo=MensajesResultado.FRACASO.getCodigo();
			
			forward = new ModelAndView("role/admin/financial/allAgreement", model);
			forward.addObject("financial", currentFinancial);
			forward.addObject("codMsg", codigo);
			forward.addObject("msg", mensaje);
		}
		return forward;
    }

	@RequestMapping(value = "admin/saveEditAgreement", method = RequestMethod.POST)
	public ModelAndView saveEditAgreement(@ModelAttribute("editAgreement") AgreementDTO agreement, BindingResult result, SessionStatus status) {
		log.info("financial:saveEditAgreement");
		Map<String, Object> model = new HashMap<String, Object>();
		ModelAndView forward;
		OperationResult resultado = null;
		String mensaje = "";
		int codigo = -1;
		
		validator.validateEditAgreement(agreement, result);
		
		Date fechaInicio = DateUtils.obtenerFecha(agreement.getInitDateText(), "dd/MM/yyyy");
		Date fechaFin = DateUtils.obtenerFecha(agreement.getEndDateText(), "dd/MM/yyyy");
		agreement.setInitDate(fechaInicio);
		agreement.setEndDate(fechaFin);
		
		if(!result.hasErrors()){
			
			//Limpiar Urls
			agreement.setUrls(AdminUtils.cleanUrls(agreement.getUrls()));
			
			resultado = agreementServices.editAgreement(agreement);
			
			if(resultado.getResult() == OperationResult.SUCCESS){
				mensaje=msgSrc.getMessage("admin.financial.agreement.edit.exito", null, null);
				codigo=MensajesResultado.EXITO.getCodigo();
			}else{
				mensaje=msgSrc.getMessage("admin.financial.agreement.edit.fracaso", null, null);
				codigo=MensajesResultado.FRACASO.getCodigo();
			}
			
			if(agreement.getIfId() != null){
				currentFinancial = financialInstitutionServicesImpl.getFI(agreement.getIfId());
				
				forward = new ModelAndView("role/admin/financial/allAgreement", model);
				forward.addObject("financial", currentFinancial);
			}else{
//				mensaje=msgSrc.getMessage("financial.noexiste", null, null);
//				codigo=MensajesResultado.FRACASO.getCodigo();
				List<FinancialInstitutionDTO> financials = financialInstitutionServicesImpl.getFIs(StatusEnum.UNBLOCKED_FINANCIAL.getCode());
				model.put("fis", financials);
				forward = new ModelAndView("role/admin/financial/allFinancial", model);
//				forward.addObject("codMsg", codigo);
//				forward.addObject("msg", mensaje);
			}
			
			forward.addObject("codMsg", codigo);
			forward.addObject("msg", mensaje);
		}else{
			List<TimeLimitDTO> plazos = timeLimitServicesImpl.getTimesLimit();
			List<ChannelDTO> canales = channelServicesImpl.getChannels(); 
			forward = new ModelAndView("role/admin/financial/editAgreement", model);
			forward.addObject("editAgreement", agreement);
			forward.addObject("plazos", plazos);
			forward.addObject("canales", canales);
			
		}
		forward.addObject("errors", result.getAllErrors());
		return forward;
	}
	
	
}
