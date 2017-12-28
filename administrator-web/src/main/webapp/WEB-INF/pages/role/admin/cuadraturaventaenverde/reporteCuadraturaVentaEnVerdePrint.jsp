<%@include file="../../../include/taglib_includes.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.ParseException"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="com.cencosud.administrator.dto.users.GraficosDTO"%>
<%@ page import="com.cencosud.administrator.web.utils.DateUtils"%>
<%@ page import="com.cencosud.administrator.web.utils.InicializarMIS"%>
<%

InicializarMIS inicializarMIS = new InicializarMIS();
try {
	inicializarMIS.init();
} catch (Exception e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}


Date dNow = new Date();
SimpleDateFormat ft = 
new SimpleDateFormat ("dd/MM/yyyy");
String currentDate = ft.format(dNow);
//out.println("date"+currentDate);
String exportToExcel = request.getParameter("exportToExcel");
if (exportToExcel != null && exportToExcel.toString().equalsIgnoreCase("YES")) {
	response.setContentType("application/vnd.ms-excel");
	response.setHeader("Content-Disposition", "inline; filename=" + "PrintVentaEnVerdeExcel.xls");
}
String dateInicio =  request.getParameter("dateInicio");


//out.println("estado="+request.getParameter("estado"));

//out.println("dateInicio="+dateInicio);
//String starttime = DateUtils.turnDate(dateInicio) != null?DateUtils.turnDate(dateInicio):DateUtils.turnDate(currentDate);

String starttime = DateUtils.turnDate3(dateInicio) != null?DateUtils.turnDate3(dateInicio):DateUtils.turnDate3(currentDate);
String starttime2 = DateUtils.turnDate4(dateInicio) != null?DateUtils.turnDate4(dateInicio):DateUtils.turnDate4(currentDate);

//out.println("starttime="+starttime);
//out.println("starttime2="+starttime2);

String prefixclause ="";

if (request.getParameter("solicitud_original") != null && !"".equals(request.getParameter("solicitud_original"))) {
  prefixclause +=" AND VTA_EOM.SOLICITUDORIGINAL LIKE '"+request.getParameter("solicitud_original")+"%'";
}

if (request.getParameter("orden_distribucion") != null && !"".equals(request.getParameter("orden_distribucion")) ) {
  prefixclause +=" AND VTA_EOM.N_ORDEN_DISTRIBU LIKE '"+request.getParameter("orden_distribucion")+"%'";
}
//out.println("prefixclause="+prefixclause);



