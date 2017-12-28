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
import com.cencosud.administrator.core.HorarioTrazabilidadActualizacionServices;
import com.cencosud.administrator.core.HorarioVentaEnVerdeActualizacionServices;
import com.cencosud.administrator.core.TipoEstadoVentaEnVerdeServices;
//import com.cencosud.administrator.core.RoleServices;
import com.cencosud.administrator.core.TipoGuiaServices;
import com.cencosud.administrator.core.TipoOrdenServices;
import com.cencosud.administrator.core.TipoVentaServices;
import com.cencosud.administrator.core.UserServices;
import com.cencosud.administrator.core.VentaEmpresaServices;
import com.cencosud.administrator.core.util.PageNate;
import com.cencosud.administrator.dto.users.EcommerceSoporteVentaDTO;
import com.cencosud.administrator.dto.users.HorarioTrazabilidadActualizacionDTO;
import com.cencosud.administrator.web.utils.DateUtils;

/**
 * @description Clase controladora que administra los informes de Ordenes de Compra 
 */
@Controller
public class AdminTrazabilidadController {
	
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
   	private HorarioTrazabilidadActualizacionServices horarioTrazabilidadActualizacionServicesImpl;
   
    
    

    @RequestMapping(value = "admin/trazabilidad", method = RequestMethod.GET)
    public ModelAndView trazabilidad(String posted, String fromstatsday_sday, String fromstatsmonth_sday, String dateInicio) {
    	log.info("home:trazabilidad");
    	//UserDTO user = (UserDTO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	Date now = new Date();
 		SimpleDateFormat ft = new SimpleDateFormat ("dd/MM/yyyy");
 		String iFechaFin = ft.format(now);
 		log.info("home:posted="+posted);
 		log.info("home:fromstatsday_sday="+fromstatsday_sday);
 		log.info("home:fromstatsmonth_sday="+ fromstatsmonth_sday);
 		log.info("home:dateInicio="+ dateInicio);
 		log.info("Function="+ DateUtils.restarDiaFecha(iFechaFin,"0"));
 		log.info("Function2="+ DateUtils.turnDate3(DateUtils.restarDiaFecha(iFechaFin,"0")));
 		//String starttime = DateUtils.turnDate3(dateInicio) != null?DateUtils.turnDate3(dateInicio):iFechaFin;
 		String starttime = DateUtils.turnDate3(dateInicio) != null?DateUtils.turnDate3(dateInicio):DateUtils.turnDate3(DateUtils.restarDiaFecha(iFechaFin,"1"));

 		log.info("home:starttime="+ starttime);
 		//cantida soporte venta
 		int cantSoporte = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaCounts(starttime, null, "2", "0", null, "99999999");

 		//Eom Encontrados (Soporte de venta se debería buscar con la query EOM (OD_EOM- SKU) )
 		//int cantSoporteVentaEomFind = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaEomFindCounts(starttime, null, "3", "0", null, null, "99999999");
 		int cantSoporteVentaEomFind = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaEomFindCounts(starttime, "1", "3", "0", null, null, "99999999");
 		
 		//Diferencias Eom No encontrados 
 		//int cantSoporteVentaEomDif = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaEomDifCounts(starttime, null, "3", "0", null, null, null);
 		int cantSoporteVentaEomDif = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaEomDifCounts(starttime, "0", "3", null, null, null, null);

 		//Diferencias Wms No encontrados 
 		int cantSoporteVentaWms = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaWmsCounts(starttime, "1", "4", null, null, null);
 		int cantSoporteVentaWmsDif = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaWmsDifCounts(starttime, "1", "4", null, null, null);

 		//Diferencias Jda No encontrados 
 		int cantSoporteVentaJda = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaJdaCounts(starttime, "1", "4", null, null, null);
 		int cantSoporteVentaJdaDif = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaJdaDifCounts(starttime, "1", "4", null, null, null);

 		List<HorarioTrazabilidadActualizacionDTO> horarios = horarioTrazabilidadActualizacionServicesImpl.getHorarioTrazabilidadActualizacions(0, 1);
 		
 		log.info("cantSoporte="+ cantSoporte);
 		log.info("cantSoporteVentaEomFind="+ cantSoporteVentaEomFind);
 		log.info("cantSoporteVentaEomDif="+ cantSoporteVentaEomDif);
 		log.info("cantSoporteVentaWms="+ cantSoporteVentaWms);
 		log.info("cantSoporteVentaWmsDif="+ cantSoporteVentaWmsDif);
 		log.info("cantSoporteVentaJda="+ cantSoporteVentaJda);
 		log.info("cantSoporteVentaJdaDif="+ cantSoporteVentaJdaDif);
 		
 		

 		Map<String, Object> model = new HashMap<String, Object>();
 		model.put("posted", posted);//
 		model.put("cantSoporte", cantSoporte);//
 		model.put("cantSoporteVentaEomFind", cantSoporteVentaEomFind);//
 		model.put("cantSoporteVentaEomDif", cantSoporteVentaEomDif);//
 		model.put("cantSoporteVentaWms", cantSoporteVentaWms);//
 		model.put("cantSoporteVentaWmsDif", cantSoporteVentaWmsDif);//
 		model.put("cantSoporteVentaJda", cantSoporteVentaJda);//
 		model.put("cantSoporteVentaJdaDif", cantSoporteVentaJdaDif);//
 		model.put("fecha", DateUtils.turnDate5(starttime));//
 		model.put("namePage", "trazabilidad");//
 		model.put("horarios", horarios);//
 		return new ModelAndView("role/admin/trazabilidad/trazabilidad", model);
     }
    
