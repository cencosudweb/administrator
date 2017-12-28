/**
 * 
 */
package com.cencosud.administrator.web.controller.financial;


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

import com.cencosud.administrator.core.BodegaCtlServices;
//import com.cencosud.administrator.web.validator.AdminUsersValidator;
import com.cencosud.administrator.core.ClienteRetiraServices;
import com.cencosud.administrator.core.CuadraturaCtlServices;
import com.cencosud.administrator.core.CuadraturaDoServices;
import com.cencosud.administrator.core.CuadraturaOrdenCompraVentaCompServices;
import com.cencosud.administrator.core.CuadraturaVtavPdServices;
import com.cencosud.administrator.core.CumplimientoServices;
//import com.cencosud.administrator.core.CommerceServices;
import com.cencosud.administrator.core.DescripcionEmpresaServices;
import com.cencosud.administrator.core.EstadoCtlServices;
import com.cencosud.administrator.core.EstadoCumpleResumenServices;
//import com.cencosud.administrator.core.EstadoCumpleResumenServices;
import com.cencosud.administrator.core.EstadoCumpleServices;
import com.cencosud.administrator.core.EstadoCumplimientoServices;
import com.cencosud.administrator.core.EstadoOdServices;
import com.cencosud.administrator.core.EstadoOrdenStockServices;
import com.cencosud.administrator.core.EstadoResponsableServices;
//import com.cencosud.administrator.core.EstadoCumplimientoServices;
//import com.cencosud.administrator.core.EstadoResponsableServices;
//import com.cencosud.administrator.core.FinancialInstitutionServices;
import com.cencosud.administrator.core.HorarioActualizacionStockServices;
import com.cencosud.administrator.core.HorarioServices;
import com.cencosud.administrator.core.HorarioVentaEnVerdeActualizacionServices;
import com.cencosud.administrator.core.OrdeneStockPendienteServices;
//import com.cencosud.administrator.core.RoleServices;
import com.cencosud.administrator.core.TipoEstadoOrdenCompraStockServices;
import com.cencosud.administrator.core.TipoEstadoVentaEnVerdeServices;
import com.cencosud.administrator.core.TipoGuiaServices;
import com.cencosud.administrator.core.TipoOrdenServices;
import com.cencosud.administrator.core.TipoVentaServices;
import com.cencosud.administrator.core.UserServices;
import com.cencosud.administrator.core.VentaEmpresaServices;
import com.cencosud.administrator.dto.users.BodegaCtlDTO;
import com.cencosud.administrator.dto.users.ClienteRetiraDTO;
import com.cencosud.administrator.dto.users.CuadraturaCtlDTO;
import com.cencosud.administrator.dto.users.CuadraturaDoDTO;
import com.cencosud.administrator.dto.users.CuadraturaOrdenCompraVentaCompDTO;
import com.cencosud.administrator.dto.users.CuadraturaVtavPdDTO;
import com.cencosud.administrator.dto.users.CumplimientoDTO;
import com.cencosud.administrator.dto.users.DescripcionEmpresaDTO;
import com.cencosud.administrator.dto.users.EstadoCtlDTO;
import com.cencosud.administrator.dto.users.EstadoCumpleDTO;
import com.cencosud.administrator.dto.users.EstadoCumpleResumenDTO;
import com.cencosud.administrator.dto.users.EstadoCumplimientoDTO;
import com.cencosud.administrator.dto.users.EstadoOdDTO;
import com.cencosud.administrator.dto.users.EstadoOrdenStockDTO;
import com.cencosud.administrator.dto.users.EstadoResponsableDTO;
import com.cencosud.administrator.dto.users.HorarioActualizacionStockDTO;
import com.cencosud.administrator.dto.users.HorarioDTO;
import com.cencosud.administrator.dto.users.HorarioVentaEnVerdeActualizacionDTO;
import com.cencosud.administrator.dto.users.OrdeneStockPendienteDTO;
import com.cencosud.administrator.dto.users.TipoEstadoOrdenCompraStockDTO;
import com.cencosud.administrator.dto.users.TipoEstadoVentaEnVerdeDTO;
import com.cencosud.administrator.dto.users.TipoGuiaDTO;
import com.cencosud.administrator.dto.users.TipoOrdenDTO;
import com.cencosud.administrator.dto.users.TipoVentaDTO;
import com.cencosud.administrator.dto.users.UserDTO;
import com.cencosud.administrator.dto.users.VentaEmpresaDTO;
import com.cencosud.administrator.web.controller.base.BaseController;
import com.cencosud.administrator.web.utils.DateUtils;

