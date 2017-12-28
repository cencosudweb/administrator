/**
 *@name AdminOrdenesController.java
 * 
 *@version 1.0 
 * 
 *@date 08-03-2017
 * 
 *@author EA7129
 * 
 *@copyright Cencosud. All rights reserved.
 */
package com.cencosud.administrator.web.controller.admin;

import java.text.SimpleDateFormat;
import java.util.Date;
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

//import com.cencosud.administrator.web.validator.AdminUsersValidator;
import com.cencosud.administrator.core.ClienteRetiraServices;
import com.cencosud.administrator.core.CuadraturaVtavPdServices;
//import com.cencosud.administrator.core.CommerceServices;
import com.cencosud.administrator.core.DescripcionEmpresaServices;
import com.cencosud.administrator.core.EstadoCumpleResumenServices;
import com.cencosud.administrator.core.EstadoCumpleServices;
import com.cencosud.administrator.core.EstadoCumplimientoServices;
import com.cencosud.administrator.core.EstadoOdServices;
import com.cencosud.administrator.core.EstadoResponsableServices;
//import com.cencosud.administrator.core.FinancialInstitutionServices;
import com.cencosud.administrator.core.HorarioServices;
//import com.cencosud.administrator.core.RoleServices;
import com.cencosud.administrator.core.TipoGuiaServices;
import com.cencosud.administrator.core.TipoOrdenServices;
import com.cencosud.administrator.core.TipoVentaServices;
import com.cencosud.administrator.core.UserServices;
import com.cencosud.administrator.core.VentaEmpresaServices;
import com.cencosud.administrator.dto.users.ClienteRetiraDTO;
import com.cencosud.administrator.dto.users.CuadraturaVtavPdDTO;
import com.cencosud.administrator.dto.users.DescripcionEmpresaDTO;
import com.cencosud.administrator.dto.users.EstadoCumpleDTO;
import com.cencosud.administrator.dto.users.EstadoCumpleResumenDTO;
import com.cencosud.administrator.dto.users.EstadoCumplimientoDTO;
import com.cencosud.administrator.dto.users.EstadoOdDTO;
import com.cencosud.administrator.dto.users.EstadoResponsableDTO;
import com.cencosud.administrator.dto.users.HorarioDTO;
import com.cencosud.administrator.dto.users.TipoGuiaDTO;
import com.cencosud.administrator.dto.users.TipoOrdenDTO;
import com.cencosud.administrator.dto.users.TipoVentaDTO;
import com.cencosud.administrator.dto.users.UserDTO;
import com.cencosud.administrator.dto.users.VentaEmpresaDTO;
import com.cencosud.administrator.web.utils.DateUtils;

/**
 * @description Clase controladora que administra los informes de Ordenes de Compra 
 */
@Controller
public class AdminCuadraturaVtavPdController {
	
	private static Logger log = Logger.getLogger(AdminUserController.class);

    @Autowired
	private UserServices userServicesImpl;
    @Autowired
	private TipoOrdenServices tipoOrdenServicesImpl;
    @Autowired
	private TipoVentaServices tipoVentaServicesImpl;
    @Autowired
	private ClienteRetiraServices clienteRetiraServicesImpl;
    @Autowired
	private DescripcionEmpresaServices descripcionEmpresaServicesImpl;
    @Autowired
	private TipoGuiaServices tipoGuiaServicesImpl;
    @Autowired
	private HorarioServices horarioServicesImpl;
    @Autowired
	private VentaEmpresaServices ventaEmpresaServicesImpl;
    @Autowired
   	private EstadoCumpleServices estadoCumpleServicesImpl;
    @Autowired
   	private EstadoCumpleResumenServices estadoCumpleResumenServicesImpl;
    @Autowired
   	private EstadoCumplimientoServices estadoCumplimientoServicesImpl;    
    @Autowired
   	private EstadoResponsableServices estadoResponsableServicesImpl;
    @Autowired
   	private CuadraturaVtavPdServices cuadraturaVtavPdServicesImpl;
    @Autowired
   	private EstadoOdServices estadoOdServicesImpl;
    
    
    
   
    
