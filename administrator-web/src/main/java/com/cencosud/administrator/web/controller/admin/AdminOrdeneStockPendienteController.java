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

import com.cencosud.administrator.core.CommerceServices;
import com.cencosud.administrator.core.EconomicActivityServices;
import com.cencosud.administrator.core.EstadoOrdenStockServices;
import com.cencosud.administrator.core.OrdeneStockPendienteServices;
import com.cencosud.administrator.dto.users.EstadoOrdenStockDTO;
import com.cencosud.administrator.dto.users.OrdeneStockPendienteDTO;
import com.cencosud.administrator.web.controller.base.BaseController;
import com.cencosud.administrator.web.utils.DateUtils;
import com.cencosud.administrator.web.validator.AdminCommerceValidator;

/**
 * @description Clase controladora que administra el usuario comercial
 */
@Controller
public class AdminOrdeneStockPendienteController extends BaseController {

	private static Logger log = Logger.getLogger(AdminOrdeneStockPendienteController.class);

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
	private OrdeneStockPendienteServices ordeneStockPendienteServicesImpl;

	

	@RequestMapping(value = "admin/allOrdeneStockPendientes", method = RequestMethod.GET)
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
 		model.put("endtime", endtime2);//
 		model.put("estados", estados);
 		
 		model.put("namePage", "trazabilidad");//
 		
 		
		return new ModelAndView("role/admin/ordenesStockPendientes/allOrdeneStockPendientes", model);
	}

	
	

}
