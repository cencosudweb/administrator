/**
 *@name AdminCommerceController.java
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
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cencosud.administrator.core.BodegaCtlServices;
import com.cencosud.administrator.core.CommerceServices;
import com.cencosud.administrator.core.CuadraturaDoServices;
import com.cencosud.administrator.core.EconomicActivityServices;
import com.cencosud.administrator.core.EstadoCtlServices;
import com.cencosud.administrator.core.EstadoOrdenStockServices;
import com.cencosud.administrator.dto.users.BodegaCtlDTO;
import com.cencosud.administrator.dto.users.CuadraturaDoDTO;
import com.cencosud.administrator.dto.users.EstadoCtlDTO;
import com.cencosud.administrator.web.controller.base.BaseController;
import com.cencosud.administrator.web.utils.DateUtils;
import com.cencosud.administrator.web.validator.AdminCommerceValidator;

/**
 * @description Clase 
 */
@Controller
public class AdminCuadraturaDoController extends BaseController {

	private static Logger log = Logger.getLogger(AdminCuadraturaDoController.class);

	@Autowired
	private MessageSource msgSrc;
	@Autowired
	private CommerceServices commerceServicesImpl;
	
	@Autowired
	private EconomicActivityServices economicAtivityServicesImpl;
	@Autowired
	private AdminCommerceValidator validator;
	//@Autowired
	//private List<EconomicActivityDTO> activities;

	//@Autowired
	//private List<O	rdeneStockPendienteDTO> ordenes;
	
	@Autowired
	private EstadoOrdenStockServices estadoOrdenStockServicesImpl;

	@Autowired
	private CuadraturaDoServices cuadraturaDoServicesImpl;
	
	@Autowired
	private EstadoCtlServices estadoCtlServicesImpl;

	@Autowired
	private BodegaCtlServices bodegaCtlServicesImpl;

	@RequestMapping(value = "admin/cuadraturaDo", method = RequestMethod.GET)
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
		return new ModelAndView("role/admin/cuadraturaDo/cuadraturaDo", model);
	}

	
	

}