    @RequestMapping(value = "admin/reportODVentaVerde", method = RequestMethod.GET)
    public ModelAndView reportODVentaVerde(String posted, String dateInicio,  String estado) {
    	log.info("home:reportODVentaVerde2");
    	//UserDTO user = (UserDTO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	Date now = new Date();
 		SimpleDateFormat ft = new SimpleDateFormat ("dd/MM/yyyy");
 		String iFechaFin = ft.format(now);
 		log.info("estado="+estado);
 		log.info("home:posted="+posted);
 		log.info("home:dateInicio="+ dateInicio);
 		log.info("Function="+ DateUtils.restarDiaFecha(iFechaFin,"0"));
 		log.info("Function2="+ DateUtils.turnDate3(DateUtils.restarDiaFecha(iFechaFin,"0")));
 		//String starttime = DateUtils.turnDate3(dateInicio) != null?DateUtils.turnDate3(dateInicio):iFechaFin;
 		//String starttime = DateUtils.turnDate3(dateInicio) != null?DateUtils.turnDate3(dateInicio):DateUtils.turnDate3(DateUtils.restarDiaFecha(iFechaFin,"1"));
		
		//String starttime = DateUtils.turnDatePd(dateInicio) != null?DateUtils.turnDatePd(DateUtils.restarDiaFecha(dateInicio,"8")):DateUtils.turnDatePd(DateUtils.restarDiaFecha(iFechaFin,"8"));
		//String endtime = DateUtils.turnDatePd(dateInicio) != null?DateUtils.turnDatePd(DateUtils.restarDiaFecha(dateInicio,"1")):DateUtils.turnDatePd(DateUtils.restarDiaFecha(iFechaFin,"1"));
		
		String starttime = DateUtils.turnDatePd(dateInicio) != null?DateUtils.turnDatePd(DateUtils.restarDiaFecha(dateInicio,"8")):DateUtils.turnDatePd(DateUtils.restarDiaFecha(iFechaFin,"8"));
		String endtime = DateUtils.turnDatePd(dateInicio) != null?DateUtils.turnDatePd(DateUtils.restarDiaFecha(dateInicio,"1")):DateUtils.turnDatePd(DateUtils.restarDiaFecha(iFechaFin,"1"));
		

 		log.info("home:starttime="+ starttime);
 		log.info("home:endtime="+ endtime);
 		
 		//Con OD
 		int cantConOd = cuadraturaVtavPdServicesImpl.getCountConOd(starttime+" 00:00:00", endtime+" 23:59:59", 1, 2, 0);
 		log.info("cantConOd="+ cantConOd);
 		//Sin OD
 		int cantSinOd = cuadraturaVtavPdServicesImpl.getCountSinOd(starttime+" 00:00:00", endtime+" 23:59:59", 1, 2, 0);
 		log.info("cantSinOd="+ cantSinOd);
 		
 		List<EstadoOdDTO> estados = estadoOdServicesImpl.getEstadoOds();
		
 		
 		//List<CuadraturaVtavPdDTO> conods = cuadraturaVtavPdServicesImpl.getCuadraturaVtavConPds(starttime, endtime, 1, 2, 2);
 		//List<CuadraturaVtavPdDTO> sinods = cuadraturaVtavPdServicesImpl.getCuadraturaVtavSinPds(starttime, endtime, 1, 2, 2);
 		List<CuadraturaVtavPdDTO> detalles = null;
 		if ("Todas".equals(estado) ) {
 			log.info("-Todas-"+detalles);
 			detalles = cuadraturaVtavPdServicesImpl.getCuadraturaVtavSinPds(starttime+" 00:00:00", endtime+" 23:59:59", 1, 0, 0);
 		} else if ("1".equals(estado)) {
 			log.info("-Uno-"+detalles);
 			detalles = cuadraturaVtavPdServicesImpl.getCuadraturaVtavConPds(starttime+" 00:00:00", endtime+" 23:59:59", 1, 2, 0);
 		} else if ("2".equals(estado)){
 			log.info("-Dos-"+detalles);
 			detalles = cuadraturaVtavPdServicesImpl.getCuadraturaVtavSinPds(starttime+" 00:00:00", endtime+" 23:59:59", 1, 2, 0);
 		} else {
 			log.info("-Cuatros-"+detalles);
 			detalles = cuadraturaVtavPdServicesImpl.getCuadraturaVtavSinPds(starttime+" 00:00:00", endtime+" 23:59:59", 1, 0, 0);
 		}
 	
 		
 		//List<CuadraturaVtavPdDTO> detalles = cuadraturaVtavPdServicesImpl.getCuadraturaVtavSinPds(starttime, endtime, 1, 0, 0);
 	 	
 		
 		

 		Map<String, Object> model = new HashMap<String, Object>();
 		model.put("posted", posted);//
 		model.put("fecha", DateUtils.turnDate5(starttime));//
 		model.put("starttime", starttime);//
 		model.put("endtime", endtime);//
 		model.put("cantConOd", cantConOd);//
 		model.put("cantSinOd", cantSinOd);//
 		model.put("detalles", detalles);//
 		model.put("estados", estados);//
 		model.put("namePage", "reportODVentaVerde");//
 		return new ModelAndView("role/admin/cuadraturaVtavPd/reportODVentaVerde", model);
     }
    
