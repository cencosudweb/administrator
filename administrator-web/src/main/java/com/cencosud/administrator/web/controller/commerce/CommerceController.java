/**
 * 
 */
package com.cencosud.administrator.web.controller.commerce;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
//import org.springframework.context.MessageSource;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.cencosud.administrator.core.AreaServices;
import com.cencosud.administrator.core.BodegaCtlServices;
//import com.cencosud.administrator.web.validator.AdminUsersValidator;
import com.cencosud.administrator.core.ClienteRetiraServices;
import com.cencosud.administrator.core.CommerceServices;
import com.cencosud.administrator.core.ContratanteServices;
import com.cencosud.administrator.core.CuadraturaCtlServices;
import com.cencosud.administrator.core.CuadraturaDoServices;
import com.cencosud.administrator.core.CuadraturaOrdenCompraVentaCompServices;
import com.cencosud.administrator.core.CuadraturaVtavPdServices;
import com.cencosud.administrator.core.CumplimientoServices;
import com.cencosud.administrator.core.CumplimientokpiWebServices;
//import com.cencosud.administrator.core.CommerceServices;
import com.cencosud.administrator.core.DescripcionEmpresaServices;
import com.cencosud.administrator.core.EstadoCtlServices;
import com.cencosud.administrator.core.EstadoCumpleResumenServices;
import com.cencosud.administrator.core.EstadoCumpleServices;
import com.cencosud.administrator.core.EstadoCumplimientoServices;
import com.cencosud.administrator.core.EstadoOdServices;
import com.cencosud.administrator.core.EstadoOrdenStockServices;
import com.cencosud.administrator.core.EstadoResponsableServices;
import com.cencosud.administrator.core.EstadoServices;
import com.cencosud.administrator.core.FinancialInstitutionServices;
import com.cencosud.administrator.core.GerenteServices;
//import com.cencosud.administrator.core.FinancialInstitutionServices;
import com.cencosud.administrator.core.HorarioActualizacionStockServices;
import com.cencosud.administrator.core.HorarioServices;
import com.cencosud.administrator.core.HorarioVentaEnVerdeActualizacionServices;
import com.cencosud.administrator.core.OrdeneStockPendienteServices;
import com.cencosud.administrator.core.PadrinoServices;
import com.cencosud.administrator.core.PautaServices;
import com.cencosud.administrator.core.PrioridadServices;
import com.cencosud.administrator.core.ReportadoServices;
import com.cencosud.administrator.core.RoleServices;
import com.cencosud.administrator.core.SoporteServices;
import com.cencosud.administrator.core.TiendaServices;
//import com.cencosud.administrator.core.RoleServices;
import com.cencosud.administrator.core.TipoEstadoOrdenCompraStockServices;
import com.cencosud.administrator.core.TipoEstadoVentaEnVerdeServices;
import com.cencosud.administrator.core.TipoGuiaServices;
import com.cencosud.administrator.core.TipoOrdenServices;
import com.cencosud.administrator.core.TipoVentaServices;
import com.cencosud.administrator.core.UserServices;
import com.cencosud.administrator.core.VentaEmpresaServices;
import com.cencosud.administrator.core.enums.StatusEnum;
import com.cencosud.administrator.core.util.PageNate;
import com.cencosud.administrator.core.util.PasswordGenerator;
import com.cencosud.administrator.dto.users.AreaDTO;
import com.cencosud.administrator.dto.users.BodegaCtlDTO;
import com.cencosud.administrator.dto.users.ClienteRetiraDTO;
import com.cencosud.administrator.dto.users.CommerceDTO;
import com.cencosud.administrator.dto.users.ContratanteDTO;
import com.cencosud.administrator.dto.users.CuadraturaCtlDTO;
import com.cencosud.administrator.dto.users.CuadraturaDoDTO;
import com.cencosud.administrator.dto.users.CuadraturaOrdenCompraVentaCompDTO;
import com.cencosud.administrator.dto.users.CuadraturaVtavPdDTO;
import com.cencosud.administrator.dto.users.CumplimientoDTO;
import com.cencosud.administrator.dto.users.CumplimientokpiWebDTO;
import com.cencosud.administrator.dto.users.DescripcionEmpresaDTO;
import com.cencosud.administrator.dto.users.EstadoCtlDTO;
import com.cencosud.administrator.dto.users.EstadoCumpleDTO;
import com.cencosud.administrator.dto.users.EstadoCumpleResumenDTO;
import com.cencosud.administrator.dto.users.EstadoCumplimientoDTO;
import com.cencosud.administrator.dto.users.EstadoDTO;
import com.cencosud.administrator.dto.users.EstadoOdDTO;
import com.cencosud.administrator.dto.users.EstadoOrdenStockDTO;
import com.cencosud.administrator.dto.users.EstadoResponsableDTO;
import com.cencosud.administrator.dto.users.FinancialInstitutionDTO;
import com.cencosud.administrator.dto.users.GerenteDTO;
import com.cencosud.administrator.dto.users.HorarioActualizacionStockDTO;
import com.cencosud.administrator.dto.users.HorarioDTO;
import com.cencosud.administrator.dto.users.HorarioVentaEnVerdeActualizacionDTO;
import com.cencosud.administrator.dto.users.OrdeneStockPendienteDTO;
import com.cencosud.administrator.dto.users.PadrinoDTO;
import com.cencosud.administrator.dto.users.PautaDTO;
import com.cencosud.administrator.dto.users.PrioridadDTO;
import com.cencosud.administrator.dto.users.ReportadoDTO;
import com.cencosud.administrator.dto.users.RoleDTO;
import com.cencosud.administrator.dto.users.SoporteDTO;
import com.cencosud.administrator.dto.users.TiendaDTO;
import com.cencosud.administrator.dto.users.TipoEstadoOrdenCompraStockDTO;
import com.cencosud.administrator.dto.users.TipoEstadoVentaEnVerdeDTO;
import com.cencosud.administrator.dto.users.TipoGuiaDTO;
import com.cencosud.administrator.dto.users.TipoOrdenDTO;
import com.cencosud.administrator.dto.users.TipoVentaDTO;
import com.cencosud.administrator.dto.users.UserDTO;
import com.cencosud.administrator.dto.users.VentaEmpresaDTO;
import com.cencosud.administrator.utils.OperationResult;
import com.cencosud.administrator.web.controller.base.BaseController;
import com.cencosud.administrator.web.controller.enums.MensajesResultado;
import com.cencosud.administrator.web.utils.DateUtils;
import com.cencosud.administrator.web.validator.AdminPautaValidator;