    @RequestMapping(value = "admin/soporteVentaDetalle", method = RequestMethod.GET)
    public ModelAndView soporteVentaDetalle(String dateInicio, String estado) {
    	log.info("home:soporteVentaDetalle");
    	//UserDTO user = (UserDTO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	Date now = new Date();
 		SimpleDateFormat ft = new SimpleDateFormat ("yyyyMMdd");
 		String iFechaFin = ft.format(now);
 		String starttime = dateInicio;
 		
 		if ( (dateInicio != null && dateInicio != "")){
 			 starttime = dateInicio;
 		} else {
 			 starttime = iFechaFin;
 		}
 		log.info("home:dateInicio="+ dateInicio);
 		
 		
 		//Post Jhonson
 		int cantSoporteVentaPosJhonson = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaCountsPosJhonson(starttime, null, "2", "0", "400", "99999999");
 		//Post Paris
 		int cantSoporteVentaPosParis = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaCountsPosParis(starttime, null, "2", "0", "400", "99999999");
 		//Paris.cl
 		int cantSoporteVentaPosParisCl = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaCountsPosParisCl(starttime, null, "2", "0", "32", "99999999");
 		//Diferencias Soporte Ventas VS Ecommerce
 		int dif = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaCounts(starttime, "0", "1", null, null, null);
 		//cantidad Ecommerce
 		int cantEcommerce = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaCounts(starttime, null, "1", null, null, "99999999");
 		
 		List<HorarioTrazabilidadActualizacionDTO> horarios = horarioTrazabilidadActualizacionServicesImpl.getHorarioTrazabilidadActualizacions(0, 1);
 		
 		
 		log.info("home:starttime="+ starttime);
 		log.info("home:iFechaFin="+ iFechaFin);
 		log.info("home:cantSoporteVentaPosJhonson="+ cantSoporteVentaPosJhonson);
 		log.info("home:cantSoporteVentaPosParis="+ cantSoporteVentaPosParis);
 		log.info("home:cantSoporteVentaPosParisCl="+ cantSoporteVentaPosParisCl);
 		log.info("home:ecommerceSoporteVentaServicesImpl="+ ecommerceSoporteVentaServicesImpl);
 		Map<String, Object> model = new HashMap<String, Object>();
 		model.put("cantSoporteVentaPosJhonson", cantSoporteVentaPosJhonson);//
 		model.put("cantSoporteVentaPosParis", cantSoporteVentaPosParis);//
		model.put("cantSoporteVentaPosParisCl", cantSoporteVentaPosParisCl);//
		model.put("dif", dif);//
		model.put("cantEcommerce", cantEcommerce);//
 		model.put("fecha", DateUtils.turnDate5(starttime));//
 		model.put("namePage", "trazabilidad");//
 		model.put("horarios", horarios);//
 		return new ModelAndView("role/admin/trazabilidad/soporteVentaDetalle", model);
     }
    
    
    @RequestMapping(value = "admin/detalleNoEncontradoSoporteVenta", method = RequestMethod.GET)
	public ModelAndView detalleNoEncontradoSoporteVenta(Integer p, String dateInicio, String estado) {
    	log.info("home:detalleNoEncontradoSoporteVenta");
    	
 		Date now = new Date();
		SimpleDateFormat ft = new SimpleDateFormat ("YYYYMMdd");
		String iFechaFin = ft.format(now);
		String fecha = ft.format(now);
		String dateInicio2 = null;
		int total;
		if ("".equals(dateInicio) || dateInicio == null ) {
			dateInicio2 = iFechaFin;
			
			
		} else {
			dateInicio2 = dateInicio;
		}
		log.info("dateInicio2:"+dateInicio2);
		
		String starttime = dateInicio2;
		String starttime2 = DateUtils.turnDate4(dateInicio2) != null?DateUtils.turnDate4(dateInicio2):DateUtils.turnDate4(iFechaFin);

		log.info("home:starttime="+starttime);
		log.info("home:dateInicio="+dateInicio);
 		log.info("home:estado="+estado);
		log.info("home:starttime="+DateUtils.restarDiaFecha2(fecha,"0"));
		log.info("home:fecha="+fecha);
		log.info("home:estado="+estado);
		log.info("home:dateInicio="+ dateInicio);
		log.info("home:starttime="+ starttime);
		log.info("home:starttime2="+ starttime2);
		
		total = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaPaginador(starttime, "0", "1", null, null);
		log.info("total="+ total);
		
		
		int pagelimit1 = 0;
		int pagelimit = pagelimit1 > 0?pagelimit1:25;
		int p1 = p != null?p:1;
		String qstr = "";
		
		
		if (dateInicio != null)
			qstr += "&dateInicio="+DateUtils.encode(dateInicio);
		else
			qstr += "";
		
		if (estado != null)
			qstr += "&estado="+estado;
		else
			qstr += "";
		
		
		
		log.info("qstr:"+qstr);
		PageNate pageNate = new PageNate(total, p1, pagelimit, "");
		pageNate.setURL("detalleNoEncontradoSoporteVenta", qstr);
		
		log.info("getStart:"+pageNate.getStart());
		log.info("getLimit:"+pageNate.getLimit());

		
		
		List<EcommerceSoporteVentaDTO> detalles = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentas(starttime, "0", "1", null, null, 0, 1000000000);
		
		
		
		int cantEcommerce = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaCounts(starttime, "0", "1", null, null, null);
		int cantSoporte = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaCounts(starttime, "0", "1", null, null, "99999999");
		int cantSoporteVentaNoEncontrados = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaCounts(starttime, "0", "1", null, null, null);
		int cantSoporteVentaEncontrados = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaCounts(starttime, "1", "1", null, null, null);
		int cantSoporteVenta = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaCounts(starttime, null, "2", null, null, null);
		List<HorarioTrazabilidadActualizacionDTO> horarios = horarioTrazabilidadActualizacionServicesImpl.getHorarioTrazabilidadActualizacions(0, 1);
 		
		log.info("home:starttime="+ starttime);
 		log.info("home:cantEcommerce="+ cantEcommerce);
 		log.info("home:cantSoporte="+ cantSoporte);
 		log.info("home:cantSoporteVentaNoEncontrados="+ cantSoporteVentaNoEncontrados);
 		log.info("home:cantSoporteVentaEncontrados="+ cantSoporteVentaEncontrados);
 		log.info("home:cantSoporteVenta="+ cantSoporteVenta);
 		
 		Map<String, Object> model = new HashMap<String, Object>();
		model.put("cantEcommerce", cantEcommerce);//
		model.put("cantSoporte", cantSoporte);//
		model.put("cantSoporteVentaNoEncontrados", cantSoporteVentaNoEncontrados);//
		model.put("cantSoporteVentaEncontrados", cantSoporteVentaEncontrados);//
		model.put("cantSoporteVenta", cantSoporteVenta);//
		model.put("detalles", detalles);//
		model.put("fecha", DateUtils.turnDate5(starttime));//
		
		
		model.put("record", total);
		model.put("p", p);
		model.put("numpages", pageNate.getNumPages());
		model.put("pagelinks", pageNate.getPageLinks());
		model.put("namePage", "trazabilidad");//
		model.put("horarios", horarios);//
		return new ModelAndView("role/admin/trazabilidad/detalleNoEncontradoSoporteVenta", model);
    }
    
    
    @RequestMapping(value = "admin/eom", method = RequestMethod.GET)
    public ModelAndView eom(String posted, String fromstatsday_sday, String fromstatsmonth_sday, String dateInicio) {
    	log.info("home:eom");
    	//UserDTO user = (UserDTO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	log.info("home:posted="+posted);
 		log.info("home:fromstatsday_sday="+fromstatsday_sday);
 		log.info("home:fromstatsmonth_sday="+ fromstatsmonth_sday);
 		log.info("home:dateInicio="+ dateInicio);
 		Date now = new Date();
 		SimpleDateFormat ft = new SimpleDateFormat ("dd/MM/yyyy");
 		String iFechaFin = ft.format(now);
 		String dateInicio2 = null;
 		if ("".equals(dateInicio) || dateInicio == null ) {
			dateInicio2 = iFechaFin;
			
			
		} else {
			dateInicio2 = dateInicio;
		}
		log.info("dateInicio2:"+dateInicio2);
 		
 		log.info("home:Function="+ DateUtils.restarDiaFecha(iFechaFin,"0"));
 		log.info("home:Function2="+ DateUtils.turnDate3(DateUtils.restarDiaFecha(iFechaFin,"0")));
 		String starttime = dateInicio2 != null?dateInicio2:DateUtils.turnDate3(DateUtils.restarDiaFecha(iFechaFin,"0"));
 		//String fecha, String estado, String estadoRelacion, String coddesp, String canVend, String subEstoc, String sku
 		//int dif = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaEomDifCounts(starttime, null, "3", "0", null, "4", "99999999");
 		//int dif = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaEomDifCounts(starttime, "0", "3", "0", null, null, "99999999");
 		int dif = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaEomDifCounts(starttime, "0", "3", "0", null, null, "99999999");
 		int bopis = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaCountsEomDad(starttime, "1", "3", "0", null, "1", "99999999");
 		int clickAndCollect = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaCountsEomDad(starttime,"1", "3", "0", null, "2", "99999999");
 		int dad = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaCountsEomDad(starttime, "1", "3", "0", null, "3", "99999999");
 		
 		List<HorarioTrazabilidadActualizacionDTO> horarios = horarioTrazabilidadActualizacionServicesImpl.getHorarioTrazabilidadActualizacions(0, 1);
 		
 		
 		log.info("home:starttime="+ starttime);
 		log.info("home:bopis="+ bopis);
 		log.info("home:clickAndCollect="+ clickAndCollect);
 		log.info("home:dad="+ dad);
 		log.info("home:dif="+ dif);
 		
 		Map<String, Object> model = new HashMap<String, Object>();
 		model.put("dif", dif);//
 		model.put("bopis", bopis);//
 		model.put("bopis", bopis);//
 		model.put("clickAndCollect", clickAndCollect);//
 		model.put("dad", dad);//
 		model.put("starttime", starttime);//
 		model.put("fecha", DateUtils.turnDate5(starttime));//
 		model.put("namePage", "trazabilidad");// 		
 		model.put("horarios", horarios);//
 		return new ModelAndView("role/admin/trazabilidad/eom", model);
     }
    
