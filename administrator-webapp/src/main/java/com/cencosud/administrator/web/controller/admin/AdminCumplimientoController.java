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

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

//import com.cencosud.administrator.web.validator.AdminUsersValidator;
import com.cencosud.administrator.core.ClienteRetiraServices;
import com.cencosud.administrator.core.CuadraturaVentaVerdeServices;
import com.cencosud.administrator.core.CumplimientokpiWebServices;
//import com.cencosud.administrator.core.CommerceServices;
import com.cencosud.administrator.core.DescripcionEmpresaServices;
import com.cencosud.administrator.core.EcommerceSoporteVentaServices;
import com.cencosud.administrator.core.EstadoCumpleResumenServices;
import com.cencosud.administrator.core.EstadoCumpleServices;
import com.cencosud.administrator.core.EstadoCumplimientoServices;
import com.cencosud.administrator.core.EstadoResponsableServices;
import com.cencosud.administrator.core.HorarioActualizacionStockServices;
//import com.cencosud.administrator.core.FinancialInstitutionServices;
import com.cencosud.administrator.core.HorarioServices;
import com.cencosud.administrator.core.HorarioVentaEnVerdeActualizacionServices;
import com.cencosud.administrator.core.TipoEstadoVentaEnVerdeServices;
//import com.cencosud.administrator.core.RoleServices;
import com.cencosud.administrator.core.TipoGuiaServices;
import com.cencosud.administrator.core.TipoOrdenServices;
import com.cencosud.administrator.core.TipoVentaServices;
import com.cencosud.administrator.core.UserServices;
import com.cencosud.administrator.core.VentaEmpresaServices;
import com.cencosud.administrator.dto.users.ClienteRetiraDTO;
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
import com.cencosud.administrator.web.utils.StringUtils;

/**
 * @description Clase controladora que administra los informes de Ordenes de Compra 
 */
@Controller
public class AdminCumplimientoController {
	
	private static Logger log = Logger.getLogger(AdminUserController.class);

	//@Autowired
   	//private CuadraturaEcommerceServices cuadraturaEcommerceServicesImpl;
    
    //@Autowired
   	//private CuadraturaJpdTotDadServices cuadraturaJpdTotDadServicesImpl;
    @Autowired
	private UserServices userServicesImpl;
    
    @Autowired
   	private EcommerceSoporteVentaServices ecommerceSoporteVentaServicesImpl;
    
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
   	private TipoEstadoVentaEnVerdeServices tipoEstadoVentaEnVerdeServicesImpl;
    
    @Autowired
   	private HorarioVentaEnVerdeActualizacionServices horarioVentaEnVerdeActualizacionServicesImpl;
   
    @Autowired
   	private CuadraturaVentaVerdeServices cuadraturaVentaVerdeServicesImpl;
    
    @Autowired
   	private HorarioActualizacionStockServices horarioActualizacionStockServicesImpl;
    
    @Autowired
   	private CuadraturaVentaVerdeServices CuadraturaVtavPdServicesImpl;
    
    

