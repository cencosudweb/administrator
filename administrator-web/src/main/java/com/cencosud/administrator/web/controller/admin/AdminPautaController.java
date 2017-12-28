
/**
 *@name AdminUserController.java
 * 
 *@version 1.0 
 * 
 *@date 07-03-2017
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
import org.springframework.context.MessageSource;
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
import com.cencosud.administrator.core.CommerceServices;
import com.cencosud.administrator.core.ContratanteServices;
import com.cencosud.administrator.core.EstadoServices;
import com.cencosud.administrator.core.FinancialInstitutionServices;
import com.cencosud.administrator.core.GerenteServices;
import com.cencosud.administrator.core.PadrinoServices;
import com.cencosud.administrator.core.PautaServices;
import com.cencosud.administrator.core.PrioridadServices;
import com.cencosud.administrator.core.ReportadoServices;
import com.cencosud.administrator.core.RoleServices;
import com.cencosud.administrator.core.SoporteServices;
import com.cencosud.administrator.core.TiendaServices;
import com.cencosud.administrator.core.UserServices;
import com.cencosud.administrator.core.enums.StatusEnum;
import com.cencosud.administrator.core.util.PageNate;
import com.cencosud.administrator.core.util.PasswordGenerator;
import com.cencosud.administrator.dto.users.AreaDTO;
import com.cencosud.administrator.dto.users.CommerceDTO;
import com.cencosud.administrator.dto.users.ContratanteDTO;
import com.cencosud.administrator.dto.users.EstadoDTO;
import com.cencosud.administrator.dto.users.FinancialInstitutionDTO;
import com.cencosud.administrator.dto.users.GerenteDTO;
import com.cencosud.administrator.dto.users.PadrinoDTO;
import com.cencosud.administrator.dto.users.PautaDTO;
import com.cencosud.administrator.dto.users.PrioridadDTO;
import com.cencosud.administrator.dto.users.ReportadoDTO;
import com.cencosud.administrator.dto.users.RoleDTO;
import com.cencosud.administrator.dto.users.SoporteDTO;
import com.cencosud.administrator.dto.users.TiendaDTO;
import com.cencosud.administrator.dto.users.UserDTO;
import com.cencosud.administrator.utils.OperationResult;
import com.cencosud.administrator.web.controller.base.BaseController;
import com.cencosud.administrator.web.controller.enums.MensajesResultado;
import com.cencosud.administrator.web.utils.DateUtils;
import com.cencosud.administrator.web.validator.AdminPautaValidator;
/**
 * @description Clase controladora que administra los usuarios   
 */
@Controller
public class AdminPautaController  extends BaseController{
	
    private static Logger log = Logger.getLogger(AdminPautaController.class);
    
    public static final char SEPARADOR = ';';
	public static final char COMILLAS = '"';

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
	
    
    @RequestMapping(value = "admin/allPautas2", method = RequestMethod.GET)
    public ModelAndView users() {
		log.info("user:allBitacoras");
		UserDTO principal = (UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		log.info("user:allBitacoras Usuario Actual "+principal.getUsername());
		List<UserDTO> users = userServicesImpl.getUsers();
		List<PautaDTO> pautas = pautaServicesImpl.getPautas();
		
		List<TiendaDTO> tiendas = tiendaServicesImpl.getTiendas();
		List<PadrinoDTO> padrinos = padrinoServicesImpl.getPadrinos(null);
		List<GerenteDTO> gerentes = gerenteServicesImpl.getGerentes(null);
		List<ContratanteDTO> contratantes = contratanteServicesImpl.getContratantes(null);
		List<SoporteDTO> soportes = soporteServicesImpl.getSoportes(null);
		
		
		
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("users", users);
		model.put("pautas", pautas);
		model.put("tiendas", tiendas);
		model.put("padrinos", padrinos);
		model.put("gerentes", gerentes);
		model.put("contratantes", contratantes);
		model.put("soportes", soportes);
		return new ModelAndView("role/admin/pauta/allPautas2", model);
    }
    
    @RequestMapping(value = "admin/allPautas", method = RequestMethod.GET)
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
		} else {
			padrinos = null;
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
		//PadrinoDTO padrinoNumero = padrinoServicesImpl.getPadrino(principal.getName());

		List<GerenteDTO> gerentesNumero = gerenteServicesImpl.getGerentes(null);
		List<ContratanteDTO> contratantesNumero = contratanteServicesImpl.getContratantes(null);
		List<SoporteDTO> soportesNumero = soporteServicesImpl.getSoportes(null);
		List<EstadoDTO> estadosNumero = estadoServicesImpl.getEstados();
		
		if (pautas != null) {
			
			forward = new ModelAndView("role/admin/pauta/allPautas", model);
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
			
			forward = new ModelAndView("role/admin/pauta/allPautas", model);
			forward.addObject("user", principal);
			forward.addObject("codMsg", codigo);
			forward.addObject("msg", mensaje);
		}
		
		return forward;
    	
    	
    }
    