/**
 * @author jose
 *
 */

@Controller
public class CommerceController extends BaseController {
	
	private static Logger log = Logger.getLogger(CommerceController.class);

	@Autowired
    private MessageSource msgSrc;  
    @Autowired
	private UserServices userServicesImpl;
    @Autowired
	private FinancialInstitutionServices financialInstitutionServicesImpl;
    @Autowired
	private CommerceServices commerceServicesImpl;
    @Autowired
    private AdminPautaValidator validator;
    @Autowired
	private RoleServices roleServicesImpl;
    
    private List<FinancialInstitutionDTO> ifs;
    private List<CommerceDTO> commerces;
    private List<RoleDTO> roles;
    
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
   	private TipoEstadoVentaEnVerdeServices tipoEstadoVentaEnVerdeServicesImpl;
    
    @Autowired
   	private HorarioVentaEnVerdeActualizacionServices horarioVentaEnVerdeActualizacionServicesImpl;
    
    @Autowired
   	private TipoEstadoOrdenCompraStockServices tipoEstadoOrdenCompraStockServicesImpl;
   
    @Autowired
   	private HorarioActualizacionStockServices horarioActualizacionStockServicesImpl;

    
    @Autowired
   	private CuadraturaOrdenCompraVentaCompServices cuadraturaOrdenCompraVentaCompServicesImpl;
    
    @Autowired
   	private CuadraturaVtavPdServices cuadraturaVtavPdServicesImpl;
    
    @Autowired
	private OrdeneStockPendienteServices ordeneStockPendienteServicesImpl;
    
    
    
    @Autowired
   	private PrioridadServices prioridadServicesImpl;
    @Autowired
   	private ReportadoServices reportadoServicesImpl;
    @Autowired
   	private AreaServices areaServicesImpl;
    @Autowired
   	private TiendaServices tiendaServicesImpl;
    @Autowired
   	private PadrinoServices padrinoServicesImpl;
    @Autowired
   	private GerenteServices gerenteServicesImpl;
    @Autowired
   	private ContratanteServices contratanteServicesImpl;
    @Autowired
   	private SoporteServices soporteServicesImpl;
    @Autowired
   	private PautaServices pautaServicesImpl;
    @Autowired
   	private EstadoServices estadoServicesImpl;
    
    
    private List<PrioridadDTO> prioridades;
    private List<ReportadoDTO> reportados;
    private List<AreaDTO> areas;
    private List<TiendaDTO> tiendas;
    private List<PadrinoDTO> padrinos;
    private List<GerenteDTO> gerentes;
    private List<ContratanteDTO> contratantes;
    private List<SoporteDTO> soportes;
    private List<EstadoDTO> estados;
    
    @Autowired
   	private CumplimientokpiWebServices cumplimientokpiWebServicesImpl;
   
    @Autowired
	private CumplimientoServices cumplimientoServicesImpl;
    
    @Autowired
   	private EstadoOdServices estadoOdServicesImpl;
    
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

    
    @RequestMapping(value = "**/commerce/reportePanelDinamico", method = RequestMethod.GET)
    public ModelAndView reportePanelDinamico(String posted, String tipo_orden, String tipo_venta, String cliente_retira,  String descripcion_empresa, String tipo_guia, String tipo_horario, String venta_empresa, String tipo_estado, String dateInicio, String cumplimiento, String cumple_resumen, String responsable) {
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
		return new ModelAndView("role/commerce/reportePanelDinamico", model);
    }
    
    @RequestMapping(value = "**/commerce/reportePanelDinamico2", method = RequestMethod.GET)
    public ModelAndView reportePanelDinamico2(String posted, String tipo_orden, String tipo_venta, String cliente_retira,  String descripcion_empresa, String tipo_guia, String tipo_horario, String venta_empresa, String tipo_estado, String dateInicio, String cumplimiento, String cumple_resumen, String responsable) {
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
		
		Map<String, Object> model = new HashMap<String, Object>();
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
		model.put("tipo_ordenN", tipo_orden);
		
		
		return new ModelAndView("role/commerce/reportePanelDinamico2", model);
    }
    