    @RequestMapping(value = "admin/detalleNoEncontradoSoporteVentaEom", method = RequestMethod.GET)
	public ModelAndView detalleNoEncontradoSoporteVentaEom(Integer p, String dateInicio, String estado) {
    	log.info("home:detalleNoEncontradoSoporteVentaEom");
    	//UserDTO user = (UserDTO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	log.info("p:"+p);
    	log.info("home:dateInicio="+dateInicio);
 		log.info("home:estado="+estado);
 		
 		
 		Date now = new Date();
		SimpleDateFormat ft = new SimpleDateFormat ("YYYYMMdd");
		String iFechaFin = ft.format(now);
		String fecha = ft.format(now);
		String dateInicio2 = null;
		int total;
		
		
		if ("".equals(dateInicio) || dateInicio == null ) {
			dateInicio2 = iFechaFin;
			
			
		} else {
			dateInicio2 = dateInicio;
		}
		log.info("dateInicio2:"+dateInicio2);
		
		
		
		log.info("home:starttime="+DateUtils.restarDiaFecha2(fecha,"0"));
		String starttime = dateInicio2;
		log.info("home:starttime="+starttime);
		String starttime2 = DateUtils.turnDate4(dateInicio2) != null?DateUtils.turnDate4(dateInicio2):DateUtils.turnDate4(iFechaFin);
		log.info("home:fecha="+fecha);
		log.info("home:estado="+estado);
		log.info("home:dateInicio="+ dateInicio);
		log.info("home:starttime="+ starttime);
		log.info("home:starttime2="+ starttime2);

		total = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaEomDifPaginador(starttime, "0", "3", "0", null, null, "99999999");
		log.info("total="+total);
		int pagelimit1 = 0;
		int pagelimit = pagelimit1 > 0?pagelimit1:25;
		int p1 = p != null?p:1;
		String qstr = "";
		
		
		if (dateInicio != null)
			qstr += "&dateInicio="+DateUtils.encode(dateInicio);
		else
			qstr += "";
		
		if (estado != null)
			qstr += "&estado="+estado;
		else
			qstr += "";
		
	
		
		log.info("qstr:"+qstr);
		PageNate pageNate = new PageNate(total, p1, pagelimit, "");
		pageNate.setURL("detalleNoEncontradoSoporteVentaEom", qstr);
		
		
		List<EcommerceSoporteVentaDTO> detalles = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaEomDifs(starttime, "0", "3", "0", null, null, "99999999", 0, 1000000000);
		int cantEcommerce = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaCounts(starttime, "0", "1", null, null, null);
		int cantSoporte = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaCounts(starttime, "0", "1", null, null, "99999999");
		//int cantSoporteVentaNoEncontrados = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaCounts(starttime, "0", "1", null, null);
		//int cantSoporteVentaNoEncontrados = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaEomDifCounts(starttime, null, "3", "0", null, "4", "99999999");
		int cantSoporteVentaNoEncontrados = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaEomDifCounts(starttime, "0", "3", "0", null, null, "99999999");
		int cantSoporteVentaEncontrados = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaCounts(starttime, "1", "1", null, null, null);
		int cantSoporteVenta = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaCounts(starttime, null, "2", null, null, "99999999");
		List<HorarioTrazabilidadActualizacionDTO> horarios = horarioTrazabilidadActualizacionServicesImpl.getHorarioTrazabilidadActualizacions(0, 1);
 		
		log.info("home:starttime="+ starttime);
 		log.info("home:cantEcommerce="+ cantEcommerce);
 		log.info("home:cantSoporte="+ cantSoporte);
 		log.info("home:cantSoporteVentaNoEncontrados="+ cantSoporteVentaNoEncontrados);
 		log.info("home:cantSoporteVentaEncontrados="+ cantSoporteVentaEncontrados);
 		log.info("home:cantSoporteVenta="+ cantSoporteVenta);
 		
 		Map<String, Object> model = new HashMap<String, Object>();
		model.put("cantEcommerce", cantEcommerce);//
		model.put("cantSoporte", cantSoporte);//
		model.put("cantSoporteVentaNoEncontrados", cantSoporteVentaNoEncontrados);//
		model.put("cantSoporteVentaEncontrados", cantSoporteVentaEncontrados);//
		model.put("cantSoporteVenta", cantSoporteVenta);//
		model.put("detalles", detalles);//
		model.put("fecha", DateUtils.turnDate5(starttime));//
		model.put("record", total);
		model.put("p", p);
		model.put("numpages", pageNate.getNumPages());
		model.put("pagelinks", pageNate.getPageLinks());
		model.put("namePage", "trazabilidad");//		
		model.put("horarios", horarios);//
		return new ModelAndView("role/admin/trazabilidad/detalleNoEncontradoSoporteVentaEom", model);
    }
    
