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
import com.cencosud.administrator.core.CumplimientoServices;
import com.cencosud.administrator.core.CumplimientokpiWebServices;
//import com.cencosud.administrator.core.CommerceServices;
import com.cencosud.administrator.core.DescripcionEmpresaServices;
import com.cencosud.administrator.core.EstadoCumpleResumenServices;
import com.cencosud.administrator.core.EstadoCumpleServices;
import com.cencosud.administrator.core.EstadoCumplimientoServices;
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
import com.cencosud.administrator.dto.users.CumplimientoDTO;
import com.cencosud.administrator.dto.users.CumplimientokpiWebDTO;
import com.cencosud.administrator.dto.users.DescripcionEmpresaDTO;
import com.cencosud.administrator.dto.users.EstadoCumpleDTO;
import com.cencosud.administrator.dto.users.EstadoCumpleResumenDTO;
import com.cencosud.administrator.dto.users.EstadoCumplimientoDTO;
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
public class AdminCumplimientoController {
	
	private static Logger log = Logger.getLogger(AdminUserController.class);

	//@Autowired
	//private MessageSource msgSrc;  
    @Autowired
	private UserServices userServicesImpl;
    //@Autowired
    //private FinancialInstitutionServices financialInstitutionServicesImpl;
    //@Autowired
    //private CommerceServices commerceServicesImpl;
    //@Autowired
    //private AdminUsersValidator validator;
    //@Autowired
    //private RoleServices roleServicesImpl;
    
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
   	private CumplimientokpiWebServices cumplimientokpiWebServicesImpl;
    
    @Autowired
	private CumplimientoServices cumplimientoServicesImpl;
    
    @RequestMapping(value = "admin/reportePanelDinamico", method = RequestMethod.GET)
    public ModelAndView reportePanelDinamico(String posted, String tipo_orden, String tipo_venta, String cliente_retira,  String descripcion_empresa, String tipo_guia, String tipo_horario, String venta_empresa, String tipo_estado, String dateInicio, String cumplimiento, String cumple_resumen, String responsable) {
		log.info("user:reportePanelDinamico");
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
		
		
		return new ModelAndView("role/admin/cumplimiento/reportePanelDinamico", model);
    }
    