    @RequestMapping(value = "admin/ventaVerdeConOdDetalle", method = RequestMethod.GET)
    public ModelAndView ventaVerdeConOdDetalle(String starttime, String endtime) {
    	log.info("home:ventaVerdeConOdDetalle");
    	//UserDTO user = (UserDTO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	Date now = new Date();
 		SimpleDateFormat ft = new SimpleDateFormat ("dd-MM-yyyy");
 		String iFechaFin = ft.format(now);
 		log.info("iFechaFin="+iFechaFin);
 		log.info("home:starttime="+starttime);
 		log.info("home:endtime="+ endtime);
 		//log.info("Function="+ DateUtils.restarDiaFecha(iFechaFin,"0"));
 		//log.info("Function2="+ DateUtils.turnDate3(DateUtils.restarDiaFecha(iFechaFin,"0")));
 		//String starttime = DateUtils.turnDate3(dateInicio) != null?DateUtils.turnDate3(dateInicio):iFechaFin;
 		//String starttime = DateUtils.turnDate3(dateInicio) != null?DateUtils.turnDate3(dateInicio):DateUtils.turnDate3(DateUtils.restarDiaFecha(iFechaFin,"1"));
		
		//String starttime = DateUtils.turnDatePd(iFechaFin) != null?DateUtils.turnDatePd(DateUtils.restarDiaFecha(iFechaFin,"8")):DateUtils.turnDatePd(DateUtils.restarDiaFecha(iFechaFin,"8"));
		//String endtime = DateUtils.turnDatePd(iFechaFin) != null?DateUtils.turnDatePd(DateUtils.restarDiaFecha(iFechaFin,"1")):DateUtils.turnDatePd(DateUtils.restarDiaFecha(iFechaFin,"1"));
 		String starttime1 = "".equals(starttime) || starttime == null?iFechaFin:starttime;
 		String endtime1 = "".equals(endtime) || endtime == null?iFechaFin:endtime;
 		log.info("home:starttime1="+ starttime1);
 		log.info("home:starttime="+ starttime);
 		log.info("home:endtime="+ endtime);
 		
 		//Con OD
 		int cantConOd = cuadraturaVtavPdServicesImpl.getCountConOd(starttime1+" 00:00:00", endtime1+" 23:59:59", 1, 2, 2);
 		log.info("cantConOd="+ cantConOd);
 		//Sin OD
 		int cantSinOd = cuadraturaVtavPdServicesImpl.getCountSinOd(starttime1+" 23:59:59", endtime1+" 23:59:59", 1, 2, 2);
 		log.info("cantSinOd="+ cantSinOd);
 		
 		List<CuadraturaVtavPdDTO> conods = cuadraturaVtavPdServicesImpl.getCuadraturaVtavConPds(starttime1+" 00:00:00", endtime1+" 23:59:59", 1, 2, 2);
 		List<CuadraturaVtavPdDTO> sinods = cuadraturaVtavPdServicesImpl.getCuadraturaVtavSinPds(starttime1+" 00:00:00", endtime1+" 23:59:59", 1, 2, 2);

 		Map<String, Object> model = new HashMap<String, Object>();
 		model.put("fecha", DateUtils.turnDate5(starttime));//
 		model.put("starttime", starttime1);//
 		model.put("endtime", endtime1);//
 		model.put("cantConOd", cantConOd);//
 		model.put("cantSinOd", cantSinOd);//
 		model.put("namePage", "reportODVentaVerde");//
 		model.put("detalles", conods);//
		return new ModelAndView("role/admin/cuadraturaVtavPd/ventaVerdeConOdDetalle", model);
    }
    
    
    @RequestMapping(value = "admin/ventaVerdeSinOdDetalle", method = RequestMethod.GET)
    public ModelAndView ventaVerdeSinOdDetalle(String starttime, String endtime) {
    	log.info("home:ventaVerdeSinOdDetalle");
    	//UserDTO user = (UserDTO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	Date now = new Date();
 		SimpleDateFormat ft = new SimpleDateFormat ("dd-MM-yyyy");
 		String iFechaFin = ft.format(now);
 		log.info("home:dateInicio="+ starttime);
 		//log.info("Function="+ DateUtils.restarDiaFecha(iFechaFin,"0"));
 		//log.info("Function2="+ DateUtils.turnDate3(DateUtils.restarDiaFecha(iFechaFin,"0")));
 		//String starttime = DateUtils.turnDate3(dateInicio) != null?DateUtils.turnDate3(dateInicio):iFechaFin;
 		//String starttime = DateUtils.turnDate3(dateInicio) != null?DateUtils.turnDate3(dateInicio):DateUtils.turnDate3(DateUtils.restarDiaFecha(iFechaFin,"1"));
		
		//String starttime = DateUtils.turnDatePd(iFechaFin) != null?DateUtils.turnDatePd(DateUtils.restarDiaFecha(iFechaFin,"8")):DateUtils.turnDatePd(DateUtils.restarDiaFecha(iFechaFin,"8"));
		//String endtime = DateUtils.turnDatePd(iFechaFin) != null?DateUtils.turnDatePd(DateUtils.restarDiaFecha(iFechaFin,"1")):DateUtils.turnDatePd(DateUtils.restarDiaFecha(iFechaFin,"1"));

 		log.info("home:starttime="+ starttime);
 		log.info("home:endtime="+ endtime);
 		
 		//Con OD
 		int cantConOd = cuadraturaVtavPdServicesImpl.getCountConOd(starttime+" 00:00:00", endtime+" 23:59:59", 1, 2, 2);
 		log.info("cantConOd="+ cantConOd);
 		//Sin OD
 		int cantSinOd = cuadraturaVtavPdServicesImpl.getCountSinOd(starttime+" 00:00:00", endtime+" 23:59:59", 1, 2, 2);
 		log.info("cantSinOd="+ cantSinOd);
 		
 		List<CuadraturaVtavPdDTO> conods = cuadraturaVtavPdServicesImpl.getCuadraturaVtavConPds(starttime+" 00:00:00", endtime+" 23:59:59", 1, 2, 2);
 		List<CuadraturaVtavPdDTO> sinods = cuadraturaVtavPdServicesImpl.getCuadraturaVtavSinPds(starttime+" 00:00:00" , endtime+" 23:59:59", 1, 2, 2);

 		Map<String, Object> model = new HashMap<String, Object>();
 		model.put("fecha", DateUtils.turnDate5(starttime));//
 		model.put("starttime", starttime);//
 		model.put("endtime", endtime);//
 		model.put("cantConOd", cantConOd);//
 		model.put("cantSinOd", cantSinOd);//
 		model.put("namePage", "reportODVentaVerde");//
 		model.put("detalles", sinods);//
		return new ModelAndView("role/admin/cuadraturaVtavPd/ventaVerdeSinOdDetalle", model);
    }
    
