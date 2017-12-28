/**
 * 
 */
package com.cencosud.administrator.web.controller.commerce;


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
import com.cencosud.administrator.core.CuadraturaVtavPdServices;
import com.cencosud.administrator.core.CumplimientokpiWebServices;
//import com.cencosud.administrator.core.CommerceServices;
import com.cencosud.administrator.core.DescripcionEmpresaServices;
import com.cencosud.administrator.core.EcommerceSoporteVentaServices;
import com.cencosud.administrator.core.EstadoCumpleResumenServices;
import com.cencosud.administrator.core.EstadoCumpleServices;
import com.cencosud.administrator.core.EstadoCumplimientoServices;
import com.cencosud.administrator.core.EstadoOdServices;
import com.cencosud.administrator.core.EstadoOrdenStockServices;
import com.cencosud.administrator.core.EstadoResponsableServices;
//import com.cencosud.administrator.core.FinancialInstitutionServices;
import com.cencosud.administrator.core.HorarioActualizacionStockServices;
import com.cencosud.administrator.core.HorarioServices;
import com.cencosud.administrator.core.HorarioTrazabilidadActualizacionServices;
import com.cencosud.administrator.core.HorarioVentaEnVerdeActualizacionServices;
import com.cencosud.administrator.core.OrdeneStockPendienteServices;
import com.cencosud.administrator.core.TipoEstadoVentaEnVerdeServices;
import com.cencosud.administrator.core.TipoGuiaServices;
import com.cencosud.administrator.core.TipoOrdenServices;
import com.cencosud.administrator.core.TipoVentaServices;
import com.cencosud.administrator.core.UserServices;
import com.cencosud.administrator.core.VentaEmpresaServices;
import com.cencosud.administrator.core.util.PageNate;
import com.cencosud.administrator.dto.users.ClienteRetiraDTO;
import com.cencosud.administrator.dto.users.CuadraturaVentaVerdeDTO;
import com.cencosud.administrator.dto.users.CuadraturaVtavPdDTO;
import com.cencosud.administrator.dto.users.DescripcionEmpresaDTO;
import com.cencosud.administrator.dto.users.EcommerceSoporteVentaDTO;
import com.cencosud.administrator.dto.users.EstadoCumpleDTO;
import com.cencosud.administrator.dto.users.EstadoCumpleResumenDTO;
import com.cencosud.administrator.dto.users.EstadoCumplimientoDTO;
import com.cencosud.administrator.dto.users.EstadoOdDTO;
import com.cencosud.administrator.dto.users.EstadoOrdenStockDTO;
import com.cencosud.administrator.dto.users.EstadoResponsableDTO;
import com.cencosud.administrator.dto.users.HorarioActualizacionStockDTO;
import com.cencosud.administrator.dto.users.HorarioDTO;
import com.cencosud.administrator.dto.users.HorarioTrazabilidadActualizacionDTO;
import com.cencosud.administrator.dto.users.OrdeneStockPendienteDTO;
import com.cencosud.administrator.dto.users.TipoGuiaDTO;
import com.cencosud.administrator.dto.users.TipoOrdenDTO;
import com.cencosud.administrator.dto.users.TipoVentaDTO;
import com.cencosud.administrator.dto.users.UserDTO;
import com.cencosud.administrator.dto.users.VentaEmpresaDTO;
import com.cencosud.administrator.web.controller.base.BaseController;
import com.cencosud.administrator.web.utils.DateUtils;
import com.cencosud.administrator.web.utils.StringUtils;

/**
 * @author jose
 *
 */

@Controller
public class CommerceController extends BaseController {
	
	private static Logger log = Logger.getLogger(CommerceController.class);

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
   
    @Autowired
   	private CuadraturaVtavPdServices cuadraturaVtavPdServicesImpl;
    
    @Autowired
   	private EstadoOdServices estadoOdServicesImpl;
    
    @Autowired
	private OrdeneStockPendienteServices ordeneStockPendienteServicesImpl;
    
    @Autowired
	private EstadoOrdenStockServices estadoOrdenStockServicesImpl;
    
    
    