    @RequestMapping(value = "admin/detalleNoEncontradoWms", method = RequestMethod.GET)
	public ModelAndView detalleNoEncontradoWms(Integer p, String dateInicio, String estado) {
    	log.info("home:detalleNoEncontradoWms");
    	//UserDTO user = (UserDTO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	Date now = new Date();
		SimpleDateFormat ft = new SimpleDateFormat ("YYYYMMdd");
		String iFechaFin = ft.format(now);
		String fecha = ft.format(now);
		String dateInicio2 = null;
		
		if ("".equals(dateInicio) || dateInicio == null ) {
			dateInicio2 = iFechaFin;
			
			
		} else {
			dateInicio2 = dateInicio;
		}
		log.info("dateInicio2:"+dateInicio2);
		
		String starttime = dateInicio2;
		String starttime2 = null;//DateUtils.turnDate4(dateInicio) != null?DateUtils.turnDate4(dateInicio):DateUtils.turnDate4(iFechaFin);
		int total;
		log.info("p:"+p);
		log.info("home:dateInicio="+dateInicio);
 		log.info("home:estado="+estado);
		log.info("starttime="+starttime);
		log.info("starttime2="+starttime2);
		log.info("home:iFechaFin="+iFechaFin);
		log.info("home:fecha="+fecha);
		log.info("home:estado="+estado);
		log.info("home:dateInicio="+ dateInicio);
		log.info("home:starttime="+ starttime);
		log.info("home:starttime2="+ starttime2);
		log.info("home:starttime2="+ starttime2);
		
		
		total = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaWmsDifPaginador(starttime, "1", "4", null, null, null, null);
		log.info("total:"+total);
		
		int pagelimit1 = 0;
		int pagelimit = pagelimit1 > 0?pagelimit1:25;
		int p1 = p != null?p:1;
		String qstr = "";
	
		
		if (dateInicio != null)
			qstr += "&dateInicio="+DateUtils.encode(dateInicio);
		else
			qstr += "";
		
		
		
		if (estado != null )
			qstr += "&estado="+estado;
		else
			qstr += "";
		
		
		
		log.info("qstr:"+qstr);
		PageNate pageNate = new PageNate(total, p1, pagelimit, "");
		pageNate.setURL("detalleNoEncontradoWms", qstr);
		
		log.info("Start:"+pageNate.getStart());
		log.info("End:"+pageNate.getLimit());
		
		
		List<EcommerceSoporteVentaDTO> detalles = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaWmsDifs(starttime, "1", "4", null, null, null, null, 0, 1000000000);
		int cantEcommerce = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaCounts(starttime, null, "1", null, null, null);
		int cantSoporte = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaCounts(starttime, null, "2", null, null, "99999999");
		int cantSoporteVentaNoEncontrados = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaWmsDifCounts(starttime, "1", "4", null, null, null);
		int cantSoporteVentaEncontrados = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaCounts(starttime, "1", "1", null, null, null);
		int cantSoporteVenta = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaCounts(starttime, null, "2", null, null, null);
		List<HorarioTrazabilidadActualizacionDTO> horarios = horarioTrazabilidadActualizacionServicesImpl.getHorarioTrazabilidadActualizacions(0, 1);
 		
		log.info("home:detalles="+ detalles);
		log.info("home:cantEcommerce="+ cantEcommerce);
 		log.info("home:cantSoporte="+ cantSoporte);
 		log.info("home:cantSoporteVentaNoEncontrados="+ cantSoporteVentaNoEncontrados);
 		log.info("home:cantSoporteVentaEncontrados="+ cantSoporteVentaEncontrados);
 		log.info("home:cantSoporteVenta="+ cantSoporteVenta);
 		
 		Map<String, Object> model = new HashMap<String, Object>();
		model.put("cantEcommerce", cantEcommerce);//
		model.put("cantSoporte", cantSoporte);//
		model.put("cantSoporteVentaNoEncontrados", cantSoporteVentaNoEncontrados);//
		model.put("cantSoporteVentaEncontrados", cantSoporteVentaEncontrados);//
		model.put("cantSoporteVenta", cantSoporteVenta);//
		model.put("detalles", detalles);//
		model.put("fecha", DateUtils.turnDate5(starttime));//
		model.put("record", total);
		model.put("p", p);
		model.put("numpages", pageNate.getNumPages());
		model.put("pagelinks", pageNate.getPageLinks());
		model.put("namePage", "trazabilidad");//		
		model.put("horarios", horarios);//
		return new ModelAndView("role/admin/trazabilidad/detalleNoEncontradoWms", model);
    }
    