%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <jsp:include page="../../../include/head.jsp" />
	
 	<link rel="stylesheet" href="<c:url value="/css/bootstrap-multiselect.css"/>" type="text/css">
    <script type="text/javascript" src="<c:url value="/js/bootstrap-multiselect.js"/>"></script>
    
    
   <script src="<c:url value="/js/admin/call/call.all.js"/>" type="text/javascript"></script>
   <script src="<c:url value="/js/admin/user/user.all.js"/>" type="text/javascript"></script>
   
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/datepicker/jquery.ui.all.css"/>">
    <script src="<c:url value="/js/jquery.ui.core.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/js/jquery.ui.datepicker.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/js/jquery.ui.datepicker-es.js"/>" type="text/javascript"></script>


    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="../../../assets/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../../../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../../../assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../../../assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../../../assets/ico/apple-touch-icon-57-precomposed.png">
  </head>

  <!--[if lt IE 7 ]> <body class="ie ie6"> <![endif]-->
  <!--[if IE 7 ]> <body class="ie ie7 "> <![endif]-->
  <!--[if IE 8 ]> <body class="ie ie8 "> <![endif]-->
  <!--[if IE 9 ]> <body class="ie ie9 "> <![endif]-->
  <!--[if (gt IE 9)|!(IE)]><!--> 
  <body class=""> 
  <!--<![endif]-->
    
     
    <div class="content">
        <div class="header">
            <h1 class="page-title">Reporte Cuadratura Venta en Verde</h1>
        </div>
        
        <%
        Connection connHora = null;
		PreparedStatement psHora = null;
		ResultSet rsHora = null;
		String SQLHora = null; 
		int totalCantidadHora = 0;
		try{
			Class.forName(InicializarMIS.getPropiedad("jdbc.driverClassName")).newInstance();
			connHora = DriverManager.getConnection(InicializarMIS.getPropiedad("jdbc.databaseurl"),InicializarMIS.getPropiedad("jdbc.username"),InicializarMIS.getPropiedad("jdbc.password"));//
			connHora.setAutoCommit(false);
			SQLHora = 	" select * from ( select this_.id as id30_0_, SUBSTR(this_.fecha,0,13)||':00:00' as ultimaActualizacion, SUBSTR(this_.fecha,0,10)||' '||(TO_NUMBER((SUBSTR(this_.fecha,11,3)),'999')+1)||':00:00:00' AS proximaActualizacion from horario_vtav_act this_ order by this_.fecha desc ) where rownum <= 1";
			
			
			psHora = connHora.prepareStatement(SQLHora, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			rsHora = psHora.executeQuery();
			connHora.commit();
			int contarHora = 0;
			while(rsHora.next()) {
				contarHora = contarHora + 1;
         %>
        
        <ul class="breadcrumb">
            <li><a href="home">Home</a> <span class="divider">/</span></li>
            <li class="active">Reporte Cuadratura Venta en Verde <span class="divider">/</span></li>
            <li class="active"><a href="#">Proceso Ultima Actualizacion:</a> <i class="icon-time"></i><%=rsHora.getString("ultimaActualizacion") %><span class="divider">/</span></li>
            <li class="active"><a href="#">Proceso Proxima Actualizacion:</a> <i class="icon-time"></i><%=rsHora.getString("proximaActualizacion") %></li>
        </ul>
        <%
			}
		} catch (SQLException exQL) {
			connHora.rollback();
			out.println("Error SQL: " + exQL.getMessage());	
		} catch (Exception ex) {
			connHora.rollback();
			out.println("Error: " + ex.getMessage());
		} finally {
			if (rsHora != null) rsHora.close();
			if (psHora != null) psHora.close();
			if (connHora != null) connHora.close();
		} 
        %>

        <div class="container-fluid">
	        <div class="row-fluid">
				<br>
				
				<jsp:include page="../../../include/messages.jsp" />
				

				<span class="label label-primary" style=" background-color:#5bc0de">Cantidad EOM</span>
				<span class="label label-success">Encontrado</span>
				<span class="label label-danger"  style=" background-color:#d9534f">No Encontrado</span>
				<span class="label label-warning">OC con Error</span>
				
				<c:forEach items="${horarios}" var="horario" varStatus="status">
					<c:choose>
						<c:when test="${horario.estado == 2}">
						
							<br></br>
					 <table class="table table-bordered table-striped">
				      <thead>
				        <tr>
				          <th>#</th>
				         	<th>Cantidad EOM</th>
						  	<th>Encontrado en JDA | OC con Error</th>
						  	<th>No Encontrado en JDA</th>
						  	<!--  
						  	<th>Diferencia</th>
						  	-->
				        </tr>
				      </thead>
				      <tbody>
					  <%
							Connection connFecha = null;
							PreparedStatement psFecha = null;
							ResultSet rsFecha = null;
							String SQLFecha = null; 
							int totalCantidadFecha = 0;
							try{
								Class.forName(InicializarMIS.getPropiedad("jdbc.driverClassName")).newInstance();
								connFecha = DriverManager.getConnection(InicializarMIS.getPropiedad("jdbc.databaseurl"),InicializarMIS.getPropiedad("jdbc.username"),InicializarMIS.getPropiedad("jdbc.password"));//
								connFecha.setAutoCommit(false);
								//[27-04-2017 12:41] No se especifica rut de cliente, Orden 452308                                    
								
								//ORIGINAL
								
								if ("1".equals(request.getParameter("estado"))) {
									
									SQLFecha = 	" SELECT " +
											" ( select count(*) from CUADRATURA_OC_VTAV_EOM VTA_EOM where 1 = 1 AND VTA_EOM.FECHA_CREACION_ORDEN >= '"+starttime2+" 00:00:00' "+prefixclause+" and VTA_EOM.FECHA_CREACION_ORDEN <= '"+starttime2+" 23:59:59' AND VTA_EOM.N_ORDEN_DISTRIBU IN (SELECT VTA_JDA.NUMDO FROM CUADRATURA_OC_VTAV_JDA VTA_JDA WHERE 1 = 1  AND VTA_JDA.NUMDO  = VTA_EOM.N_ORDEN_DISTRIBU AND ROWNUM < 2 )) as totalEom, " + 
											
											" '0' as totalnoencontrado, "  +
											" ( select count(*) from CUADRATURA_OC_VTAV_EOM VTA_EOM where 1 = 1 AND VTA_EOM.FECHA_CREACION_ORDEN >= '"+starttime2+" 00:00:00' "+prefixclause+" and VTA_EOM.FECHA_CREACION_ORDEN <= '"+starttime2+" 23:59:59' AND VTA_EOM.N_ORDEN_DISTRIBU IN (SELECT VTA_JDA.NUMDO FROM CUADRATURA_OC_VTAV_JDA VTA_JDA WHERE 1 = 1 AND VTA_JDA.NUMDO  = VTA_EOM.N_ORDEN_DISTRIBU AND ROWNUM < 2)) as totalencontrado,  " +
 
											" ( select count(*) from CUADRATURA_OC_VTAV_EOM VTA_EOM where 1 = 1 AND VTA_EOM.FECHA_CREACION_ORDEN >= '"+starttime2+" 00:00:00' "+prefixclause+" and VTA_EOM.FECHA_CREACION_ORDEN <= '"+starttime2+" 23:59:59' AND VTA_EOM.N_ORDEN_DISTRIBU IN (SELECT VTA_JDA.NUMDO FROM CUADRATURA_OC_VTAV_JDA VTA_JDA WHERE 1 = 1 AND VTA_JDA.NUMDO  = VTA_EOM.N_ORDEN_DISTRIBU and (VTA_JDA.Ex14error like '%El nombre de comprador debe tener un largo de a los mas 20 caracter%' OR VTA_JDA.Ex14error like '%El producto con codigo%' OR VTA_JDA.Ex14error like '%El proveedor indicado en el mensaje no corresponde al proveedor actual de la Orde%' OR VTA_JDA.Ex14error like '%En la distribucion del producto con codigo%' OR VTA_JDA.Ex14error like '%En la distribucion, el codigo del local 115 no esta especificado en el bloque de%' OR VTA_JDA.Ex14error like '%En la distribucion, el codigo del local 12 no esta especificado en el bloque de m%' OR VTA_JDA.Ex14error like '%Error al borrar despachos vigentes%' OR VTA_JDA.Ex14error like '%La fecha de entrega es anterior a la de emision%' OR VTA_JDA.Ex14error like '%La fecha de vigencia debe tener formato%' OR VTA_JDA.Ex14error like '%La orden con el numero%' OR VTA_JDA.Ex14error like '%La orden No%' OR VTA_JDA.Ex14error like '%a Predistribucion no coincide con el detalle de la orden, para el Codigo Product%' OR VTA_JDA.Ex14error like '%No se especifica el nombre de cliente%' OR VTA_JDA.Ex14error like '%No se especifica la fecha comprometida cliente%' OR VTA_JDA.Ex14error like '%No se especifica el nombre de cliente%' OR VTA_JDA.Ex14error like '%No se especifica rut de cliente%' OR VTA_JDA.Ex14error like '%No se especifica el nombre de cliente%' OR VTA_JDA.Ex14error like '%No se especifica secpred, Orden%' OR VTA_JDA.Ex14error like '%No se especifica tipo de orden%' OR VTA_JDA.Ex14error like '%No se puede obtener la fecha de origen de la orden%' OR VTA_JDA.Ex14error like '%No se puede reemplazar la OC ya que posee despachos%') AND ROWNUM < 2 AND VTA_JDA.POFECE = ( select max( VTA_JDA2.POFECE )  from CUADRATURA_OC_VTAV_JDA VTA_JDA2 WHERE 1  = 1 AND VTA_JDA2.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU))) as totalencontradorut,  " +
											
											
											" (select count(*)   from CUADRATURA_OC_VTAV_JDA VTA_JDA  where 1 = 1 and VTA_JDA.POFECE >= '"+starttime+"' AND VTA_JDA.POFECE <= '"+starttime+"') as totalJda " +
											" from dual";
									
								} else if ("2".equals(request.getParameter("estado"))) {
									SQLFecha = 	" SELECT " +
											" ( select count(*) from CUADRATURA_OC_VTAV_EOM VTA_EOM where 1 = 1 AND VTA_EOM.FECHA_CREACION_ORDEN >= '"+starttime2+" 00:00:00' and VTA_EOM.FECHA_CREACION_ORDEN <= '"+starttime2+" 23:59:59' "+prefixclause+" AND VTA_EOM.N_ORDEN_DISTRIBU NOT IN (SELECT VTA_JDA.NUMDO FROM CUADRATURA_OC_VTAV_JDA VTA_JDA WHERE 1 = 1 AND VTA_JDA.NUMDO  = VTA_EOM.N_ORDEN_DISTRIBU AND ROWNUM < 2 AND VTA_JDA.POFECE = ( select max( VTA_JDA2.POFECE )  from CUADRATURA_OC_VTAV_JDA VTA_JDA2 WHERE 1  = 1 AND VTA_JDA2.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU))) as totalEom, " + 
											
											" ( select count(*) from CUADRATURA_OC_VTAV_EOM VTA_EOM where 1 = 1 AND VTA_EOM.FECHA_CREACION_ORDEN >= '"+starttime2+" 00:00:00' and VTA_EOM.FECHA_CREACION_ORDEN <= '"+starttime2+" 23:59:59' "+prefixclause+" AND VTA_EOM.N_ORDEN_DISTRIBU NOT IN (SELECT VTA_JDA.NUMDO FROM CUADRATURA_OC_VTAV_JDA VTA_JDA WHERE 1 = 1 AND VTA_JDA.NUMDO  = VTA_EOM.N_ORDEN_DISTRIBU AND ROWNUM < 2 AND VTA_JDA.POFECE = ( select max( VTA_JDA2.POFECE )  from CUADRATURA_OC_VTAV_JDA VTA_JDA2 WHERE 1  = 1 AND VTA_JDA2.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU))) as totalnoencontrado, "  +
											" '0' as totalencontrado,  " +
 											" '0' as totalencontradorut, " + 	
											
											
											" (select count(*)   from CUADRATURA_OC_VTAV_JDA VTA_JDA  where 1 = 1 and VTA_JDA.POFECE >= '"+starttime+"' AND VTA_JDA.POFECE <= '"+starttime+"') as totalJda " +
											" from dual";

								
								} else if ("3".equals(request.getParameter("estado"))) {
									SQLFecha = 	" SELECT " +
											" ( select count(*) from CUADRATURA_OC_VTAV_EOM VTA_EOM where 1 = 1 AND VTA_EOM.FECHA_CREACION_ORDEN >= '"+starttime2+" 00:00:00' "+prefixclause+" and VTA_EOM.FECHA_CREACION_ORDEN <= '"+starttime2+" 23:59:59' AND VTA_EOM.N_ORDEN_DISTRIBU IN (SELECT VTA_JDA.NUMDO FROM CUADRATURA_OC_VTAV_JDA VTA_JDA WHERE 1 = 1 AND VTA_JDA.NUMDO  = VTA_EOM.N_ORDEN_DISTRIBU and (VTA_JDA.Ex14error like '%El nombre de comprador debe tener un largo de a los mas 20 caracter%' OR VTA_JDA.Ex14error like '%El producto con codigo%' OR VTA_JDA.Ex14error like '%El proveedor indicado en el mensaje no corresponde al proveedor actual de la Orde%' OR VTA_JDA.Ex14error like '%En la distribucion del producto con codigo%' OR VTA_JDA.Ex14error like '%En la distribucion, el codigo del local 115 no esta especificado en el bloque de%' OR VTA_JDA.Ex14error like '%En la distribucion, el codigo del local 12 no esta especificado en el bloque de m%' OR VTA_JDA.Ex14error like '%Error al borrar despachos vigentes%' OR VTA_JDA.Ex14error like '%La fecha de entrega es anterior a la de emision%' OR VTA_JDA.Ex14error like '%La fecha de vigencia debe tener formato%' OR VTA_JDA.Ex14error like '%La orden con el numero%' OR VTA_JDA.Ex14error like '%La orden No%' OR VTA_JDA.Ex14error like '%a Predistribucion no coincide con el detalle de la orden, para el Codigo Product%' OR VTA_JDA.Ex14error like '%No se especifica el nombre de cliente%' OR VTA_JDA.Ex14error like '%No se especifica la fecha comprometida cliente%' OR VTA_JDA.Ex14error like '%No se especifica el nombre de cliente%' OR VTA_JDA.Ex14error like '%No se especifica rut de cliente%' OR VTA_JDA.Ex14error like '%No se especifica el nombre de cliente%' OR VTA_JDA.Ex14error like '%No se especifica secpred, Orden%' OR VTA_JDA.Ex14error like '%No se especifica tipo de orden%' OR VTA_JDA.Ex14error like '%No se puede obtener la fecha de origen de la orden%' OR VTA_JDA.Ex14error like '%No se puede reemplazar la OC ya que posee despachos%') AND ROWNUM < 2)) as totalEom,  " +
											
											" '0' as totalnoencontrado, "  +
											" ( select count(*) from CUADRATURA_OC_VTAV_EOM VTA_EOM where 1 = 1 AND VTA_EOM.FECHA_CREACION_ORDEN >= '"+starttime2+" 00:00:00' "+prefixclause+" and VTA_EOM.FECHA_CREACION_ORDEN <= '"+starttime2+" 23:59:59' AND VTA_EOM.N_ORDEN_DISTRIBU IN (SELECT VTA_JDA.NUMDO FROM CUADRATURA_OC_VTAV_JDA VTA_JDA WHERE 1 = 1 AND VTA_JDA.NUMDO  = VTA_EOM.N_ORDEN_DISTRIBU and (VTA_JDA.Ex14error like '%El nombre de comprador debe tener un largo de a los mas 20 caracter%' OR VTA_JDA.Ex14error like '%El producto con codigo%' OR VTA_JDA.Ex14error like '%El proveedor indicado en el mensaje no corresponde al proveedor actual de la Orde%' OR VTA_JDA.Ex14error like '%En la distribucion del producto con codigo%' OR VTA_JDA.Ex14error like '%En la distribucion, el codigo del local 115 no esta especificado en el bloque de%' OR VTA_JDA.Ex14error like '%En la distribucion, el codigo del local 12 no esta especificado en el bloque de m%' OR VTA_JDA.Ex14error like '%Error al borrar despachos vigentes%' OR VTA_JDA.Ex14error like '%La fecha de entrega es anterior a la de emision%' OR VTA_JDA.Ex14error like '%La fecha de vigencia debe tener formato%' OR VTA_JDA.Ex14error like '%La orden con el numero%' OR VTA_JDA.Ex14error like '%La orden No%' OR VTA_JDA.Ex14error like '%a Predistribucion no coincide con el detalle de la orden, para el Codigo Product%' OR VTA_JDA.Ex14error like '%No se especifica el nombre de cliente%' OR VTA_JDA.Ex14error like '%No se especifica la fecha comprometida cliente%' OR VTA_JDA.Ex14error like '%No se especifica el nombre de cliente%' OR VTA_JDA.Ex14error like '%No se especifica rut de cliente%' OR VTA_JDA.Ex14error like '%No se especifica el nombre de cliente%' OR VTA_JDA.Ex14error like '%No se especifica secpred, Orden%' OR VTA_JDA.Ex14error like '%No se especifica tipo de orden%' OR VTA_JDA.Ex14error like '%No se puede obtener la fecha de origen de la orden%' OR VTA_JDA.Ex14error like '%No se puede reemplazar la OC ya que posee despachos%') AND ROWNUM < 2)) as totalencontrado,  " +
 
											" ( select count(*) from CUADRATURA_OC_VTAV_EOM VTA_EOM where 1 = 1 AND VTA_EOM.FECHA_CREACION_ORDEN >= '"+starttime2+" 00:00:00' "+prefixclause+" and VTA_EOM.FECHA_CREACION_ORDEN <= '"+starttime2+" 23:59:59' AND VTA_EOM.N_ORDEN_DISTRIBU IN (SELECT VTA_JDA.NUMDO FROM CUADRATURA_OC_VTAV_JDA VTA_JDA WHERE 1 = 1 AND VTA_JDA.NUMDO  = VTA_EOM.N_ORDEN_DISTRIBU and (VTA_JDA.Ex14error like '%El nombre de comprador debe tener un largo de a los mas 20 caracter%' OR VTA_JDA.Ex14error like '%El producto con codigo%' OR VTA_JDA.Ex14error like '%El proveedor indicado en el mensaje no corresponde al proveedor actual de la Orde%' OR VTA_JDA.Ex14error like '%En la distribucion del producto con codigo%' OR VTA_JDA.Ex14error like '%En la distribucion, el codigo del local 115 no esta especificado en el bloque de%' OR VTA_JDA.Ex14error like '%En la distribucion, el codigo del local 12 no esta especificado en el bloque de m%' OR VTA_JDA.Ex14error like '%Error al borrar despachos vigentes%' OR VTA_JDA.Ex14error like '%La fecha de entrega es anterior a la de emision%' OR VTA_JDA.Ex14error like '%La fecha de vigencia debe tener formato%' OR VTA_JDA.Ex14error like '%La orden con el numero%' OR VTA_JDA.Ex14error like '%La orden No%' OR VTA_JDA.Ex14error like '%a Predistribucion no coincide con el detalle de la orden, para el Codigo Product%' OR VTA_JDA.Ex14error like '%No se especifica el nombre de cliente%' OR VTA_JDA.Ex14error like '%No se especifica la fecha comprometida cliente%' OR VTA_JDA.Ex14error like '%No se especifica el nombre de cliente%' OR VTA_JDA.Ex14error like '%No se especifica rut de cliente%' OR VTA_JDA.Ex14error like '%No se especifica el nombre de cliente%' OR VTA_JDA.Ex14error like '%No se especifica secpred, Orden%' OR VTA_JDA.Ex14error like '%No se especifica tipo de orden%' OR VTA_JDA.Ex14error like '%No se puede obtener la fecha de origen de la orden%' OR VTA_JDA.Ex14error like '%No se puede reemplazar la OC ya que posee despachos%') AND ROWNUM < 2 AND VTA_JDA.POFECE = ( select max( VTA_JDA2.POFECE )  from CUADRATURA_OC_VTAV_JDA VTA_JDA2 WHERE 1  = 1 AND VTA_JDA2.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU))) as totalencontradorut,  " +
											
											
											" (select count(*)   from CUADRATURA_OC_VTAV_JDA VTA_JDA  where 1 = 1 and VTA_JDA.POFECE >= '"+starttime+"' AND VTA_JDA.POFECE <= '"+starttime+"') as totalJda " +
											" from dual";
									
								} else {
									
									SQLFecha = 	" SELECT " +
											" ( select count(*)   from CUADRATURA_OC_VTAV_EOM VTA_EOM  where 1 = 1 AND VTA_EOM.FECHA_CREACION_ORDEN >= '"+starttime2+" 00:00:00' and VTA_EOM.FECHA_CREACION_ORDEN <= '"+starttime2+" 23:59:59' "+prefixclause+") as totalEom, " + 
											
											" ( select count(*) from CUADRATURA_OC_VTAV_EOM VTA_EOM where 1 = 1 AND VTA_EOM.FECHA_CREACION_ORDEN >= '"+starttime2+" 00:00:00' and VTA_EOM.FECHA_CREACION_ORDEN <= '"+starttime2+" 23:59:59' "+prefixclause+" AND VTA_EOM.N_ORDEN_DISTRIBU NOT IN (SELECT VTA_JDA.NUMDO FROM CUADRATURA_OC_VTAV_JDA VTA_JDA WHERE 1 = 1  AND VTA_JDA.NUMDO  = VTA_EOM.N_ORDEN_DISTRIBU AND ROWNUM < 2)) as totalnoencontrado, "  +
											" ( select count(*) from CUADRATURA_OC_VTAV_EOM VTA_EOM where 1 = 1 AND VTA_EOM.FECHA_CREACION_ORDEN >= '"+starttime2+" 00:00:00' and VTA_EOM.FECHA_CREACION_ORDEN <= '"+starttime2+" 23:59:59' "+prefixclause+" AND VTA_EOM.N_ORDEN_DISTRIBU IN (SELECT VTA_JDA.NUMDO FROM CUADRATURA_OC_VTAV_JDA VTA_JDA WHERE 1 = 1  AND VTA_JDA.NUMDO  = VTA_EOM.N_ORDEN_DISTRIBU AND ROWNUM < 2)) as totalencontrado,  " +
 
											" ( select count(*) from CUADRATURA_OC_VTAV_EOM VTA_EOM where 1 = 1 AND VTA_EOM.FECHA_CREACION_ORDEN >= '"+starttime2+" 00:00:00' and VTA_EOM.FECHA_CREACION_ORDEN <= '"+starttime2+" 23:59:59' "+prefixclause+" AND VTA_EOM.N_ORDEN_DISTRIBU IN (SELECT VTA_JDA.NUMDO FROM CUADRATURA_OC_VTAV_JDA VTA_JDA WHERE 1 = 1  AND VTA_JDA.NUMDO  = VTA_EOM.N_ORDEN_DISTRIBU and (VTA_JDA.Ex14error like '%El nombre de comprador debe tener un largo de a los mas 20 caracter%' OR VTA_JDA.Ex14error like '%El producto con codigo%' OR VTA_JDA.Ex14error like '%El proveedor indicado en el mensaje no corresponde al proveedor actual de la Orde%' OR VTA_JDA.Ex14error like '%En la distribucion del producto con codigo%' OR VTA_JDA.Ex14error like '%En la distribucion, el codigo del local 115 no esta especificado en el bloque de%' OR VTA_JDA.Ex14error like '%En la distribucion, el codigo del local 12 no esta especificado en el bloque de m%' OR VTA_JDA.Ex14error like '%Error al borrar despachos vigentes%' OR VTA_JDA.Ex14error like '%La fecha de entrega es anterior a la de emision%' OR VTA_JDA.Ex14error like '%La fecha de vigencia debe tener formato%' OR VTA_JDA.Ex14error like '%La orden con el numero%' OR VTA_JDA.Ex14error like '%La orden No%' OR VTA_JDA.Ex14error like '%a Predistribucion no coincide con el detalle de la orden, para el Codigo Product%' OR VTA_JDA.Ex14error like '%No se especifica el nombre de cliente%' OR VTA_JDA.Ex14error like '%No se especifica la fecha comprometida cliente%' OR VTA_JDA.Ex14error like '%No se especifica el nombre de cliente%' OR VTA_JDA.Ex14error like '%No se especifica rut de cliente%' OR VTA_JDA.Ex14error like '%No se especifica el nombre de cliente%' OR VTA_JDA.Ex14error like '%No se especifica secpred, Orden%' OR VTA_JDA.Ex14error like '%No se especifica tipo de orden%' OR VTA_JDA.Ex14error like '%No se puede obtener la fecha de origen de la orden%' OR VTA_JDA.Ex14error like '%No se puede reemplazar la OC ya que posee despachos%') AND ROWNUM < 2 AND VTA_JDA.POFECE = ( select max( VTA_JDA2.POFECE )  from CUADRATURA_OC_VTAV_JDA VTA_JDA2 WHERE 1  = 1 AND VTA_JDA2.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU))) as totalencontradorut,  " +
											
											
											" (select count(*)   from CUADRATURA_OC_VTAV_JDA VTA_JDA  where 1 = 1 and VTA_JDA.POFECE >= '"+starttime+"' AND VTA_JDA.POFECE <= '"+starttime+"') as totalJda " +
											" from dual";
								}
								
											
								//out.println("SQLFecha="+SQLFecha);
								//out.print("<br>");
								psFecha = connFecha.prepareStatement(SQLFecha, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
								rsFecha = psFecha.executeQuery();
								connFecha.commit();
								int contarFecha = 0;
								int totalProcentajeFecha = 0;
								while(rsFecha.next()) {
									contarFecha = contarFecha + 1;
									
							%>
					  <tr>
						<td>#</td>
						<td><span class="label label-primary" style=" background-color:#5bc0de">
						<%
						DecimalFormat formatea = new DecimalFormat("###,###.##");
						out.println(formatea.format(rsFecha.getInt("totalEom")));
						%>
						
						</span></td>
						  
						
						
						<td><span class="label label-success">
						<%
						out.println(formatea.format(rsFecha.getInt("totalencontrado")));
						%>
						</span>
						&nbsp;
						|
						&nbsp;
						<span class="label label-warning">
						<%
						out.println(formatea.format(rsFecha.getInt("totalencontradorut")));
						%>
						</span> 
						</td>
						<td><span class="label label-danger"  style=" background-color:#d9534f">
						<%
						out.println(formatea.format(rsFecha.getInt("totalnoencontrado")));
						%>
						</span></td>
						<!--  
						<td><span class="label label-warning">
						
						<%
						out.println(formatea.format(rsFecha.getInt("totalEom")-rsFecha.getInt("totalJda")));
						%>
						</span></td>
						-->
					  </tr>
					  <%
								}  // end while Fecha
							} catch (SQLException exQL) {
								connFecha.rollback();
								out.println("Error SQL: " + exQL.getMessage());	
							} catch (Exception ex) {
								connFecha.rollback();
								out.println("Error: " + ex.getMessage());
							} finally {
								if (rsFecha != null) rsFecha.close();
								if (psFecha != null) psFecha.close();
								if (connFecha != null) connFecha.close();
							} 
							%>
				      </tbody>
				    </table>	
					
					<br>	
					<div class="well" style="overflow:scroll; height:400px">				
				     <table class="table table-bordered table-striped">
				      <thead>
				        <tr>
				          <th>#</th>
				          <th>Solic. EOM</th>
				          <th>DO EOM</th>
				          <th>F.C DO</th>
				          <th>OC JDA</th>
				          <th class="der">Log B2B</th>
						  <th>Despa</th>
						  <!--  
				          <th style="width: 150px;">Acciones</th>
				          -->
				        </tr>
				      </thead>
				      <tbody>
					  <%
						Connection conn = null;
						
						PreparedStatement psCumple = null;
						ResultSet rsCumple = null;
						String SQLCumple = null;
						
						
						int contarCumple = 0;
								
						try{
							Class.forName(InicializarMIS.getPropiedad("jdbc.driverClassName")).newInstance();
							conn = DriverManager.getConnection(InicializarMIS.getPropiedad("jdbc.databaseurl"),InicializarMIS.getPropiedad("jdbc.username"),InicializarMIS.getPropiedad("jdbc.password"));//
							conn.setAutoCommit(false);
							//ORIGINAL
							
							if ("1".equals(request.getParameter("estado"))) {
								SQLCumple = " SELECT " + 
										"  (select VTA_EOM_2.SOLICITUDORIGINAL from CUADRATURA_OC_VTAV_EOM VTA_EOM_2 where VTA_EOM_2.N_ORDEN_DISTRIBU = VTA_EOM.N_ORDEN_DISTRIBU AND ROWNUM < 2) AS SOLICITUDORIGINAL, " +
										"  VTA_EOM.N_ORDEN_DISTRIBU, " +
										"  (select to_char(REPLACE(VTA_EOM_2.FECHA_CREACION_ORDEN,',000000000',''))  from CUADRATURA_OC_VTAV_EOM VTA_EOM_2 where VTA_EOM_2.N_Orden_Distribu = VTA_EOM.N_ORDEN_DISTRIBU AND ROWNUM < 2 ) AS FECHA_CREACION_ORDEN, " +
										
										" CASE WHEN (select  EX14ERROR from CUADRATURA_OC_VTAV_JDA VTA_JDA where 1 = 1  and VTA_JDA.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU and   VTA_JDA.Ex14error like '%La OC se cargo correctamente%' AND ROWNUM < 2 AND VTA_JDA.POFECE = ( select max( VTA_JDA2.POFECE )  from CUADRATURA_OC_VTAV_JDA VTA_JDA2 WHERE 1  = 1 AND VTA_JDA2.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU)) IS NOT NULL THEN 'Log Envio Encontrado' ELSE 'Log Envio No Encontrado' END as LOGENCONTRADOENJDA," +
										
										" NVL( (SELECT VTA_JDA.DESPA FROM CUADRATURA_OC_VTAV_JDA VTA_JDA WHERE 1 = 1 AND VTA_JDA.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU AND ROWNUM < 2 AND VTA_JDA.POFECE = ( select max( VTA_JDA2.POFECE )  from CUADRATURA_OC_VTAV_JDA VTA_JDA2 WHERE 1  = 1 AND VTA_JDA2.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU)),'-') AS DESPA, " + 		
										" NVL( (SELECT VTA_JDA.PONUMB FROM CUADRATURA_OC_VTAV_JDA VTA_JDA WHERE 1 = 1 AND VTA_JDA.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU AND ROWNUM < 2 AND VTA_JDA.POFECE = ( select max( VTA_JDA2.POFECE )  from CUADRATURA_OC_VTAV_JDA VTA_JDA2 WHERE 1  = 1 AND VTA_JDA2.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU)),'OC JDA No Encontrado') AS PONUMB, " + 		
										" NVL( (SELECT VTA_JDA.EX14ERROR FROM CUADRATURA_OC_VTAV_JDA VTA_JDA WHERE 1 = 1 AND VTA_JDA.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU AND ROWNUM < 2 AND VTA_JDA.POFECE = ( select max( VTA_JDA2.POFECE )  from CUADRATURA_OC_VTAV_JDA VTA_JDA2 WHERE 1  = 1 AND VTA_JDA2.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU)),'Log B2B No Encontrado') AS EX14ERROR " + 
										
										
										" from CUADRATURA_OC_VTAV_EOM VTA_EOM " + 
										" where 1 = 1 " + 
										" AND  VTA_EOM.N_ORDEN_DISTRIBU  IN (SELECT VTA_JDA.NUMDO FROM CUADRATURA_OC_VTAV_JDA VTA_JDA WHERE 1 = 1 AND VTA_JDA.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU) " +
										" AND VTA_EOM.FECHA_CREACION_ORDEN >= '"+starttime2+" 00:00:00' and VTA_EOM.FECHA_CREACION_ORDEN <= '"+starttime2+" 23:59:59' " +
										"" + prefixclause + "" +
										" GROUP BY VTA_EOM.N_ORDEN_DISTRIBU " +
										" ORDER BY VTA_EOM.N_ORDEN_DISTRIBU ASC ";
								
							} else if ("2".equals(request.getParameter("estado"))) {
								SQLCumple = " SELECT " + 
										"  (select VTA_EOM_2.SOLICITUDORIGINAL from CUADRATURA_OC_VTAV_EOM VTA_EOM_2 where VTA_EOM_2.N_ORDEN_DISTRIBU = VTA_EOM.N_ORDEN_DISTRIBU AND ROWNUM < 2 ) AS SOLICITUDORIGINAL, " +
										"  VTA_EOM.N_ORDEN_DISTRIBU, " +
										"  (select to_char(REPLACE(VTA_EOM_2.FECHA_CREACION_ORDEN,',000000000',''))  from CUADRATURA_OC_VTAV_EOM VTA_EOM_2 where VTA_EOM_2.N_Orden_Distribu = VTA_EOM.N_ORDEN_DISTRIBU AND ROWNUM < 2)  AS FECHA_CREACION_ORDEN, " +

										" CASE WHEN (select  EX14ERROR from CUADRATURA_OC_VTAV_JDA VTA_JDA where 1 = 1  and VTA_JDA.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU and   VTA_JDA.Ex14error  like '%La OC se cargo correctamente%' AND ROWNUM < 2 AND VTA_JDA.POFECE = ( select max( VTA_JDA2.POFECE )  from CUADRATURA_OC_VTAV_JDA VTA_JDA2 WHERE 1  = 1 AND VTA_JDA2.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU)) IS NOT NULL THEN 'Log Envio Encontrado' ELSE 'Log Envio No Encontrado' END as LOGENCONTRADOENJDA," +

										" NVL( (SELECT VTA_JDA.DESPA FROM CUADRATURA_OC_VTAV_JDA VTA_JDA WHERE 1 = 1 AND VTA_JDA.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU AND ROWNUM < 2 AND VTA_JDA.POFECE = ( select max( VTA_JDA2.POFECE )  from CUADRATURA_OC_VTAV_JDA VTA_JDA2 WHERE 1  = 1 AND VTA_JDA2.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU)),'-') AS DESPA, " + 		
										" NVL( (SELECT VTA_JDA.PONUMB FROM CUADRATURA_OC_VTAV_JDA VTA_JDA WHERE 1 = 1 AND VTA_JDA.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU AND ROWNUM < 2 AND VTA_JDA.POFECE = ( select max( VTA_JDA2.POFECE )  from CUADRATURA_OC_VTAV_JDA VTA_JDA2 WHERE 1  = 1 AND VTA_JDA2.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU)),'OC JDA No Encontrado') AS PONUMB, " + 		
										" NVL( (SELECT VTA_JDA.EX14ERROR FROM CUADRATURA_OC_VTAV_JDA VTA_JDA WHERE 1 = 1 AND VTA_JDA.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU AND ROWNUM < 2 AND VTA_JDA.POFECE = ( select max( VTA_JDA2.POFECE )  from CUADRATURA_OC_VTAV_JDA VTA_JDA2 WHERE 1  = 1 AND VTA_JDA2.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU)),'Log B2B No Encontrado') AS EX14ERROR " + 
												
												
										
										
										" from CUADRATURA_OC_VTAV_EOM VTA_EOM " + 
										" where 1 = 1 " + 
										" AND  VTA_EOM.N_ORDEN_DISTRIBU  NOT IN (SELECT VTA_JDA.NUMDO FROM CUADRATURA_OC_VTAV_JDA VTA_JDA WHERE 1 = 1 AND VTA_JDA.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU) " +
										" AND VTA_EOM.FECHA_CREACION_ORDEN >= '"+starttime2+" 00:00:00' and VTA_EOM.FECHA_CREACION_ORDEN <= '"+starttime2+" 23:59:59' " +
										"" + prefixclause + "" +
										" GROUP BY VTA_EOM.N_ORDEN_DISTRIBU " +
										" ORDER BY VTA_EOM.N_ORDEN_DISTRIBU ASC ";
							} else if ("3".equals(request.getParameter("estado"))) { 
								SQLCumple = " SELECT " + 
										"  (select VTA_EOM_2.SOLICITUDORIGINAL from CUADRATURA_OC_VTAV_EOM VTA_EOM_2 where VTA_EOM_2.N_ORDEN_DISTRIBU = VTA_EOM.N_ORDEN_DISTRIBU AND ROWNUM < 2 ) AS SOLICITUDORIGINAL, " +
										"  VTA_EOM.N_ORDEN_DISTRIBU, " +
										"  (select to_char(REPLACE(VTA_EOM_2.FECHA_CREACION_ORDEN,',000000000',''))  from CUADRATURA_OC_VTAV_EOM VTA_EOM_2 where VTA_EOM_2.N_Orden_Distribu = VTA_EOM.N_ORDEN_DISTRIBU AND ROWNUM < 2 ) AS FECHA_CREACION_ORDEN, " +
										
										" CASE WHEN (select  EX14ERROR from CUADRATURA_OC_VTAV_JDA VTA_JDA where 1 = 1 and VTA_JDA.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU and   VTA_JDA.Ex14error like '%La OC se cargo correctamente%' AND ROWNUM < 2 AND VTA_JDA.POFECE = ( select max( VTA_JDA2.POFECE )  from CUADRATURA_OC_VTAV_JDA VTA_JDA2 WHERE 1  = 1 AND VTA_JDA2.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU)) IS NOT NULL THEN 'Log Envio Encontrado' ELSE 'Log Envio No Encontrado' END as LOGENCONTRADOENJDA," +
										
										" NVL( (SELECT VTA_JDA.DESPA FROM CUADRATURA_OC_VTAV_JDA VTA_JDA WHERE 1 = 1 AND VTA_JDA.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU AND ROWNUM < 2 AND VTA_JDA.POFECE = ( select max( VTA_JDA2.POFECE )  from CUADRATURA_OC_VTAV_JDA VTA_JDA2 WHERE 1  = 1 AND VTA_JDA2.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU)),'-') AS DESPA, " + 		
										" NVL( (SELECT VTA_JDA.PONUMB FROM CUADRATURA_OC_VTAV_JDA VTA_JDA WHERE 1 = 1 AND VTA_JDA.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU AND ROWNUM < 2 AND VTA_JDA.POFECE = ( select max( VTA_JDA2.POFECE )  from CUADRATURA_OC_VTAV_JDA VTA_JDA2 WHERE 1  = 1 AND VTA_JDA2.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU)),'OC JDA No Encontrado') AS PONUMB, " + 		
										" NVL( (SELECT VTA_JDA.EX14ERROR FROM CUADRATURA_OC_VTAV_JDA VTA_JDA WHERE 1 = 1 AND VTA_JDA.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU AND ROWNUM < 2 AND VTA_JDA.POFECE = ( select max( VTA_JDA2.POFECE )  from CUADRATURA_OC_VTAV_JDA VTA_JDA2 WHERE 1  = 1 AND VTA_JDA2.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU)),'Log B2B No Encontrado') AS EX14ERROR " + 
										
										
										" from CUADRATURA_OC_VTAV_EOM VTA_EOM " + 
										" where 1 = 1 " + 
										" AND  VTA_EOM.N_ORDEN_DISTRIBU  IN (SELECT VTA_JDA.NUMDO FROM CUADRATURA_OC_VTAV_JDA VTA_JDA WHERE 1 = 1 AND VTA_JDA.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU AND (VTA_JDA.Ex14error like '%El nombre de comprador debe tener un largo de a los mas 20 caracter%' OR VTA_JDA.Ex14error like '%El producto con codigo%' OR VTA_JDA.Ex14error like '%El proveedor indicado en el mensaje no corresponde al proveedor actual de la Orde%' OR VTA_JDA.Ex14error like '%En la distribucion del producto con codigo%' OR VTA_JDA.Ex14error like '%En la distribucion, el codigo del local 115 no esta especificado en el bloque de%' OR VTA_JDA.Ex14error like '%En la distribucion, el codigo del local 12 no esta especificado en el bloque de m%' OR VTA_JDA.Ex14error like '%Error al borrar despachos vigentes%' OR VTA_JDA.Ex14error like '%La fecha de entrega es anterior a la de emision%' OR VTA_JDA.Ex14error like '%La fecha de vigencia debe tener formato%' OR VTA_JDA.Ex14error like '%La orden con el numero%' OR VTA_JDA.Ex14error like '%La orden No%' OR VTA_JDA.Ex14error like '%a Predistribucion no coincide con el detalle de la orden, para el Codigo Product%' OR VTA_JDA.Ex14error like '%No se especifica el nombre de cliente%' OR VTA_JDA.Ex14error like '%No se especifica la fecha comprometida cliente%' OR VTA_JDA.Ex14error like '%No se especifica el nombre de cliente%' OR VTA_JDA.Ex14error like '%No se especifica rut de cliente%' OR VTA_JDA.Ex14error like '%No se especifica el nombre de cliente%' OR VTA_JDA.Ex14error like '%No se especifica secpred, Orden%' OR VTA_JDA.Ex14error like '%No se especifica tipo de orden%' OR VTA_JDA.Ex14error like '%No se puede obtener la fecha de origen de la orden%' OR VTA_JDA.Ex14error like '%No se puede reemplazar la OC ya que posee despachos%')) " +
										" AND VTA_EOM.FECHA_CREACION_ORDEN >= '"+starttime2+" 00:00:00' and VTA_EOM.FECHA_CREACION_ORDEN <= '"+starttime2+" 23:59:59' " +
										"" + prefixclause + "" +
										" GROUP BY VTA_EOM.N_ORDEN_DISTRIBU " +
										" ORDER BY VTA_EOM.N_ORDEN_DISTRIBU ASC ";
							
							} else {
								
								SQLCumple = " SELECT " + 
										"  (select VTA_EOM_2.SOLICITUDORIGINAL from CUADRATURA_OC_VTAV_EOM VTA_EOM_2 where VTA_EOM_2.N_ORDEN_DISTRIBU = VTA_EOM.N_ORDEN_DISTRIBU AND ROWNUM < 2) AS SOLICITUDORIGINAL, " +
										"  VTA_EOM.N_ORDEN_DISTRIBU, " +
										"  (select to_char(REPLACE(VTA_EOM_2.FECHA_CREACION_ORDEN,',000000000',''))  from CUADRATURA_OC_VTAV_EOM VTA_EOM_2 where VTA_EOM_2.N_Orden_Distribu = VTA_EOM.N_ORDEN_DISTRIBU ) AS FECHA_CREACION_ORDEN, " +

										" CASE WHEN (select  EX14ERROR from CUADRATURA_OC_VTAV_JDA VTA_JDA where 1 = 1 and VTA_JDA.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU and   VTA_JDA.Ex14error like '%La OC se cargo correctamente%' AND ROWNUM < 2 AND VTA_JDA.POFECE = ( select max( VTA_JDA2.POFECE )  from CUADRATURA_OC_VTAV_JDA VTA_JDA2 WHERE 1  = 1 AND VTA_JDA2.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU)) IS NOT NULL THEN 'Log Envio Encontrado' ELSE 'Log Envio No Encontrado' END as LOGENCONTRADOENJDA," +

										" NVL( (SELECT VTA_JDA.DESPA FROM CUADRATURA_OC_VTAV_JDA VTA_JDA WHERE 1 = 1 AND VTA_JDA.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU AND ROWNUM < 2 AND VTA_JDA.POFECE = ( select max( VTA_JDA2.POFECE )  from CUADRATURA_OC_VTAV_JDA VTA_JDA2 WHERE 1  = 1 AND VTA_JDA2.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU)),'-') AS DESPA, " + 		
										" NVL( (SELECT VTA_JDA.PONUMB FROM CUADRATURA_OC_VTAV_JDA VTA_JDA WHERE 1 = 1 AND VTA_JDA.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU AND ROWNUM < 2 AND VTA_JDA.POFECE = ( select max( VTA_JDA2.POFECE )  from CUADRATURA_OC_VTAV_JDA VTA_JDA2 WHERE 1  = 1 AND VTA_JDA2.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU)),'OC JDA No Encontrado') AS PONUMB, " + 		
										" NVL( (SELECT VTA_JDA.EX14ERROR FROM CUADRATURA_OC_VTAV_JDA VTA_JDA WHERE 1 = 1 AND VTA_JDA.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU AND ROWNUM < 2 AND VTA_JDA.POFECE = ( select max( VTA_JDA2.POFECE )  from CUADRATURA_OC_VTAV_JDA VTA_JDA2 WHERE 1  = 1 AND VTA_JDA2.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU)),'Log B2B No Encontrado') AS EX14ERROR " + 
										
										
										" from CUADRATURA_OC_VTAV_EOM VTA_EOM " + 
										" where 1 = 1 " + 
										" AND VTA_EOM.FECHA_CREACION_ORDEN >= '"+starttime2+" 00:00:00' and VTA_EOM.FECHA_CREACION_ORDEN <= '"+starttime2+" 23:59:59' " +
										"" + prefixclause + "" +
										" GROUP BY VTA_EOM.N_ORDEN_DISTRIBU " +
										" ORDER BY VTA_EOM.N_ORDEN_DISTRIBU ASC ";
							}
							
							//out.println("SQLCumple="+SQLCumple);
							//out.print("<br>");
							
							
							
							
							psCumple = conn.prepareStatement(SQLCumple, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
							rsCumple = psCumple.executeQuery();
							conn.commit();
							int h = 0;
							while(rsCumple.next()) {
								// start while Cumple
								// TO_TIMESTAMP ('04/05/17', 'DD-MM-YY')
								h = h +1;
								contarCumple = contarCumple + 1;
						%>
					  
					            <tr>
						          <td><%=contarCumple%></td>
									<td align="left" nowrap="nowrap"><%=rsCumple.getString("SOLICITUDORIGINAL")%></td>
									<td align="left" nowrap="nowrap"><%=rsCumple.getString("N_ORDEN_DISTRIBU")%></td>
									<td align="left" nowrap="nowrap"><%=rsCumple.getString("FECHA_CREACION_ORDEN")%></td>
									<td align="left" nowrap="nowrap">
								  
								  <%
								
								
								if ("OC JDA No Encontrado".equals(rsCumple.getString("PONUMB"))) {
								%>
								<span class="label label-danger"  style=" background-color:#d9534f"><%=rsCumple.getString("PONUMB")%></span>
								<% 	
								}  else {
								%>
								<span class="label label-success"><%=rsCumple.getString("PONUMB")%></span>
								<%
								}
								%>
									
									
									
									</td>
									<td align="left" nowrap="nowrap" >
									<%
								
								
								if ("Log B2B No Encontrado".equals(rsCumple.getString("EX14ERROR"))) {
								%>
								<span class="label label-danger"  style=" background-color:#d9534f"><%=rsCumple.getString("EX14ERROR")%></span>
								
								
								<% 	
								}  else if ("Log Envio No Encontrado".equals(rsCumple.getString("LOGENCONTRADOENJDA"))) {
								%>
								
								<span class="label label-warning"><%=rsCumple.getString("EX14ERROR")%></span>
								
								<% 	
								}  else {
								%>
								<span class="label label-success"><%=rsCumple.getString("EX14ERROR")%></span>
								<%
								}
								%>
									
									
									</td>
									<td align="left" nowrap="nowrap"><%=rsCumple.getString("DESPA")%></td>
									<!--
									<td>
									<a href="#myModal" class="lockUnlock" modo='111' iduser="111" title="Habilitar" role="button" data-toggle="modal" style="margin-right: 15px"><i class="icon-info-sign"></i> Ver</a>
									</td>
									-->
						        </tr>
						        
								<%
								//} // end while Cumplimiento
							}  // end while Cumple
						} catch (SQLException exQL) {
							conn.rollback();
							out.println("Error SQL: " + exQL.getMessage());	
						} catch (Exception ex) {
							conn.rollback();
							out.println("Error: " + ex.getMessage());
						} finally {
							if (rsCumple != null) rsCumple.close();
							if (psCumple != null) psCumple.close();
							if (conn != null) conn.close();
						} 
						%>
						<form method="post"  action="lockUnlockUser" id="f_lock">
		        			<input type="hidden" name="id" id="id_user"/>
		        			<input type="hidden" name="modo" id="modo"/>
						</form>
				        
				      </tbody>
				    </table>
				    </div>
				</div>
				<!-- 				<div class="pagination"> -->
<!-- 				    <ul> -->
<!-- 				        <li><a href="#">Prev</a></li> -->
<!-- 				        <li><a href="#">1</a></li> -->
<!-- 				        <li><a href="#">2</a></li> -->
<!-- 				        <li><a href="#">3</a></li> -->
<!-- 				        <li><a href="#">4</a></li> -->
<!-- 				        <li><a href="#">Next</a></li> -->
<!-- 				    </ul> -->
<!-- 				</div> -->
				
				<br>
				<% 
				if ( contarCumple > 0) { %>
               	<%
				} else {
               	%>
               		<table class="table">
              			<thead>
                			<tr>
                				<td>No hay registros a consultar</td>
                			</tr>
                		</thead>
               		</table>
               	
               	<%
				}
               	%>
               	<br>
							
						</c:when>
						<c:otherwise>
							<table class="table">
	              				<thead>
	                				<tr>
	                					<td>No hay registros a consultar, ya que se esta ejecutando el proceso de actualizacion</td>
	                				</tr>
	                			</thead>
               				</table>
    					</c:otherwise>
					</c:choose>
				</c:forEach>

						
			<!---->
	
		
		
		
				
	        </div>
        </div>
    </div>

    <script src="<c:url value="/js/bootstrap/js/bootstrap.js"/>"></script>
   
    
  </body>
</html>


