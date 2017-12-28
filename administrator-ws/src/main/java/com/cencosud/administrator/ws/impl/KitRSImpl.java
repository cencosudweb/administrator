/**
 * 
 */
package com.cencosud.administrator.ws.impl;

import java.io.BufferedWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.cencosud.administrator.core.KitServices;
import com.cencosud.administrator.core.impl.MISServices;
import com.cencosud.administrator.core.util.UtilMIS;
import com.cencosud.administrator.dto.users.SystemLogDTO;
import com.cencosud.administrator.dto.users.TipoGuiaDTO;
import com.cencosud.administrator.dto.users.TipoOrdenDTO;
import com.cencosud.administrator.dto.users.TipoVentaDTO;
import com.cencosud.administrator.utils.Constantes;
import com.cencosud.administrator.ws.KitRS;
import com.cencosud.administrator.ws.response.BodyResp;
import com.cencosud.administrator.ws.util.Errores;
import com.ibm.as400.access.AS400;
import com.ibm.as400.access.AS400JDBCDriver;

/**
 * @author EA7129
 *
 */

@Path("/service")
public class KitRSImpl extends MISServices implements KitRS {

	private static Logger log = Logger.getLogger(KitRSImpl.class);

	@Autowired
	private KitServices services;

	// http://localhost:8080/administrator-ws/kitserviceRS/service/services1
	@GET
	@Path("/services1")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public Response getServices(@Context HttpServletRequest info) {
		// TODO Auto-generated method stub
		try {
			return Response.ok("{\"status\":\"Service running\"}", MediaType.APPLICATION_JSON)
					.header(Constantes.CONTENT_TYPE, Constantes.APPLICATION_JSON_ENCODE).build();

		} catch (Exception ex) {
			return Response.status(Response.Status.NOT_FOUND).build();
		}
	}