/**
 * @author JOSE
 *
 */

@Controller
public class FinancialController extends BaseController {
	
	private static Logger log = Logger.getLogger(FinancialController.class);

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
   	private HorarioVentaEnVerdeActualizacionServices horarioVentaEnVerdeActualizacionServicesImpl;
    
    
    @Autowired
   	private TipoEstadoVentaEnVerdeServices tipoEstadoVentaEnVerdeServicesImpl;
    
    @Autowired
   	private TipoEstadoOrdenCompraStockServices tipoEstadoOrdenCompraStockServicesImpl;
   
    @Autowired
   	private HorarioActualizacionStockServices horarioActualizacionStockServicesImpl;
   
    @Autowired
   	private CuadraturaOrdenCompraVentaCompServices cuadraturaOrdenCompraVentaCompServicesImpl;
   
    @Autowired
	private CumplimientoServices cumplimientoServicesImpl;
    
    @Autowired
   	private CuadraturaVtavPdServices cuadraturaVtavPdServicesImpl;
    
    
    @Autowired
   	private EstadoOdServices estadoOdServicesImpl;
    
    @Autowired
	private OrdeneStockPendienteServices ordeneStockPendienteServicesImpl;
    
    @Autowired
	private EstadoOrdenStockServices estadoOrdenStockServicesImpl;
    
    @Autowired
	private CuadraturaCtlServices cuadraturaCtlServicesImpl;
    
    @Autowired
	private CuadraturaDoServices cuadraturaDoServicesImpl;
    
    
    @Autowired
   	private EstadoCtlServices estadoCtlServicesImpl;

   	@Autowired
   	private BodegaCtlServices bodegaCtlServicesImpl;

    
    @RequestMapping(value = "**/financial/reportePanelDinamico", method = RequestMethod.GET)
    public ModelAndView buttonIncognitoFinancial(String posted, String tipo_orden, String tipo_venta, String cliente_retira,  String descripcion_empresa, String tipo_guia, String tipo_horario, String venta_empresa, String tipo_estado, String dateInicio, String cumplimiento, String cumple_resumen, String responsable) {
    	log.info("user:reportePanelDinamico");
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
		
		return new ModelAndView("role/financial/reportePanelDinamico", model);
    }
    