    @RequestMapping(value = "admin/detalleNoEncontradoJda", method = RequestMethod.GET)
	public ModelAndView detalleNoEncontradoJda(Integer p, String dateInicio, String estado) {
    	log.info("home:detalleNoEncontradoWms");
    	//UserDTO user = (UserDTO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	log.info("home:dateInicio="+dateInicio);
 		log.info("home:estado="+estado);
 		log.info("p:"+p);
 		
 		Date now = new Date();
		SimpleDateFormat ft = new SimpleDateFormat ("YYYYMMdd");
		String iFechaFin = ft.format(now);
		String fecha = ft.format(now);
		String dateInicio2 = null;
		int total;	
		
		
		if ("".equals(dateInicio) || dateInicio == null ) {
			dateInicio2 = iFechaFin;
			
			
		} else {
			dateInicio2 = dateInicio;
		}
		log.info("dateInicio2:"+dateInicio2);
		
		log.info("starttime="+DateUtils.restarDiaFecha2(fecha,"0"));
		String starttime = dateInicio2;
		log.info("starttime="+starttime);
		String starttime2 = DateUtils.turnDate4(dateInicio2) != null?DateUtils.turnDate4(dateInicio2):DateUtils.turnDate4(iFechaFin);
		log.info("home:fecha="+fecha);
		log.info("home:estado="+estado);
		log.info("home:dateInicio="+ dateInicio);
		log.info("home:starttime="+ starttime);
		log.info("home:starttime2="+ starttime2);
		
		total = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaJdaDifPaginador(starttime, "1", "4", null, null, null, null);
		log.info("total:"+total);
		
		
		int pagelimit1 = 0;
		int pagelimit = pagelimit1 > 0?pagelimit1:25;
		int p1 = p != null?p:1;
		String qstr = "";
		
		if (dateInicio != null)
			qstr += "&dateInicio="+DateUtils.encode(dateInicio);
		else
			qstr += "";
		
		if (estado != null)
			qstr += "&estado="+estado;
		else
			qstr += "";
		

		
		log.info("qstr:"+qstr);
		PageNate pageNate = new PageNate(total, p1, pagelimit, "");
		pageNate.setURL("detalleNoEncontradoWms", qstr);
		
		log.info("Start:"+pageNate.getStart());
		log.info("End:"+ pageNate.getLimit());
		List<EcommerceSoporteVentaDTO> detalles = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaJdaDifs(starttime, "1", "4", null, null, null, null, 0, 1000000000);
		int cantEcommerce = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaCounts(starttime, null, "1", null, null, null);
		int cantSoporte = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaCounts(starttime, null, "2", null, null, "99999999");
		int cantSoporteVentaNoEncontrados = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaJdaDifCounts(starttime, "1", "4", null, null, null);
		int cantSoporteVentaEncontrados = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaCounts(starttime, "1", "1", null, null, null);
		int cantSoporteVenta = ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaCounts(starttime, null, "2", null, null, null);
		List<HorarioTrazabilidadActualizacionDTO> horarios = horarioTrazabilidadActualizacionServicesImpl.getHorarioTrazabilidadActualizacions(0, 1);
 		
		log.info("home:starttime="+ starttime);
 		log.info("home:cantEcommerce="+ cantEcommerce);
 		log.info("home:cantSoporte="+ cantSoporte);
 		log.info("home:cantSoporteVentaNoEncontrados="+ cantSoporteVentaNoEncontrados);
 		log.info("home:cantSoporteVentaEncontrados="+ cantSoporteVentaEncontrados);
 		log.info("home:cantSoporteVenta="+ cantSoporteVenta);
 		
 		Map<String, Object> model = new HashMap<String, Object>();
		model.put("cantEcommerce", cantEcommerce);//
		model.put("cantSoporte", cantSoporte);//
		model.put("cantSoporteVentaNoEncontrados", cantSoporteVentaNoEncontrados);//
		model.put("cantSoporteVentaEncontrados", cantSoporteVentaEncontrados);//
		model.put("cantSoporteVenta", cantSoporteVenta);//
		model.put("detalles", detalles);//
		model.put("fecha", DateUtils.turnDate5(starttime));//
		model.put("record", total);
		model.put("p", p);
		model.put("numpages", pageNate.getNumPages());
		model.put("pagelinks", pageNate.getPageLinks());
		model.put("namePage", "trazabilidad");//		
		model.put("horarios", horarios);//
		return new ModelAndView("role/admin/trazabilidad/detalleNoEncontradoJda", model);
    }

}