    @RequestMapping(value = "**/commerce/trazabilidad", method = RequestMethod.GET)
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
 		
 		
 		return new ModelAndView("role/commerce/trazabilidad", model);
     }
    
    @RequestMapping(value = "**/commerce/soporteVentaDetalle", method = RequestMethod.GET)
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
 		return new ModelAndView("role/commerce/soporteVentaDetalle", model);
     }
    
    
    @RequestMapping(value = "**/commerce/detalleNoEncontradoSoporteVenta", method = RequestMethod.GET)
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
		return new ModelAndView("role/commerce/detalleNoEncontradoSoporteVenta", model);
    }
    
    
    @RequestMapping(value = "**/commerce/eom", method = RequestMethod.GET)
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
 		return new ModelAndView("role/commerce/eom", model);
     }
    
    @RequestMapping(value = "**/commerce/detalleNoEncontradoSoporteVentaEom", method = RequestMethod.GET)
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
		return new ModelAndView("role/commerce/detalleNoEncontradoSoporteVentaEom", model);
    }
    
    @RequestMapping(value = "**/commerce/detalleNoEncontradoWms", method = RequestMethod.GET)
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
		return new ModelAndView("role/commerce/detalleNoEncontradoWms", model);
    }
    
    @RequestMapping(value = "**/commerce/detalleNoEncontradoJda", method = RequestMethod.GET)
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
		return new ModelAndView("role/commerce/detalleNoEncontradoJda", model);
    }
    
    @RequestMapping(value = "**/commerce/panelEstatico", method = RequestMethod.GET)
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
 		
 		
 		
 		return new ModelAndView("role/commerce/panelEstatico", model);
     }
    
    
    @RequestMapping(value = "**/commerce/reporteCuadraturaVentaEnVerde", method = RequestMethod.GET)
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
		
		
		return new ModelAndView("role/commerce/reporteCuadraturaVentaEnVerde", model);
    }
    
    
    @RequestMapping(value = "**/commerce/detalleOcEom", method = RequestMethod.GET)
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
		return new ModelAndView("role/commerce/detalleOcEom", model);
    }
    
    
    @RequestMapping(value = "**/commerce/detalleOcEncontrado", method = RequestMethod.GET)
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
		return new ModelAndView("role/commerce/detalleOcEncontrado", model);
    }
    
    
    @RequestMapping(value = "**/commerce/detalleOcNoEncontrado", method = RequestMethod.GET)
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
		return new ModelAndView("role/commerce/detalleOcNoEncontrado", model);
    }
    
    @RequestMapping(value = "**/commerce/detalleOcConError", method = RequestMethod.GET)
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
		return new ModelAndView("role/commerce/detalleOcConError", model);
    }
    
    @RequestMapping(value = "**/commerce/detalleCantidaOc", method = RequestMethod.GET)
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
		return new ModelAndView("role/commerce/detalleCantidaOc", model);
    }
    
    @RequestMapping(value = "**/commerce/reporteResponsableCumplimiento", method = RequestMethod.GET)
    public ModelAndView reporteResponsableCumplimiento(String tipo_orden, String tipo_venta, String cliente_retira,  String descripcion_empresa, String tipo_guia, String tipo_horario, String venta_empresa, String tipo_estado, String dateInicio, String cumplimiento, String cumple_resumen, String responsable) {
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
 		model.put("namePage", "reporteResponsableCumplimiento");//
 		return new ModelAndView("role/commerce/reporteResponsableCumplimiento", model);
     }
    
    
    @RequestMapping(value = "**/commerce/reportODVentaVerde", method = RequestMethod.GET)
    public ModelAndView reportODVentaVerde(String posted, String dateInicio,  String estado) {
    	log.info("home:reportODVentaVerde");
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
 		} else if ("Uno".equals(estado)) {
 			log.info("-Uno-"+detalles);
 			detalles = cuadraturaVtavPdServicesImpl.getCuadraturaVtavConPds(starttime+" 00:00:00", endtime+" 23:59:59", 1, 2, 0);
 		} else if ("Dos".equals(estado)){
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
 		return new ModelAndView("role/commerce/reportODVentaVerde", model);
     }
    
    @RequestMapping(value = "**/commerce/ventaVerdeConOdDetalle", method = RequestMethod.GET)
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
 		int cantConOd = cuadraturaVtavPdServicesImpl.getCountConOd(starttime1+" 00:00:00", endtime1+" 23:59:59", 1, 2, 0);
 		log.info("cantConOd="+ cantConOd);
 		//Sin OD
 		int cantSinOd = cuadraturaVtavPdServicesImpl.getCountSinOd(starttime1+" 23:59:59", endtime1+" 23:59:59", 1, 2, 0);
 		log.info("cantSinOd="+ cantSinOd);
 		
 		List<CuadraturaVtavPdDTO> conods = cuadraturaVtavPdServicesImpl.getCuadraturaVtavConPds(starttime1+" 00:00:00", endtime1+" 23:59:59", 1, 2, 0);
 		List<CuadraturaVtavPdDTO> sinods = cuadraturaVtavPdServicesImpl.getCuadraturaVtavSinPds(starttime1+" 00:00:00", endtime1+" 23:59:59", 1, 2, 0);

 		Map<String, Object> model = new HashMap<String, Object>();
 		model.put("fecha", DateUtils.turnDate5(starttime));//
 		model.put("starttime", starttime1);//
 		model.put("endtime", endtime1);//
 		model.put("cantConOd", cantConOd);//
 		model.put("cantSinOd", cantSinOd);//
 		model.put("namePage", "reportODVentaVerde");//
 		model.put("detalles", conods);//
		return new ModelAndView("role/commerce/ventaVerdeConOdDetalle", model);
    }
    
    
    @RequestMapping(value = "**/commerce/ventaVerdeSinOdDetalle", method = RequestMethod.GET)
    public ModelAndView ventaVerdeSinOdDetalle(String starttime, String endtime, String dateInicio) {
    	log.info("home:ventaVerdeSinOdDetalle");
    	//UserDTO user = (UserDTO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	Date now = new Date();
 		SimpleDateFormat ft = new SimpleDateFormat ("dd-MM-yyyy");
 		String iFechaFin = ft.format(now);
 		log.info("home:dateInicio="+ dateInicio);
 		log.info("home:starttime="+ starttime);
 		log.info("home:endtime="+ endtime);
 		//log.info("Function="+ DateUtils.restarDiaFecha(iFechaFin,"0"));
 		//log.info("Function2="+ DateUtils.turnDate3(DateUtils.restarDiaFecha(iFechaFin,"0")));
 		//String starttime = DateUtils.turnDate3(dateInicio) != null?DateUtils.turnDate3(dateInicio):iFechaFin;
 		//String starttime = DateUtils.turnDate3(dateInicio) != null?DateUtils.turnDate3(dateInicio):DateUtils.turnDate3(DateUtils.restarDiaFecha(iFechaFin,"1"));
		
		//String starttime = DateUtils.turnDatePd(iFechaFin) != null?DateUtils.turnDatePd(DateUtils.restarDiaFecha(iFechaFin,"8")):DateUtils.turnDatePd(DateUtils.restarDiaFecha(iFechaFin,"8"));
		//String endtime = DateUtils.turnDatePd(iFechaFin) != null?DateUtils.turnDatePd(DateUtils.restarDiaFecha(iFechaFin,"1")):DateUtils.turnDatePd(DateUtils.restarDiaFecha(iFechaFin,"1"));

 		log.info("home:starttime="+ starttime);
 		log.info("home:endtime="+ endtime);
 		
 		//Con OD
 		int cantConOd = cuadraturaVtavPdServicesImpl.getCountConOd(starttime+" 00:00:00", endtime+" 23:59:59", 1, 2, 0);
 		log.info("cantConOd="+ cantConOd);
 		//Sin OD
 		int cantSinOd = cuadraturaVtavPdServicesImpl.getCountSinOd(starttime+" 00:00:00", endtime+" 23:59:59", 1, 2, 0);
 		log.info("cantSinOd="+ cantSinOd);
 		
 		List<CuadraturaVtavPdDTO> conods = cuadraturaVtavPdServicesImpl.getCuadraturaVtavConPds(starttime+" 00:00:00", endtime+" 23:59:59", 1, 2, 0);
 		List<CuadraturaVtavPdDTO> sinods = cuadraturaVtavPdServicesImpl.getCuadraturaVtavSinPds(starttime+" 00:00:00" , endtime+" 23:59:59", 1, 2, 0);

 		Map<String, Object> model = new HashMap<String, Object>();
 		model.put("fecha", DateUtils.turnDate5(starttime));//
 		model.put("starttime", starttime);//
 		model.put("endtime", endtime);//
 		model.put("cantConOd", cantConOd);//
 		model.put("cantSinOd", cantSinOd);//
 		model.put("namePage", "reportODVentaVerde");//
 		model.put("detalles", sinods);//
 		model.put("dateInicio",  !"".equals(dateInicio) || dateInicio != null ? dateInicio : iFechaFin);//
 		
		return new ModelAndView("role/commerce/ventaVerdeSinOdDetalle", model);
    }
    
    
    @RequestMapping(value = "**/commerce/allOrdeneStockPendientes", method = RequestMethod.GET)
	public ModelAndView allOrdeneStockPendiente(Integer p, String posted,String  dateInicio, String  dateFin, String orden, String nroDeLinea, String doDtlStatus, String tipoOrden,  String pedido, String cantidadPendiente, String bodega, String statCode, String estado) {
		log.info("OrdeneStockPendiente:allOrdeneStockPendiente");
		Date dNow = new Date();
		SimpleDateFormat ft = new SimpleDateFormat ("dd/MM/yyyy");
		String currentDate = ft.format(dNow);
		int total;
		String orden2 = orden != null? orden :null;
		String nroDeLinea2 = nroDeLinea != null? nroDeLinea : null;
		String doDtlStatus2 = doDtlStatus != null? doDtlStatus : null;
		String tipoOrden2 = tipoOrden != null? tipoOrden : null;
		String pedido2 = pedido != null? pedido : null;
		String cantidadPendiente2 = cantidadPendiente != null? cantidadPendiente : null;
		String bodega2 = bodega != null? bodega : null;
		String statCode2 = statCode != null? statCode : null;
		String estado2 = estado != null? estado : null;
		
		log.info("p="+p);
 		log.info("posted="+posted);
 		log.info("dateInicio="+dateInicio);
 		log.info("dateFin="+ dateFin);
 		
 		log.info("orden="+ orden2);
 		log.info("nroDeLinea="+ nroDeLinea2);
 		log.info("doDtlStatus="+ doDtlStatus2);
 		log.info("tipoOrden="+ tipoOrden2);
 		log.info("pedido="+ pedido2);
 		log.info("cantidadPendiente="+ cantidadPendiente2);
 		log.info("bodega="+ bodega2);
 		log.info("statCode="+ statCode2);
 		log.info("estado="+ estado2);
 		
 		
 	
 		
 		
 		total = 10000;// ecommerceSoporteVentaServicesImpl.getEcommerceSoporteVentaEomDifPaginador(starttime, "0", "3", "0", null, null, "99999999");
		log.info("total="+total);
		int pagelimit1 = 0;
		int pagelimit = pagelimit1 > 0?pagelimit1:25;
		int p1 = p != null?p:1;

		String estado1 = "".equals(estado) ?null:estado;
		log.info("estado1="+estado1);
		
		
		String qstr = "";
		
		
		if (dateInicio != null)
			qstr += "&dateInicio="+DateUtils.encode(dateInicio);
		else
			qstr += "";
		
		if (dateFin != null)
			qstr += "&dateInicio="+DateUtils.encode(dateFin);
		else
			qstr += "";
		
		if (orden != null)
			qstr += "&orden="+orden;
		else
			qstr += "";
		
		if (nroDeLinea != null)
			qstr += "&nroDeLinea="+nroDeLinea;
		else
			qstr += "";
		
		if (doDtlStatus != null)
			qstr += "&doDtlStatus="+doDtlStatus;
		else
			qstr += "";
	
		if (tipoOrden != null)
			qstr += "&tipoOrden="+tipoOrden;
		else
			qstr += "";
		
		if (pedido != null)
			qstr += "&pedido="+pedido;
		else
			qstr += "";
		
		if (cantidadPendiente != null)
			qstr += "&cantidadPendiente="+cantidadPendiente;
		else
			qstr += "";
		
		if (bodega != null)
			qstr += "&bodega="+bodega;
		else
			qstr += "";
		
		if (statCode != null)
			qstr += "&statCode="+statCode;
		else
			qstr += "";
		
		if (estado != null)
			qstr += "&estado="+estado;
		else
			qstr += "";
		
		log.info("qstr:"+qstr);
		//PageNate pageNate = new PageNate(10000, p1, pagelimit, "");
		//pageNate.setURL("detalleNoEncontradoSoporteVentaEom", qstr);
		
		//String starttime2 = DateUtils.turnDate(dateInicio) != null?DateUtils.turnDate(DateUtils.restarDiaFecha(dateInicio,"8")):DateUtils.turnDate(DateUtils.restarDiaFecha(currentDate,"8"));
		//String endtime2 = DateUtils.turnDate(dateInicio) != null?DateUtils.turnDate(DateUtils.restarDiaFecha(dateInicio,"1")):DateUtils.turnDate(DateUtils.restarDiaFecha(currentDate,"1"));
		//String starttime2 = DateUtils.turnDate(dateInicio) != null?DateUtils.turnDate(DateUtils.restarDiaFecha(dateInicio,"0")):DateUtils.turnDate(DateUtils.restarDiaFecha(currentDate,"0"));
		//String endtime2 = DateUtils.turnDate(dateFin) != null?DateUtils.turnDate(DateUtils.restarDiaFecha(dateFin,"0")):DateUtils.turnDate(DateUtils.restarDiaFecha(currentDate,"0"));

		String starttime2 = DateUtils.turnDate(dateInicio) != null?DateUtils.turnDate(DateUtils.restarDiaFecha(dateInicio,"0")):DateUtils.turnDate(DateUtils.restarDiaFecha(currentDate,"1"));
		String endtime2 = DateUtils.turnDate(dateInicio) != null?DateUtils.turnDate(DateUtils.restarDiaFecha(dateInicio,"0")):DateUtils.turnDate(DateUtils.restarDiaFecha(currentDate,"1"));
		
 		//String starttime = DateUtils.turnDate(dateInicio) != null?DateUtils.turnDate(dateInicio):DateUtils.turnDate(currentDate);
		//String endtime = DateUtils.turnDate(dateInicio) != null?DateUtils.turnDate(dateInicio):DateUtils.turnDate(currentDate);
 		//String starttime = DateUtils.turnDate(dateInicio) != null?DateUtils.turnDate(dateInicio):DateUtils.turnDate(currentDate);
		//String endtime = DateUtils.turnDate(dateFin) != null?DateUtils.turnDate(dateFin):DateUtils.turnDate(currentDate);
		String starttime = DateUtils.turnDate(dateInicio) != null?DateUtils.turnDate(dateInicio):DateUtils.turnDate(currentDate);
		String endtime = DateUtils.turnDate(dateInicio) != null?DateUtils.turnDate(dateInicio):DateUtils.turnDate(currentDate);

		log.info("starttime="+ starttime);
		log.info("endtime="+ endtime);
		
		log.info("starttime2="+ starttime2);
		log.info("endtime2="+ endtime2);
		
		List<EstadoOrdenStockDTO> estados = estadoOrdenStockServicesImpl.getEstadoOrdenStocks();
		
		//List<OrdeneStockPendienteDTO> ordenes = ordeneStockPendienteServicesImpl.getOrdeneStockPendientes(starttime+" 00:00:00", endtime+" 23:59:59", 0, null, null, null, null, null, null, "90", 0, 0, 1000000000);
		//List<OrdeneStockPendienteDTO> ordenes = ordeneStockPendienteServicesImpl.getOrdeneStockPendientes(starttime2+" 00:00:00", endtime2+" 23:59:59", 0, null, null, null, null, null, null, estado1, 0, 0, 1000000000);
		List<OrdeneStockPendienteDTO> ordenes = ordeneStockPendienteServicesImpl.getOrdeneStockPendientes(starttime2+" 00:00:00", endtime2+" 23:59:59", 0, null, null, null, null, null, null, null, 0, "NO", 0, 1000000000);

		//List<OrdeneStockPendienteDTO> ordenes = OrdeneStockPendienteServicesImpl.getOrdeneStockPendientes(starttime, endtime, 0, null, null, null, null, null, null, null, 0, 0, 1000000000);

		//log.info("ordenes="+ ordenes);
 		
 		

 		Map<String, Object> model = new HashMap<String, Object>();
 		model.put("posted", posted);//
 		model.put("ordenes", ordenes);//
 		model.put("starttime", starttime2);//
 		model.put("endtime", endtime);//
 		model.put("estados", estados);
 		
 		model.put("namePage", "allOrdeneStockPendientes");//
 		
 		
		return new ModelAndView("role/commerce/allOrdeneStockPendientes", model);
	}
    
    
    

}