	// http://localhost:8085/administrator-ws/kitserviceRS/service/ssoJson2/{usuario}/{clave}//
	@GET
	@Path("/userLogin/{usuario}/{clave}")
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	@Consumes({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public Response getUserLogin(@Context HttpServletRequest info, @PathParam("usuario") String usuario,
			@PathParam("clave") String clave) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		log.info("Inicio");
		// http://buraktas.com/jersey-client-example-with-json-support/
		BodyResp bodyResp = new BodyResp();

		try {//
				// setTransaccion(Transacciones.SERVICIO_SSO);
				// setIpAddress(info.getRemoteAddr());//
			bodyResp = services.getUserLogin(usuario, clave);
			if (bodyResp != null) {

				return Response.ok(UtilMIS.getJSONString(bodyResp), MediaType.APPLICATION_JSON).build();
				// return Response.ok(usuario).build();
				// return
				// Response.ok(UtilMIS.getJSONString(bodyResp),MediaType.APPLICATION_JSON).header(Constantes.CONTENT_TYPE,Constantes.APPLICATION_JSON_ENCODE).build();
				// return
				// Response.status(200).entity("getBooks is called, params : " +
				// usuario).build();

			}
		} catch (Exception ex) {
			log.error(Errores.MENSAJE_ERROR_SERVICES);
			log.error(Errores.EXCEPTION_MESSAGE + ex.getMessage());
			log.error(Errores.EXCEPTION_LOCALIZED + ex.getLocalizedMessage());
			ex.printStackTrace();
			bodyResp = respuestaGenerica();
		}

		log.info("Fin:" + "");
		return Response.ok(UtilMIS.getJSONString(bodyResp), MediaType.APPLICATION_JSON).build();
	}

	// http://localhost:8085/administrator-ws/kitserviceRS/service/ssoJson2/{usuario}/{clave}//
	@GET
	@Path("/userLogin2/{usuario}/{clave}")
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	@Consumes({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public Response userLogin2(@Context HttpServletRequest info,
			@PathParam("usuario") String usuario,
			@PathParam("clave") String clave) {
		// TODO Auto-generated method stub
		log.info("Inicio");
		// http://buraktas.com/jersey-client-example-with-json-support/
		BodyResp bodyResp = new BodyResp();

		try {//
				// setTransaccion(Transacciones.SERVICIO_SSO);
				// setIpAddress(info.getRemoteAddr());//
			//bodyResp = services.getTipoOrden();
			//List<TipoOrden> ordenSource = kitDaoImpl.getTipoOrden();
			
			Connection dbconnection2 = crearConexion2();
			
			System.out.println("Pausa para eliminar  CUMPLIMIENTO_RESPALDO sleep(60 seg)");
			elimnarCumplimiento(dbconnection2,	" DELETE  FROM CUMPLIMIENTO_ESTATICO_WS CU WHERE 1 = 1 AND CU.FECHA_COMPROMISO_EOM = '2017-06-06' ");
			commit(dbconnection2,"COMMIT");
			//Thread.sleep(60);
			System.out.println("Pausa para eliminar  CUMPLIMIENTO_RESPALDO sleep(60 seg)");
			elimnarCumplimiento(dbconnection2,	
					" INSERT INTO CUMPLIMIENTO_ESTATICO_WS ( " +
												"	SELECT " +
				    " (select EC.description  from CUMPLIMIENTO_KPIWEB TC LEFT JOIN ESTADO_CUMPLE EC ON TC.ID_CUMPLE = EC.ID where id_cumple = 1 and rownum <= 1) as description_cumple " +
				    " ,SUM(CASE  WHEN CU.ID_CUMPLE = 1 THEN  1 ELSE 0 END) as cantidad_cumple " +
				    " ,(  ROUND( (select count(*) from Cumplimiento_Kpiweb_Estatico CU WHERE 1 = 1  AND  CU.FECHA_COMPROMISO_EOM  = '2017-06-06' and CU.ID_CUMPLE = 1) / (select count(*) from Cumplimiento_Kpiweb_Estatico CU WHERE 1 = 1  AND  CU.FECHA_COMPROMISO_EOM  = '2017-06-06' and (CU.ID_CUMPLE = 1 OR CU.ID_CUMPLE = 2 OR CU.ID_CUMPLE = 3)) * 100 , 2) ) as porcentaje_cumple " +
				
				
				    " ,(select EC.description  from CUMPLIMIENTO_KPIWEB TC LEFT JOIN ESTADO_CUMPLE EC ON TC.ID_CUMPLE = EC.ID where id_cumple = 2 and rownum <= 1) as description_atrasado " +
				    " ,SUM(CASE  WHEN CU.ID_CUMPLE = 2 THEN  1 ELSE 0 END) as cantidad_atrasado " +
				    " ,(  ROUND( (select count(*) from Cumplimiento_Kpiweb_Estatico CU WHERE 1 = 1  AND  CU.FECHA_COMPROMISO_EOM  = '2017-06-06' and CU.ID_CUMPLE = 2) / (select count(*) from Cumplimiento_Kpiweb_Estatico CU WHERE 1 = 1  AND  CU.FECHA_COMPROMISO_EOM  = '2017-06-06' and (CU.ID_CUMPLE = 1 OR CU.ID_CUMPLE = 2 OR CU.ID_CUMPLE = 3)) * 100 , 2) ) as porcentaje_atrasado " +
				    
				    " ,(select EC.description  from CUMPLIMIENTO_KPIWEB TC LEFT JOIN ESTADO_CUMPLE EC ON TC.ID_CUMPLE = EC.ID where id_cumple = 3 and rownum <= 1) as description_no_cumple " +
				    " ,SUM(CASE  WHEN CU.ID_CUMPLE = 3 THEN  1 ELSE 0 END) as cantidad_no_cumple " +
				    " ,(  ROUND( (select count(*) from Cumplimiento_Kpiweb_Estatico CU WHERE 1 = 1  AND  CU.FECHA_COMPROMISO_EOM  = '2017-06-06' and CU.ID_CUMPLE = 3) / (select count(*) from Cumplimiento_Kpiweb_Estatico CU WHERE 1 = 1  AND  CU.FECHA_COMPROMISO_EOM  = '2017-06-06' and (CU.ID_CUMPLE = 1 OR CU.ID_CUMPLE = 2 OR CU.ID_CUMPLE = 3)) * 100 , 2) ) as porcentaje_no_cumple " +
				    
				    " ,SUM(CASE WHEN (CU.ID_CUMPLE = 1 OR CU.ID_CUMPLE = 2 OR CU.ID_CUMPLE = 3) THEN 1 ELSE 0 END) as totales " +
				    " ,CU.FECHA_COMPROMISO_EOM AS FECHA_COMPROMISO_EOM " +
				    
				  	" from CUMPLIMIENTO_KPIWEB_ESTATICO CU  " +
				  	" WHERE 1 = 1   " +
				  	" AND  CU.FECHA_COMPROMISO_EOM  = '2017-06-06' " +
				  	" GROUP BY CU.FECHA_COMPROMISO_EOM " +
				  	" ) " );

			commit(dbconnection2,"COMMIT");
			//Thread.sleep(60);
			
			
			
			List<TipoOrdenDTO> ordenSource = services.getTipoOrden2();
			if (bodyResp != null) {

				return Response.ok(UtilMIS.getJSONString(ordenSource),
						MediaType.APPLICATION_JSON).build();
				// return Response.ok(usuario).build();
				// return
				// Response.ok(UtilMIS.getJSONString(bodyResp),MediaType.APPLICATION_JSON).header(Constantes.CONTENT_TYPE,Constantes.APPLICATION_JSON_ENCODE).build();
				// return
				// Response.status(200).entity("getBooks is called, params : " +
				// usuario).build();

			}
		} catch (Exception ex) {
			log.error(Errores.MENSAJE_ERROR_SERVICES);
			log.error(Errores.EXCEPTION_MESSAGE + ex.getMessage());
			log.error(Errores.EXCEPTION_LOCALIZED + ex.getLocalizedMessage());
			ex.printStackTrace();
			bodyResp = respuestaGenerica();
		}

		log.info("Fin:" + "");
		return Response.ok(UtilMIS.getJSONString(bodyResp),
				MediaType.APPLICATION_JSON).build();
	}

	//http://localhost:8088/administrator-ws/kitserviceRS/service/cumplimiento?fechaCompromisoEom=2017-06-04&tipoOrden=-1&tipoVenta=-1&tipoGuia=-1
	
	
	@GET
	@Path("/cumplimiento")
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	@Consumes({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public Response getCumplimientoEstaticoWs(@Context HttpServletRequest info, @QueryParam("fechaCompromisoEom") String fechaCompromisoEom, @QueryParam("tipoOrden") int tipoOrden, @QueryParam("tipoVenta") int tipoVenta, @QueryParam("tipoGuia") int tipoGuia ) {
		// TODO Auto-generated method stub
		log.info("Inicio");
		// http://buraktas.com/jersey-client-example-with-json-support/
		BodyResp bodyResp = new BodyResp();
		String prefixclause ="";
		
		if (tipoOrden != -1) {
			prefixclause += " AND CU.ID_TIPO_ORDEN = " +  tipoOrden + "  ";
		} else {
			prefixclause += " ";
		}
		
		if (tipoVenta != -1) {
			prefixclause += " AND CU.ID_TIPO_VENTA = " +  tipoVenta + "  ";
		} else {
			prefixclause += " ";
		}
		
		if (tipoGuia != -1) {
			prefixclause += " AND CU.ID_TIPOGUI = " +  tipoGuia + "  ";
		} else {
			prefixclause += " ";
		}
		
		
		try {
			
			
			Connection dbconnection2 = crearConexion2();
			
			//System.out.println("Pausa para eliminar  CUMPLIMIENTO_RESPALDO sleep(60 seg)");
			elimnarCumplimiento(dbconnection2,	" DELETE  FROM cumplimiento_estatico_ws  WHERE 1 = 1 AND FECHA_COMPROMISO_EOM = '"+fechaCompromisoEom+"' " + "");
			//commit(dbconnection2,"COMMIT");
			//Thread.sleep(60);
			//System.out.println("Pausa para eliminar  CUMPLIMIENTO_ESTATICO_WS sleep(60 seg)");
			
			//PostgresSql
			/*
			elimnarCumplimiento(dbconnection2,	
					" 	INSERT INTO CUMPLIMIENTO_ESTATICO_WS  (DESCRIPTION_CUMPLE,CANTIDAD_CUMPLE,PORCENTAJE_CUMPLE,DESCRIPTION_ATRASADO,CANTIDAD_ATRASADO,PORCENTAJE_ATRASADO,DESCRIPTION_NO_CUMPLE,CANTIDAD_NO_CUMPLE,PORCENTAJE_NO_CUMPLE,CANTIDAD_TOTAL,PORCENTAJE_TOTAL,FECHA_COMPROMISO_EOM ) " +
					"		SELECT " +
					" 			(CASE  WHEN (select COUNT(*)  from Cumplimiento_Kpiweb_Estatico TC LEFT JOIN ESTADO_CUMPLE EC ON TC.ID_CUMPLE = EC.ID where id_cumple = 1 limit 1) > 0 THEN  '1.- CUMPLE' ELSE '1.- CUMPLE' END) AS DESCRIPTION_CUMPLE  "		+
				    " 			,SUM(CASE  WHEN CU.ID_CUMPLE = 1 THEN  1 ELSE 0 END) as CANTIDAD_CUMPLE " +
				    " 			, ROUND((cast((select count(*) from Cumplimiento_Kpiweb_Estatico CU WHERE 1 = 1  AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"' and CU.ID_CUMPLE = 1 "+prefixclause+") as float) / cast((select count(*) from Cumplimiento_Kpiweb_Estatico CU WHERE 1 = 1  AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"' "+prefixclause+" and (CU.ID_CUMPLE = 1 OR CU.ID_CUMPLE = 2 OR CU.ID_CUMPLE = 3) ) as float)  * 100),2) AS PORCENTAJE_CUMPLE " +

				    " 			,(CASE  WHEN (select COUNT(*)  from Cumplimiento_Kpiweb_Estatico TC LEFT JOIN ESTADO_CUMPLE EC ON TC.ID_CUMPLE = EC.ID where id_cumple = 2 limit 1) > 0 THEN  '2.- ATRASADO' ELSE '2.- ATRASADO' END) AS DESCRIPTION_ATRASADO " +
				    " 			, SUM(CASE  WHEN CU.ID_CUMPLE = 2 THEN  1 ELSE 0 END) as CANTIDAD_ATRASADO  " +
				    " 			, ROUND((cast((select count(*) from Cumplimiento_Kpiweb_Estatico CU WHERE 1 = 1  AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"' and CU.ID_CUMPLE = 2 "+prefixclause+") as float) / cast((select count(*) from Cumplimiento_Kpiweb_Estatico CU WHERE 1 = 1  AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"' "+prefixclause+" and (CU.ID_CUMPLE = 1 OR CU.ID_CUMPLE = 2 OR CU.ID_CUMPLE = 3) ) as float)  * 100),2) AS PORCENTAJE_ATRASADO  " +
				   
				    " 			,(CASE  WHEN (select COUNT(*)  from Cumplimiento_Kpiweb_Estatico TC LEFT JOIN ESTADO_CUMPLE EC ON TC.ID_CUMPLE = EC.ID where id_cumple = 3 limit 1) > 0 THEN  '3.- NO CUMPLE' ELSE '3.- NO CUMPLE' END) AS DESCRIPTION_NO_CUMPLE " +
				    " 			, SUM(CASE  WHEN CU.ID_CUMPLE = 3 THEN  1 ELSE 0 END) as CANTIDAD_NO_CUMPLE  " +
				    " 			, ROUND((cast((select count(*) from Cumplimiento_Kpiweb_Estatico CU WHERE 1 = 1  AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"' and CU.ID_CUMPLE = 3 "+prefixclause+") as float) / cast((select count(*) from Cumplimiento_Kpiweb_Estatico CU WHERE 1 = 1  AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"' "+prefixclause+" and (CU.ID_CUMPLE = 1 OR CU.ID_CUMPLE = 2 OR CU.ID_CUMPLE = 3) ) as float)  * 100),2) AS PORCENTAJE_NO_CUMPLE  " +
				    
				    " 			,SUM(CASE WHEN (CU.ID_CUMPLE = 1 OR CU.ID_CUMPLE = 2 OR CU.ID_CUMPLE = 3) THEN 1 ELSE 0 END) as CANTIDAD_TOTAL  " +
				    
				    " 			,(  ROUND( (select count(*) from Cumplimiento_Kpiweb_Estatico CU WHERE 1 = 1  AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"'  and (CU.ID_CUMPLE = 1 OR CU.ID_CUMPLE = 2 OR CU.ID_CUMPLE = 3) "+prefixclause+" ) / (select count(*) from Cumplimiento_Kpiweb_Estatico CU WHERE 1 = 1  AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"'  "+prefixclause+" and (CU.ID_CUMPLE = 1 OR CU.ID_CUMPLE = 2 OR CU.ID_CUMPLE = 3)) * 100 , 2) ) as PORCENTAJE_TOTAL   " +
				    " 			, FECHA_COMPROMISO_EOM " +

				    " from CUMPLIMIENTO_KPIWEB_ESTATICO CU  " +
				  	" WHERE 1 = 1   " +
				  	" " + prefixclause +
				  	" AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"' " +
				  	" GROUP BY CU.FECHA_COMPROMISO_EOM " +
				  	"  " );
			*/
			
			//Oracle
			
			elimnarCumplimiento(dbconnection2,	
					" INSERT INTO CUMPLIMIENTO_ESTATICO_WS ( " +
												"	SELECT " +
					" (select id    from CUMPLIMIENTO_KPIWEB TC where rownum<=1) as id" +		
				    " ,(select EC.description  from CUMPLIMIENTO_KPIWEB TC LEFT JOIN ESTADO_CUMPLE EC ON TC.ID_CUMPLE = EC.ID where id_cumple = 1 and rownum <= 1) as description_cumple " +
				    " ,SUM(CASE  WHEN CU.ID_CUMPLE = 1 THEN  1 ELSE 0 END) as cantidad_cumple " +
				    " ,(  ROUND( (select count(*) from Cumplimiento_Kpiweb_Estatico CU WHERE 1 = 1  AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"' and CU.ID_CUMPLE = 1 "+prefixclause+") / (select count(*) from Cumplimiento_Kpiweb_Estatico CU WHERE 1 = 1  AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"' and (CU.ID_CUMPLE = 1 OR CU.ID_CUMPLE = 2 OR CU.ID_CUMPLE = 3) "+prefixclause+") * 100 , 3) ) as porcentaje_cumple " +
				
				
				    " ,(select EC.description  from CUMPLIMIENTO_KPIWEB TC LEFT JOIN ESTADO_CUMPLE EC ON TC.ID_CUMPLE = EC.ID where id_cumple = 2 and rownum <= 1) as description_atrasado " +
				    " ,SUM(CASE  WHEN CU.ID_CUMPLE = 2 THEN  1 ELSE 0 END) as cantidad_atrasado " +
				    " ,(  ROUND( (select count(*) from Cumplimiento_Kpiweb_Estatico CU WHERE 1 = 1  AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"' and CU.ID_CUMPLE = 2 "+prefixclause+") / (select count(*) from Cumplimiento_Kpiweb_Estatico CU WHERE 1 = 1  AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"' and (CU.ID_CUMPLE = 1 OR CU.ID_CUMPLE = 2 OR CU.ID_CUMPLE = 3) "+prefixclause+") * 100 , 3) ) as porcentaje_atrasado " +
				    
				    " ,(select EC.description  from CUMPLIMIENTO_KPIWEB TC LEFT JOIN ESTADO_CUMPLE EC ON TC.ID_CUMPLE = EC.ID where id_cumple = 3 and rownum <= 1) as description_no_cumple " +
				    " ,SUM(CASE  WHEN CU.ID_CUMPLE = 3 THEN  1 ELSE 0 END) as cantidad_no_cumple " +
				    " ,(  ROUND( (select count(*) from Cumplimiento_Kpiweb_Estatico CU WHERE 1 = 1  AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"' and CU.ID_CUMPLE = 3 "+prefixclause+") / (select count(*) from Cumplimiento_Kpiweb_Estatico CU WHERE 1 = 1  AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"' and (CU.ID_CUMPLE = 1 OR CU.ID_CUMPLE = 2 OR CU.ID_CUMPLE = 3) "+prefixclause+") * 100 , 3) ) as porcentaje_no_cumple " +
				    
				    " ,SUM(CASE WHEN (CU.ID_CUMPLE = 1 OR CU.ID_CUMPLE = 2 OR CU.ID_CUMPLE = 3) THEN 1 ELSE 0 END) as cantidad_total " +
				    " ,(  ROUND( (select count(*) from Cumplimiento_Kpiweb_Estatico CU WHERE 1 = 1  AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"' and (CU.ID_CUMPLE = 1 OR CU.ID_CUMPLE = 2 OR CU.ID_CUMPLE = 3) "+prefixclause+") / (select count(*) from Cumplimiento_Kpiweb_Estatico CU WHERE 1 = 1  AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"' and (CU.ID_CUMPLE = 1 OR CU.ID_CUMPLE = 2 OR CU.ID_CUMPLE = 3) "+prefixclause+") * 100 , 2) ) as porcentaje_total " +

				    " ,CU.FECHA_COMPROMISO_EOM AS FECHA_COMPROMISO_EOM " +
				    
				  	" from CUMPLIMIENTO_KPIWEB_ESTATICO CU  " +
				  	" WHERE 1 = 1   " +
				  	" AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"' " +
				  	" GROUP BY CU.FECHA_COMPROMISO_EOM " +
				  	" ) " );
			commit(dbconnection2,"COMMIT");
			
			//Mysql
			/*
			elimnarCumplimiento(dbconnection2,	
					" INSERT INTO  cumplimiento_estatico_ws ( " +
												"	SELECT " +
					" (select id    from cumplimiento_kpiweb TC limit 0,1) as id" +		
				    " ,IFNULL((select EC.description  from cumplimiento_kpiweb TC LEFT JOIN estado_cumple EC ON TC.ID_CUMPLE = EC.ID where id_cumple = 1 limit 0,1),'-') as description_cumple " +
				    " ,IFNULL(SUM(CASE  WHEN CU.ID_CUMPLE = 1 THEN  1 ELSE 0 END),0) as cantidad_cumple " +
				    " ,IFNULL((  ROUND( (select count(*) from cumplimiento_kpiweb CU WHERE 1 = 1  AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"' and CU.ID_CUMPLE = 1 "+prefixclause+") / (select count(*) from cumplimiento_kpiweb CU WHERE 1 = 1  AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"' and (CU.ID_CUMPLE = 1 OR CU.ID_CUMPLE = 2 OR CU.ID_CUMPLE = 3) "+prefixclause+") * 100 , 3) ),0) as porcentaje_cumple " +
				
				
				    " ,IFNULL((select EC.description  from cumplimiento_kpiweb TC LEFT JOIN estado_cumple EC ON TC.ID_CUMPLE = EC.ID where id_cumple = 2 limit 0,1),'-') as description_atrasado " +
				    " ,IFNULL(SUM(CASE  WHEN CU.ID_CUMPLE = 2 THEN  1 ELSE 0 END),0) as cantidad_atrasado " +
				    " ,IFNULL((  ROUND( (select count(*) from cumplimiento_kpiweb CU WHERE 1 = 1  AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"' and CU.ID_CUMPLE = 2 "+prefixclause+") / (select count(*) from cumplimiento_kpiweb CU WHERE 1 = 1  AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"' and (CU.ID_CUMPLE = 1 OR CU.ID_CUMPLE = 2 OR CU.ID_CUMPLE = 3) "+prefixclause+") * 100 , 3) ),0) as porcentaje_atrasado " +
				    
				    " ,IFNULL((select EC.description  from cumplimiento_kpiweb TC LEFT JOIN estado_cumple EC ON TC.ID_CUMPLE = EC.ID where id_cumple = 3 limit 0,1),'-') as description_no_cumple " +
				    " ,IFNULL(SUM(CASE  WHEN CU.ID_CUMPLE = 3 THEN  1 ELSE 0 END),0) as cantidad_no_cumple " +
				    " ,IFNULL((  ROUND( (select count(*) from cumplimiento_kpiweb CU WHERE 1 = 1  AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"' and CU.ID_CUMPLE = 3 "+prefixclause+") / (select count(*) from cumplimiento_kpiweb CU WHERE 1 = 1  AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"' and (CU.ID_CUMPLE = 1 OR CU.ID_CUMPLE = 2 OR CU.ID_CUMPLE = 3) "+prefixclause+") * 100 , 3) ),0) as porcentaje_no_cumple " +
				    
				    " ,IFNULL(SUM(CASE WHEN (CU.ID_CUMPLE = 1 OR CU.ID_CUMPLE = 2 OR CU.ID_CUMPLE = 3) THEN 1 ELSE 0 END),0) as cantidad_total " +
				    " ,IFNULL((  ROUND( (select count(*) from cumplimiento_kpiweb CU WHERE 1 = 1  AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"' and (CU.ID_CUMPLE = 1 OR CU.ID_CUMPLE = 2 OR CU.ID_CUMPLE = 3) "+prefixclause+") / (select count(*) from cumplimiento_kpiweb CU WHERE 1 = 1  AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"' and (CU.ID_CUMPLE = 1 OR CU.ID_CUMPLE = 2 OR CU.ID_CUMPLE = 3) "+prefixclause+") * 100 , 2) ),0) as porcentaje_total " +

				    " ,CU.FECHA_COMPROMISO_EOM AS FECHA_COMPROMISO_EOM " +
				    
				  	" from cumplimiento_kpiweb CU  " +
				  	" WHERE 1 = 1   " +
				  	" AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"' " +
				  	" GROUP BY CU.FECHA_COMPROMISO_EOM " +
				  	" ) " );
			
			*/

			
			
			bodyResp = services.getCumplimientoEstaticoWs(fechaCompromisoEom);
			if (bodyResp != null) {
				
				
				
				
				 return Response.ok(UtilMIS.getJSONString(bodyResp), MediaType.APPLICATION_JSON)
					      .header("Access-Control-Allow-Origin", "*")
					      .header("Access-Control-Allow-Methods", "POST, GET, PUT, UPDATE, OPTIONS")
					      .header("Access-Control-Allow-Headers", "Content-Type, Accept, X-Requested-With").build();
				 
				 
				
				//return Response.ok(UtilMIS.getJSONString(bodyResp), MediaType.APPLICATION_JSON).header(Constantes.CONTENT_TYPE, Constantes.APPLICATION_JSON_ENCODE).build();

				//return Response.ok(UtilMIS.getJSONString(bodyResp), MediaType.APPLICATION_JSON).build();
				
			}
		} catch (Exception ex) {
			log.error(Errores.MENSAJE_ERROR_SERVICES);
			log.error(Errores.EXCEPTION_MESSAGE + ex.getMessage());
			log.error(Errores.EXCEPTION_LOCALIZED + ex.getLocalizedMessage());
			ex.printStackTrace();
			bodyResp = respuestaGenerica();
		}

		log.info("Fin:" + "");
		return Response.ok(UtilMIS.getJSONString(bodyResp),
				MediaType.APPLICATION_JSON).build();
	}

	@GET
	@Path("/ordenes")
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	@Consumes({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public Response getTipoOrden(@Context HttpServletRequest info) {
		// TODO Auto-generated method stub
		log.info("Inicio");
		// http://buraktas.com/jersey-client-example-with-json-support/
		BodyResp bodyResp = new BodyResp();

		try {//
				// setTransaccion(Transacciones.SERVICIO_SSO);
				// setIpAddress(info.getRemoteAddr());//
			//bodyResp = services.getTipoOrden();
			//List<TipoOrden> ordenSource = kitDaoImpl.getTipoOrden();
			
			
			
			
			
			List<TipoOrdenDTO> ordenSource = services.getTipoOrden2();
			if (bodyResp != null) {

				//return Response.ok(UtilMIS.getJSONString(ordenSource), MediaType.APPLICATION_JSON).build();
				return Response.ok(UtilMIS.getJSONString(ordenSource), MediaType.APPLICATION_JSON)
							.header("Access-Control-Allow-Origin", "*")
							.header("Access-Control-Allow-Methods", "POST, GET, PUT, UPDATE, OPTIONS")
							.header("Access-Control-Allow-Headers", "Content-Type, Accept, X-Requested-With").build();
				
				/*return Response.ok(UtilMIS.getJSONString(ordenSource), MediaType.APPLICATION_JSON)
					      .header("Access-Control-Allow-Origin", "*")
					      .header("Access-Control-Allow-Methods", "POST, GET, PUT, UPDATE, OPTIONS")
					      .header("Access-Control-Allow-Headers", "Content-Type, Accept, X-Requested-With").build();
					      
					      */

			}
		} catch (Exception ex) {
			log.error(Errores.MENSAJE_ERROR_SERVICES);
			log.error(Errores.EXCEPTION_MESSAGE + ex.getMessage());
			log.error(Errores.EXCEPTION_LOCALIZED + ex.getLocalizedMessage());
			ex.printStackTrace();
			bodyResp = respuestaGenerica();
		}

		log.info("Fin:" + "");
		return Response.ok(UtilMIS.getJSONString(bodyResp),
				MediaType.APPLICATION_JSON).build();
	}
	
	
	

	@GET
	@Path("/ventas")
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	@Consumes({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public Response getTipoVenta(@Context HttpServletRequest info) {
		// TODO Auto-generated method stub
		log.info("Inicio");
		// http://buraktas.com/jersey-client-example-with-json-support/
		BodyResp bodyResp = new BodyResp();

		try {//
				// setTransaccion(Transacciones.SERVICIO_SSO);
				// setIpAddress(info.getRemoteAddr());//
			//bodyResp = services.getTipoOrden();
			//List<TipoOrden> ordenSource = kitDaoImpl.getTipoOrden();
			
			
			
			
			
			List<TipoVentaDTO> ordenSource = services.getTipoVenta();
			if (bodyResp != null) {

				//return Response.ok(UtilMIS.getJSONString(ordenSource), MediaType.APPLICATION_JSON).build();
				/*
				return Response.ok(UtilMIS.getJSONString(ordenSource), MediaType.APPLICATION_JSON)
					      .header("Access-Control-Allow-Origin", "*")
					      .header("Access-Control-Allow-Methods", "POST, GET, PUT, UPDATE, OPTIONS")
					      .header("Access-Control-Allow-Headers", "Content-Type, Accept, X-Requested-With").build();
				*/
				return Response.ok(UtilMIS.getJSONString(ordenSource), MediaType.APPLICATION_JSON)
						.header("Access-Control-Allow-Origin", "*")
						.header("Access-Control-Allow-Methods", "POST, GET, PUT, UPDATE, OPTIONS")
						.header("Access-Control-Allow-Headers", "Content-Type, Accept, X-Requested-With").build();

			}
		} catch (Exception ex) {
			log.error(Errores.MENSAJE_ERROR_SERVICES);
			log.error(Errores.EXCEPTION_MESSAGE + ex.getMessage());
			log.error(Errores.EXCEPTION_LOCALIZED + ex.getLocalizedMessage());
			ex.printStackTrace();
			bodyResp = respuestaGenerica();
		}

		log.info("Fin:" + "");
		return Response.ok(UtilMIS.getJSONString(bodyResp),
				MediaType.APPLICATION_JSON).build();
	}

	@GET
	@Path("/guias")
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	@Consumes({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public Response getTipoGuia(@Context HttpServletRequest info) {
		// TODO Auto-generated method stub
		log.info("Inicio");
		// http://buraktas.com/jersey-client-example-with-json-support/
		BodyResp bodyResp = new BodyResp();

		try {//
				// setTransaccion(Transacciones.SERVICIO_SSO);
				// setIpAddress(info.getRemoteAddr());//
			//bodyResp = services.getTipoOrden();
			//List<TipoOrden> ordenSource = kitDaoImpl.getTipoOrden();
			
			
			
			
			
			List<TipoGuiaDTO> ordenSource = services.getTipoGuia();
			if (bodyResp != null) {

				//return Response.ok(UtilMIS.getJSONString(ordenSource), MediaType.APPLICATION_JSON).build();
				/*
				return Response.ok(UtilMIS.getJSONString(ordenSource), MediaType.APPLICATION_JSON)
					      .header("Access-Control-Allow-Origin", "*")
					      .header("Access-Control-Allow-Methods", "POST, GET, PUT, UPDATE, OPTIONS")
					      .header("Access-Control-Allow-Headers", "Content-Type, Accept, X-Requested-With").build();
				*/
				return Response.ok(UtilMIS.getJSONString(ordenSource), MediaType.APPLICATION_JSON)
						.header("Access-Control-Allow-Origin", "*")
						.header("Access-Control-Allow-Methods", "POST, GET, PUT, UPDATE, OPTIONS")
						.header("Access-Control-Allow-Headers", "Content-Type, Accept, X-Requested-With").build();
			}
		} catch (Exception ex) {
			log.error(Errores.MENSAJE_ERROR_SERVICES);
			log.error(Errores.EXCEPTION_MESSAGE + ex.getMessage());
			log.error(Errores.EXCEPTION_LOCALIZED + ex.getLocalizedMessage());
			ex.printStackTrace();
			bodyResp = respuestaGenerica();
		}

		log.info("Fin:" + "");
		return Response.ok(UtilMIS.getJSONString(bodyResp),
				MediaType.APPLICATION_JSON).build();
	}
	
	
	@GET
	@Path("/logs")
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	@Consumes({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public Response getLog(@Context HttpServletRequest info) {
		// TODO Auto-generated method stub
		log.info("Inicio");
		// http://buraktas.com/jersey-client-example-with-json-support/
		BodyResp bodyResp = new BodyResp();

		try {//
				// setTransaccion(Transacciones.SERVICIO_SSO);
				// setIpAddress(info.getRemoteAddr());//
			//bodyResp = services.getTipoOrden();
			//List<TipoOrden> ordenSource = kitDaoImpl.getTipoOrden();
			
			
			
			
			
			List<SystemLogDTO> ordenSource = services.getLog();
			if (bodyResp != null) {

				//return Response.ok(UtilMIS.getJSONString(ordenSource), MediaType.APPLICATION_JSON).build();
				/*
				return Response.ok(UtilMIS.getJSONString(ordenSource), MediaType.APPLICATION_JSON)
					      .header("Access-Control-Allow-Origin", "*")
					      .header("Access-Control-Allow-Methods", "POST, GET, PUT, UPDATE, OPTIONS")
					      .header("Access-Control-Allow-Headers", "Content-Type, Accept, X-Requested-With").build();
				*/
				return Response.ok(UtilMIS.getJSONString(ordenSource), MediaType.APPLICATION_JSON)
						.header("Access-Control-Allow-Origin", "*")
						.header("Access-Control-Allow-Methods", "POST, GET, PUT, UPDATE, OPTIONS")
						.header("Access-Control-Allow-Headers", "Content-Type, Accept, X-Requested-With").build();

			}
		} catch (Exception ex) {
			log.error(Errores.MENSAJE_ERROR_SERVICES);
			log.error(Errores.EXCEPTION_MESSAGE + ex.getMessage());
			log.error(Errores.EXCEPTION_LOCALIZED + ex.getLocalizedMessage());
			ex.printStackTrace();
			bodyResp = respuestaGenerica();
		}

		log.info("Fin:" + "");
		return Response.ok(UtilMIS.getJSONString(bodyResp),
				MediaType.APPLICATION_JSON).build();
	}
	
	
	
	
	@GET
	@Path("/sku")
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	@Consumes({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public Response getSkuServicioWs(@Context HttpServletRequest info, @QueryParam("inumbr") int inumbr) {
		// TODO Auto-generated method stub
		log.info("Inicio");
		Connection dbconnection = crearConexionRoble();
		// http://buraktas.com/jersey-client-example-with-json-support/
		BodyResp bodyResp = new BodyResp();
		String prefixclause ="";
		
		
		
		try {
			
			
			Connection dbconnection2 = crearConexion2();
			
			//System.out.println("Pausa para eliminar  CUMPLIMIENTO_RESPALDO sleep(60 seg)");
			elimnarCumplimiento(dbconnection2,	" DELETE  FROM sku_servicio_ws  WHERE 1 = 1 ");
			//commit(dbconnection2,"COMMIT");
			//Thread.sleep(60);
			//System.out.println("Pausa para eliminar  CUMPLIMIENTO_ESTATICO_WS sleep(60 seg)");
			
			//PostgresSql
			/*
			elimnarCumplimiento(dbconnection2,	
					" 	INSERT INTO CUMPLIMIENTO_ESTATICO_WS  (DESCRIPTION_CUMPLE,CANTIDAD_CUMPLE,PORCENTAJE_CUMPLE,DESCRIPTION_ATRASADO,CANTIDAD_ATRASADO,PORCENTAJE_ATRASADO,DESCRIPTION_NO_CUMPLE,CANTIDAD_NO_CUMPLE,PORCENTAJE_NO_CUMPLE,CANTIDAD_TOTAL,PORCENTAJE_TOTAL,FECHA_COMPROMISO_EOM ) " +
					"		SELECT " +
					" 			(CASE  WHEN (select COUNT(*)  from Cumplimiento_Kpiweb_Estatico TC LEFT JOIN ESTADO_CUMPLE EC ON TC.ID_CUMPLE = EC.ID where id_cumple = 1 limit 1) > 0 THEN  '1.- CUMPLE' ELSE '1.- CUMPLE' END) AS DESCRIPTION_CUMPLE  "		+
				    " 			,SUM(CASE  WHEN CU.ID_CUMPLE = 1 THEN  1 ELSE 0 END) as CANTIDAD_CUMPLE " +
				    " 			, ROUND((cast((select count(*) from Cumplimiento_Kpiweb_Estatico CU WHERE 1 = 1  AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"' and CU.ID_CUMPLE = 1 "+prefixclause+") as float) / cast((select count(*) from Cumplimiento_Kpiweb_Estatico CU WHERE 1 = 1  AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"' "+prefixclause+" and (CU.ID_CUMPLE = 1 OR CU.ID_CUMPLE = 2 OR CU.ID_CUMPLE = 3) ) as float)  * 100),2) AS PORCENTAJE_CUMPLE " +

				    " 			,(CASE  WHEN (select COUNT(*)  from Cumplimiento_Kpiweb_Estatico TC LEFT JOIN ESTADO_CUMPLE EC ON TC.ID_CUMPLE = EC.ID where id_cumple = 2 limit 1) > 0 THEN  '2.- ATRASADO' ELSE '2.- ATRASADO' END) AS DESCRIPTION_ATRASADO " +
				    " 			, SUM(CASE  WHEN CU.ID_CUMPLE = 2 THEN  1 ELSE 0 END) as CANTIDAD_ATRASADO  " +
				    " 			, ROUND((cast((select count(*) from Cumplimiento_Kpiweb_Estatico CU WHERE 1 = 1  AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"' and CU.ID_CUMPLE = 2 "+prefixclause+") as float) / cast((select count(*) from Cumplimiento_Kpiweb_Estatico CU WHERE 1 = 1  AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"' "+prefixclause+" and (CU.ID_CUMPLE = 1 OR CU.ID_CUMPLE = 2 OR CU.ID_CUMPLE = 3) ) as float)  * 100),2) AS PORCENTAJE_ATRASADO  " +
				   
				    " 			,(CASE  WHEN (select COUNT(*)  from Cumplimiento_Kpiweb_Estatico TC LEFT JOIN ESTADO_CUMPLE EC ON TC.ID_CUMPLE = EC.ID where id_cumple = 3 limit 1) > 0 THEN  '3.- NO CUMPLE' ELSE '3.- NO CUMPLE' END) AS DESCRIPTION_NO_CUMPLE " +
				    " 			, SUM(CASE  WHEN CU.ID_CUMPLE = 3 THEN  1 ELSE 0 END) as CANTIDAD_NO_CUMPLE  " +
				    " 			, ROUND((cast((select count(*) from Cumplimiento_Kpiweb_Estatico CU WHERE 1 = 1  AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"' and CU.ID_CUMPLE = 3 "+prefixclause+") as float) / cast((select count(*) from Cumplimiento_Kpiweb_Estatico CU WHERE 1 = 1  AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"' "+prefixclause+" and (CU.ID_CUMPLE = 1 OR CU.ID_CUMPLE = 2 OR CU.ID_CUMPLE = 3) ) as float)  * 100),2) AS PORCENTAJE_NO_CUMPLE  " +
				    
				    " 			,SUM(CASE WHEN (CU.ID_CUMPLE = 1 OR CU.ID_CUMPLE = 2 OR CU.ID_CUMPLE = 3) THEN 1 ELSE 0 END) as CANTIDAD_TOTAL  " +
				    
				    " 			,(  ROUND( (select count(*) from Cumplimiento_Kpiweb_Estatico CU WHERE 1 = 1  AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"'  and (CU.ID_CUMPLE = 1 OR CU.ID_CUMPLE = 2 OR CU.ID_CUMPLE = 3) "+prefixclause+" ) / (select count(*) from Cumplimiento_Kpiweb_Estatico CU WHERE 1 = 1  AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"'  "+prefixclause+" and (CU.ID_CUMPLE = 1 OR CU.ID_CUMPLE = 2 OR CU.ID_CUMPLE = 3)) * 100 , 2) ) as PORCENTAJE_TOTAL   " +
				    " 			, FECHA_COMPROMISO_EOM " +

				    " from CUMPLIMIENTO_KPIWEB_ESTATICO CU  " +
				  	" WHERE 1 = 1   " +
				  	" " + prefixclause +
				  	" AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"' " +
				  	" GROUP BY CU.FECHA_COMPROMISO_EOM " +
				  	"  " );
			*/
			
			//Oracle
			elimnarCumplimiento(dbconnection2,"INSERT INTO SKU_SERVICIO_WS (INUMBR, PRSDEP, PRSSDP, PRSCLA, PRSVND, prstip) VALUES("+Integer.parseInt(ejecutarQuerySku("".equals(inumbr) || inumbr == 0 ? 0 : inumbr, dbconnection))+", "+Integer.parseInt(ejecutarQueryPrsDep("".equals(inumbr) || inumbr == 0 ? 0 : inumbr, dbconnection))+", "+Integer.parseInt(ejecutarQueryPrssDp("".equals(inumbr) || inumbr == 0 ? 0 : inumbr, dbconnection))+", "+Integer.parseInt(ejecutarQueryPrsCla("".equals(inumbr) || inumbr == 0 ? 0 : inumbr, dbconnection))+", "+Integer.parseInt(ejecutarQueryPrsVnd("".equals(inumbr) || inumbr == 0 ? 0 : inumbr, dbconnection))+", '"+ejecutarQueryPrsTip("".equals(inumbr) || inumbr == 0 ? 0 : inumbr, dbconnection)+"') ");
			commit(dbconnection2,"COMMIT");
			
			//Mysql
			/*
			elimnarCumplimiento(dbconnection2,	
					" INSERT INTO  cumplimiento_estatico_ws ( " +
												"	SELECT " +
					" (select id    from cumplimiento_kpiweb TC limit 0,1) as id" +		
				    " ,IFNULL((select EC.description  from cumplimiento_kpiweb TC LEFT JOIN estado_cumple EC ON TC.ID_CUMPLE = EC.ID where id_cumple = 1 limit 0,1),'-') as description_cumple " +
				    " ,IFNULL(SUM(CASE  WHEN CU.ID_CUMPLE = 1 THEN  1 ELSE 0 END),0) as cantidad_cumple " +
				    " ,IFNULL((  ROUND( (select count(*) from cumplimiento_kpiweb CU WHERE 1 = 1  AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"' and CU.ID_CUMPLE = 1 "+prefixclause+") / (select count(*) from cumplimiento_kpiweb CU WHERE 1 = 1  AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"' and (CU.ID_CUMPLE = 1 OR CU.ID_CUMPLE = 2 OR CU.ID_CUMPLE = 3) "+prefixclause+") * 100 , 3) ),0) as porcentaje_cumple " +
				
				
				    " ,IFNULL((select EC.description  from cumplimiento_kpiweb TC LEFT JOIN estado_cumple EC ON TC.ID_CUMPLE = EC.ID where id_cumple = 2 limit 0,1),'-') as description_atrasado " +
				    " ,IFNULL(SUM(CASE  WHEN CU.ID_CUMPLE = 2 THEN  1 ELSE 0 END),0) as cantidad_atrasado " +
				    " ,IFNULL((  ROUND( (select count(*) from cumplimiento_kpiweb CU WHERE 1 = 1  AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"' and CU.ID_CUMPLE = 2 "+prefixclause+") / (select count(*) from cumplimiento_kpiweb CU WHERE 1 = 1  AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"' and (CU.ID_CUMPLE = 1 OR CU.ID_CUMPLE = 2 OR CU.ID_CUMPLE = 3) "+prefixclause+") * 100 , 3) ),0) as porcentaje_atrasado " +
				    
				    " ,IFNULL((select EC.description  from cumplimiento_kpiweb TC LEFT JOIN estado_cumple EC ON TC.ID_CUMPLE = EC.ID where id_cumple = 3 limit 0,1),'-') as description_no_cumple " +
				    " ,IFNULL(SUM(CASE  WHEN CU.ID_CUMPLE = 3 THEN  1 ELSE 0 END),0) as cantidad_no_cumple " +
				    " ,IFNULL((  ROUND( (select count(*) from cumplimiento_kpiweb CU WHERE 1 = 1  AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"' and CU.ID_CUMPLE = 3 "+prefixclause+") / (select count(*) from cumplimiento_kpiweb CU WHERE 1 = 1  AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"' and (CU.ID_CUMPLE = 1 OR CU.ID_CUMPLE = 2 OR CU.ID_CUMPLE = 3) "+prefixclause+") * 100 , 3) ),0) as porcentaje_no_cumple " +
				    
				    " ,IFNULL(SUM(CASE WHEN (CU.ID_CUMPLE = 1 OR CU.ID_CUMPLE = 2 OR CU.ID_CUMPLE = 3) THEN 1 ELSE 0 END),0) as cantidad_total " +
				    " ,IFNULL((  ROUND( (select count(*) from cumplimiento_kpiweb CU WHERE 1 = 1  AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"' and (CU.ID_CUMPLE = 1 OR CU.ID_CUMPLE = 2 OR CU.ID_CUMPLE = 3) "+prefixclause+") / (select count(*) from cumplimiento_kpiweb CU WHERE 1 = 1  AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"' and (CU.ID_CUMPLE = 1 OR CU.ID_CUMPLE = 2 OR CU.ID_CUMPLE = 3) "+prefixclause+") * 100 , 2) ),0) as porcentaje_total " +

				    " ,CU.FECHA_COMPROMISO_EOM AS FECHA_COMPROMISO_EOM " +
				    
				  	" from cumplimiento_kpiweb CU  " +
				  	" WHERE 1 = 1   " +
				  	" AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"' " +
				  	" GROUP BY CU.FECHA_COMPROMISO_EOM " +
				  	" ) " );
			
			*/

			
			
			bodyResp = services.getSkuServicioWs(inumbr);
			if (bodyResp != null) {
				
				
				
				
				 return Response.ok(UtilMIS.getJSONString(bodyResp), MediaType.APPLICATION_JSON)
					      .header("Access-Control-Allow-Origin", "*")
					      .header("Access-Control-Allow-Methods", "POST, GET, PUT, UPDATE, OPTIONS")
					      .header("Access-Control-Allow-Headers", "Content-Type, Accept, X-Requested-With").build();
				 
				 
				
				//return Response.ok(UtilMIS.getJSONString(bodyResp), MediaType.APPLICATION_JSON).header(Constantes.CONTENT_TYPE, Constantes.APPLICATION_JSON_ENCODE).build();

				//return Response.ok(UtilMIS.getJSONString(bodyResp), MediaType.APPLICATION_JSON).build();
				
			}
		} catch (Exception ex) {
			log.error(Errores.MENSAJE_ERROR_SERVICES);
			log.error(Errores.EXCEPTION_MESSAGE + ex.getMessage());
			log.error(Errores.EXCEPTION_LOCALIZED + ex.getLocalizedMessage());
			ex.printStackTrace();
			bodyResp = respuestaGenerica();
		}

		log.info("Fin:" + "");
		return Response.ok(UtilMIS.getJSONString(bodyResp),
				MediaType.APPLICATION_JSON).build();
	}
	
	
	@GET
	@Path("/skuXml")
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	@Consumes({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public Response getSkuServicioWs2(@Context HttpServletRequest info, @QueryParam("inumbr") int inumbr) {
		// TODO Auto-generated method stub
		log.info("Inicio");
		Connection dbconnection = crearConexionRoble();
		// http://buraktas.com/jersey-client-example-with-json-support/
		BodyResp bodyResp = new BodyResp();
		String prefixclause ="";
		
		
		
		try {
			
			
			Connection dbconnection2 = crearConexion2();
			
			//System.out.println("Pausa para eliminar  CUMPLIMIENTO_RESPALDO sleep(60 seg)");
			elimnarCumplimiento(dbconnection2,	" DELETE  FROM sku_servicio_ws  WHERE 1 = 1 ");
			//commit(dbconnection2,"COMMIT");
			//Thread.sleep(60);
			//System.out.println("Pausa para eliminar  CUMPLIMIENTO_ESTATICO_WS sleep(60 seg)");
			
			//PostgresSql
			/*
			elimnarCumplimiento(dbconnection2,	
					" 	INSERT INTO CUMPLIMIENTO_ESTATICO_WS  (DESCRIPTION_CUMPLE,CANTIDAD_CUMPLE,PORCENTAJE_CUMPLE,DESCRIPTION_ATRASADO,CANTIDAD_ATRASADO,PORCENTAJE_ATRASADO,DESCRIPTION_NO_CUMPLE,CANTIDAD_NO_CUMPLE,PORCENTAJE_NO_CUMPLE,CANTIDAD_TOTAL,PORCENTAJE_TOTAL,FECHA_COMPROMISO_EOM ) " +
					"		SELECT " +
					" 			(CASE  WHEN (select COUNT(*)  from Cumplimiento_Kpiweb_Estatico TC LEFT JOIN ESTADO_CUMPLE EC ON TC.ID_CUMPLE = EC.ID where id_cumple = 1 limit 1) > 0 THEN  '1.- CUMPLE' ELSE '1.- CUMPLE' END) AS DESCRIPTION_CUMPLE  "		+
				    " 			,SUM(CASE  WHEN CU.ID_CUMPLE = 1 THEN  1 ELSE 0 END) as CANTIDAD_CUMPLE " +
				    " 			, ROUND((cast((select count(*) from Cumplimiento_Kpiweb_Estatico CU WHERE 1 = 1  AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"' and CU.ID_CUMPLE = 1 "+prefixclause+") as float) / cast((select count(*) from Cumplimiento_Kpiweb_Estatico CU WHERE 1 = 1  AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"' "+prefixclause+" and (CU.ID_CUMPLE = 1 OR CU.ID_CUMPLE = 2 OR CU.ID_CUMPLE = 3) ) as float)  * 100),2) AS PORCENTAJE_CUMPLE " +

				    " 			,(CASE  WHEN (select COUNT(*)  from Cumplimiento_Kpiweb_Estatico TC LEFT JOIN ESTADO_CUMPLE EC ON TC.ID_CUMPLE = EC.ID where id_cumple = 2 limit 1) > 0 THEN  '2.- ATRASADO' ELSE '2.- ATRASADO' END) AS DESCRIPTION_ATRASADO " +
				    " 			, SUM(CASE  WHEN CU.ID_CUMPLE = 2 THEN  1 ELSE 0 END) as CANTIDAD_ATRASADO  " +
				    " 			, ROUND((cast((select count(*) from Cumplimiento_Kpiweb_Estatico CU WHERE 1 = 1  AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"' and CU.ID_CUMPLE = 2 "+prefixclause+") as float) / cast((select count(*) from Cumplimiento_Kpiweb_Estatico CU WHERE 1 = 1  AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"' "+prefixclause+" and (CU.ID_CUMPLE = 1 OR CU.ID_CUMPLE = 2 OR CU.ID_CUMPLE = 3) ) as float)  * 100),2) AS PORCENTAJE_ATRASADO  " +
				   
				    " 			,(CASE  WHEN (select COUNT(*)  from Cumplimiento_Kpiweb_Estatico TC LEFT JOIN ESTADO_CUMPLE EC ON TC.ID_CUMPLE = EC.ID where id_cumple = 3 limit 1) > 0 THEN  '3.- NO CUMPLE' ELSE '3.- NO CUMPLE' END) AS DESCRIPTION_NO_CUMPLE " +
				    " 			, SUM(CASE  WHEN CU.ID_CUMPLE = 3 THEN  1 ELSE 0 END) as CANTIDAD_NO_CUMPLE  " +
				    " 			, ROUND((cast((select count(*) from Cumplimiento_Kpiweb_Estatico CU WHERE 1 = 1  AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"' and CU.ID_CUMPLE = 3 "+prefixclause+") as float) / cast((select count(*) from Cumplimiento_Kpiweb_Estatico CU WHERE 1 = 1  AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"' "+prefixclause+" and (CU.ID_CUMPLE = 1 OR CU.ID_CUMPLE = 2 OR CU.ID_CUMPLE = 3) ) as float)  * 100),2) AS PORCENTAJE_NO_CUMPLE  " +
				    
				    " 			,SUM(CASE WHEN (CU.ID_CUMPLE = 1 OR CU.ID_CUMPLE = 2 OR CU.ID_CUMPLE = 3) THEN 1 ELSE 0 END) as CANTIDAD_TOTAL  " +
				    
				    " 			,(  ROUND( (select count(*) from Cumplimiento_Kpiweb_Estatico CU WHERE 1 = 1  AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"'  and (CU.ID_CUMPLE = 1 OR CU.ID_CUMPLE = 2 OR CU.ID_CUMPLE = 3) "+prefixclause+" ) / (select count(*) from Cumplimiento_Kpiweb_Estatico CU WHERE 1 = 1  AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"'  "+prefixclause+" and (CU.ID_CUMPLE = 1 OR CU.ID_CUMPLE = 2 OR CU.ID_CUMPLE = 3)) * 100 , 2) ) as PORCENTAJE_TOTAL   " +
				    " 			, FECHA_COMPROMISO_EOM " +

				    " from CUMPLIMIENTO_KPIWEB_ESTATICO CU  " +
				  	" WHERE 1 = 1   " +
				  	" " + prefixclause +
				  	" AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"' " +
				  	" GROUP BY CU.FECHA_COMPROMISO_EOM " +
				  	"  " );
			*/
			
			//Oracle
			elimnarCumplimiento(dbconnection2,"INSERT INTO SKU_SERVICIO_WS (INUMBR, PRSDEP, PRSSDP, PRSCLA, PRSVND, prstip) VALUES("+Integer.parseInt(ejecutarQuerySku("".equals(inumbr) || inumbr == 0 ? 0 : inumbr, dbconnection))+", "+Integer.parseInt(ejecutarQueryPrsDep("".equals(inumbr) || inumbr == 0 ? 0 : inumbr, dbconnection))+", "+Integer.parseInt(ejecutarQueryPrssDp("".equals(inumbr) || inumbr == 0 ? 0 : inumbr, dbconnection))+", "+Integer.parseInt(ejecutarQueryPrsCla("".equals(inumbr) || inumbr == 0 ? 0 : inumbr, dbconnection))+", "+Integer.parseInt(ejecutarQueryPrsVnd("".equals(inumbr) || inumbr == 0 ? 0 : inumbr, dbconnection))+", '"+ejecutarQueryPrsTip("".equals(inumbr) || inumbr == 0 ? 0 : inumbr, dbconnection)+"') ");
			commit(dbconnection2,"COMMIT");
			
			//Mysql
			/*
			elimnarCumplimiento(dbconnection2,	
					" INSERT INTO  cumplimiento_estatico_ws ( " +
												"	SELECT " +
					" (select id    from cumplimiento_kpiweb TC limit 0,1) as id" +		
				    " ,IFNULL((select EC.description  from cumplimiento_kpiweb TC LEFT JOIN estado_cumple EC ON TC.ID_CUMPLE = EC.ID where id_cumple = 1 limit 0,1),'-') as description_cumple " +
				    " ,IFNULL(SUM(CASE  WHEN CU.ID_CUMPLE = 1 THEN  1 ELSE 0 END),0) as cantidad_cumple " +
				    " ,IFNULL((  ROUND( (select count(*) from cumplimiento_kpiweb CU WHERE 1 = 1  AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"' and CU.ID_CUMPLE = 1 "+prefixclause+") / (select count(*) from cumplimiento_kpiweb CU WHERE 1 = 1  AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"' and (CU.ID_CUMPLE = 1 OR CU.ID_CUMPLE = 2 OR CU.ID_CUMPLE = 3) "+prefixclause+") * 100 , 3) ),0) as porcentaje_cumple " +
				
				
				    " ,IFNULL((select EC.description  from cumplimiento_kpiweb TC LEFT JOIN estado_cumple EC ON TC.ID_CUMPLE = EC.ID where id_cumple = 2 limit 0,1),'-') as description_atrasado " +
				    " ,IFNULL(SUM(CASE  WHEN CU.ID_CUMPLE = 2 THEN  1 ELSE 0 END),0) as cantidad_atrasado " +
				    " ,IFNULL((  ROUND( (select count(*) from cumplimiento_kpiweb CU WHERE 1 = 1  AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"' and CU.ID_CUMPLE = 2 "+prefixclause+") / (select count(*) from cumplimiento_kpiweb CU WHERE 1 = 1  AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"' and (CU.ID_CUMPLE = 1 OR CU.ID_CUMPLE = 2 OR CU.ID_CUMPLE = 3) "+prefixclause+") * 100 , 3) ),0) as porcentaje_atrasado " +
				    
				    " ,IFNULL((select EC.description  from cumplimiento_kpiweb TC LEFT JOIN estado_cumple EC ON TC.ID_CUMPLE = EC.ID where id_cumple = 3 limit 0,1),'-') as description_no_cumple " +
				    " ,IFNULL(SUM(CASE  WHEN CU.ID_CUMPLE = 3 THEN  1 ELSE 0 END),0) as cantidad_no_cumple " +
				    " ,IFNULL((  ROUND( (select count(*) from cumplimiento_kpiweb CU WHERE 1 = 1  AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"' and CU.ID_CUMPLE = 3 "+prefixclause+") / (select count(*) from cumplimiento_kpiweb CU WHERE 1 = 1  AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"' and (CU.ID_CUMPLE = 1 OR CU.ID_CUMPLE = 2 OR CU.ID_CUMPLE = 3) "+prefixclause+") * 100 , 3) ),0) as porcentaje_no_cumple " +
				    
				    " ,IFNULL(SUM(CASE WHEN (CU.ID_CUMPLE = 1 OR CU.ID_CUMPLE = 2 OR CU.ID_CUMPLE = 3) THEN 1 ELSE 0 END),0) as cantidad_total " +
				    " ,IFNULL((  ROUND( (select count(*) from cumplimiento_kpiweb CU WHERE 1 = 1  AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"' and (CU.ID_CUMPLE = 1 OR CU.ID_CUMPLE = 2 OR CU.ID_CUMPLE = 3) "+prefixclause+") / (select count(*) from cumplimiento_kpiweb CU WHERE 1 = 1  AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"' and (CU.ID_CUMPLE = 1 OR CU.ID_CUMPLE = 2 OR CU.ID_CUMPLE = 3) "+prefixclause+") * 100 , 2) ),0) as porcentaje_total " +

				    " ,CU.FECHA_COMPROMISO_EOM AS FECHA_COMPROMISO_EOM " +
				    
				  	" from cumplimiento_kpiweb CU  " +
				  	" WHERE 1 = 1   " +
				  	" AND  CU.FECHA_COMPROMISO_EOM  = '"+fechaCompromisoEom+"' " +
				  	" GROUP BY CU.FECHA_COMPROMISO_EOM " +
				  	" ) " );
			
			*/

			
			
			bodyResp = services.getSkuServicioWs(inumbr);
			if (bodyResp != null) {
				
				
				
				
				 return Response.ok(UtilMIS.jaxbObjectToXML(bodyResp), MediaType.APPLICATION_XML)
					      .header("Access-Control-Allow-Origin", "*")
					      .header("Access-Control-Allow-Methods", "POST, GET, PUT, UPDATE, OPTIONS")
					      .header("Access-Control-Allow-Headers", "Content-Type, Accept, X-Requested-With").build();
				 
				 
				
				//return Response.ok(UtilMIS.getJSONString(bodyResp), MediaType.APPLICATION_JSON).header(Constantes.CONTENT_TYPE, Constantes.APPLICATION_JSON_ENCODE).build();

				//return Response.ok(UtilMIS.getJSONString(bodyResp), MediaType.APPLICATION_JSON).build();
				
			}
		} catch (Exception ex) {
			log.error(Errores.MENSAJE_ERROR_SERVICES);
			log.error(Errores.EXCEPTION_MESSAGE + ex.getMessage());
			log.error(Errores.EXCEPTION_LOCALIZED + ex.getLocalizedMessage());
			ex.printStackTrace();
			bodyResp = respuestaGenerica();
		}

		log.info("Fin:" + "");
		return Response.ok(UtilMIS.jaxbObjectToXML(bodyResp),
				MediaType.APPLICATION_XML).build();
	}
	
	
	
	/**
	 * Metodo que crea la conexion a la base de datos kpiweb 
	 *
	 * @return 
	 */
	private static Connection crearConexion2() {
		Connection dbconnection = null;

		try {
			//Oracle
			
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			dbconnection = DriverManager.getConnection(
					"jdbc:oracle:thin:@172.18.163.15:1521/XE", "kpiweb",
					"kpiweb");
			
			/*
			dbconnection = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521/XE", "system",
					"admin");
			*/
			//PostgreSql
			//Class.forName("org.postgresql.Driver");
			//dbconnection = DriverManager.getConnection("jdbc:postgresql://examplecluster.c1sk9ck4vb7w.us-west-2.redshift.amazonaws.com:5439/dev","masteruser","Testing01");
			
			
			//Mysql
			/*
			Class.forName("com.mysql.jdbc.Driver");
			
			//dbconnection = DriverManager.getConnection( "jdbc:mysql://localhost:3306/trazabilidad", "root", "admin");
			dbconnection = DriverManager.getConnection("jdbc:mysql://txddb.cqjxibnc2qub.us-west-2.rds.amazonaws.com/trazabilidad", "adminuser",	"s4cc2ss943");
				*/	
					
		}

		catch (Exception e) {
			log.error("Error de conexion "+ e.getMessage());
		}

		return dbconnection;
	}
	
	/**
	 * Metodo que ejecuta la eliminacion de registros en una tabla 
	 * 
	 * @param Connection, conexion de las base de datos
	 * @param String, query para la eliminacion  
	 * @return 
	 */
	private static void elimnarCumplimiento(Connection dbconnection,  String sql) {
		log.info("Inicio elimnar Cumplimiento.");
		log.info("sql:" + sql);
		PreparedStatement pstmt = null;
		try {
			pstmt = dbconnection.prepareStatement(sql);
			log.info("registros elimnados Cumplimient : " + pstmt.executeUpdate());
			
		}
		catch (Exception e) {
			e.printStackTrace();
			log.error("[elimnarCumplimiento]Exception:" + e.getMessage());
		}
		finally {
			cerrarTodo(null, pstmt, null);
		}
		log.info("Fin elimnar Cumplimiento.");

	}
	
	/**
	 * Metodo que cierra todas la conexiones y archivos
	 *
	 * @return 
	 */
	private static void cerrarTodo(Connection cnn, PreparedStatement pstmt,
			BufferedWriter bw) {

		try {
			if (cnn != null) {
				cnn.close();
				cnn = null;
			}
		}

		catch (Exception e) {
			log.error("Error inesperado "+ e.getMessage());
		}

		try {

			if (pstmt != null) {

				pstmt.close();
				pstmt = null;
			}
		}

		catch (Exception e) {

			log.error("Error inesperado "+ e.getMessage());
		}
		try {

			if (bw != null) {

				bw.flush();
				bw.close();
				bw = null;
			}
		} catch (Exception e) {

			log.error("Error inesperado "+ e.getMessage());
		}
	}
	
	/**
	 * Metodo que hace commit en la base de datos
	 * 
	 * @param Connection, conexion a la base de datos
	 * @return si valor de retorno
	*/
	private static void commit(Connection dbconnection,  String sql) {
		log.info("Inicio commit.");
		PreparedStatement pstmt = null;
		try {
			pstmt = dbconnection.prepareStatement(sql);
			log.info("registros commit : " + pstmt.executeUpdate());
			
		}
		catch (Exception e) {
			e.printStackTrace();
			log.error("[actualizarModelo]Exception:" + e.getMessage());
		}
		finally {
			cerrarTodo(null, pstmt, null);
		}
		log.info("Fin Acommit.");

	}
	
	private static String ejecutarQuerySku(int inumbr, Connection dbconnection) {
		
		StringBuffer sb         = new StringBuffer();
		PreparedStatement pstmt = null;
		String result = "";
		try {

			sb = new StringBuffer();
			sb.append("SELECT a.inumbr , b.PRSDEP, b.PRSSDP, b.PRSCLA, b.PRSVND, b.prstip   FROM mmsp4lib.invmst as A join mmsp4lib.prsupp as B  on b.PRSDEP = A.idept  and b.PRSSDP = A.isdept    and b.PRSCLA = A.Iclas  and b.PRSVND = A.Asnum  and b.PRSTIP <> ' '  and b.PRSVND <> 0   ");
			sb.append(" where a.inumbr in (");
			sb.append(inumbr);
			sb.append(") ");// 90 enviados a tiendas
			pstmt = dbconnection.prepareStatement(sb.toString());
			ResultSet rs = pstmt.executeQuery();
			sb = new StringBuffer();

			boolean reg = false;
			do{
				reg = rs.next();
				if (reg){
					result = rs.getString("inumbr");
					break;
				}else{
					result = "";
				}
			}
			while (reg);
		}
		catch (Exception e) {

			e.printStackTrace();
		}
		finally {

			cerrarTodo(null,pstmt,null);
		}
		return result;
	}
	private static String ejecutarQueryPrsDep(int inumbr, Connection dbconnection) {
		
		StringBuffer sb         = new StringBuffer();
		PreparedStatement pstmt = null;
		String result = "";
		try {

			sb = new StringBuffer();
			sb.append("SELECT a.inumbr , b.PRSDEP, b.PRSSDP, b.PRSCLA, b.PRSVND, b.prstip   FROM mmsp4lib.invmst as A join mmsp4lib.prsupp as B  on b.PRSDEP = A.idept  and b.PRSSDP = A.isdept    and b.PRSCLA = A.Iclas  and b.PRSVND = A.Asnum  and b.PRSTIP <> ' '  and b.PRSVND <> 0   ");
			sb.append(" where a.inumbr in (");
			sb.append(inumbr);
			sb.append(") ");// 90 enviados a tiendas
			pstmt = dbconnection.prepareStatement(sb.toString());
			ResultSet rs = pstmt.executeQuery();
			sb = new StringBuffer();

			boolean reg = false;
			do{
				reg = rs.next();
				if (reg){
					result = rs.getString("PRSDEP");
					break;
				}else{
					result = "";
				}
			}
			while (reg);
		}
		catch (Exception e) {

			e.printStackTrace();
		}
		finally {

			cerrarTodo(null,pstmt,null);
		}
		return result;
	}
	
	
	private static String ejecutarQueryPrssDp(int inumbr, Connection dbconnection) {
		
		StringBuffer sb         = new StringBuffer();
		PreparedStatement pstmt = null;
		String result = "";
		try {

			sb = new StringBuffer();
			sb.append("SELECT a.inumbr , b.PRSDEP, b.PRSSDP, b.PRSCLA, b.PRSVND, b.prstip   FROM mmsp4lib.invmst as A join mmsp4lib.prsupp as B  on b.PRSDEP = A.idept  and b.PRSSDP = A.isdept    and b.PRSCLA = A.Iclas  and b.PRSVND = A.Asnum  and b.PRSTIP <> ' '  and b.PRSVND <> 0   ");
			sb.append(" where a.inumbr in (");
			sb.append(inumbr);
			sb.append(") ");// 90 enviados a tiendas
			
			pstmt = dbconnection.prepareStatement(sb.toString());
			ResultSet rs = pstmt.executeQuery();
			sb = new StringBuffer();

			boolean reg = false;
			do{
				reg = rs.next();
				if (reg){
					result = rs.getString("PRSSDP");
					break;
				}else{
					result = "";
				}
			}
			while (reg);
		}
		catch (Exception e) {

			e.printStackTrace();
			
		}
		finally {

			cerrarTodo(null,pstmt,null);
		}
		return result;
	}
	
	private static String ejecutarQueryPrsCla(int inumbr, Connection dbconnection) {
		
		StringBuffer sb         = new StringBuffer();
		PreparedStatement pstmt = null;
		String result = "";
		try {

			sb = new StringBuffer();
			sb.append("SELECT a.inumbr , b.PRSDEP, b.PRSSDP, b.PRSCLA, b.PRSVND, b.prstip   FROM mmsp4lib.invmst as A join mmsp4lib.prsupp as B  on b.PRSDEP = A.idept  and b.PRSSDP = A.isdept    and b.PRSCLA = A.Iclas  and b.PRSVND = A.Asnum  and b.PRSTIP <> ' '  and b.PRSVND <> 0   ");
			sb.append(" where a.inumbr in (");
			sb.append(inumbr);
			sb.append(") ");// 90 enviados a tiendas
			pstmt = dbconnection.prepareStatement(sb.toString());
			ResultSet rs = pstmt.executeQuery();
			sb = new StringBuffer();

			boolean reg = false;
			do{
				reg = rs.next();
				if (reg){
					result = rs.getString("PRSCLA");
					break;
				}else{
					result = "";
				}
			}
			while (reg);
		}
		catch (Exception e) {

			e.printStackTrace();
		}
		finally {

			cerrarTodo(null,pstmt,null);
		}
		return result;
	}
	
	
private static String ejecutarQueryPrsVnd(int inumbr, Connection dbconnection) {
		
		StringBuffer sb         = new StringBuffer();
		PreparedStatement pstmt = null;
		String result = "";
		try {

			sb = new StringBuffer();
			sb.append("SELECT a.inumbr , b.PRSDEP, b.PRSSDP, b.PRSCLA, b.PRSVND, b.prstip   FROM mmsp4lib.invmst as A join mmsp4lib.prsupp as B  on b.PRSDEP = A.idept  and b.PRSSDP = A.isdept    and b.PRSCLA = A.Iclas  and b.PRSVND = A.Asnum  and b.PRSTIP <> ' '  and b.PRSVND <> 0   ");
			sb.append(" where a.inumbr in (");
			sb.append(inumbr);
			sb.append(") ");// 90 enviados a tiendas
			pstmt = dbconnection.prepareStatement(sb.toString());
			ResultSet rs = pstmt.executeQuery();
			sb = new StringBuffer();

			boolean reg = false;
			do{
				reg = rs.next();
				if (reg){
					result = rs.getString("PRSVND");
					break;
				}else{
					result = "";
				}
			}
			while (reg);
		}
		catch (Exception e) {

			e.printStackTrace();
		}
		finally {

			cerrarTodo(null,pstmt,null);
		}
		return result;
	}


	private static String ejecutarQueryPrsTip(int inumbr, Connection dbconnection) {
	
	StringBuffer sb         = new StringBuffer();
	PreparedStatement pstmt = null;
	String result = "";
	try {

		sb = new StringBuffer();
		sb.append("SELECT a.inumbr , b.PRSDEP, b.PRSSDP, b.PRSCLA, b.PRSVND, b.prstip   FROM mmsp4lib.invmst as A join mmsp4lib.prsupp as B  on b.PRSDEP = A.idept  and b.PRSSDP = A.isdept    and b.PRSCLA = A.Iclas  and b.PRSVND = A.Asnum  and b.PRSTIP <> ' '  and b.PRSVND <> 0   ");
		sb.append(" where a.inumbr in (");
		sb.append(inumbr);
		sb.append(") ");// 90 enviados a tiendas
		pstmt = dbconnection.prepareStatement(sb.toString());
		ResultSet rs = pstmt.executeQuery();
		sb = new StringBuffer();

		boolean reg = false;
		do{
			reg = rs.next();
			if (reg){
				result = rs.getString("prstip");
				break;
			}else{
				result = "";
			}
		}
		while (reg);
	}
	catch (Exception e) {

		e.printStackTrace();
	}
	finally {

		cerrarTodo(null,pstmt,null);
	}
	return result;
}




	private static Connection crearConexionRoble() {

	System.out.println("Creado conexion a ROBLE.");
	AS400JDBCDriver d = new AS400JDBCDriver();
	String mySchema = "RDBPARIS2";
	Properties p = new Properties();
	AS400 o = new AS400("roble.cencosud.corp","USRCOM", "USRCOM");
	Connection dbconnection = null;

	try {

		System.out.println("AuthenticationScheme: "+o.getVersion());
		dbconnection = d.connect (o, p, mySchema);
		System.out.println("Conexion a ROBLE CREADA.");
	}
	catch (Exception e) {

		System.out.println(e.getMessage());
	}
	return dbconnection;
}

	

	

}