    @RequestMapping(value = "admin/addPauta", method = RequestMethod.GET)
    public ModelAndView pauta() {
		log.info("user:addPauta");
		
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
		pautaDTO.setArchive("1");
		ifs = financialInstitutionServicesImpl.getFIs(StatusEnum.UNBLOCKED_FINANCIAL.getCode());
		model.put("ifs", ifs);
		
		commerces = commerceServicesImpl.getCommerces(StatusEnum.UNBLOCKED_COMMERCE.getCode());
		model.put("commerces", commerces);
		
		roles = roleServicesImpl.getRoles(false);
		model.put("roles", roles);
		
		model.put("test", "nok");
		
		
		ModelAndView forward= new ModelAndView("role/admin/pauta/addPauta", model);
		forward.addObject("newPauta", pautaDTO);
		return forward;
    }
    
    @RequestMapping(value = "admin/savePauta", method = RequestMethod.POST)
    /*public ModelAndView save(@ModelAttribute("newPauta") PautaDTO pauta, BindingResult result, SessionStatus status, HttpServletRequest request,
    		HttpServletResponse response, @RequestParam("file") MultipartFile file) {
    		*/
   public ModelAndView save(@ModelAttribute("newPauta") PautaDTO pauta, BindingResult result, SessionStatus status) {	
		log.info("user:savePauta");
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
		
		/*
		if (!file.isEmpty()) {
			log.info("Archivo No Vacio");
			// obtener el nombre del archivo
            String nameOriginal   = file.getOriginalFilename();
			// obtener el nombre del archivo
            String nombre   = file.getName();                            
            //  obtener el tipo de archivo
            // e. .jpg = "image/jpeg", .txt = "text/plain"
            String tipo     = file.getContentType();
            // obtener el tamaño del archivo
            long tamanio    = file.getSize();
            //  obtener la extension
            String extension = nameOriginal.substring( nameOriginal.lastIndexOf( "." ) );
			//variable ramdom
            String ramdomPass = PasswordGenerator.randomPassword(111);
			//nombre del archivo en el cual se guardara
            String archive = ramdomPass+"_"+nameOriginal;
            log.info("archive="+archive);
			log.info("Nombre="+nombre);
            log.info("NameOriginal="+nameOriginal);
            log.info("Tipo="+tipo);
            log.info("Tamanio="+tamanio);
            log.info("Extension="+extension);
            
         // limito a 300 Kb el humbral del tamaño del archivo a subir
			// 1024 x 300 = 307200 bytes = 300 Kb
            if (tamanio >= 1024) {
            	log.info("Tamaño valido");
            	//byte[] bytes = null;
				try {
					byte[] bytes = file.getBytes();
					log.info("Tamaño bytes" + bytes);
    				//String rootPath = System.getProperty("catalina.home");
    				String rootPath = System.getProperty("jboss.server.config.dir");
    				//String fileName = System.getProperty("jboss.server.config.dir") + "/my.properties";
    				log.info("rootPath:" + rootPath);
    				//File dir = new File(rootPath + File.separator + "webapps" + File.separator + "billing-web" + File.separator + "docs");
    				File dir = new File(rootPath + File.separator + "" + "");
    				log.info("dir:" + dir);
    				//File dir = new File(rootPath + File.separator + "tmpFiles");
    				if (!dir.exists())
    					dir.mkdirs();
    				
    				log.info("rootPath="+rootPath);
    				//log.info("rootPath2="+rootPath + File.separator + "webapps" + File.separator + "billing-web" + File.separator + "docs" + File.separator + archive);
    				log.info("ramdomPass="+ramdomPass);			
    				
    				log.info("getAbsolutePath=" + dir.getAbsolutePath() + File.separator + archive);
    				// Create the file on server
    				File serverFile = new File(dir.getAbsolutePath() + File.separator + archive );
    				log.info("serverFile=" + serverFile);
    				//File serverFile = new File(dir.getAbsolutePath() + File.separator + archive );
    				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
    				//Write the uploaded file to the system
    				stream.write(bytes);
    				stream.close();
    				
    				String cadena;
    				FileReader f = new FileReader(dir.getAbsolutePath() + File.separator + archive);
    				BufferedReader b = new BufferedReader(f);
    				
    				
    				CSVReader lector = null;

    				try {
    					// Abrir el .csv
    					lector = new CSVReader(new FileReader(dir.getAbsolutePath() + File.separator + archive),
    							SEPARADOR, COMILLAS);

    					// Definir el string de la línea leída
    					String[] linea = null;

    					while ((linea = lector.readNext()) != null) {
    						// System.out.println(Arrays.toString(linea));
    						System.out.println("DATA=" + linea[0] + "" + linea[1]);

    					}
    				} catch (IOException e) {
    					e.printStackTrace();
    				} finally {
    					// Cierro el buffer de lectura
    					if (lector != null) {
    						try {
    							lector.close();
    						} catch (IOException e) {
    							e.printStackTrace();
    						}
    					}
    				}
    				
    				
    		        //while((cadena = b.readLine())!=null) {
    		        	//cadena = b.readLine();
    		        //	String[] campos = cadena.split(";"); 
    		        	//System.out.println(Arrays.toString(campos));
    		        //	log.info("campos = 1 " + campos[0]);
    		       //	log.info("campos = 2 " + campos[1]);
    		        //	log.info("campos = 3 " + campos[2]);
    		        //	log.info("campos = 4 " + campos[3]);
    		        	//log.info("campos = XXXX " + cadena);
    		        	//cadena = b.readLine();
    		        //    System.out.println(cadena);
    		        //}
    		        //b.close();
    		        
    				log.info("Server File Location=" + serverFile.getAbsolutePath());
    				String fileName="";			
    				fileName = file.getOriginalFilename();
    				//do whatever you want
    				log.info("fileName" + fileName);
					 
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
            	
            	
            }
            
            
            
		}
		*/
		
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
			pauta.setArea(area);
			
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
			model.put("padrinos", padrinos);
			
			gerentes = gerenteServicesImpl.getGerentes(null);
			model.put("gerentes", gerentes);
			
			contratantes = contratanteServicesImpl.getContratantes(null);
			model.put("contratantes", contratantes);
			
			soportes = soporteServicesImpl.getSoportes(null);
			model.put("soportes", soportes);
			
			estados = estadoServicesImpl.getEstados();
			model.put("estados", estados);
			
			
			forward = new ModelAndView("role/admin/pauta/allPautas", model);
			forward.addObject("codMsg", codigo);
			forward.addObject("msg", mensaje);
		}else{
			
			log.info("NO Ok=");
			List<PautaDTO> pautas = pautaServicesImpl.getPautas(null, null, null, null, null, null, null, 0, 1000000000);
			model.put("pautas", pautas);
			
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
			forward = new ModelAndView("role/admin/pauta/addPauta", model);
			forward.addObject("newPauta", pauta);
		}
		forward.addObject("errors", result.getAllErrors());
		return forward;
    }
    
    @RequestMapping(value = "admin/editPauta", method = RequestMethod.GET)
    public ModelAndView editPauta(Long id) {
		log.info("user:editPauta");
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
			//pautaDTO.setFechaVisita2(currentDate);
			pautaDTO.setTypeSelected("1");
			pautaDTO.setValorTienda("1");
			pautaDTO.setValorPadrino("1");
			pautaDTO.setValorGerente("1");
			pautaDTO.setValorContratante("1");
			pautaDTO.setValorSoporte("1");

			
			forward = new ModelAndView("role/admin/pauta/editPauta", model);
			forward.addObject("editPauta", pauta);
		}else{
			String mensaje=msgSrc.getMessage("pauta.noexiste", null, null);
			int codigo=MensajesResultado.FRACASO.getCodigo();
			List<PautaDTO> pautas = pautaServicesImpl.getPautas();
			model.put("pautas", pautas);
			forward = new ModelAndView("role/admin/pauta/allPautas", model);
			forward.addObject("codMsg", codigo);
			forward.addObject("msg", mensaje);
		}
		return forward;
    }
    
    
    @RequestMapping(value = "admin/saveEditPauta", method = RequestMethod.POST)
	public ModelAndView saveEditPauta(
			@ModelAttribute("editPauta") PautaDTO pauta,
			BindingResult result, SessionStatus status) {
		log.info("Pauta:saveEditPauta");
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
			List<PadrinoDTO> padrinos = padrinoServicesImpl.getPadrinos(null);
			List<GerenteDTO> gerentes = gerenteServicesImpl.getGerentes(null);
			List<ContratanteDTO> contratantes = contratanteServicesImpl.getContratantes(null);
			List<SoporteDTO> soportes = soporteServicesImpl.getSoportes(null);
			List<EstadoDTO> estados = estadoServicesImpl.getEstados();

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
			forward = new ModelAndView("role/admin/pauta/allPautas", model);
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
			forward = new ModelAndView("role/admin/pauta/editPauta",
					model);
		}
		forward.addObject("errors", result.getAllErrors());
		return forward;
	}
    

    
    /*
    @RequestMapping(value = "admin/resetPassword", method = RequestMethod.GET)
    public ModelAndView resetPassword(Long id) {
		log.info("user:resetPassword");
		log.info("user:Long "+id);
		Map<String, Object> model = new HashMap<String, Object>();
		ModelAndView forward;
		String mensaje;
		OperationResult result;
		int codigo;
		
		try {
			result = userServicesImpl.resetPassword(id);
			if(result.getResult()==OperationResult.SUCCESS){
				mensaje=msgSrc.getMessage("reset.password.exito", null, null);
				codigo=MensajesResultado.EXITO.getCodigo();
			}else{
				mensaje=msgSrc.getMessage("reset.password.fracaso", null, null);
				codigo=MensajesResultado.FRACASO.getCodigo();
			}
			
			List<UserDTO> users = userServicesImpl.getUsers();
			model.put("users", users);
			
		} catch (Exception e) {
			mensaje=msgSrc.getMessage("reset.password.fracaso", null, null);
			codigo=MensajesResultado.FRACASO.getCodigo();
			log.error("Error al resetear password");
			log.error(e);
		}
		
		forward = new ModelAndView("role/admin/user/allUsers", model);
		forward.addObject("codMsg", codigo);
		forward.addObject("msg", mensaje);
		return forward;
    }
    
    @RequestMapping(value = "admin/lockUnlockPauta", method = RequestMethod.POST)
    public ModelAndView lockUnluckUser(@RequestParam("id") Long id, @RequestParam("modo")String modo) {
		log.info("user:lockUnlockUser");
		log.info("user:Long "+id);
		log.info("user:Modo "+modo);
		Map<String, Object> model = new HashMap<String, Object>();
		ModelAndView forward;
		OperationResult resultado = null;
		String mensaje = "";
		int codigo = -1;
		
		try {
			
			if("U".equalsIgnoreCase(modo)){
				resultado=userServicesImpl.updateStatus(id, StatusEnum.UNBLOCKED_USER.getCode());	
				userServicesImpl.updateAttempts(id, UserDTO.MAX_ATTEMPTS);
			}else{
				if("L".equalsIgnoreCase(modo)){
					resultado=userServicesImpl.updateStatus(id, StatusEnum.BLOCKED_USER.getCode());
					userServicesImpl.updateAttempts(id, 0);
				}
			}
			
			if(resultado!=null){
				if(resultado.getResult() == OperationResult.SUCCESS){
					mensaje=msgSrc.getMessage("admin.user.estado.exito", null, null);
					codigo=MensajesResultado.EXITO.getCodigo();
				}else{
					mensaje=msgSrc.getMessage("admin.user.estado.fracaso", null, null);
					codigo=MensajesResultado.EXITO.getCodigo();
				}
			}
			
			List<UserDTO> users = userServicesImpl.getUsers();
			model.put("users", users);
		} catch (Exception e) {
			log.error("Error al bloquear/desbloquear usuario",e);
			mensaje=msgSrc.getMessage("admin.user.estado.fracaso", null, null);
			codigo=MensajesResultado.EXITO.getCodigo();
		}
		
		forward = new ModelAndView("role/admin/pauta/allPautas", model);
		forward.addObject("codMsg", codigo);
		forward.addObject("msg", mensaje);
		return forward;
    }
    */
    
    
    @RequestMapping(value = "admin/lockUnlockPauta", method = RequestMethod.POST)
    public ModelAndView lockUnlockPauta(@RequestParam("id") Long id, @RequestParam("modo")String modo) {
		log.info("user:lockUnlockPauta");
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
			List<PadrinoDTO> padrinos = padrinoServicesImpl.getPadrinos(null);
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
			model.put("estados", estados);
			
		} catch (Exception e) {
			log.error("Error al bloquear/desbloquear pauta",e);
			mensaje=msgSrc.getMessage("admin.pauta.del.fracaso", null, null);
			codigo=MensajesResultado.EXITO.getCodigo();
		}
		
		forward = new ModelAndView("role/admin/pauta/allPautas", model);
		forward.addObject("codMsg", codigo);
		forward.addObject("msg", mensaje);
		return forward;
    }

   
    
   

}
