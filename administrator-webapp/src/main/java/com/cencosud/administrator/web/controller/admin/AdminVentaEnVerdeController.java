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
import com.cencosud.administrator.core.util.PageNate;
import com.cencosud.administrator.dto.users.CuadraturaVentaVerdeDTO;
import com.cencosud.administrator.dto.users.HorarioActualizacionStockDTO;
import com.cencosud.administrator.web.utils.DateUtils;

/**
 * @description Clase controladora que administra los informes de Ordenes de Compra 
 */
@Controller
public class AdminVentaEnVerdeController {
	
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
    
    

    @RequestMapping(value = "admin/reporteCuadraturaVentaEnVerde", method = RequestMethod.GET)
    public ModelAndView reporteCuadraturaEnVerde(String posted, String dateInicio, String dateFin, String estado) {
		log.info("user:reporteCuadraturaVentaEnVerde");
		//UserDTO principal = (UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		//log.info("user:allUsers Usuario Actual "+principal.getUsername());
		log.info("user:posted="+posted);
		log.info("user:dateInicio="+dateInicio);
		log.info("user:dateFin="+ dateFin);
		log.info("estado="+estado);
		
		Date now = new Date();
 		SimpleDateFormat ft = new SimpleDateFormat ("dd/MM/yyyy");
 		String iFechaFin = ft.format(now);
 		log.info("home:posted="+posted);
 		log.info("home:dateInicio="+ dateInicio);
 		log.info("Function="+ DateUtils.restarDiaFecha(iFechaFin,"0"));
 		log.info("Function2="+ DateUtils.turnDate3(DateUtils.restarDiaFecha(iFechaFin,"0")));
 		//String starttime = DateUtils.turnDate3(dateInicio) != null?DateUtils.turnDate3(dateInicio):iFechaFin;
 		String starttime = DateUtils.turnDateVentaVerde(dateInicio) != null?DateUtils.turnDateVentaVerde(dateInicio):DateUtils.turnDateVentaVerde(iFechaFin);
		log.info("user:starttime="+starttime);

		List<HorarioActualizacionStockDTO> horarios = horarioActualizacionStockServicesImpl.getHorarioActualizacionStocks(0, 1);
		List<CuadraturaVentaVerdeDTO> listado = cuadraturaVentaVerdeServicesImpl.getCuadraturaVentaVerde(starttime,starttime, "1", 0, 100);
		
		int eom = cuadraturaVentaVerdeServicesImpl.getCuadraturaVentaVerdeContar(starttime+" 00:00:00",starttime+" 23:59:59", "1");
		int encontrado = cuadraturaVentaVerdeServicesImpl.getCuadraturaVentaVerdeContar(starttime+" 00:00:00",starttime+" 23:59:59", "2");
		int noEncontrado = cuadraturaVentaVerdeServicesImpl.getCuadraturaVentaVerdeContar(starttime+" 00:00:00",starttime+" 23:59:59", "3");
		int ocConError = cuadraturaVentaVerdeServicesImpl.getCuadraturaVentaVerdeContar(starttime+" 00:00:00",starttime+" 23:59:59", "4");
		int cantidadOc = cuadraturaVentaVerdeServicesImpl.getCuadraturaVentaVerdeContar(starttime+" 00:00:00",starttime+" 23:59:59", "5");

		log.info("eom="+eom);
		log.info("encontrado="+encontrado);
		log.info("noEncontrado="+noEncontrado);
		log.info("ocConError="+ocConError);
		log.info("cantidadOc="+cantidadOc);
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("posted", posted);//
		model.put("eom", eom);//
		model.put("encontrado", encontrado);//
		model.put("noEncontrado", noEncontrado);//
		model.put("ocConError", ocConError);//
		model.put("cantidadOc", cantidadOc);//
		model.put("horarios", horarios);//
		model.put("namePage", "ventaEnVerde");//
		
		
		return new ModelAndView("role/admin/cuadraturaventaenverde/reporteCuadraturaVentaEnVerde", model);
    }
    
    
    @RequestMapping(value = "admin/detalleOcEom", method = RequestMethod.GET)
    public ModelAndView detalleOC(Integer p,  String dateInicio, String estado_relacion) {
		log.info("user:detalleOC");
		//UserDTO principal = (UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		//log.info("user:allUsers Usuario Actual "+principal.getUsername());
		Date now = new Date();
 		SimpleDateFormat ft = new SimpleDateFormat ("dd/MM/yyyy");
 		String iFechaFin = ft.format(now);
		String fecha = ft.format(now);
		
		String starttime = dateInicio != null?dateInicio+" 00:00:00":null;
		String starttime2 = dateInicio != null?dateInicio+" 23:59:59":null;
		//String starttime2 = DateUtils.turnDate4(dateInicio) != null?DateUtils.turnDate4(dateInicio):DateUtils.turnDate4(iFechaFin);
		int total;
		log.info("p:"+p);
		log.info("home:dateInicio="+dateInicio);
 		log.info("home:estado_relacion="+estado_relacion);
		log.info("starttime="+starttime);
		log.info("starttime2="+starttime2);
		log.info("home:iFechaFin="+iFechaFin);
		log.info("home:fecha="+fecha);
		log.info("home:dateInicio="+ dateInicio);
		log.info("home:starttime="+ starttime);
		log.info("home:starttime2="+ starttime2);
		log.info("home:starttime2="+ starttime2);
		
		total = cuadraturaVentaVerdeServicesImpl.getCuadraturaVentaVerdePaginador(starttime,starttime2, "1");
		log.info("total:"+total);
		
		int pagelimit1 = 0;
		int pagelimit = pagelimit1 > 0?pagelimit1:25;
		int p1 = p != null?p:1;
		String qstr = "";
	
		
		if (dateInicio != null)
			qstr += "&dateInicio="+DateUtils.encode(dateInicio);
		else
			qstr += "";
		
		
		
		if (estado_relacion != null )
			qstr += "&estado_relacion="+estado_relacion;
		else
			qstr += "";
		
		
		
		log.info("qstr:"+qstr);
		PageNate pageNate = new PageNate(total, p1, pagelimit, "");
		pageNate.setURL("detalleOcEom", qstr);
		
		log.info("Start:"+pageNate.getStart());
		log.info("End:"+pageNate.getLimit());
		
		//List<CuadraturaVentaVerdeDTO> detalles = cuadraturaVentaVerdeServicesImpl.getCuadraturaVentaVerde(starttime,starttime2, "1", pageNate.getStart(), pageNate.getLimit());
		List<CuadraturaVentaVerdeDTO> detalles = cuadraturaVentaVerdeServicesImpl.getCuadraturaVentaVerde(starttime,starttime2, "1", 0, 1000000000);
		List<HorarioActualizacionStockDTO> horarios = horarioActualizacionStockServicesImpl.getHorarioActualizacionStocks(0, 1);

		int cantidad = cuadraturaVentaVerdeServicesImpl.getCuadraturaVentaVerdeContar(starttime,starttime2, "1");

		log.info("home:detalles="+ detalles);
		log.info("cantidad="+ cantidad);
		
 		Map<String, Object> model = new HashMap<String, Object>();
		model.put("cantidad", cantidad);//
		model.put("detalles", detalles);//
		model.put("fecha", DateUtils.turnDate5(starttime));//
		model.put("record", total);
		model.put("p", p);
		model.put("numpages", pageNate.getNumPages());
		model.put("pagelinks", pageNate.getPageLinks());
		model.put("horarios", horarios);//
		model.put("namePage", "ventaEnVerde");//
		return new ModelAndView("role/admin/cuadraturaventaenverde/detalleOcEom", model);
    }
    
    
    @RequestMapping(value = "admin/detalleOcEncontrado", method = RequestMethod.GET)
    public ModelAndView detalleOcEncontrado(Integer p, String posted, String dateInicio, String estado_relacion) {
		log.info("user:detalleOcEncontrado");
		//UserDTO principal = (UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		//log.info("user:allUsers Usuario Actual "+principal.getUsername());
		log.info("user:posted="+posted);
		log.info("user:dateInicio="+dateInicio);
		log.info("user:estado_relacion="+ estado_relacion);
		
		//Date dNow = new Date();
		//SimpleDateFormat ft = new SimpleDateFormat ("dd/MM/yyyy");
		//String currentDate = ft.format(dNow);
		
		Date now = new Date();
 		SimpleDateFormat ft = new SimpleDateFormat ("dd/MM/yyyy");
 		String iFechaFin = ft.format(now);
		String fecha = ft.format(now);
		
		String starttime = dateInicio != null?dateInicio+" 00:00:00":null;
		String starttime2 = dateInicio != null?dateInicio+" 23:59:59":null;
		//String starttime2 = DateUtils.turnDate4(dateInicio) != null?DateUtils.turnDate4(dateInicio):DateUtils.turnDate4(iFechaFin);
		int total;
		log.info("p:"+p);
		log.info("home:dateInicio="+dateInicio);
 		log.info("home:estado_relacion="+estado_relacion);
		log.info("starttime="+starttime);
		log.info("starttime2="+starttime2);
		log.info("home:iFechaFin="+iFechaFin);
		log.info("home:fecha="+fecha);
		log.info("home:dateInicio="+ dateInicio);
		log.info("home:starttime="+ starttime);
		log.info("home:starttime2="+ starttime2);
		log.info("home:starttime2="+ starttime2);
		
		total = cuadraturaVentaVerdeServicesImpl.getCuadraturaVentaVerdePaginador(starttime,starttime2, "2");
		log.info("total:"+total);
		
		int pagelimit1 = 0;
		int pagelimit = pagelimit1 > 0?pagelimit1:25;
		int p1 = p != null?p:1;
		String qstr = "";
	
		
		if (dateInicio != null)
			qstr += "&dateInicio="+DateUtils.encode(dateInicio);
		else
			qstr += "";
		
		
		
		if (estado_relacion != null )
			qstr += "&estado_relacion="+estado_relacion;
		else
			qstr += "";
		
		
		
		log.info("qstr:"+qstr);
		PageNate pageNate = new PageNate(total, p1, pagelimit, "");
		pageNate.setURL("detalleOcEncontrado", qstr);
		
		log.info("Start:"+pageNate.getStart());
		log.info("End:"+pageNate.getLimit());

		//Oc Encontrado
		//List<CuadraturaVentaVerdeDTO> detalles = cuadraturaVentaVerdeServicesImpl.getCuadraturaVentaVerde(starttime,starttime2, "2", pageNate.getStart(), pageNate.getLimit()); 
		List<CuadraturaVentaVerdeDTO> detalles = cuadraturaVentaVerdeServicesImpl.getCuadraturaVentaVerde(starttime,starttime2, "2", 0, 1000000000); 
		List<HorarioActualizacionStockDTO> horarios = horarioActualizacionStockServicesImpl.getHorarioActualizacionStocks(0, 1);
		
		
		int cantidad = cuadraturaVentaVerdeServicesImpl.getCuadraturaVentaVerdeContar(starttime,starttime2, "2");

		log.info("home:detalles="+ detalles);
		log.info("cantidad="+ cantidad);
		
 		Map<String, Object> model = new HashMap<String, Object>();
		model.put("cantidad", cantidad);//
		model.put("detalles", detalles);//
		model.put("fecha", DateUtils.turnDate5(starttime));//
		model.put("record", total);
		model.put("p", p);
		model.put("numpages", pageNate.getNumPages());
		model.put("pagelinks", pageNate.getPageLinks());
		model.put("horarios", horarios);//
		model.put("namePage", "ventaEnVerde");//
		return new ModelAndView("role/admin/cuadraturaventaenverde/detalleOcEncontrado", model);
    }
    
    
    @RequestMapping(value = "admin/detalleOcNoEncontrado", method = RequestMethod.GET)
    public ModelAndView detalleOcNoEncontrado(Integer p, String posted, String dateInicio, String estado_relacion) {
		log.info("user:detalleOcNoEncontrado");
		//UserDTO principal = (UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		//log.info("user:allUsers Usuario Actual "+principal.getUsername());
		log.info("user:posted="+posted);
		log.info("user:dateInicio="+dateInicio);
		log.info("user:estado_relacion="+ estado_relacion);
		
		//Date dNow = new Date();
		//SimpleDateFormat ft = new SimpleDateFormat ("dd/MM/yyyy");
		//String currentDate = ft.format(dNow);
		
		Date now = new Date();
 		SimpleDateFormat ft = new SimpleDateFormat ("dd/MM/yyyy");
 		String iFechaFin = ft.format(now);
		String fecha = ft.format(now);
		
		String starttime = dateInicio != null?dateInicio+" 00:00:00":null;
		String starttime2 = dateInicio != null?dateInicio+" 23:59:59":null;
		//String starttime2 = DateUtils.turnDate4(dateInicio) != null?DateUtils.turnDate4(dateInicio):DateUtils.turnDate4(iFechaFin);
		int total;
		log.info("p:"+p);
		log.info("home:dateInicio="+dateInicio);
 		log.info("home:estado_relacion="+estado_relacion);
		log.info("starttime="+starttime);
		log.info("starttime2="+starttime2);
		log.info("home:iFechaFin="+iFechaFin);
		log.info("home:fecha="+fecha);
		log.info("home:dateInicio="+ dateInicio);
		log.info("home:starttime="+ starttime);
		log.info("home:starttime2="+ starttime2);
		log.info("home:starttime2="+ starttime2);
		
		total = cuadraturaVentaVerdeServicesImpl.getCuadraturaVentaVerdePaginador(starttime,starttime2, "3");
		log.info("total:"+total);
		
		int pagelimit1 = 0;
		int pagelimit = pagelimit1 > 0?pagelimit1:25;
		int p1 = p != null?p:1;
		String qstr = "";
	
		
		if (dateInicio != null)
			qstr += "&dateInicio="+DateUtils.encode(dateInicio);
		else
			qstr += "";
		
		
		
		if (estado_relacion != null )
			qstr += "&estado_relacion="+estado_relacion;
		else
			qstr += "";
		
		
		
		log.info("qstr:"+qstr);
		PageNate pageNate = new PageNate(total, p1, pagelimit, "");
		pageNate.setURL("detalleOcNoEncontrado", qstr);
		
		log.info("Start:"+pageNate.getStart());
		log.info("End:"+pageNate.getLimit());

		//Oc No Encontrado
		//List<CuadraturaVentaVerdeDTO> detalles = cuadraturaVentaVerdeServicesImpl.getCuadraturaVentaVerde(starttime,starttime2, "3", pageNate.getStart(), pageNate.getLimit()); 
		List<CuadraturaVentaVerdeDTO> detalles = cuadraturaVentaVerdeServicesImpl.getCuadraturaVentaVerde(starttime,starttime2, "3", 0, 1000000000); 
		List<HorarioActualizacionStockDTO> horarios = horarioActualizacionStockServicesImpl.getHorarioActualizacionStocks(0, 1);
		
		
		int cantidad = cuadraturaVentaVerdeServicesImpl.getCuadraturaVentaVerdeContar(starttime,starttime2, "3");

		log.info("home:detalles="+ detalles);
		log.info("cantidad="+ cantidad);
		
 		Map<String, Object> model = new HashMap<String, Object>();
		model.put("cantidad", cantidad);//
		model.put("detalles", detalles);//
		model.put("fecha", DateUtils.turnDate5(starttime));//
		model.put("record", total);
		model.put("p", p);
		model.put("numpages", pageNate.getNumPages());
		model.put("pagelinks", pageNate.getPageLinks());
		model.put("horarios", horarios);//
		model.put("namePage", "ventaEnVerde");//
		return new ModelAndView("role/admin/cuadraturaventaenverde/detalleOcNoEncontrado", model);
    }
    