    @RequestMapping(value = "**/financial/reportePanelDinamicoPrint", method = RequestMethod.GET)
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
		return new ModelAndView("role/financial/reportePanelDinamicoPrint", model);
    }
    
    
    @RequestMapping(value = "**/financial/reportePanelEstatico", method = RequestMethod.GET)
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
		return new ModelAndView("role/financial/reportePanelEstatico", model);
    }
    
    @RequestMapping(value = "**/financial/reportePanelEstaticoPrint", method = RequestMethod.GET)
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
		return new ModelAndView("role/financial/reportePanelEstaticoPrint", model);
    }
    
    
    @RequestMapping(value = "**/financial/reporteOrdenDeCompraStock", method = RequestMethod.GET)
    public ModelAndView reporteOrdenDeCompraStock(String posted, String dateInicio, String dateFin, String estado) {
		log.info("user:reporteOrdenDeCompraStock");
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
		List<TipoEstadoOrdenCompraStockDTO> tipostocks = tipoEstadoOrdenCompraStockServicesImpl.getTipoEstadoOrdenCompraStocks();
		List<HorarioActualizacionStockDTO> horarioStocks = horarioActualizacionStockServicesImpl.getHorarioActualizacionStocks(0, 1);
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("posted", posted);//
		model.put("tipoestadovtavs", tipoestadovtavs);//
		model.put("horarios", horarios);//
		model.put("tipostocks", tipostocks);//
		model.put("horariostocks", horarioStocks);//
		return new ModelAndView("role/financial/reporteOrdenDeCompraStock", model);
    }
    
    @RequestMapping(value = "**/financial/reporteOrdenDeCompraStockPrint", method = RequestMethod.GET)
    public ModelAndView reporteOrdenDeCompraStockPrint(String posted, String dateInicio, String dateFin, String estado) {
		log.info("user:reporteOrdenDeCompraStockPrint");
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
		List<TipoEstadoOrdenCompraStockDTO> tipostocks = tipoEstadoOrdenCompraStockServicesImpl.getTipoEstadoOrdenCompraStocks();
		List<HorarioActualizacionStockDTO> horarioStocks = horarioActualizacionStockServicesImpl.getHorarioActualizacionStocks(0, 1);
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("posted", posted);//
		model.put("tipoestadovtavs", tipoestadovtavs);//
		model.put("horarios", horarios);//
		model.put("tipostocks", tipostocks);//
		model.put("horariostocks", horarioStocks);//
		return new ModelAndView("role/financial/reporteOrdenDeCompraStockPrint", model);
    }
    
    @RequestMapping(value = "**/financial/reportePanelDinamicoMensual", method = RequestMethod.GET)
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
		model.put("user", principal);
		model.put("users", users);
		model.put("posted", posted);
		model.put("compare", compare);
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
		return new ModelAndView("role/financial/reportePanelDinamicoMensual", model);
    }
    
    @RequestMapping(value = "**/financial/reportePanelDinamicoMensualComparar", method = RequestMethod.GET)
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
		
		
		return new ModelAndView("role/financial/reportePanelDinamicoMensualComparar", model);
    }
    
    
    @RequestMapping(value = "**/financial/reporteCuadraturaVentaEnVerde", method = RequestMethod.GET)
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
		return new ModelAndView("role/financial/reporteCuadraturaVentaEnVerde", model);
    }
    
    
    @RequestMapping(value = "**/financial/reporteCuadraturaVentaEnVerdeCantidad", method = RequestMethod.GET)
    public ModelAndView reportePrintCuadraturaVentaEnVerdeCantidad(String fecha) {
		log.info("user:reportePrintCuadraturaVentaEnVerdeCantidad");
		UserDTO principal = (UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		log.info("user:allUsers Usuario Actual "+principal.getUsername());
		log.info("user:fecha="+fecha);
		
		//Date dNow = new Date();
		//SimpleDateFormat ft = new SimpleDateFormat ("dd/MM/yyyy");
		//String currentDate = ft.format(dNow);
		
		
		List<HorarioVentaEnVerdeActualizacionDTO> horarios = horarioVentaEnVerdeActualizacionServicesImpl.getHorarioVentaEnVerdeActualizacions(0, 1);
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("fecha", fecha);//
		model.put("horarios", horarios);//
		return new ModelAndView("role/financial/reporteCuadraturaVentaEnVerdeCantidad", model);
    }
    
    
    @RequestMapping(value = "**/financial/reporteCuadraturaEcommerceSoporteVenta", method = RequestMethod.GET)
    public ModelAndView reporteCuadraturaEcommerceSoporteVenta(String posted, String dateInicio, String dateFin, String estado) {
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
		return new ModelAndView("role/financial/reporteCuadraturaEcommerceSoporteVenta", model);
    }
    
    @RequestMapping(value = "**/financial/detalleCuadraturaVentaEnVerdeCantidad", method = RequestMethod.GET)
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
		return new ModelAndView("role/financial/detalleCuadraturaVentaEnVerdeCantidad", model);
    }
    
    
    @RequestMapping(value = "**/financial/reporteResponsableCumplimiento", method = RequestMethod.GET)
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
		
		
		return new ModelAndView("role/financial/reporteResponsableCumplimiento", model);
    }
    
    @RequestMapping(value = "**/financial/downloadExcelCumplimiento", method = RequestMethod.GET)
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
    
    
    @RequestMapping(value = "**/financial/reportODVentaVerde", method = RequestMethod.GET)
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
		
		String starttime = DateUtils.turnDatePd(dateInicio) != null?DateUtils.turnDatePd(DateUtils.restarDiaFecha(dateInicio,"8")):DateUtils.turnDatePd(DateUtils.restarDiaFecha(iFechaFin,"8"));
		String endtime = DateUtils.turnDatePd(dateInicio) != null?DateUtils.turnDatePd(DateUtils.restarDiaFecha(dateInicio,"1")):DateUtils.turnDatePd(DateUtils.restarDiaFecha(iFechaFin,"1"));

 		log.info("home:starttime="+ starttime);
 		log.info("home:endtime="+ endtime);
 		
 		//Con OD
 		int cantConOd = cuadraturaVtavPdServicesImpl.getCountConOd(starttime+" 00:00:00", endtime+" 23:59:59", 1, 2, 2);
 		log.info("cantConOd="+ cantConOd);
 		//Sin OD
 		int cantSinOd = cuadraturaVtavPdServicesImpl.getCountSinOd(starttime+" 00:00:00", endtime+" 23:59:59", 1, 2, 2);
 		log.info("cantSinOd="+ cantSinOd);
 		
 		
 		//List<CuadraturaVtavPdDTO> conods = cuadraturaVtavPdServicesImpl.getCuadraturaVtavConPds(starttime, endtime, 1, 2, 2);
 		//List<CuadraturaVtavPdDTO> sinods = cuadraturaVtavPdServicesImpl.getCuadraturaVtavSinPds(starttime, endtime, 1, 2, 2);
 		List<CuadraturaVtavPdDTO> detalles = null;
 		if ("Todas".equals(estado) ) {
 			log.info("-Todas-"+detalles);
 			detalles = cuadraturaVtavPdServicesImpl.getCuadraturaVtavSinPds(starttime+" 00:00:00", endtime+" 23:59:59", 1, 0, 0);
 		} else if ("Uno".equals(estado)) {
 			log.info("-Uno-"+detalles);
 			detalles = cuadraturaVtavPdServicesImpl.getCuadraturaVtavConPds(starttime+" 00:00:00", endtime+" 23:59:59", 1, 2, 2);
 		} else if ("Dos".equals(estado)){
 			log.info("-Dos-"+detalles);
 			detalles = cuadraturaVtavPdServicesImpl.getCuadraturaVtavSinPds(starttime+" 00:00:00", endtime+" 23:59:59", 1, 2, 2);
 		} else {
 			log.info("-Cuatros-"+detalles);
 			detalles = cuadraturaVtavPdServicesImpl.getCuadraturaVtavSinPds(starttime+" 00:00:00", endtime+" 23:59:59", 1, 0, 0);
 		}
 	
 		List<EstadoOdDTO> estados = estadoOdServicesImpl.getEstadoOds();
		
 		//List<CuadraturaVtavPdDTO> detalles = cuadraturaVtavPdServicesImpl.getCuadraturaVtavSinPds(starttime, endtime, 1, 0, 0);
 	 	
 		
 		

 		Map<String, Object> model = new HashMap<String, Object>();
 		model.put("posted", posted);//
 		model.put("fecha", DateUtils.turnDate5(starttime));//
 		model.put("starttime", starttime);//
 		model.put("endtime", endtime);//
 		model.put("cantConOd", cantConOd);//
 		model.put("cantSinOd", cantSinOd);//
 		model.put("detalles", detalles);//
 		model.put("estados", estados);
 		model.put("namePage", "reportODVentaVerde");//
 		return new ModelAndView("role/financial/reportODVentaVerde", model);
     }
    
    
    @RequestMapping(value = "**/financial/allOrdeneStockPendientes", method = RequestMethod.GET)
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
			qstr += "&dateFin="+DateUtils.encode(dateFin);
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

		String starttime2 = DateUtils.turnDate(dateInicio) != null?DateUtils.turnDate(DateUtils.restarDiaFecha(dateInicio,"0")):DateUtils.turnDate(DateUtils.restarDiaFecha(currentDate,"0"));
		String endtime2 = DateUtils.turnDate(dateFin) != null?DateUtils.turnDate(DateUtils.restarDiaFecha(dateFin,"0")):DateUtils.turnDate(DateUtils.restarDiaFecha(currentDate,"0"));
		
 		//String starttime = DateUtils.turnDate(dateInicio) != null?DateUtils.turnDate(dateInicio):DateUtils.turnDate(currentDate);
		//String endtime = DateUtils.turnDate(dateInicio) != null?DateUtils.turnDate(dateInicio):DateUtils.turnDate(currentDate);
 		//String starttime = DateUtils.turnDate(dateInicio) != null?DateUtils.turnDate(dateInicio):DateUtils.turnDate(currentDate);
		//String endtime = DateUtils.turnDate(dateFin) != null?DateUtils.turnDate(dateFin):DateUtils.turnDate(currentDate);
		String starttime = DateUtils.turnDate(dateInicio) != null?DateUtils.turnDate(dateInicio):DateUtils.turnDate(currentDate);
		String endtime = DateUtils.turnDate(dateFin) != null?DateUtils.turnDate(dateFin):DateUtils.turnDate(currentDate);

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
 		
 		model.put("namePage", "trazabilidad");//
 		
 		
		return new ModelAndView("role/financial/allOrdeneStockPendientes", model);
	}
    
    
    @RequestMapping(value = "**/financial/cuadraturaCtl", method = RequestMethod.GET)
	public ModelAndView cuadraturaCtl(Integer p, String posted,String  dateInicio, String  dateFin, String  carga, String bogeda, String tranNbr,  String estado) {
		log.info("OrdeneStockPendiente:allOrdeneStockPendiente");
		Date dNow = new Date();
		SimpleDateFormat ft = new SimpleDateFormat ("dd/MM/yyyy");
		String currentDate = ft.format(dNow);
		
		
		
		String starttime = DateUtils.turnDateCtl(dateInicio) != null?DateUtils.turnDateCtl(dateInicio):DateUtils.turnDateCtl(DateUtils.restarDiaFecha(currentDate,"1"));
 		String endtime = DateUtils.turnDateCtl(dateInicio) != null?DateUtils.turnDateCtl(dateInicio):DateUtils.turnDateCtl(DateUtils.restarDiaFecha(currentDate,"1"));

		int total;
	
		
		log.info("p="+p);
 		log.info("posted="+posted);
 		log.info("dateInicio="+dateInicio);
 		log.info("dateFin="+ dateFin);
 		log.info("carga="+ carga);
 		log.info("bogeda="+ bogeda);
 		//log.info("tipo="+ tipo);
 		log.info("tranNbr="+ tranNbr);
 		log.info("estado="+ estado);
 		
 		
 	
 		
 		
 		total = 10000;// = cuadraturaCtlServicesImpl.getCuadraturaCtls(carga, bogeda, starttime+" 00:00:00", endtime+" 23:59:59", tipo, tranNbr, estado);
		
		log.info("total="+total);
		int pagelimit1 = 0;
		int pagelimit = pagelimit1 > 0?pagelimit1:25;
		int p1 = p != null?p:1;
		String estado2 = !"All".equals(estado) && estado != null?estado:"9";
		String bodega2 = !"".equals(bogeda)  && bogeda != null?bogeda:null;
		
		
		int encontrados = Integer.parseInt(estado2);
		//int bodegas = Integer.parseInt(bodega2);
		log.info("encontrados="+ encontrados);
		log.info("bodega2="+ bodega2);
		
		String qstr = "";
		
		
		if (dateInicio != null)
			qstr += "&dateInicio="+DateUtils.encode(dateInicio);
		else
			qstr += "";
		
		if (dateFin != null)
			qstr += "&dateInicio="+DateUtils.encode(dateFin);
		else
			qstr += "";
		/*
		if (carga != 0)
			qstr += "&carga="+carga;
		else
			qstr += "";
		
		if (bogeda != 0)
			qstr += "&bogeda="+bogeda;
		else
			qstr += "";
		
		if (tipo != null)
			qstr += "&tipo="+tipo;
		else
			qstr += "";
			
	
		if (tranNbr != 0)
			qstr += "&tranNbr="+tranNbr;
		else
			qstr += "";
		
		if (estado != 9)
			qstr += "&estado="+estado;
		else
			qstr += "";
		*/
		
		
		log.info("qstr:"+qstr);
		//PageNate pageNate = new PageNate(10000, p1, pagelimit, "");
		//pageNate.setURL("detalleNoEncontradoSoporteVentaEom", qstr);
		
		
		log.info("starttime="+ starttime);
		log.info("endtime="+ endtime);
		
		int countEncontrado = cuadraturaCtlServicesImpl.getCuadraturaCtlContar(0, bodega2, 0, starttime+" 00:00:00", endtime+" 23:59:59", null, 0, 1);
		int countNoEncontrado = cuadraturaCtlServicesImpl.getCuadraturaCtlContar(0, bodega2, 0, starttime+" 00:00:00", endtime+" 23:59:59", null, 0, 0);
		log.info("countEncontrado="+ countEncontrado);
		log.info("countNoEncontrado="+ countNoEncontrado);
		//List<CuadraturaCtlDTO> ctls = cuadraturaCtlServicesImpl.getCuadraturaCtls(carga, bogeda, starttime+" 00:00:00", endtime+" 23:59:59", null, tranNbr, estado, 0, 1000000000);
		List<CuadraturaCtlDTO> ctls = cuadraturaCtlServicesImpl.getCuadraturaCtls(0, bodega2, 0, starttime+" 00:00:00", endtime+" 23:59:59", null, 0, encontrados, 0, 1000000000);
		
		List<EstadoCtlDTO> estadoCtls = estadoCtlServicesImpl.getEstadoCtls();
		List<BodegaCtlDTO> bodegaCtls = bodegaCtlServicesImpl.getBodegaCtls();
		//log.info("ctls="+ ctls);
 		
 		

 		Map<String, Object> model = new HashMap<String, Object>();
 		model.put("posted", posted);//
 		model.put("ctls", ctls);//
 		model.put("starttime", starttime);//
 		model.put("endtime", endtime);//
 		model.put("countEncontrado", countEncontrado);//
 		model.put("countNoEncontrado", countNoEncontrado);//
 		model.put("namePage", "trazabilidad");//
 		model.put("estadoCtls", estadoCtls);//
 		model.put("bodegaCtls", bodegaCtls);//
 		
		return new ModelAndView("role/financial/cuadraturaCtl", model);
	}
    
    @RequestMapping(value = "**/financial/cuadraturaDo", method = RequestMethod.GET)
	public ModelAndView cuadraturaDo(Integer p, String posted,String  dateInicio, String  dateFin, String estado) {
		log.info("Do");
		Date dNow = new Date();
		SimpleDateFormat ft = new SimpleDateFormat ("dd/MM/yyyy");
		String currentDate = ft.format(dNow);
		//String starttime = DateUtils.turnDate(dateInicio) != null?DateUtils.turnDate(dateInicio):DateUtils.turnDate(currentDate);
		//String endtime = DateUtils.turnDate(dateFin) != null?DateUtils.turnDate(dateFin):DateUtils.turnDate(currentDate);
		
 		String starttime = DateUtils.turnDateCtl(dateInicio) != null?DateUtils.turnDateCtl(dateInicio):DateUtils.turnDateCtl(DateUtils.restarDiaFecha(currentDate,"1"));
 		String endtime = DateUtils.turnDateCtl(dateInicio) != null?DateUtils.turnDateCtl(dateInicio):DateUtils.turnDateCtl(DateUtils.restarDiaFecha(currentDate,"1"));

		//int total;
		log.info("p="+p);
 		log.info("posted="+posted);
 		log.info("dateInicio="+dateInicio);
 		log.info("dateFin="+ dateFin);
 		log.info("estado="+ estado);
		log.info("starttime="+ starttime);
		log.info("endtime="+ endtime);


		int pagelimit1 = 0;
		int pagelimit = pagelimit1 > 0?pagelimit1:25;
		int p1 = p != null?p:1;
		String estado2 = !"All".equals(estado) && estado != null?estado:"9";
		int encontrados = Integer.parseInt(estado2);
		log.info("encontrados="+ encontrados);
		
		String qstr = "";
		
		
		if (dateInicio != null)
			qstr += "&dateInicio="+DateUtils.encode(dateInicio);
		else
			qstr += "";
		
		if (dateFin != null)
			qstr += "&dateFin="+DateUtils.encode(dateFin);
		else
			qstr += "";
		
		if (estado != null)
			qstr += "&estado="+estado;
		else
			qstr += "";
		
		
		log.info("qstr:"+qstr);
		//PageNate pageNate = new PageNate(10000, p1, pagelimit, "");
		//pageNate.setURL("detalleNoEncontradoSoporteVentaEom", qstr);
		
		int countNoEncontrado = cuadraturaDoServicesImpl.getCuadraturaDoContar( starttime+" 00:00:00", endtime+" 23:59:59",  0);
		log.info("countNoEncontrado="+ countNoEncontrado);
		List<CuadraturaDoDTO> dos = cuadraturaDoServicesImpl.getCuadraturaDos( starttime+" 00:00:00", endtime+" 23:59:59",  0, 0, 1000000000);

 		Map<String, Object> model = new HashMap<String, Object>();
 		model.put("posted", posted);//
 		model.put("dos", dos);//
 		model.put("starttime", starttime);//
 		model.put("endtime", endtime);//
 		model.put("countNoEncontrado", countNoEncontrado);//
 		model.put("namePage", "trazabilidad");//
		return new ModelAndView("role/financial/cuadraturaDo", model);
	}
    
 
     

}