    @RequestMapping(value = "**/commerce/reportePanelDinamicoPrint", method = RequestMethod.GET)
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
		return new ModelAndView("role/commerce/reportePanelDinamicoPrint", model);
    }
    
    @RequestMapping(value = "**/commerce/reportePanelEstatico", method = RequestMethod.GET)
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
		return new ModelAndView("role/commerce/reportePanelEstatico", model);
    }
    
    @RequestMapping(value = "**/commerce/reportePanelEstaticoPrint", method = RequestMethod.GET)
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
		return new ModelAndView("role/commerce/reportePanelEstaticoPrint", model);
    }
    
    
    @RequestMapping(value = "**/commerce/reporteCuadraturaVentaEnVerde", method = RequestMethod.GET)
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
		return new ModelAndView("role/commerce/reporteCuadraturaVentaEnVerde", model);
    }
    
    
    @RequestMapping(value = "**/commerce/reporteCuadraturaVentaEnVerdeCantidad", method = RequestMethod.GET)
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
		return new ModelAndView("role/commerce/reporteCuadraturaVentaEnVerdeCantidad", model);
    }
    
    @RequestMapping(value = "**/commerce/reporteCuadraturaVentaEnVerdePrint", method = RequestMethod.GET)
    public ModelAndView reportePrintCuadraturaVentaEnVerdePrint(String posted, String dateInicio, String dateFin, String estado) {
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
		return new ModelAndView("role/commerce/reporteCuadraturaVentaEnVerdePrint", model);
    }
    
    
    @RequestMapping(value = "**/commerce/reporteOrdenDeCompraStock", method = RequestMethod.GET)
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
		return new ModelAndView("role/commerce/reporteOrdenDeCompraStock", model);
    }
    
    @RequestMapping(value = "**/commerce/reporteOrdenDeCompraStockPrint", method = RequestMethod.GET)
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
		return new ModelAndView("role/commerce/reporteOrdenDeCompraStockPrint", model);
    }
    
    
    @RequestMapping(value = "**/commerce/reportePanelDinamicoMensual", method = RequestMethod.GET)
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
		model.put("estadocumpleresumens", estadocumpleresumens);
		model.put("estadocumplimientos", estadocumplimientos);
		model.put("estadoresponsables", estadoresponsables);
		model.put("tipo_ordenN", tipo_orden);
		return new ModelAndView("role/commerce/reportePanelDinamicoMensual", model);
    }
    
    @RequestMapping(value = "**/commerce/reportePanelDinamicoMensualComparar", method = RequestMethod.GET)
    public ModelAndView reportePanelDinamicoMensualComparar(String posted, String tipo_orden, String tipo_venta, String cliente_retira,  String descripcion_empresa, String tipo_guia, String tipo_horario, String venta_empresa, String tipo_estado, String dateInicio, String cumplimiento, String cumple_resumen, String responsable) {
		log.info("user:reportePanelDinamicoMensualCompararComparar");
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
		//List<VentaEmpresaDTO> ventaempresas = ventaEmpresaServicesImpl.getVentaEmpresas();
		//List<FechaCompromisoDTO> fechas = fechaCompromisoServicesImpl.getFechaCompromisos();
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
		model.put("guias", guias);
		//model.put("horarios", horarios);
		//model.put("ventaempresas", ventaempresas);
		//model.put("fechas", fechas);
		//model.put("estadocumples", estadocumples);
		return new ModelAndView("role/commerce/reportePanelDinamicoMensualComparar", model);
    }
    
    
    @RequestMapping(value = "role/commerce/reporteTrackLogistica", method = RequestMethod.GET)
    public ModelAndView reporteTrackLogistica(String posted, String tipo_orden, String tipo_venta, String cliente_retira,  String descripcion_empresa, String tipo_guia, String tipo_horario, String venta_empresa, String tipo_estado, String dateInicio, String cumplimiento, String cumple_resumen, String responsable) {
		log.info("user:reporteTrackLogistica");
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
		
		
		return new ModelAndView("role/commerce/reporteTrackLogistica", model);
    }
    
    
    @RequestMapping(value = "**/commerce/reporteCuadraturaEcommerceSoporteVenta", method = RequestMethod.GET)
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
		return new ModelAndView("role/commerce/reporteCuadraturaEcommerceSoporteVenta", model);
    }
    
    
    @RequestMapping(value = "**/commerce/detalleCuadraturaVentaEnVerdeCantidad", method = RequestMethod.GET)
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
		return new ModelAndView("role/commerce/detalleCuadraturaVentaEnVerdeCantidad", model);
    }
    
    
    @RequestMapping(value = "**/commerce/allPautas", method = RequestMethod.GET)
    public ModelAndView pautas(Integer p,  Long tienda, Long padrino,  Long gerente, Long contraparte, Long soporte, Long estado, String dateInicio) {
    	log.info("user:allPautas");
		log.info("p:"+p);
		log.info("tienda:"+tienda);
		log.info("padrino:"+padrino);
		log.info("gerente:"+gerente);
		log.info("contraparte:"+contraparte);
		log.info("soporte:"+soporte);
		log.info("estado:"+estado);
		log.info("dateInicio:"+dateInicio);
		UserDTO principal = (UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		log.info("user:allUsers Usuario Actual "+principal.getUsername());
		log.info("user:allUsers Nombre Usuario Actual "+principal.getName());
		Map<String, Object> model = new HashMap<String, Object>();
		ModelAndView forward;
		Integer total;
		//String tiendaId = tienda != null?tienda:null;
		String starttime = DateUtils.turnDate(dateInicio) != null?DateUtils.turnDate(dateInicio):null;
		//String stoptime = DateUtils.turnDate(dateFin) != null?DateUtils.turnDate(dateFin).concat(" 23:59:59"):null;
		//String padrino1 = padrino != null && padrino != ""?padrino:null;
		//String gerente1 = gerente != null && gerente != ""?gerente:null;
		//String contratante1 =  contratante != null && contratante != ""?contratante:null;
		//String soporte1 = soporte != null?soporte:null;
		
		//Convertir in a String y Viceversa
		//int entero = 0;
		//String enteroString = Integer.toString(entero);
		//String enteroString = "5";
		//int entero = Integer.parseInt(enteroString);
		TiendaDTO tiendas;
		if (tienda != null) {
			tiendas  = tiendaServicesImpl.getTiendasId(tienda);
		} else {
			tiendas = null;
		}
		
		PadrinoDTO padrinos;
		if (padrino != null) {
			padrinos  = padrinoServicesImpl.getPadrinosId(padrino);
			//padrinos  = padrinoServicesImpl.getPadrino(principal.getName());
		} else {
			//padrinos  = padrinoServicesImpl.getPadrino(principal.getName());
			padrinos  = null;
		}
		
		GerenteDTO gerentes;
		if (gerente != null) {
			gerentes  = gerenteServicesImpl.getGerentesId(gerente);
		} else {
			gerentes = null;
		}
		
		ContratanteDTO contratantes;
		if (contraparte != null) {
			contratantes  = contratanteServicesImpl.getContratantesId(contraparte);
		} else {
			contratantes = null;
		}
		
		SoporteDTO soportes;
		if (soporte != null) {
			soportes  = soporteServicesImpl.getSoportesId(soporte);
		} else {
			soportes = null;
		}
		
		EstadoDTO estados;
		if (estado != null) {
			estados  = estadoServicesImpl.getEstadosId(estado);
		} else {
			estados = null;
		}
		total = pautaServicesImpl.getCountPautas(tiendas, padrinos, gerentes, contratantes, soportes, estados, starttime);
		
		log.info("total:"+total);
		int pagelimit1 = 0;
		int pagelimit = pagelimit1 > 0?pagelimit1:25;
		int p1 = p != null?p:1;
		String qstr = "";
		
		
		if (tienda != null)
			qstr += "&tienda="+tienda;
		else
			qstr += "";
		
		if (dateInicio != null)
			qstr += "&dateInicio="+DateUtils.encode(dateInicio);
		else
			qstr += "";

		if (padrino != null )
			qstr += "&padrino="+padrino;
		else
			qstr += "";
		
		if (gerente != null )
			qstr += "&gerente="+gerente;
		else
			qstr += "";
		
		if (contraparte != null )
			qstr += "&contraparte="+contraparte;
		else
			qstr += "";

		if (soporte != null )
			qstr += "&soporte="+soporte;
		else
			qstr += "";
		
		if (estado != null )
			qstr += "&estado="+estado;
		else
			qstr += "";
		
		
		log.info("qstr:"+qstr);
		PageNate pageNate = new PageNate(total, p1, pagelimit, "");
		pageNate.setURL("allPautas", qstr);
		
		//log.info("getStart:"+pageNate.getStart());
		//log.info("getLimit:"+pageNate.getLimit());
		log.info("starttime="+starttime);
		log.info("tiendaID="+tiendas);
		log.info("padrinosID="+padrinos);
		//List<PautaDTO> pautas = pautaServicesImpl.getPautas(tiendas, padrinos, gerentes, contratantes, soportes, null,pageNate.getStart(), pageNate.getLimit());
		List<PautaDTO> pautas = pautaServicesImpl.getPautas(tiendas, padrinos, gerentes, contratantes, soportes, estados, starttime,0, 1000000000);

		List<UserDTO> users = userServicesImpl.getUsers();
		List<TiendaDTO> tiendaNumero = tiendaServicesImpl.getTiendas();
		List<PadrinoDTO> padrinoNumero = padrinoServicesImpl.getPadrinos(null);
		//List<PadrinoDTO> padrinoNumero = padrinoServicesImpl.getPadrinoDescs(principal.getName());


		List<GerenteDTO> gerentesNumero = gerenteServicesImpl.getGerentes(null);
		List<ContratanteDTO> contratantesNumero = contratanteServicesImpl.getContratantes(null);
		List<SoporteDTO> soportesNumero = soporteServicesImpl.getSoportes(null);
		List<EstadoDTO> estadosNumero = estadoServicesImpl.getEstados();
		
		if (pautas != null) {
			
			forward = new ModelAndView("role/commerce/allPautas", model);
			forward.addObject("pautas", pautas);
			forward.addObject("users", users);
			forward.addObject("tiendas", tiendaNumero);
			//forward.addObject("record", total);
			forward.addObject("p", p);
			forward.addObject("user", principal);
			forward.addObject("padrinos",padrinoNumero);
			forward.addObject("gerentes", gerentesNumero);
			forward.addObject("contratantes", contratantesNumero);
			forward.addObject("soportes", soportesNumero);
			forward.addObject("estados", estadosNumero);
			forward.addObject("numpages", pageNate.getNumPages());
			forward.addObject("pagelinks", pageNate.getPageLinks());
			forward.addObject("users", users);
		} else {
			String mensaje=msgSrc.getMessage("pauta.noexiste", null, null);
			int codigo=MensajesResultado.FRACASO.getCodigo();
			
			forward = new ModelAndView("role/commerce/allPautas", model);
			forward.addObject("user", principal);
			forward.addObject("codMsg", codigo);
			forward.addObject("msg", mensaje);
		}
		
		return forward;
    	
    	
    }
    
    @RequestMapping(value = "**/commerce/addPauta", method = RequestMethod.GET)
    public ModelAndView pauta() {
		log.info("user:addPauta");
		UserDTO principal = (UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		log.info("user:allUsers Usuario Actual "+principal.getUsername());
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		Date dNow = new Date();
		SimpleDateFormat ft = new SimpleDateFormat ("dd/MM/yyyy");
		String currentDate = ft.format(dNow);

		
		prioridades = prioridadServicesImpl.getPrioridads();
		model.put("prioridades", prioridades);
		
		reportados = reportadoServicesImpl.getReportados();
		model.put("reportados", reportados);
		
		areas = areaServicesImpl.getAreas();
		model.put("areas", areas);
		
		tiendas = tiendaServicesImpl.getTiendas();
		model.put("tiendas", tiendas);
		
		//padrinos = padrinoServicesImpl.getPadrinos(null);
		padrinos = padrinoServicesImpl.getPadrinoDescs(principal.getName());

		model.put("padrinos", padrinos);
		
		gerentes = gerenteServicesImpl.getGerentes(null);
		model.put("gerentes", gerentes);
		
		contratantes = contratanteServicesImpl.getContratantes(null);
		model.put("contratantes", contratantes);
		
		soportes = soporteServicesImpl.getSoportes(null);
		model.put("soportes", soportes);
		
		estados = estadoServicesImpl.getEstados();
		model.put("estados", estados);
		
		
		
		//IF por defecto al crear usuario
		PautaDTO pautaDTO = new PautaDTO();
		pautaDTO.setFechaVisita2(currentDate);
		pautaDTO.setTypeSelected("");
		pautaDTO.setValorTienda("");;
		pautaDTO.setValorPadrino("");
		pautaDTO.setValorGerente("");
		pautaDTO.setValorContratante("");
		pautaDTO.setValorSoporte("");
		pautaDTO.setValid("nok");
		
		ifs = financialInstitutionServicesImpl.getFIs(StatusEnum.UNBLOCKED_FINANCIAL.getCode());
		model.put("ifs", ifs);
		
		commerces = commerceServicesImpl.getCommerces(StatusEnum.UNBLOCKED_COMMERCE.getCode());
		model.put("commerces", commerces);
		
		roles = roleServicesImpl.getRoles(false);
		model.put("roles", roles);
		
		model.put("test", "nok");
		
		List<UserDTO> users = userServicesImpl.getUsers();
		
		ModelAndView forward= new ModelAndView("role/commerce/addPauta", model);
		forward.addObject("newPauta", pautaDTO);
		model.put("users", users);
		forward.addObject("user", principal);
		return forward;
    }
    
    @RequestMapping(value = "**/commerce/savePauta", method = RequestMethod.POST)
    public ModelAndView save(@ModelAttribute("newPauta") PautaDTO pauta, BindingResult result, SessionStatus status) {
		log.info("user:savePauta");
		UserDTO principal = (UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		log.info("user:allUsers Usuario Actual "+principal.getUsername());
		log.info("user:Tienda="+pauta.getTienda().getId());
		log.info("user:Padrino="+pauta.getPadrino().getId());

		Map<String, Object> model = new HashMap<String, Object>();
		ModelAndView forward;
		OperationResult resultado;
		String mensaje = "";
		int codigo = -1;
		String starttime = DateUtils.turnDate(pauta.getFechaVisita2()) != null?DateUtils.turnDate(pauta.getFechaVisita2()):DateUtils.turnDate(pauta.getFechaVisita2());
		log.info("starttime="+starttime);
		log.info("user:savePauta="+pauta.getTypeSelected());
		log.info("user:ValorTienda="+pauta.getValorTienda());
		log.info("user:ValorTienda="+pauta.getTienda().getId());
		
		
		log.info("user:ValorPadrino="+pauta.getValorPadrino());
		log.info("user:ValorPadrino="+pauta.getPadrino().getId());
		
		
		log.info("user:ValorGerente="+pauta.getValorGerente());
		log.info("user:ValorContraparte="+pauta.getValorContratante());
		log.info("user:ValorSoporte="+pauta.getValorSoporte());
		log.info("user:Valid="+pauta.getValid());
		log.info("user:Valid="+pauta.getNumeroRequerimiento());
		log.info("Valid="+pauta.getValid());
		
		
		validator.validateAdd(pauta, result);
		if(!result.hasErrors()){
			log.info("Ok=");
			/*
			if(user.getTypeSelected() == RoleEnum.ROLE_USER_IF.getId().intValue()){
				user.setCommerces(null);
			}else{
				user.setFis(null);
			}
			*/
			
			
				
			//user.setRut(StringUtils.getDBRut(user.getRut()));
			//user.setPhone(user.getPhone());
			int ramdom = PasswordGenerator.randomNumber(1000);
			
			
			log.info("ramdom="+ramdom);
			
			log.info("fecha="+pauta.getNumeroRequerimiento());
			log.info("fecha="+pauta.getTienda().getId());
			log.info("fecha="+pauta.getFechaVisita2());
			log.info("fecha="+pauta.getFechaVisita2());
			log.info("fecha="+pauta.getFechaVisita2());
			log.info("fecha="+pauta.getFechaVisita2());
			
			log.info("fecha="+pauta.getFechaVisita2());

			pauta.setNumeroRequerimiento(ramdom);
			
			int validPauta = pautaServicesImpl.getPautaRandom(pauta.getNumeroRequerimiento());
			log.info("validPauta="+validPauta);
			
			
			TiendaDTO tienda = new TiendaDTO(pauta.getTienda().getId());
			//TiendaDTO tienda = new TiendaDTO(Long.parseLong(pauta.getValorTienda()));
			pauta.setTienda(tienda);
			
			//PadrinoDTO padrino = new PadrinoDTO(Long.parseLong(pauta.getValorPadrino()));
			PadrinoDTO padrino = new PadrinoDTO(pauta.getPadrino().getId());
			pauta.setPadrino(padrino);
			
			GerenteDTO gerente = new GerenteDTO(new Long(1));
			pauta.setGerente(gerente);
			
			
			
			ContratanteDTO contratante = new ContratanteDTO(new Long(1));
			pauta.setContratante(contratante);
			
			SoporteDTO soporte = new SoporteDTO(new Long(1));
			pauta.setSoporte(soporte);
			
			
			ReportadoDTO reportado = new ReportadoDTO(new Long(1));
			pauta.setReportado(reportado);
			
			AreaDTO area = new AreaDTO(pauta.getArea().getId());
			
			EstadoDTO estado = new EstadoDTO(pauta.getEstado().getId());
			pauta.setEstado(estado);

			PrioridadDTO prioridad = new PrioridadDTO (pauta.getPrioridad().getId());
			pauta.setPrioridad(prioridad);
			pauta.setDescripcionIssue(pauta.getDescripcionIssue());
			pauta.setObservacion(pauta.getObservacion());
			
			
			pauta.setFechaVisita(starttime);
			
			pauta.setTicketCu(pauta.getTicketCu() != null || pauta.getTicketCu() != ""?pauta.getTicketCu():"-" );
			
			
			log.info("Id="+pauta.getId());
			resultado =  pautaServicesImpl.addPauta(pauta);
			
			
			
			
			if(resultado.getResult() == OperationResult.SUCCESS){
				mensaje=msgSrc.getMessage("admin.pauta.add.exito", null, null);
				codigo=MensajesResultado.EXITO.getCodigo();
			}else{
				mensaje=msgSrc.getMessage("admin.pauta.add.fracaso", null, null);
				codigo=MensajesResultado.FRACASO.getCodigo();
			}
			
			List<PautaDTO> pautas = pautaServicesImpl.getPautas(null, null, null, null, null, null, null, 0, 1000000000);
			model.put("pautas", pautas);
			
			prioridades = prioridadServicesImpl.getPrioridads();
			model.put("prioridades", prioridades);
			
			reportados = reportadoServicesImpl.getReportados();
			model.put("reportados", reportados);
			
			areas = areaServicesImpl.getAreas();
			model.put("areas", areas);
			
			tiendas = tiendaServicesImpl.getTiendas();
			model.put("tiendas", tiendas);
			
			padrinos = padrinoServicesImpl.getPadrinos(null);
			//padrinos = padrinoServicesImpl.getPadrinoDescs(principal.getName());
			model.put("padrinos", padrinos);
			
			gerentes = gerenteServicesImpl.getGerentes(null);
			model.put("gerentes", gerentes);
			
			contratantes = contratanteServicesImpl.getContratantes(null);
			model.put("contratantes", contratantes);
			
			soportes = soporteServicesImpl.getSoportes(null);
			model.put("soportes", soportes);
			
			estados = estadoServicesImpl.getEstados();
			model.put("estados", estados);
			
			List<UserDTO> users = userServicesImpl.getUsers();
			model.put("users", users);
			
			forward = new ModelAndView("role/commerce/allPautas", model);
			forward.addObject("codMsg", codigo);
			forward.addObject("msg", mensaje);
			forward.addObject("user", principal);
		}else{
			
			log.info("NO Ok=");
			List<PautaDTO> pautas = pautaServicesImpl.getPautas(null, null, null, null, null, null,null, 0, 1000000000);
			model.put("pautas", pautas);
			
			List<UserDTO> users = userServicesImpl.getUsers();
			model.put("users", users);
			
			model.put("prioridades", prioridades);
			model.put("reportados", reportados);
			model.put("areas", areas);
			model.put("tiendas", tiendas);
			model.put("padrinos", padrinos);
			model.put("gerentes", gerentes);
			model.put("contratantes", contratantes);
			model.put("soportes", soportes);
			model.put("estados", estados);
			
			
			
			

			
			//model.put("typeSelected", user.getTypeSelected());
			forward = new ModelAndView("role/commerce/addPauta", model);
			forward.addObject("newPauta", pauta);
			forward.addObject("user", principal);
		}
		forward.addObject("errors", result.getAllErrors());
		return forward;
    }
    
    @RequestMapping(value = "**/commerce/editPauta", method = RequestMethod.GET)
    public ModelAndView editPauta(Long id) {
		log.info("user:editPauta");
		UserDTO principal = (UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		log.info("user:allUsers Usuario Actual "+principal.getUsername());
		
		log.info("user:Long "+id);
		Map<String, Object> model = new HashMap<String, Object>();
		ModelAndView forward;
		
		PautaDTO pauta = pautaServicesImpl.getPauta(id);
		if(pauta!=null){
			pauta.setFechaVisita2( DateUtils.turnDateEditPauta(pauta.getFechaVisita()));
			
			
			prioridades = prioridadServicesImpl.getPrioridads();
			model.put("prioridades", prioridades);
			reportados = reportadoServicesImpl.getReportados();
			model.put("reportados", reportados);
			areas = areaServicesImpl.getAreas();
			model.put("areas", areas);
			tiendas = tiendaServicesImpl.getTiendas();
			model.put("tiendas", tiendas);
			padrinos = padrinoServicesImpl.getPadrinos(null);
			//padrinos = padrinoServicesImpl.getPadrinoDescs(principal.getName());
			model.put("padrinos", padrinos);
			gerentes = gerenteServicesImpl.getGerentes(null);
			model.put("gerentes", gerentes);
			contratantes = contratanteServicesImpl.getContratantes(null);
			model.put("contratantes", contratantes);
			soportes = soporteServicesImpl.getSoportes(null);
			model.put("soportes", soportes);
			estados = estadoServicesImpl.getEstados();
			model.put("estados", estados);
			
			List<UserDTO> users = userServicesImpl.getUsers();
			model.put("users", users);
			
			
			
			//IF por defecto al crear usuario
			PautaDTO pautaDTO = new PautaDTO();
			//pautaDTO.setFechaVisita2(currentDate);
			pautaDTO.setTypeSelected("1");
			pautaDTO.setValorTienda("1");
			pautaDTO.setValorPadrino("1");
			pautaDTO.setValorGerente("1");
			pautaDTO.setValorContratante("1");
			pautaDTO.setValorSoporte("1");

			
			forward = new ModelAndView("role/commerce/editPauta", model);
			forward.addObject("editPauta", pauta);
			forward.addObject("user", principal);
		}else{
			String mensaje=msgSrc.getMessage("pauta.noexiste", null, null);
			int codigo=MensajesResultado.FRACASO.getCodigo();
			List<PautaDTO> pautas = pautaServicesImpl.getPautas();
			model.put("pautas", pautas);
			forward = new ModelAndView("role/admin/pauta/allPautas", model);
			forward.addObject("codMsg", codigo);
			forward.addObject("msg", mensaje);
			forward.addObject("user", principal);
		}
		return forward;
    }
    
    
    @RequestMapping(value = "**/commerce/saveEditPauta", method = RequestMethod.POST)
	public ModelAndView saveEditPauta(
			@ModelAttribute("editPauta") PautaDTO pauta,
			BindingResult result, SessionStatus status) {
		log.info("Pauta:saveEditPauta");
		UserDTO principal = (UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		log.info("user:allUsers Usuario Actual "+principal.getUsername());
		
		Map<String, Object> model = new HashMap<String, Object>();
		ModelAndView forward;
		OperationResult resultado;
		String mensaje = "";
		int codigo = -1; 
		String starttime = DateUtils.turnDate(pauta.getFechaVisita2()) != null?DateUtils.turnDate(pauta.getFechaVisita2()):DateUtils.turnDate(pauta.getFechaVisita2());
		log.info("starttime1="+starttime);
		log.info("starttime2="+pauta.getFechaVisita2());
		
		validator.validateEdit(pauta, result);
		if (!result.hasErrors()) {
			
			
			
			
			pauta.setFechaVisita2(starttime);
			log.info("starttime3="+pauta.getFechaVisita2());
			
			//TiendaDTO tienda = new TiendaDTO(Long.parseLong(pauta.getValorTienda()));
			TiendaDTO tienda = new TiendaDTO(pauta.getTienda().getId());
			pauta.setTienda(tienda);
			
			//PadrinoDTO padrino = new PadrinoDTO(Long.parseLong(pauta.getValorPadrino()));
			PadrinoDTO padrino = new PadrinoDTO(pauta.getPadrino().getId());

			pauta.setPadrino(padrino);
			
			GerenteDTO gerente = new GerenteDTO(new Long(1));
			pauta.setGerente(gerente);
			
			ContratanteDTO contratante = new ContratanteDTO(new Long(1));
			pauta.setContratante(contratante);
			
			SoporteDTO soporte = new SoporteDTO(new Long(1));
			pauta.setSoporte(soporte);
			
			
			ReportadoDTO reportado = new ReportadoDTO(new Long(1));
			pauta.setReportado(reportado);
			
			AreaDTO area = new AreaDTO(pauta.getArea().getId());
			pauta.setArea(area);
			
			EstadoDTO estado = new EstadoDTO(pauta.getEstado().getId());
			pauta.setEstado(estado);

			PrioridadDTO prioridad = new PrioridadDTO (pauta.getPrioridad().getId());
			pauta.setPrioridad(prioridad);
			pauta.setDescripcionIssue(pauta.getDescripcionIssue());
			pauta.setObservacion(pauta.getObservacion());
			
			
			pauta.setFechaVisita(starttime);
			pauta.setTicketCu(pauta.getTicketCu() != null || pauta.getTicketCu() != ""?pauta.getTicketCu():"-" );
			
			
			
			resultado = pautaServicesImpl.editPauta(pauta);

			if (resultado.getResult() == OperationResult.SUCCESS) {
				mensaje = msgSrc.getMessage("admin.pauta.edit.exito", null,
						null);
				codigo = MensajesResultado.EXITO.getCodigo();
			} else {
				mensaje = msgSrc.getMessage("admin.pauta.edit.fracaso",
						null, null);
				codigo = MensajesResultado.FRACASO.getCodigo();
			}

			List<PautaDTO> pautas = pautaServicesImpl.getPautas();
			List<TiendaDTO> tiendas = tiendaServicesImpl.getTiendas();
			List<PrioridadDTO> prioridades = prioridadServicesImpl.getPrioridads();
			List<ReportadoDTO> reportados = reportadoServicesImpl.getReportados();
			List<AreaDTO> areas = areaServicesImpl.getAreas();
			List<EstadoDTO> estados = estadoServicesImpl.getEstados();
			List<PadrinoDTO> padrinos = padrinoServicesImpl.getPadrinos(null);
			//List<PadrinoDTO> padrinos = padrinoServicesImpl.getPadrinoDescs(principal.getName());

			List<GerenteDTO> gerentes = gerenteServicesImpl.getGerentes(null);
			List<ContratanteDTO> contratantes = contratanteServicesImpl.getContratantes(null);
			List<SoporteDTO> soportes = soporteServicesImpl.getSoportes(null);
			List<UserDTO> users = userServicesImpl.getUsers();
			
			
			model.put("users", users);
			model.put("prioridades", prioridades);
			model.put("reportados", reportados);
			model.put("areas", areas);
			model.put("tiendas", tiendas);
			model.put("padrinos", padrinos);
			model.put("gerentes", gerentes);
			model.put("contratantes", contratantes);
			model.put("soportes", soportes);
			model.put("pautas", pautas);
			model.put("estados", estados);
			forward = new ModelAndView("role/commerce/allPautas", model);
			forward.addObject("codMsg", codigo);
			forward.addObject("msg", mensaje);
		} else {
			prioridades = prioridadServicesImpl.getPrioridads();
			model.put("prioridades", prioridades);
			reportados = reportadoServicesImpl.getReportados();
			model.put("reportados", reportados);
			areas = areaServicesImpl.getAreas();
			model.put("areas", areas);
			tiendas = tiendaServicesImpl.getTiendas();
			model.put("tiendas", tiendas);
			padrinos = padrinoServicesImpl.getPadrinos(null);
			model.put("padrinos", padrinos);
			gerentes = gerenteServicesImpl.getGerentes(null);
			model.put("gerentes", gerentes);
			contratantes = contratanteServicesImpl.getContratantes(null);
			model.put("contratantes", contratantes);
			soportes = soporteServicesImpl.getSoportes(null);
			model.put("soportes", soportes);
			estados = estadoServicesImpl.getEstados();
			model.put("estados", estados);
			
			List<UserDTO> users = userServicesImpl.getUsers();
			model.put("users", users);
			
			forward = new ModelAndView("role/commerce/editPauta",
					model);
			forward.addObject("user", principal);
		}
		forward.addObject("errors", result.getAllErrors());
		return forward;
	}
    

    
    
    
    
    
    
    @RequestMapping(value = "**/commerce/lockUnlockPauta", method = RequestMethod.POST)
    public ModelAndView lockUnlockPauta(@RequestParam("id") Long id, @RequestParam("modo")String modo) {
		log.info("user:lockUnlockPauta");
		UserDTO principal = (UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		log.info("user:allUsers Usuario Actual "+principal.getUsername());
		
		log.info("user:Long "+id);
		log.info("user:Modo "+modo);
		Map<String, Object> model = new HashMap<String, Object>();
		ModelAndView forward;
		OperationResult resultado = null;
		String mensaje = "";
		int codigo = -1;
		
		try {
			
			if("D".equalsIgnoreCase(modo)){
				resultado=pautaServicesImpl.deletePauta(id);
				//userServicesImpl.updateAttempts(id, UserDTO.MAX_ATTEMPTS);
			}else{
				if("L".equalsIgnoreCase(modo)){
					resultado=pautaServicesImpl.deletePauta(id);
					//resultado=userServicesImpl.updateStatus(id, StatusEnum.BLOCKED_USER.getCode());
					//userServicesImpl.updateAttempts(id, 0);
				}
			}
			
			if(resultado!=null){
				if(resultado.getResult() == OperationResult.SUCCESS){
					mensaje=msgSrc.getMessage("admin.pauta.del.exito", null, null);
					codigo=MensajesResultado.EXITO.getCodigo();
				}else{
					mensaje=msgSrc.getMessage("admin.pauta.del.fracaso", null, null);
					codigo=MensajesResultado.EXITO.getCodigo();
				}
			}
			List<TiendaDTO> tiendas = tiendaServicesImpl.getTiendas();
			//List<PadrinoDTO> padrinos = padrinoServicesImpl.getPadrinos(null);
			List<PadrinoDTO> padrinos = padrinoServicesImpl.getPadrinoDescs(principal.getName());
			List<GerenteDTO> gerentes = gerenteServicesImpl.getGerentes(null);
			List<ContratanteDTO> contratantes = contratanteServicesImpl.getContratantes(null);
			List<SoporteDTO> soportes = soporteServicesImpl.getSoportes(null);
			List<PautaDTO> pautas = pautaServicesImpl.getPautas(null, null, null, null, null, null, null, 0, 1000000000);
			List<EstadoDTO> estados = estadoServicesImpl.getEstados();
			
			model.put("tiendas", tiendas);
			model.put("padrinos", padrinos);
			model.put("gerentes", gerentes);
			model.put("contratantes", contratantes);
			model.put("soportes", soportes);
			model.put("pautas", pautas);
			model.put("user", principal);
			model.put("estados", estados);
		} catch (Exception e) {
			log.error("Error al bloquear/desbloquear pauta",e);
			mensaje=msgSrc.getMessage("admin.pauta.del.fracaso", null, null);
			codigo=MensajesResultado.EXITO.getCodigo();
		}
		
		forward = new ModelAndView("role/commerce/allPautas", model);
		forward.addObject("codMsg", codigo);
		forward.addObject("msg", mensaje);
		forward.addObject("user", principal);
		return forward;
    }
    
    
    @RequestMapping(value = "**/commerce/downloadExcelCumplimientokpiWeb", method = RequestMethod.GET)
   	public ModelAndView downloadExcelCumplimientokpiWeb(String fechaIni, String fechaTer) {
   		log.info("User:downloadExcelCumplimientokpiWeb");
   		log.info("User:fechaIni"+fechaIni);
   		log.info("User:fechaTer"+fechaTer);
   		
   		String starttimeIni = DateUtils.turnDate222222( String.valueOf( DateUtils.restarDia(DateUtils.turnDate1111(fechaIni)  ) ) );
   		String starttimeTer = fechaTer;
   		log.info("User:starttimeIni="+starttimeIni);
   		log.info("User:starttimeTer="+starttimeTer);
   		
   		//String filtroUsername = username != null?username:null;
   		//log.info("filtroUsername:"+filtroUsername);
   		List<CumplimientokpiWebDTO> cumplimientokpiWebList = cumplimientokpiWebServicesImpl.getCumplimientokpiWebs(starttimeIni, starttimeTer);
   		 
   		return new ModelAndView("CumplimientokpiWebListExcel", "cumplimientokpiWebList", cumplimientokpiWebList);
   		
   	 }
    
    
    @RequestMapping(value = "**/commerce/downloadExcelPauta", method = RequestMethod.GET)
   	public ModelAndView downloadExcelPauta(Integer p,  Long tienda, Long padrino,  Long gerente, Long contraparte, Long soporte, Long estado, String dateInicio) {
   		log.info("User:downloadExcelPauta");
   		TiendaDTO tiendas;
		if (tienda != null) {
			tiendas  = tiendaServicesImpl.getTiendasId(tienda);
		} else {
			tiendas = null;
		}
		
		PadrinoDTO padrinos;
		if (padrino != null) {
			padrinos  = padrinoServicesImpl.getPadrinosId(padrino);
			//padrinos  = padrinoServicesImpl.getPadrino(principal.getName());
		} else {
			//padrinos  = padrinoServicesImpl.getPadrino(principal.getName());
			padrinos  = null;
		}
		
		GerenteDTO gerentes;
		if (gerente != null) {
			gerentes  = gerenteServicesImpl.getGerentesId(gerente);
		} else {
			gerentes = null;
		}
		
		ContratanteDTO contratantes;
		if (contraparte != null) {
			contratantes  = contratanteServicesImpl.getContratantesId(contraparte);
		} else {
			contratantes = null;
		}
		
		SoporteDTO soportes;
		if (soporte != null) {
			soportes  = soporteServicesImpl.getSoportesId(soporte);
		} else {
			soportes = null;
		}
		
		EstadoDTO estados;
		if (estado != null) {
			estados  = estadoServicesImpl.getEstadosId(estado);
		} else {
			estados = null;
		}
   		
		List<PautaDTO> pautaList = pautaServicesImpl.getPautas(tiendas, padrinos, gerentes, contratantes, soportes, estados, null,0, 1000000000);

   		return new ModelAndView("PautaListExcel", "pautaList", pautaList);
   		
   	 }
    
    @RequestMapping(value = "**/commerce/reporteResponsableCumplimiento", method = RequestMethod.GET)
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
		
		
		return new ModelAndView("role/commerce/reporteResponsableCumplimiento", model);
    }
    
    @RequestMapping(value = "**/commerce/downloadExcelCumplimiento", method = RequestMethod.GET)
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
    
    
    @RequestMapping(value = "**/commerce/reportODVentaVerde", method = RequestMethod.GET)
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
 		return new ModelAndView("role/commerce/reportODVentaVerde", model);
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

		String starttime2 = DateUtils.turnDate(dateInicio) != null?DateUtils.turnDate(DateUtils.restarDiaFecha(dateInicio,"0")):DateUtils.turnDate(DateUtils.restarDiaFecha(currentDate,"1"));
		String endtime2 = DateUtils.turnDate(dateFin) != null?DateUtils.turnDate(DateUtils.restarDiaFecha(dateFin,"0")):DateUtils.turnDate(DateUtils.restarDiaFecha(currentDate,"1"));
		
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
 		model.put("endtime", endtime2);//
 		model.put("estados", estados);
 		
 		model.put("namePage", "trazabilidad");//
 		
 		
		return new ModelAndView("role/commerce/allOrdeneStockPendientes", model);
	}
    
    @RequestMapping(value = "**/commerce/cuadraturaCtl", method = RequestMethod.GET)
	public ModelAndView cuadraturaCtl(Integer p, String posted,String  dateInicio, String  dateFin, String  carga, String bogeda, String tranNbr,  String estado) {
		log.info("OrdeneStockPendiente:cuadraturaCtl");
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
		List<CuadraturaCtlDTO> ctls = cuadraturaCtlServicesImpl.getCuadraturaCtls(0, bodega2, 0, starttime+" 00:00:00", endtime+" 23:59:59", null, 0, 0, 0, 1000000000);
		
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
 		
		return new ModelAndView("role/commerce/cuadraturaCtl", model);
	}
    
    @RequestMapping(value = "**/commerce/cuadraturaDo", method = RequestMethod.GET)
	public ModelAndView cuadraturaDo(Integer p, String posted,String  dateInicio, String  dateFin, String estado) {
		log.info("Do");
		Date dNow = new Date();
		SimpleDateFormat ft = new SimpleDateFormat ("dd/MM/yyyy");
		String currentDate = ft.format(dNow);
		//String starttime = DateUtils.turnDate(dateInicio) != null?DateUtils.turnDate(dateInicio):DateUtils.turnDate(currentDate);
		//String endtime = DateUtils.turnDate(dateFin) != null?DateUtils.turnDate(dateFin):DateUtils.turnDate(currentDate);
		
 		String starttime = DateUtils.turnDateCtl(dateInicio) != null?DateUtils.turnDateCtl(dateInicio):DateUtils.turnDateCtl(DateUtils.restarDiaFecha(currentDate,"1"));
 		String endtime = DateUtils.turnDateCtl(dateFin) != null?DateUtils.turnDateCtl(dateFin):DateUtils.turnDateCtl(DateUtils.restarDiaFecha(currentDate,"1"));

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
		return new ModelAndView("role/commerce/cuadraturaDo", model);
	}
    
    

    
    
    

}