    @RequestMapping(value = "admin/reportePanelDinamico2", method = RequestMethod.GET)
    public ModelAndView reportePanelDinamico2(String posted, String tipo_orden, String tipo_venta, String cliente_retira,  String descripcion_empresa, String tipo_guia, String tipo_horario, String venta_empresa, String tipo_estado, String dateInicio, String cumplimiento, String cumple_resumen, String responsable) {
		log.info("user:reportePanelDinamico2");
		UserDTO principal = (UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		log.info("user:allUsers Usuario Actual "+principal.getUsername());
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
		
		//String dateInicio =  dateInicio;
		//out.println("dateInicio="+dateInicio);
		String starttime = DateUtils.turnDate(dateInicio) != null?DateUtils.turnDate(dateInicio):DateUtils.turnDate(currentDate);
		//out.println("starttime"+starttime);

		log.info("user:starttime="+starttime);
		
		
		List<UserDTO> users = userServicesImpl.getUsers();
		List<TipoOrdenDTO> ordenes = tipoOrdenServicesImpl.getTipoOrdens();
		List<TipoVentaDTO> ventas = tipoVentaServicesImpl.getTipoVentas();
		//List<ClienteRetiraDTO> clientes = clienteRetiraServicesImpl.getClienteRetiras();
		List<DescripcionEmpresaDTO> empresas = descripcionEmpresaServicesImpl.getDescripcionEmpresas();
		List<TipoGuiaDTO> guias = tipoGuiaServicesImpl.getTipoGuias();
		//List<HorarioDTO> horarios = horarioServicesImpl.getHorarios();
		//List<VentaEmpresaDTO> ventaempresas = ventaEmpresaServicesImpl.getVentaEmpresas();
		//List<FechaCompromisoDTO> fechas = fechaCompromisoServicesImpl.getFechaCompromisos();
		//List<EstadoCumpleDTO> estadocumples = estadoCumpleServicesImpl.getEstadoCumples();
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("user", principal);
		model.put("posted", posted);
		model.put("users", users);
		model.put("ordenes", ordenes);
		model.put("ventas", ventas);
		//model.put("clientes", clientes);
		model.put("empresas", empresas);
		model.put("guias", guias);
		//model.put("horarios", horarios);
		//model.put("ventaempresas", ventaempresas);
		//model.put("fechas", fechas);
		//model.put("estadocumples", estadocumples);
		
		
		return new ModelAndView("role/admin/cumplimiento/reportePanelDinamico2", model);
    }
    
    
  
    
    @RequestMapping(value = "admin/reportePanelDinamicoPrint", method = RequestMethod.GET)
    public ModelAndView reportePanelDinamicoPrint(String posted, String tipo_orden, String tipo_venta, String cliente_retira,  String descripcion_empresa, String tipo_guia, String tipo_horario, String venta_empresa, String tipo_estado, String dateInicio, String cumplimiento, String cumple_resumen, String responsable) {
		log.info("user:reportePanelDinamicoPrint");
		UserDTO principal = (UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		log.info("user:allUsers Usuario Actual "+principal.getUsername());
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
		
		if ("".equals(posted)) {
			model.put("posted", null);
		} else {
			model.put("posted", "ok");
		}
		//model.put("posted", posted);
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
		return new ModelAndView("role/admin/cumplimiento/reportePanelDinamicoPrint", model);
    }
    
    @RequestMapping(value = "admin/reportePanelEstatico", method = RequestMethod.GET)
    public ModelAndView reportePanelEstatico(String posted, String tipo_orden, String tipo_venta, String cliente_retira,  String descripcion_empresa, String tipo_guia, String tipo_horario, String venta_empresa, String tipo_estado, String dateInicio, String cumplimiento, String cumple_resumen, String responsable) {
    	log.info("user:reportePanelEstatico");
		UserDTO principal = (UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		log.info("user:allUsers Usuario Actual "+principal.getUsername());
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
		model.put("posted", posted);
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
		return new ModelAndView("role/admin/cumplimiento/reportePanelEstatico", model);
    }
    
    
    @RequestMapping(value = "admin/reportePanelEstaticoPrint", method = RequestMethod.GET)
    public ModelAndView reportePanelEstaticoPrint(String posted, String tipo_orden, String tipo_venta, String cliente_retira,  String descripcion_empresa, String tipo_guia, String tipo_horario, String venta_empresa, String tipo_estado, String dateInicio, String cumplimiento, String cumple_resumen, String responsable) {
		log.info("user:reportePanelEstaticoPrint");
		UserDTO principal = (UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		log.info("user:allUsers Usuario Actual "+principal.getUsername());
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
		
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		if ("NULL".equals(posted)) {
			model.put("posted", null);
		} else {
			model.put("posted", "ok");
		}
		//model.put("posted", posted);
		model.put("users", users);
		model.put("ordenes", ordenes);
		model.put("ventas", ventas);
		model.put("clientes", clientes);
		model.put("empresas", empresas);
		model.put("guias", guias);
		model.put("horarios", horarios);
		model.put("ventaempresas", ventaempresas);
		model.put("estadocumples", estadocumples);
		
		model.put("tipo_ordenN", tipo_orden);	
		return new ModelAndView("role/admin/cumplimiento/reportePanelEstaticoPrint", model);
    }
    
    @RequestMapping(value = "admin/reportePanelDinamicoSemanal", method = RequestMethod.GET)
    public ModelAndView reportePanelDinamicoSemanal(String posted, String tipo_orden, String tipo_venta, String cliente_retira,  String descripcion_empresa, String tipo_guia, String tipo_horario, String venta_empresa, String tipo_estado, String dateInicio, String cumplimiento, String cumple_resumen, String responsable) {
		log.info("user:reportePanelDinamicoSemanal");
		UserDTO principal = (UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		log.info("user:allUsers Usuario Actual "+principal.getUsername());
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
		
		
		return new ModelAndView("role/admin/cumplimiento/reportePanelDinamicoSemanal", model);
    }
    
    
    @RequestMapping(value = "admin/reportePanelDinamicoMensual", method = RequestMethod.GET)
    public ModelAndView reportePanelDinamicoMensual(String posted, String tipo_orden, String tipo_venta, String cliente_retira,  String descripcion_empresa, String tipo_guia, String tipo_horario, String venta_empresa, String tipo_estado, String dateInicio, String cumplimiento, String cumple_resumen, String responsable) {
		log.info("user:reportePanelDinamicoMensual");
		UserDTO principal = (UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		log.info("user:allUsers Usuario Actual "+principal.getUsername());
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
	
		
		Map<String, String> compare = new HashMap<String, String>();
		compare.put("1", "-1");
		compare.put("2", "-2");
		compare.put("3", "-3");
		compare.put("4", "-4");
		compare.put("5", "-5");
		compare.put("6", "-6");
		compare.put("7", "-7");
		compare.put("8", "-8");
		compare.put("9", "-9");
		compare.put("10", "-10");
		compare.put("11", "-11");
		
		
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("posted", posted);
		model.put("compare", compare);
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
		
		
		return new ModelAndView("role/admin/cumplimiento/reportePanelDinamicoMensual", model);
    }
    
    
 
    
    @RequestMapping(value = "admin/reportePanelDinamicoMensual2", method = RequestMethod.GET)
    public ModelAndView reportePanelDinamicoMensual2(String posted, String tipo_orden, String tipo_venta, String cliente_retira,  String descripcion_empresa, String tipo_guia, String tipo_horario, String venta_empresa, String tipo_estado, String dateInicio, String cumplimiento, String cumple_resumen, String responsable) {
		log.info("user:reportePanelDinamicoMensual2");
		UserDTO principal = (UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		log.info("user:allUsers Usuario Actual "+principal.getUsername());
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
		
		//String dateInicio =  dateInicio;
		//out.println("dateInicio="+dateInicio);
		String starttime = DateUtils.turnDate(dateInicio) != null?DateUtils.turnDate(dateInicio):DateUtils.turnDate(currentDate);
		//out.println("starttime"+starttime);

		log.info("user:starttime="+starttime);
		
		
		List<UserDTO> users = userServicesImpl.getUsers();
		List<TipoOrdenDTO> ordenes = tipoOrdenServicesImpl.getTipoOrdens();
		List<TipoVentaDTO> ventas = tipoVentaServicesImpl.getTipoVentas();
		//List<ClienteRetiraDTO> clientes = clienteRetiraServicesImpl.getClienteRetiras();
		//List<DescripcionEmpresaDTO> empresas = descripcionEmpresaServicesImpl.getDescripcionEmpresas();
		List<TipoGuiaDTO> guias = tipoGuiaServicesImpl.getTipoGuias();
		//List<HorarioDTO> horarios = horarioServicesImpl.getHorarios();
		////List<VentaEmpresaDTO> ventaempresas = ventaEmpresaServicesImpl.getVentaEmpresas();
		//List<FechaCompromisoDTO> fechas = fechaCompromisoServicesImpl.getFechaCompromisos();
		//List<EstadoCumpleDTO> estadocumples = estadoCumpleServicesImpl.getEstadoCumples();
		
		Map<String, String> compare = new HashMap<String, String>();
		compare.put("1", "-1");
		compare.put("2", "-2");
		compare.put("3", "-3");
		compare.put("4", "-4");
		compare.put("5", "-5");
		compare.put("6", "-6");
		
		
		
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("user", principal);

		model.put("posted", posted);
		model.put("users", users);
		model.put("compare", compare);
		
		
		model.put("ordenes", ordenes);
		model.put("ventas", ventas);
		//model.put("clientes", clientes);
		//model.put("empresas", empresas);
		model.put("guias", guias);
		//model.put("horarios", horarios);
		//model.put("ventaempresas", ventaempresas);
		//model.put("fechas", fechas);
		//model.put("estadocumples", estadocumples);
		
		return new ModelAndView("role/admin/cumplimiento/reportePanelDinamicoMensual2", model);
    }
    
    
    @RequestMapping(value = "admin/reportePanelDinamicoMensualComparar", method = RequestMethod.GET)
    public ModelAndView reportePanelDinamicoMensualComparar(String posted, String tipo_orden, String tipo_venta, String cliente_retira,  String descripcion_empresa, String tipo_guia, String tipo_horario, String venta_empresa, String tipo_estado, String dateInicio, String cumplimiento, String cumple_resumen, String responsable) {
		log.info("user:reportePanelDinamicoMensualComparar");
		UserDTO principal = (UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		log.info("user:allUsers Usuario Actual "+principal.getUsername());
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
		
		//String dateInicio =  dateInicio;
		//out.println("dateInicio="+dateInicio);
		String starttime = DateUtils.turnDate(dateInicio) != null?DateUtils.turnDate(dateInicio):DateUtils.turnDate(currentDate);
		//out.println("starttime"+starttime);

		log.info("user:starttime="+starttime);
		
		
		List<UserDTO> users = userServicesImpl.getUsers();
		List<TipoOrdenDTO> ordenes = tipoOrdenServicesImpl.getTipoOrdens();
		List<TipoVentaDTO> ventas = tipoVentaServicesImpl.getTipoVentas();
		//List<ClienteRetiraDTO> clientes = clienteRetiraServicesImpl.getClienteRetiras();
		//List<DescripcionEmpresaDTO> empresas = descripcionEmpresaServicesImpl.getDescripcionEmpresas();
		List<TipoGuiaDTO> guias = tipoGuiaServicesImpl.getTipoGuias();
		//List<HorarioDTO> horarios = horarioServicesImpl.getHorarios();
		////List<VentaEmpresaDTO> ventaempresas = ventaEmpresaServicesImpl.getVentaEmpresas();
		//List<FechaCompromisoDTO> fechas = fechaCompromisoServicesImpl.getFechaCompromisos();
		//List<EstadoCumpleDTO> estadocumples = estadoCumpleServicesImpl.getEstadoCumples();
		
		Map<String, String> compare = new HashMap<String, String>();
		compare.put("1", "-1");
		compare.put("2", "-2");
		compare.put("3", "-3");
		compare.put("4", "-4");
		compare.put("5", "-5");
		compare.put("6", "-6");
		
		
		
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("user", principal);

		model.put("posted", posted);
		model.put("users", users);
		model.put("compare", compare);
		
		
		model.put("ordenes", ordenes);
		model.put("ventas", ventas);
		//model.put("clientes", clientes);
		//model.put("empresas", empresas);
		model.put("guias", guias);
		//model.put("horarios", horarios);
		//model.put("ventaempresas", ventaempresas);
		//model.put("fechas", fechas);
		//model.put("estadocumples", estadocumples);
		
		return new ModelAndView("role/admin/cumplimiento/reportePanelDinamicoMensualComparar", model);
    }
    
    @RequestMapping(value = "admin/reportePanelDinamicoMensual3", method = RequestMethod.GET)
    public ModelAndView reportePanelDinamicoMensual3(String posted, String tipo_orden, String tipo_venta, String cliente_retira,  String descripcion_empresa, String tipo_guia, String tipo_horario, String venta_empresa, String tipo_estado, String dateInicio, String cumplimiento, String cumple_resumen, String responsable) {
		log.info("user:reportePanelDinamicoMensual3");
		UserDTO principal = (UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		log.info("user:allUsers Usuario Actual "+principal.getUsername());
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
		
		Map<String, String> compare = new HashMap<String, String>();
		compare.put("1", "-1");
		compare.put("2", "-2");
		compare.put("3", "-3");
		compare.put("4", "-4");
		compare.put("5", "-5");
		compare.put("6", "-6");
		compare.put("7", "-7");
		compare.put("8", "-8");
		compare.put("9", "-9");
		compare.put("10", "-10");
		compare.put("11", "-11");
		
		
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("user", principal);

		model.put("posted", posted);
		model.put("users", users);
		model.put("compare", compare);
		
		
		model.put("ordenes", ordenes);
		model.put("ventas", ventas);
		model.put("clientes", clientes);
		model.put("empresas", empresas);
		model.put("guias", guias);
		model.put("horarios", horarios);
		model.put("ventaempresas", ventaempresas);
		model.put("estadocumples", estadocumples);
		
		
		model.put("tipo_ordenN", tipo_orden);
		
		
		return new ModelAndView("role/admin/cumplimiento/reportePanelDinamicoMensual3", model);
    }
    
    
    @RequestMapping(value = "admin/reportePanelDinamicoMensualGrafico", method = RequestMethod.GET)
    public ModelAndView reportePanelDinamicoMensualGrafico(String posted, String tipo_orden, String tipo_venta, String cliente_retira,  String descripcion_empresa, String tipo_guia, String tipo_horario, String venta_empresa, String tipo_estado, String dateInicio, String cumplimiento, String cumple_resumen, String responsable) {
		log.info("user:reportePanelDinamicoMensual3");
		UserDTO principal = (UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		log.info("user:allUsers Usuario Actual "+principal.getUsername());
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
		
		//String dateInicio =  dateInicio;
		//out.println("dateInicio="+dateInicio);
		String starttime = DateUtils.turnDate(dateInicio) != null?DateUtils.turnDate(dateInicio):DateUtils.turnDate(currentDate);
		//out.println("starttime"+starttime);

		log.info("user:starttime="+starttime);
		
		
		List<UserDTO> users = userServicesImpl.getUsers();
		List<TipoOrdenDTO> ordenes = tipoOrdenServicesImpl.getTipoOrdens();
		List<TipoVentaDTO> ventas = tipoVentaServicesImpl.getTipoVentas();
		//List<ClienteRetiraDTO> clientes = clienteRetiraServicesImpl.getClienteRetiras();
		//List<DescripcionEmpresaDTO> empresas = descripcionEmpresaServicesImpl.getDescripcionEmpresas();
		//List<TipoGuiaDTO> guias = tipoGuiaServicesImpl.getTipoGuias();
		//List<HorarioDTO> horarios = horarioServicesImpl.getHorarios();
		//List<VentaEmpresaDTO> ventaempresas = ventaEmpresaServicesImpl.getVentaEmpresas();
		//List<FechaCompromisoDTO> fechas = fechaCompromisoServicesImpl.getFechaCompromisos();
		//List<EstadoDTO> estados = estadoServicesImpl.getEstados();
		//List<EstadoCumpleDTO> estadocumples = estadoCumpleServicesImpl.getEstadoCumples();
	
		
		Map<String, String> compare = new HashMap<String, String>();
		compare.put("1", "-1");
		compare.put("2", "-2");
		compare.put("3", "-3");
		compare.put("4", "-4");
		compare.put("5", "-5");
		compare.put("6", "-6");
		compare.put("7", "-7");
		compare.put("8", "-8");
		compare.put("9", "-9");
		compare.put("10", "-10");
		compare.put("11", "-11");
		
		
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("user", principal);

		model.put("posted", posted);
		model.put("users", users);
		model.put("compare", compare);
		
		
		model.put("ordenes", ordenes);
		model.put("ventas", ventas);
		//model.put("clientes", clientes);
		//model.put("empresas", empresas);
		//model.put("guias", guias);
		//model.put("horarios", horarios);
		//model.put("ventaempresas", ventaempresas);
		//model.put("estadocumples", estadocumples);
		
		return new ModelAndView("role/admin/cumplimiento/reportePanelDinamicoMensualGrafico", model);
    }
    
    
    @RequestMapping(value = "admin/reporteResponsableCumplimiento", method = RequestMethod.GET)
    public ModelAndView reporterResponsableCumplimiento(String posted, String tipo_orden, String tipo_venta, String cliente_retira,  String descripcion_empresa, String tipo_guia, String tipo_horario, String venta_empresa, String tipo_estado, String dateInicio, String cumplimiento, String cumple_resumen, String responsable) {
		log.info("user:reportereporteResponsableCumplimiento");
		UserDTO principal = (UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		log.info("user:allUsers Usuario Actual "+principal.getUsername());
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
		
		
		return new ModelAndView("role/admin/cumplimiento/reporteResponsableCumplimiento", model);
    }
    
    
    @RequestMapping(value = "admin/downloadExcelCumplimientokpiWeb", method = RequestMethod.GET)
	public ModelAndView downloadExcelCumplimientokpiWeb(String fechaIni, String fechaTer, String[] tipo_orden) {
		log.info("User:downloadExcelCumplimientokpiWeb");
		log.info("User:fechaIni"+fechaIni);
		log.info("User:fechaTer"+fechaTer);
		log.info("User:tipo_orden"+tipo_orden);
		
		String[] tipoOrdenes = tipo_orden;
		if (tipo_orden != null) {
			for(String tipoOrdene: tipoOrdenes) {
				log.info("Data = "+tipoOrdene);
			}
		}
		
		
		
		
		
		String starttimeIni = DateUtils.turnDate222222( String.valueOf( DateUtils.restarDia(DateUtils.turnDate1111(fechaIni)  ) ) );
		String starttimeTer = fechaTer;
		log.info("User:starttimeIni="+starttimeIni);
		log.info("User:starttimeTer="+starttimeTer);
		
		//String filtroUsername = username != null?username:null;
		//log.info("filtroUsername:"+filtroUsername);
		List<CumplimientokpiWebDTO> cumplimientokpiWebList = cumplimientokpiWebServicesImpl.getCumplimientokpiWebs(starttimeIni, starttimeTer);
		 
		return new ModelAndView("CumplimientokpiWebListExcel", "cumplimientokpiWebList", cumplimientokpiWebList);
		
	 }
    
    /*
    @RequestMapping(value = "admin/downloadPDFCumplimientokpiWeb", method = RequestMethod.GET)
	public ModelAndView downloadPdf(String username) {
		log.info("User:downloadPDFUser");
		log.info("User:username"+username);
		String filtroUsername = username != null?username:null;
		log.info("filtroUsername:"+filtroUsername); 
		 
		List<UserDTO> userList = userServicesImpl.getUsers(filtroUsername, 0, 10000000);
		return new ModelAndView("UserListPdf", "userList", userList);
	}
	*/
    
    @RequestMapping(value = "admin/viewCSVCumplimientokpiWeb", method = RequestMethod.GET)
   	public ModelAndView downloadCsv(String fechaIni, String fechaTer) {
   		log.info("User:viewCSVCumplimientokpiWeb");
   		//http://www.codejava.net/frameworks/spring/spring-mvc-with-csv-file-download-example 
   		log.info("User:fechaIni"+fechaIni);
		log.info("User:fechaTer"+fechaTer);
		
		String starttimeIni = DateUtils.turnDate222222( String.valueOf( DateUtils.restarDia(DateUtils.turnDate1111(fechaIni)  ) ) );
		String starttimeTer = fechaTer;
		log.info("User:starttimeIni="+starttimeIni);
		log.info("User:starttimeTer="+starttimeTer);
		
   		List<CumplimientokpiWebDTO> cumplimientokpiWebList = cumplimientokpiWebServicesImpl.getCumplimientokpiWebs(starttimeIni, starttimeTer);
   		
   		String[] header = { "Id", "cumple", "resumen", "cumplimiento", "responsable"};
   		
   		//return new ModelAndView("UserViewCSV", "cardList", cardList);
   		
   		ModelAndView model = new ModelAndView("CumplimientokpiWebListCSV");
   		model.addObject("csvData", cumplimientokpiWebList);
   		model.addObject("csvHeader", header);
   		return model;
   	}
    
    
    @RequestMapping(value = "admin/downloadExcelCumplimiento", method = RequestMethod.GET)
	public ModelAndView downloadExcelCumplimiento(String dateInicio) {
		log.info("User:downloadExcelCumplimiento");
		log.info("User:dateInicio"+dateInicio);
		
		
		Date dNow = new Date();
		SimpleDateFormat ft = new SimpleDateFormat ("dd/MM/yyyy");
		String currentDate = ft.format(dNow);
		//String dateInicio =  dateInicio;
		//out.println("dateInicio="+dateInicio);
		String starttime = DateUtils.turnDate(dateInicio) != null?DateUtils.turnDate(DateUtils.restarDiasFecha2(dateInicio,"8")):DateUtils.turnDate(DateUtils.restarDiasFecha2(currentDate,"8"));
		String endtime = DateUtils.turnDate(dateInicio) != null?DateUtils.turnDate(dateInicio):DateUtils.turnDate(currentDate);

		log.info("User:starttime"+starttime);
		log.info("User:endtime"+endtime);
		

		List<CumplimientoDTO> cumplimientoList = cumplimientoServicesImpl
				.getCumplimientos(starttime+" 00:00:00", endtime+" 23:59:59");

		
		//String filtroUsername = username != null?username:null;
		//log.info("filtroUsername:"+filtroUsername);
		 
		return new ModelAndView("CumplimientoListExcel", "cumplimientoList", cumplimientoList);
		
	 }
    
    
   

}
