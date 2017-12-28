/**
 *@name AdminCuadraturaInventarioController.java
 * 
 *@version 1.0 
 * 
 *@date 05-04-2017
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

import com.cencosud.administrator.core.CuadraturaOrdenCompraVentaCompServices;
//import com.cencosud.administrator.web.validator.AdminUsersValidator;
//import com.cencosud.administrator.core.CommerceServices;
//import com.cencosud.administrator.core.FinancialInstitutionServices;
import com.cencosud.administrator.core.HorarioVentaEnVerdeActualizacionServices;
//import com.cencosud.administrator.core.RoleServices;
import com.cencosud.administrator.core.TipoEstadoVentaEnVerdeServices;
import com.cencosud.administrator.dto.users.CuadraturaOrdenCompraVentaCompDTO;
//import com.cencosud.administrator.core.UserServices;
import com.cencosud.administrator.dto.users.HorarioVentaEnVerdeActualizacionDTO;
import com.cencosud.administrator.dto.users.TipoEstadoVentaEnVerdeDTO;
import com.cencosud.administrator.dto.users.UserDTO;
import com.cencosud.administrator.web.utils.DateUtils;

/**
 * @description 
 */

@Controller
public class AdminCuadraturaVentaEnVerdeController {
	
	private static Logger log = Logger.getLogger(AdminUserController.class);

    //@Autowired
	//private MessageSource msgSrc;  
	//@Autowired
	//private UserServices userServicesImpl;
	//@Autowired
	//private FinancialInstitutionServices financialInstitutionServicesImpl;
	//@Autowired
	//private CommerceServices commerceServicesImpl;
	//@Autowired
	//private AdminUsersValidator validator;
	//@Autowired
	//private RoleServices roleServicesImpl;
    
    @Autowired
   	private TipoEstadoVentaEnVerdeServices tipoEstadoVentaEnVerdeServicesImpl;
    
    @Autowired
   	private HorarioVentaEnVerdeActualizacionServices horarioVentaEnVerdeActualizacionServicesImpl;
   
    @Autowired
   	private CuadraturaOrdenCompraVentaCompServices cuadraturaOrdenCompraVentaCompServicesImpl;
   
    
    
    
    
    @RequestMapping(value = "admin/reporteCuadraturaVentaEnVerde", method = RequestMethod.GET)
    public ModelAndView reporteCuadraturaEnVerde(String posted, String dateInicio, String dateFin, String estado) {
		log.info("user:reporteCuadraturaVentaEnVerde");
		UserDTO principal = (UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		log.info("user:allUsers Usuario Actual "+principal.getUsername());
		log.info("user:posted="+posted);
		log.info("user:dateInicio="+dateInicio);
		log.info("user:dateFin="+ dateFin);
		log.info("estado="+estado);
		
		//Date dNow = new Date();
		//SimpleDateFormat ft = new SimpleDateFormat ("dd/MM/yyyy");
		//String currentDate = ft.format(dNow);
		
		String starttime = DateUtils.turnDate(dateInicio) != null?DateUtils.turnDate(dateInicio):null;
		String stoptime = DateUtils.turnDate(dateFin) != null?DateUtils.turnDate(dateFin).concat(" 23:59:59"):null;
		String estado1 = estado != null && estado != ""?estado:null;
		log.info("user:starttime="+starttime);
		log.info("user:stoptime="+stoptime);
		log.info("user:estado1="+estado1);
		
		List<TipoEstadoVentaEnVerdeDTO> tipoestadovtavs = tipoEstadoVentaEnVerdeServicesImpl.getTipoEstadoVentaEnVerdes();
		List<HorarioVentaEnVerdeActualizacionDTO> horarios = horarioVentaEnVerdeActualizacionServicesImpl.getHorarioVentaEnVerdeActualizacions(0, 1);
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("posted", posted);//
		model.put("tipoestadovtavs", tipoestadovtavs);//
		model.put("horarios", horarios);//
		return new ModelAndView("role/admin/cuadraturaventaenverde/reporteCuadraturaVentaEnVerde", model);
    }
    
    @RequestMapping(value = "admin/reporteCuadraturaVentaEnVerdePrint", method = RequestMethod.GET)
    public ModelAndView reportePrintCuadraturaVentaEnVerde(String posted, String dateInicio, String dateFin, String estado) {
		log.info("user:reporteCuadraturaEnVerdePrint");
		UserDTO principal = (UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		log.info("user:allUsers Usuario Actual "+principal.getUsername());
		log.info("user:posted="+posted);
		log.info("user:dateInicio="+dateInicio);
		log.info("user:dateFin="+ dateFin);
		log.info("estado="+estado);
		
		//Date dNow = new Date();
		//SimpleDateFormat ft = new SimpleDateFormat ("dd/MM/yyyy");
		//String currentDate = ft.format(dNow);
		
		String starttime = DateUtils.turnDate(dateInicio) != null?DateUtils.turnDate(dateInicio):null;
		String stoptime = DateUtils.turnDate(dateFin) != null?DateUtils.turnDate(dateFin).concat(" 23:59:59"):null;
		String estado1 = estado != null && estado != ""?estado:null;
		log.info("user:starttime="+starttime);
		log.info("user:stoptime="+stoptime);
		log.info("user:estado1="+estado1);
		
		List<TipoEstadoVentaEnVerdeDTO> tipoestadovtavs = tipoEstadoVentaEnVerdeServicesImpl.getTipoEstadoVentaEnVerdes();
		List<HorarioVentaEnVerdeActualizacionDTO> horarios = horarioVentaEnVerdeActualizacionServicesImpl.getHorarioVentaEnVerdeActualizacions(0, 1);
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("posted", posted);
		model.put("tipoestadovtavs", tipoestadovtavs);//
		model.put("horarios", horarios);//
		return new ModelAndView("role/admin/cuadraturaventaenverde/reporteCuadraturaVentaEnVerdePrint", model);
    }
    
    
    @RequestMapping(value = "admin/detalleCuadraturaVentaEnVerdeCantidad", method = RequestMethod.GET)
    public ModelAndView detallePrintCuadraturaVentaEnVerdeCantidad(String fecha) {
		log.info("user:detallePrintCuadraturaVentaEnVerdeCantidad");
		UserDTO principal = (UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		log.info("user:allUsers Usuario Actual "+principal.getUsername());
		log.info("user:fecha="+fecha);
		
		//Date dNow = new Date();
		//SimpleDateFormat ft = new SimpleDateFormat ("dd/MM/yyyy");
		//String currentDate = ft.format(dNow);
		
		
		//List<TipoEstadoVentaEnVerdeDTO> tipoestadovtavs = tipoEstadoVentaEnVerdeServicesImpl.getTipoEstadoVentaEnVerdes();
		List<HorarioVentaEnVerdeActualizacionDTO> horarios = horarioVentaEnVerdeActualizacionServicesImpl.getHorarioVentaEnVerdeActualizacions(0, 1);
		List<CuadraturaOrdenCompraVentaCompDTO> detalles = cuadraturaOrdenCompraVentaCompServicesImpl.getCuadraturaOrdenCompraVentaComps(fecha);
		
		
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("fecha", fecha);//
		model.put("horarios", horarios);//
		model.put("detalles", detalles);//
		return new ModelAndView("role/admin/cuadraturaventaenverde/detalleCuadraturaVentaEnVerdeCantidad", model);
    }
   
}