    @RequestMapping(value = "admin/detalleOcConError", method = RequestMethod.GET)
    public ModelAndView detalleOcConError(Integer p, String posted, String dateInicio, String estado_relacion) {
		log.info("user:detalleOcConError");
		//UserDTO principal = (UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		//log.info("user:allUsers Usuario Actual "+principal.getUsername());
		log.info("user:posted="+posted);
		log.info("user:dateInicio="+dateInicio);
		log.info("user:estado_relacion="+ estado_relacion);
		
		//Date dNow = new Date();
		//SimpleDateFormat ft = new SimpleDateFormat ("dd/MM/yyyy");
		//String currentDate = ft.format(dNow);
		
		Date now = new Date();
 		SimpleDateFormat ft = new SimpleDateFormat ("dd/MM/yyyy");
 		String iFechaFin = ft.format(now);
		String fecha = ft.format(now);
		
		String starttime = dateInicio != null?dateInicio+" 00:00:00":null;
		String starttime2 = dateInicio != null?dateInicio+" 23:59:59":null;
		//String starttime2 = DateUtils.turnDate4(dateInicio) != null?DateUtils.turnDate4(dateInicio):DateUtils.turnDate4(iFechaFin);
		int total;
		log.info("p:"+p);
		log.info("home:dateInicio="+dateInicio);
 		log.info("home:estado_relacion="+estado_relacion);
		log.info("starttime="+starttime);
		log.info("starttime2="+starttime2);
		log.info("home:iFechaFin="+iFechaFin);
		log.info("home:fecha="+fecha);
		log.info("home:dateInicio="+ dateInicio);
		log.info("home:starttime="+ starttime);
		log.info("home:starttime2="+ starttime2);
		log.info("home:starttime2="+ starttime2);
		
		total = cuadraturaVentaVerdeServicesImpl.getCuadraturaVentaVerdePaginador(starttime,starttime2, "4");
		log.info("total:"+total);
		
		int pagelimit1 = 0;
		int pagelimit = pagelimit1 > 0?pagelimit1:25;
		int p1 = p != null?p:1;
		String qstr = "";
	
		
		if (dateInicio != null)
			qstr += "&dateInicio="+DateUtils.encode(dateInicio);
		else
			qstr += "";
		
		
		
		if (estado_relacion != null )
			qstr += "&estado_relacion="+estado_relacion;
		else
			qstr += "";
		
		
		
		log.info("qstr:"+qstr);
		PageNate pageNate = new PageNate(total, p1, pagelimit, "");
		pageNate.setURL("detalleOcConError", qstr);
		
		log.info("Start:"+pageNate.getStart());
		log.info("End:"+pageNate.getLimit());

		//Oc No Encontrado
		//List<CuadraturaVentaVerdeDTO> detalles = cuadraturaVentaVerdeServicesImpl.getCuadraturaVentaVerde(starttime,starttime2, "4", pageNate.getStart(), pageNate.getLimit()); 
		List<CuadraturaVentaVerdeDTO> detalles = cuadraturaVentaVerdeServicesImpl.getCuadraturaVentaVerde(starttime,starttime2, "4", 0, 1000000000); 
		List<HorarioActualizacionStockDTO> horarios = horarioActualizacionStockServicesImpl.getHorarioActualizacionStocks(0, 1);
		
		
		int cantidad = cuadraturaVentaVerdeServicesImpl.getCuadraturaVentaVerdeContar(starttime,starttime2, "4");

		log.info("home:detalles="+ detalles);
		log.info("cantidad="+ cantidad);
		
 		Map<String, Object> model = new HashMap<String, Object>();
		model.put("cantidad", cantidad);//
		model.put("detalles", detalles);//
		model.put("fecha", DateUtils.turnDate5(starttime));//
		model.put("record", total);
		model.put("p", p);
		model.put("numpages", pageNate.getNumPages());
		model.put("pagelinks", pageNate.getPageLinks());
		model.put("horarios", horarios);//
		model.put("namePage", "ventaEnVerde");//
		return new ModelAndView("role/admin/cuadraturaventaenverde/detalleOcConError", model);
    }
    
