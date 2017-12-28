/**
 * 
 */
package com.cencosud.administrator.web.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cencosud.administrator.core.ChannelServices;
import com.cencosud.administrator.core.RoleServices;
import com.cencosud.administrator.dto.users.ChannelDTO;
import com.cencosud.administrator.dto.users.RoleDTO;
import com.cencosud.administrator.dto.users.UserDTO;
import com.cencosud.administrator.web.controller.base.BaseController;
//import com.invoicings.administrator.web.dao.SalesDAO;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

/**
 * @author jose
 *
 */

@Controller
public class AdminChannelController extends BaseController {
	
	private static Logger log = Logger.getLogger(AdminChannelController.class);
	
	
	@Autowired
	private ChannelServices channelServicesImpl;
	
	@Autowired
	private RoleServices roleServicesImpl;
	
	@RequestMapping(value = "admin/allChannel", method = RequestMethod.GET)
    public ModelAndView allFinancial(String idChannel) {
		log.info("channel:allChannel");
		UserDTO principal = (UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		log.info("user:allUsers Usuario Actual "+principal.getUsername());
		log.info("idChannel="+idChannel);
		String idChannel1 = idChannel != null && idChannel != ""?idChannel:null;
		log.info("canal"+idChannel1);
		List<ChannelDTO> channels = channelServicesImpl.getChannels();
		//List<ChannelDTO> channels = channelServicesImpl.getChannelSp(idChannel1);
		List<ChannelDTO> listChannels = channelServicesImpl.getChannels();
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("channels", channels);
		model.put("listChannels", listChannels);
		model.put("user", principal);
		return new ModelAndView("role/admin/channel/allChannel", model);
    }
	
	
	
	@RequestMapping(value = "admin/addChannel", method = RequestMethod.GET)
    public ModelAndView Channel() {
		log.info("user:addChannel");
		UserDTO principal = (UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		log.info("user:allUsers Usuario Actual "+principal.getUsername());
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("user", principal);
		
		//IF por defecto al crear usuario
		ChannelDTO channelDTO = new ChannelDTO();
		ModelAndView forward= new ModelAndView("role/admin/channel/addChannel", model);
		forward.addObject("newChannel", channelDTO);
		return forward;
    }
    
   
    @RequestMapping(value = "admin/xlsAll", method = RequestMethod.GET)
   	public ModelAndView xlsAll(String idChannel) {
    	log.info("channel:xlsAll");
		UserDTO principal = (UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		log.info("user:allUsers Usuario Actual "+principal.getUsername());
		String idChannel1 = idChannel != null && idChannel != ""?idChannel:null;
		log.info("idChannel1"+idChannel1);
		List<ChannelDTO> channels = channelServicesImpl.getChannels();
		
		// Retrieve our data from a custom data provider
		// Our data comes from a DAO layer
		//SalesDAO dataprovider = new SalesDAO();
		
		// Assign the datasource to an instance of JRDataSource
		// JRDataSource is the datasource that Jasper understands
		// This is basically a wrapper to Java's collection classes
		//JRDataSource datasource  = dataprovider.getDataSource();
		JRDataSource datasource = new JRBeanCollectionDataSource(channels);
		// In order to use Spring's built-in Jasper support, 
		// We are required to pass our datasource as a map parameter
		// parameterMap is the Model of our application
		Map<String,Object> parameterMap = new HashMap<String,Object>();
		
		
		
		parameterMap.put("dataSource", datasource);
   		//return new ModelAndView("xlsReport", parameterMap);
   		
   		// xlsReport is the View of our application
   		// This is declared inside the /WEB-INF/jasper-views.xml
   		ModelAndView model = new ModelAndView("xlsAllReport", parameterMap);
   		return model;
   	}
    
    @RequestMapping(value = "admin/pdfAll", method = RequestMethod.GET)
   	public ModelAndView pdfAll(String idChannel) {
    	log.info("channel:xlsAll");
		UserDTO principal = (UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		log.info("user:allUsers Usuario Actual "+principal.getUsername());
		String idChannel1 = idChannel != null && idChannel != ""?idChannel:null;
		log.info("idChannel1"+idChannel1);
		List<ChannelDTO> channels = channelServicesImpl.getChannels();
		
		// Retrieve our data from a custom data provider
		// Our data comes from a DAO layer
		//SalesDAO dataprovider = new SalesDAO();
		
		// Assign the datasource to an instance of JRDataSource
		// JRDataSource is the datasource that Jasper understands
		// This is basically a wrapper to Java's collection classes
		//JRDataSource datasource  = dataprovider.getDataSource();
		JRDataSource datasource = new JRBeanCollectionDataSource(channels);
		// In order to use Spring's built-in Jasper support, 
		// We are required to pass our datasource as a map parameter
		// parameterMap is the Model of our application
		Map<String,Object> parameterMap = new HashMap<String,Object>();
		
		
		
		parameterMap.put("dataSource", datasource);
   		//return new ModelAndView("xlsReport", parameterMap);
   		
   		// xlsReport is the View of our application
   		// This is declared inside the /WEB-INF/jasper-views.xml
   		ModelAndView model = new ModelAndView("pdfAllReport", parameterMap);
   		return model;
   	}
    
    @RequestMapping(value = "admin/csvAll", method = RequestMethod.GET)
   	public ModelAndView csvAll(String idChannel) {
    	log.info("channel:csvAll");
		UserDTO principal = (UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		log.info("user:allUsers Usuario Actual "+principal.getUsername());
		String idChannel1 = idChannel != null && idChannel != ""?idChannel:null;
		log.info("idChannel1"+idChannel1);
		List<ChannelDTO> channels = channelServicesImpl.getChannels();
		
		// Retrieve our data from a custom data provider
		// Our data comes from a DAO layer
		//SalesDAO dataprovider = new SalesDAO();
		
		// Assign the datasource to an instance of JRDataSource
		// JRDataSource is the datasource that Jasper understands
		// This is basically a wrapper to Java's collection classes
		//JRDataSource datasource  = dataprovider.getDataSource();
		JRDataSource datasource = new JRBeanCollectionDataSource(channels);
		// In order to use Spring's built-in Jasper support, 
		// We are required to pass our datasource as a map parameter
		// parameterMap is the Model of our application
		Map<String,Object> parameterMap = new HashMap<String,Object>();
		
		
		
		parameterMap.put("dataSource", datasource);
   		//return new ModelAndView("xlsReport", parameterMap);
   		
   		// xlsReport is the View of our application
   		// This is declared inside the /WEB-INF/jasper-views.xml
   		ModelAndView model = new ModelAndView("csvAllReport", parameterMap);
   		return model;
   	}
    
    @RequestMapping(value = "admin/htmlAll", method = RequestMethod.GET)
   	public ModelAndView htmlAll(String idChannel) {
    	log.info("channel:htmlAll");
		UserDTO principal = (UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		log.info("user:allUsers Usuario Actual "+principal.getUsername());
		String idChannel1 = idChannel != null && idChannel != ""?idChannel:null;
		log.info("idChannel1"+idChannel1);
		List<ChannelDTO> channels = channelServicesImpl.getChannels();
		
		// Retrieve our data from a custom data provider
		// Our data comes from a DAO layer
		//SalesDAO dataprovider = new SalesDAO();
		
		// Assign the datasource to an instance of JRDataSource
		// JRDataSource is the datasource that Jasper understands
		// This is basically a wrapper to Java's collection classes
		//JRDataSource datasource  = dataprovider.getDataSource();
		JRDataSource datasource = new JRBeanCollectionDataSource(channels);
		// In order to use Spring's built-in Jasper support, 
		// We are required to pass our datasource as a map parameter
		// parameterMap is the Model of our application
		Map<String,Object> parameterMap = new HashMap<String,Object>();
		
		
		
		parameterMap.put("dataSource", datasource);
   		//return new ModelAndView("xlsReport", parameterMap);
   		
   		// xlsReport is the View of our application
   		// This is declared inside the /WEB-INF/jasper-views.xml
   		ModelAndView model = new ModelAndView("htmlAllReport", parameterMap);
   		return model;
   	}
    
    @RequestMapping(value = "admin/xls", method = RequestMethod.GET)
   	public ModelAndView xls(String idChannel) {
    	log.info("channel:xls");
		UserDTO principal = (UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		log.info("user:allUsers Usuario Actual "+principal.getUsername());
		String idChannel1 = idChannel != null && idChannel != ""?idChannel:null;
		log.info("idChannel1"+idChannel1);
		List<ChannelDTO> channels = channelServicesImpl.getChannels();
		
		// Retrieve our data from a custom data provider
		// Our data comes from a DAO layer
		//SalesDAO dataprovider = new SalesDAO();
		
		// Assign the datasource to an instance of JRDataSource
		// JRDataSource is the datasource that Jasper understands
		// This is basically a wrapper to Java's collection classes
		//JRDataSource datasource  = dataprovider.getDataSource();
		JRDataSource datasource = new JRBeanCollectionDataSource(channels);
		JRDataSource datasource2 = new JRBeanCollectionDataSource(channels);
		// In order to use Spring's built-in Jasper support, 
		// We are required to pass our datasource as a map parameter
		// parameterMap is the Model of our application
		Map<String,Object> parameterMap = new HashMap<String,Object>();
		
		
		
		parameterMap.put("dataSource", datasource);
		parameterMap.put("dataSourceSubreport", datasource2);		
   		//return new ModelAndView("xlsReport", parameterMap);
   		
   		// xlsReport is the View of our application
   		// This is declared inside the /WEB-INF/jasper-views.xml
   		ModelAndView model = new ModelAndView("xlsReport", parameterMap);
   		return model;
   	}
    
    @RequestMapping(value = "admin/pdf", method = RequestMethod.GET)
   	public ModelAndView pdf(String idChannel) {
    	log.info("channel:pdf");
		UserDTO principal = (UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		log.info("user:allUsers Usuario Actual "+principal.getUsername());
		String idChannel1 = idChannel != null && idChannel != ""?idChannel:null;
		log.info("idChannel1"+idChannel1);
		List<ChannelDTO> channels = channelServicesImpl.getChannels();
		List<RoleDTO> roles = roleServicesImpl.getRolesByUser(Long.parseLong(idChannel1));
		// Retrieve our data from a custom data provider
		// Our data comes from a DAO layer
		//SalesDAO dataprovider = new SalesDAO();
		
		// Assign the datasource to an instance of JRDataSource
		// JRDataSource is the datasource that Jasper understands
		// This is basically a wrapper to Java's collection classes
		//JRDataSource datasource  = dataprovider.getDataSource();
		//JRDataSource datasource2  = dataprovider.getDataSource2();
		JRDataSource datasource = new JRBeanCollectionDataSource(channels);
		//JRDataSource datasource2 = new JRBeanCollectionDataSource(channels);
		JRDataSource datasource2 = new JRBeanCollectionDataSource(roles);
		// In order to use Spring's built-in Jasper support, 
		// We are required to pass our datasource as a map parameter
		// parameterMap is the Model of our application
		Map<String,Object> parameterMap = new HashMap<String,Object>();
		parameterMap.put("dataSource", datasource);
		parameterMap.put("dataSourceSubreport", datasource2);		
   		//return new ModelAndView("xlsReport", parameterMap);
   		
   		// xlsReport is the View of our application
   		// This is declared inside the /WEB-INF/jasper-views.xml
   		ModelAndView model = new ModelAndView("pdfReport", parameterMap);
   		return model;
   	}
    
   
    @RequestMapping(value = "admin/csv", method = RequestMethod.GET)
   	public ModelAndView csv(String idChannel) {
    	log.info("channel:csv");
		UserDTO principal = (UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		log.info("user:allUsers Usuario Actual "+principal.getUsername());
		String idChannel1 = idChannel != null && idChannel != ""?idChannel:null;
		log.info("idChannel1"+idChannel1);
		List<ChannelDTO> channels = channelServicesImpl.getChannels();
		
		// Retrieve our data from a custom data provider
		// Our data comes from a DAO layer
		//SalesDAO dataprovider = new SalesDAO();
		
		// Assign the datasource to an instance of JRDataSource
		// JRDataSource is the datasource that Jasper understands
		// This is basically a wrapper to Java's collection classes
		//JRDataSource datasource  = dataprovider.getDataSource();
		JRDataSource datasource = new JRBeanCollectionDataSource(channels);
		JRDataSource datasource2 = new JRBeanCollectionDataSource(channels);
		// In order to use Spring's built-in Jasper support, 
		// We are required to pass our datasource as a map parameter
		// parameterMap is the Model of our application
		Map<String,Object> parameterMap = new HashMap<String,Object>();
		parameterMap.put("dataSource", datasource);
		parameterMap.put("dataSourceSubreport", datasource2);			
   		//return new ModelAndView("xlsReport", parameterMap);
   		
   		// xlsReport is the View of our application
   		// This is declared inside the /WEB-INF/jasper-views.xml
   		ModelAndView model = new ModelAndView("csvReport", parameterMap);
   		return model;
   	}
    
    @RequestMapping(value = "admin/html", method = RequestMethod.GET)
   	public ModelAndView html(String idChannel) {
    	log.info("channel:html");
		UserDTO principal = (UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		log.info("user:allUsers Usuario Actual "+principal.getUsername());
		String idChannel1 = idChannel != null && idChannel != ""?idChannel:null;
		log.info("idChannel1"+idChannel1);
		List<ChannelDTO> channels = channelServicesImpl.getChannels();
		
		// Retrieve our data from a custom data provider
		// Our data comes from a DAO layer
		//SalesDAO dataprovider = new SalesDAO();
		
		// Assign the datasource to an instance of JRDataSource
		// JRDataSource is the datasource that Jasper understands
		// This is basically a wrapper to Java's collection classes
		//JRDataSource datasource  = dataprovider.getDataSource();
		JRDataSource datasource = new JRBeanCollectionDataSource(channels);
		JRDataSource datasource2 = new JRBeanCollectionDataSource(channels);
		
		// In order to use Spring's built-in Jasper support, 
		// We are required to pass our datasource as a map parameter
		// parameterMap is the Model of our application
		Map<String,Object> parameterMap = new HashMap<String,Object>();
		parameterMap.put("dataSource", datasource);
		parameterMap.put("dataSourceSubreport", datasource2);			
   		//return new ModelAndView("xlsReport", parameterMap);
   		
   		// xlsReport is the View of our application
   		// This is declared inside the /WEB-INF/jasper-views.xml
   		ModelAndView model = new ModelAndView("htmlReport", parameterMap);
   		return model;
   	}

}