    @RequestMapping(value = "admin/panelEstatico", method = RequestMethod.GET)
    public ModelAndView panelDinamico(String tipo_orden, String tipo_venta, String cliente_retira,  String descripcion_empresa, String tipo_guia, String tipo_horario, String venta_empresa, String tipo_estado, String dateInicio, String cumplimiento, String cumple_resumen, String responsable) {
		//UserDTO principal = (UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		//log.info("user:allUsers Usuario Actual "+principal.getUsername());
		//log.info("posted"+posted);
		log.info("user:tipo_orden="+tipo_orden);
		log.info("user:tipo_venta="+ tipo_venta);
		log.info("user:cliente_retira="+cliente_retira);
		log.info("user:descripcion_empresa="+descripcion_empresa);
		log.info("user:tipo_guia="+tipo_guia);
		log.info("user:tipo_horario="+tipo_horario);
		log.info("user:venta_empresa="+venta_empresa);
		log.info("user:tipo_estado="+tipo_estado);
		log.info("user:dateInicio="+dateInicio);
		log.info("user:cumplimiento="+cumplimiento);
		log.info("user:cumple_resumen="+cumple_resumen);
		log.info("user:responsable="+responsable);    	
    	//UserDTO user = (UserDTO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Date dNow = new Date();
		SimpleDateFormat ft = new SimpleDateFormat ("dd/MM/yyyy");
		String currentDate = ft.format(dNow);
		log.info("currentDate="+currentDate);
		//log.info("Date="+DateUtils.turnDate(DateUtils.restarDiaFecha(currentDate,"1")));
		
		
		//String dateInicio =  dateInicio;
		//out.println("dateInicio="+dateInicio);
		
		String starttime = DateUtils.turnDate(dateInicio) != null?DateUtils.turnDate(dateInicio): DateUtils.turnDate(DateUtils.restarDiaFecha(currentDate,"1"));
		
		//String starttime = DateUtils.turnDate(dateInicio) != null?DateUtils.turnDate(dateInicio):DateUtils.turnDate(currentDate);
		//out.println("starttime"+starttime);
		log.info("user:starttime="+starttime);
		//log.info("user:starttime2="+starttime2);

		String orden = null;
		String venta = "";
		String guia = "";
		
		if (!"".equals(tipo_orden)) {
			orden = tipo_orden;
		} else {
			orden = null;
		}
		
		
		if (!"".equals(tipo_venta)) {
			venta = tipo_venta;
		} else {
			venta = null;
		}
		
		
		if (!"".equals(tipo_guia)) {
			guia = tipo_guia;
		} else {
			guia = null;
		}
		
		
		
		log.info("orden="+orden);
		log.info("venta="+venta);
		log.info("guia="+guia);
		
		
 		
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
		
		
		
		
 		
		String prefixclause = null;
		
		log.info("orden="+orden);
		log.info("venta="+venta);
		log.info("guia="+guia);
 		//cantidad Cumple
 		int cantCumple = cumplimientokpiWebServicesImpl.getCumpleokpiWebCounts(starttime, starttime, orden, venta, guia, "1", prefixclause);
 		//cantidad Atrasado
 		int cantAtrasado = cumplimientokpiWebServicesImpl.getCumpleokpiWebCounts(starttime, starttime, orden, venta, guia, "2", prefixclause);
 		//cantidad No cumple
 		int cantNoCumple = cumplimientokpiWebServicesImpl.getCumpleokpiWebCounts(starttime, starttime, orden, venta, guia, "3", prefixclause);
 		//Total cantidad
 		int cantTotal = cumplimientokpiWebServicesImpl.getTotalkpiWebCounts(starttime, starttime, orden, venta, guia, null, prefixclause);
 		
 		
 		float porcentajeCumple = 0;
		if (cantCumple == 0 && cantTotal == 0) {
			System.out.println("-");
			porcentajeCumple = 0;
		} else {
			porcentajeCumple = ((float ) ( (float ) cantCumple / (float )cantTotal) * 100);
			DecimalFormat df = new DecimalFormat("0.00"); 
			System.out.println("->"+df.format(porcentajeCumple));
		}
 		String sporcentajeCumple = Float.toString(porcentajeCumple);
 		
 		
 		float porcentajeAtrasado = 0;
		if (cantAtrasado == 0 && cantTotal == 0) {
			System.out.println("-");
			porcentajeAtrasado = 0;
		} else {
			porcentajeAtrasado = ((float ) ( (float ) cantAtrasado / (float )cantTotal) * 100);
			DecimalFormat df = new DecimalFormat("0.00"); 
			System.out.println("->"+df.format(porcentajeAtrasado));
		}
 		String sporcentajeAtrasado = Float.toString(porcentajeAtrasado);
		
 		
 		float porcentajeNoCumple = 0;
		if (cantNoCumple == 0 && cantTotal == 0) {
			System.out.println("-");
			porcentajeNoCumple = 0;
		} else {
			porcentajeNoCumple = ((float ) ( (float ) cantNoCumple / (float )cantTotal) * 100);
			DecimalFormat df = new DecimalFormat("0.00"); 
			System.out.println("->"+df.format(porcentajeNoCumple));
		}
 		String sporcentajeNoCumple = Float.toString(porcentajeNoCumple);
 		
 		
 		float porcentajeTotal = 0;
		if (cantTotal == 0) {
			System.out.println("-");
			porcentajeTotal = 0;
		} else {
			porcentajeTotal = ((float ) ( (float ) cantTotal / (float )cantTotal) * 100);
			DecimalFormat df = new DecimalFormat("0.00"); 
			System.out.println("->"+df.format(porcentajeTotal));
		}
 		String sporcentajeTotal = Float.toString(porcentajeTotal);
 		
 		
 		log.info("starttime="+ starttime);
 		log.info("cantCumple="+ cantCumple);
 		log.info("cantCumple="+ cantCumple);
 		log.info("==1=="+ StringUtils.Redondear(sporcentajeCumple,2));
 		
 		
 		
 		sporcentajeCumple.replace(".","");
 		log.info("==2=="+ sporcentajeCumple.replace(".",""));

 		
 		
 		
 		
 		log.info("porcentajeCumple=" + StringUtils.Redondear(String.valueOf(""+porcentajeCumple),2));
 		log.info("cantAtrasado="+ cantAtrasado);
 		log.info("cantNoCumple="+ cantNoCumple);
 		
 		Map<String, Object> model = new HashMap<String, Object>();
 		//model.put("posted", posted);//
 		model.put("cantCumple", cantCumple);//
 		model.put("porcentajeCumple", StringUtils.Redondear(sporcentajeCumple,2));//

 		model.put("cantAtrasado", cantAtrasado);//
 		model.put("porcentajeAtrasado", StringUtils.Redondear(sporcentajeAtrasado,2));//
 		
 		model.put("cantNoCumple", cantNoCumple);//
 		model.put("porcentajeNoCumple", StringUtils.Redondear(sporcentajeNoCumple,2));//

 		model.put("cantTotal", cantTotal);
 		model.put("porcentajeTotal", StringUtils.Redondear(sporcentajeTotal,2));//
 		model.put("test", sporcentajeCumple.replace(".",""));//
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
 		model.put("fecha", DateUtils.turnDate5(starttime));//
 		model.put("namePage", "panelEstatico");//
 		
 		
 		
 		return new ModelAndView("role/admin/cumplimiento/panelEstatico", model);
     }
    
    
    @RequestMapping(value = "admin/cuadraturaVentaEnVerdePd", method = RequestMethod.GET)
    public ModelAndView cuadraturaVentaEnVerdePd(String tipo_orden, String tipo_venta, String cliente_retira,  String descripcion_empresa, String tipo_guia, String tipo_horario, String venta_empresa, String tipo_estado, String dateInicio, String cumplimiento, String cumple_resumen, String responsable) {
		//UserDTO principal = (UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		//log.info("user:allUsers Usuario Actual "+principal.getUsername());
		//log.info("posted"+posted);
		log.info("user:tipo_orden="+tipo_orden);
		log.info("user:tipo_venta="+ tipo_venta);
		log.info("user:cliente_retira="+cliente_retira);
		log.info("user:descripcion_empresa="+descripcion_empresa);
		log.info("user:tipo_guia="+tipo_guia);
		log.info("user:tipo_horario="+tipo_horario);
		log.info("user:venta_empresa="+venta_empresa);
		log.info("user:tipo_estado="+tipo_estado);
		log.info("user:dateInicio="+dateInicio);
		log.info("user:cumplimiento="+cumplimiento);
		log.info("user:cumple_resumen="+cumple_resumen);
		log.info("user:responsable="+responsable);    	
    	//UserDTO user = (UserDTO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Date dNow = new Date();
		SimpleDateFormat ft = new SimpleDateFormat ("dd/MM/yyyy");
		String currentDate = ft.format(dNow);
		log.info("currentDate="+currentDate);
		//log.info("Date="+DateUtils.turnDate(DateUtils.restarDiaFecha(currentDate,"1")));
		
		
		//String dateInicio =  dateInicio;
		//out.println("dateInicio="+dateInicio);
		
		String starttime = DateUtils.turnDate(dateInicio) != null?DateUtils.turnDate(dateInicio): DateUtils.turnDate(DateUtils.restarDiaFecha(currentDate,"1"));
		
		//String starttime = DateUtils.turnDate(dateInicio) != null?DateUtils.turnDate(dateInicio):DateUtils.turnDate(currentDate);
		//out.println("starttime"+starttime);
		log.info("user:starttime="+starttime);
		//log.info("user:starttime2="+starttime2);

		String orden = null;
		String venta = "";
		String guia = "";
		
		if (!"".equals(tipo_orden)) {
			orden = tipo_orden;
		} else {
			orden = null;
		}
		
		
		if (!"".equals(tipo_venta)) {
			venta = tipo_venta;
		} else {
			venta = null;
		}
		
		
		if (!"".equals(tipo_guia)) {
			guia = tipo_guia;
		} else {
			guia = null;
		}
		
		
		
		log.info("orden="+orden);
		log.info("venta="+venta);
		log.info("guia="+guia);
		
		
 		
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
		
		
		
		
 		
		String prefixclause = null;
		
		log.info("orden="+orden);
		log.info("venta="+venta);
		log.info("guia="+guia);
 		//cantidad Cumple
 		int cantCumple = cumplimientokpiWebServicesImpl.getCumpleokpiWebCounts(starttime, starttime, orden, venta, guia, "1", prefixclause);
 		//cantidad Atrasado
 		int cantAtrasado = cumplimientokpiWebServicesImpl.getCumpleokpiWebCounts(starttime, starttime, orden, venta, guia, "2", prefixclause);
 		//cantidad No cumple
 		int cantNoCumple = cumplimientokpiWebServicesImpl.getCumpleokpiWebCounts(starttime, starttime, orden, venta, guia, "3", prefixclause);
 		//Total cantidad
 		int cantTotal = cumplimientokpiWebServicesImpl.getTotalkpiWebCounts(starttime, starttime, orden, venta, guia, null, prefixclause);
 		
 		
 		float porcentajeCumple = 0;
		if (cantCumple == 0 && cantTotal == 0) {
			System.out.println("-");
			porcentajeCumple = 0;
		} else {
			porcentajeCumple = ((float ) ( (float ) cantCumple / (float )cantTotal) * 100);
			DecimalFormat df = new DecimalFormat("0.00"); 
			System.out.println("->"+df.format(porcentajeCumple));
		}
 		String sporcentajeCumple = Float.toString(porcentajeCumple);
 		
 		
 		float porcentajeAtrasado = 0;
		if (cantAtrasado == 0 && cantTotal == 0) {
			System.out.println("-");
			porcentajeAtrasado = 0;
		} else {
			porcentajeAtrasado = ((float ) ( (float ) cantAtrasado / (float )cantTotal) * 100);
			DecimalFormat df = new DecimalFormat("0.00"); 
			System.out.println("->"+df.format(porcentajeAtrasado));
		}
 		String sporcentajeAtrasado = Float.toString(porcentajeAtrasado);
		
 		
 		float porcentajeNoCumple = 0;
		if (cantNoCumple == 0 && cantTotal == 0) {
			System.out.println("-");
			porcentajeNoCumple = 0;
		} else {
			porcentajeNoCumple = ((float ) ( (float ) cantNoCumple / (float )cantTotal) * 100);
			DecimalFormat df = new DecimalFormat("0.00"); 
			System.out.println("->"+df.format(porcentajeNoCumple));
		}
 		String sporcentajeNoCumple = Float.toString(porcentajeNoCumple);
 		
 		
 		float porcentajeTotal = 0;
		if (cantTotal == 0) {
			System.out.println("-");
			porcentajeTotal = 0;
		} else {
			porcentajeTotal = ((float ) ( (float ) cantTotal / (float )cantTotal) * 100);
			DecimalFormat df = new DecimalFormat("0.00"); 
			System.out.println("->"+df.format(porcentajeTotal));
		}
 		String sporcentajeTotal = Float.toString(porcentajeTotal);
 		
 		
 		log.info("starttime="+ starttime);
 		log.info("cantCumple="+ cantCumple);
 		log.info("cantCumple="+ cantCumple);
 		log.info("==1=="+ StringUtils.Redondear(sporcentajeCumple,2));
 		
 		
 		
 		sporcentajeCumple.replace(".","");
 		log.info("==2=="+ sporcentajeCumple.replace(".",""));

 		
 		
 		
 		
 		log.info("porcentajeCumple=" + StringUtils.Redondear(String.valueOf(""+porcentajeCumple),2));
 		log.info("cantAtrasado="+ cantAtrasado);
 		log.info("cantNoCumple="+ cantNoCumple);
 		
 		Map<String, Object> model = new HashMap<String, Object>();
 		//model.put("posted", posted);//
 		model.put("cantCumple", cantCumple);//
 		model.put("porcentajeCumple", StringUtils.Redondear(sporcentajeCumple,2));//

 		model.put("cantAtrasado", cantAtrasado);//
 		model.put("porcentajeAtrasado", StringUtils.Redondear(sporcentajeAtrasado,2));//
 		
 		model.put("cantNoCumple", cantNoCumple);//
 		model.put("porcentajeNoCumple", StringUtils.Redondear(sporcentajeNoCumple,2));//

 		model.put("cantTotal", cantTotal);
 		model.put("porcentajeTotal", StringUtils.Redondear(sporcentajeTotal,2));//
 		model.put("test", sporcentajeCumple.replace(".",""));//
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
 		model.put("fecha", DateUtils.turnDate5(starttime));//
 		model.put("namePage", "panelEstatico");//
 		
 		
 		
 		return new ModelAndView("role/admin/cuadraturaventaenverdepd/cuadraturaVentaEnVerdePd", model);
     }
    
    
    
   

}
