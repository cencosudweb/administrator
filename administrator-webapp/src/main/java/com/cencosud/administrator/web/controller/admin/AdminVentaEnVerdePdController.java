/**
 * 
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
 * @author EA7129
 *
 */
public class AdminVentaEnVerdePdController {
	
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
   
    @RequestMapping(value = "admin/ven", method = RequestMethod.GET)
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

}