    @RequestMapping(value = "admin/detalleCantidaOc", method = RequestMethod.GET)
    public ModelAndView detalleCantidaOc(Integer p, String posted, String dateInicio, String estado_relacion) {
		log.info("user:detalleCantidaOc");
		//UserDTO principal = (UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		//log.info("user:allUsers Usuario Actual "+principal.getUsername());
		log.info("user:posted="+posted);
		log.info("user:dateInicio="+dateInicio);
		log.info("user:estado_relacion="+ estado_relacion);
		
		//Date dNow = new Date();
		//SimpleDateFormat ft = new SimpleDateFormat ("dd/MM/yyyy");
		//String currentDate = ft.format(dNow);
		
		Date now = new Date();
 		SimpleDateFormat ft = new SimpleDateFormat ("dd/MM/yyyy");
 		String iFechaFin = ft.format(now);
		String fecha = ft.format(now);
		
		String starttime = dateInicio != null?dateInicio+" 00:00:00":null;
		String starttime2 = dateInicio != null?dateInicio+" 23:59:59":null;
		//String starttime2 = DateUtils.turnDate4(dateInicio) != null?DateUtils.turnDate4(dateInicio):DateUtils.turnDate4(iFechaFin);
		int total;
		log.info("p:"+p);
		log.info("home:dateInicio="+dateInicio);
 		log.info("home:estado_relacion="+estado_relacion);
		log.info("starttime="+starttime);
		log.info("starttime2="+starttime2);
		log.info("home:iFechaFin="+iFechaFin);
		log.info("home:fecha="+fecha);
		log.info("home:dateInicio="+ dateInicio);
		log.info("home:starttime="+ starttime);
		log.info("home:starttime2="+ starttime2);
		log.info("home:starttime2="+ starttime2);
		
		total = cuadraturaVentaVerdeServicesImpl.getCuadraturaVentaVerdePaginador(starttime,starttime2, "5");
		log.info("total:"+total);
		
		int pagelimit1 = 0;
		int pagelimit = pagelimit1 > 0?pagelimit1:25;
		int p1 = p != null?p:1;
		String qstr = "";
	
		
		if (dateInicio != null)
			qstr += "&dateInicio="+DateUtils.encode(dateInicio);
		else
			qstr += "";
		
		
		
		if (estado_relacion != null )
			qstr += "&estado_relacion="+estado_relacion;
		else
			qstr += "";
		
		
		
		log.info("qstr:"+qstr);
		PageNate pageNate = new PageNate(total, p1, pagelimit, "");
		pageNate.setURL("detalleCantidaOc", qstr);
		
		log.info("Start:"+pageNate.getStart());
		log.info("End:"+pageNate.getLimit());

		//Oc No Encontrado
		//List<CuadraturaVentaVerdeDTO> detalles = cuadraturaVentaVerdeServicesImpl.getCuadraturaVentaVerde(starttime,starttime2, "5", pageNate.getStart(), pageNate.getLimit()); 
		List<CuadraturaVentaVerdeDTO> detalles = cuadraturaVentaVerdeServicesImpl.getCuadraturaVentaVerde(starttime,starttime2, "5", 0, 1000000000); 
		List<HorarioActualizacionStockDTO> horarios = horarioActualizacionStockServicesImpl.getHorarioActualizacionStocks(0, 1);

		int cantidad = cuadraturaVentaVerdeServicesImpl.getCuadraturaVentaVerdeContar(starttime,starttime2, "5");

		log.info("home:detalles="+ detalles);
		log.info("cantidad="+ cantidad);
		
 		Map<String, Object> model = new HashMap<String, Object>();
		model.put("cantidad", cantidad);//
		model.put("detalles", detalles);//
		model.put("fecha", DateUtils.turnDate5(starttime));//
		model.put("record", total);
		model.put("p", p);
		model.put("numpages", pageNate.getNumPages());
		model.put("pagelinks", pageNate.getPageLinks());
		model.put("horarios", horarios);//
		model.put("namePage", "ventaEnVerde");//
		return new ModelAndView("role/admin/cuadraturaventaenverde/detalleCantidaOc", model);
    }
    
    
   

}