    @RequestMapping(value = "admin/cuadraturaVtavPd", method = RequestMethod.GET)
    public ModelAndView cuadraturaVtavPd(String posted, String tipo_orden, String tipo_venta, String cliente_retira,  String descripcion_empresa, String tipo_guia, String tipo_horario, String venta_empresa, String tipo_estado, String dateInicio, String cumplimiento, String cumple_resumen, String responsable) {
		log.info("user:cuadraturaVtavPd");
		UserDTO principal = (UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		log.info("user:allUsers Usuario Actual "+principal.getUsername());
		log.info("user:dateInicio="+dateInicio);
		log.info("posted"+posted);
		log.info("user:tipo_orden="+tipo_orden);
		log.info("user:tipo_venta="+ tipo_venta);
		log.info("user:cliente_retira="+cliente_retira);
		log.info("user:descripcion_empresa="+descripcion_empresa);
		log.info("user:tipo_guia="+tipo_guia);
		log.info("user:tipo_horario="+tipo_horario);
		log.info("user:venta_empresa="+venta_empresa);
		log.info("user:tipo_estado="+tipo_estado);
		log.info("user:tipo_fecha="+dateInicio);
		log.info("user:tipo_fecha="+cumplimiento);
		log.info("user:tipo_fecha="+cumple_resumen);
		log.info("user:tipo_fecha="+responsable);
		
		Date dNow = new Date();
		SimpleDateFormat ft = new SimpleDateFormat ("dd/MM/yyyy");
		String currentDate = ft.format(dNow);
		log.info("user:currentDate="+currentDate);
		//String dateInicio =  dateInicio;
		//out.println("dateInicio="+dateInicio);
		String starttime = DateUtils.turnDate(dateInicio) != null?DateUtils.turnDate(dateInicio):DateUtils.turnDate(currentDate);
		//out.println("starttime"+starttime);

		log.info("user:starttime="+starttime);
		
		
		List<UserDTO> users = userServicesImpl.getUsers();
		List<TipoOrdenDTO> ordenes = tipoOrdenServicesImpl.getTipoOrdens();
		List<TipoVentaDTO> ventas = tipoVentaServicesImpl.getTipoVentas();
		List<ClienteRetiraDTO> clientes = clienteRetiraServicesImpl.getClienteRetiras();
		List<DescripcionEmpresaDTO> empresas = descripcionEmpresaServicesImpl.getDescripcionEmpresas();
		List<TipoGuiaDTO> guias = tipoGuiaServicesImpl.getTipoGuias();
		List<HorarioDTO> horarios = horarioServicesImpl.getHorarios();
		List<VentaEmpresaDTO> ventaempresas = ventaEmpresaServicesImpl.getVentaEmpresas();
		List<EstadoCumpleDTO> estadocumples = estadoCumpleServicesImpl.getEstadoCumples();
		List<EstadoCumpleResumenDTO> estadocumpleresumens = estadoCumpleResumenServicesImpl.getEstadoCumpleResumens();
		List<EstadoCumplimientoDTO> estadocumplimientos = estadoCumplimientoServicesImpl.getEstadoCumplimientos();
		List<EstadoResponsableDTO> estadoresponsables = estadoResponsableServicesImpl.getEstadoResponsables();
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("user", principal);
		model.put("posted", posted);
		model.put("users", users);
		model.put("ordenes", ordenes);
		model.put("ventas", ventas);
		model.put("clientes", clientes);
		model.put("empresas", empresas);
		model.put("guias", guias);
		model.put("horarios", horarios);
		model.put("ventaempresas", ventaempresas);
		model.put("estadocumples", estadocumples);
		model.put("estadocumpleresumens", estadocumpleresumens);
		model.put("estadocumplimientos", estadocumplimientos);
		model.put("estadoresponsables", estadoresponsables);
		model.put("tipo_ordenN", tipo_orden);
		
		
		return new ModelAndView("role/admin/cuadraturaVtavPd/cuadraturaVtavPd", model);
    }
    
    
    
    
   

}
