<%@include file="../../include/taglib_includes.jsp"%>
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
<%
Date dNow = new Date();
SimpleDateFormat ft = 
new SimpleDateFormat ("dd/MM/yyyy");
String currentDate = ft.format(dNow);
String exportToExcel = request.getParameter("exportToExcel");
if (exportToExcel != null && exportToExcel.toString().equalsIgnoreCase("YES")) {
	response.setContentType("application/vnd.ms-excel");
	response.setHeader("Content-Disposition", "inline; filename=" + "PrintVentaEnVerdeExcel.xls");
}
String dateInicio =  request.getParameter("dateInicio");
String starttime = DateUtils.turnDate3(dateInicio) != null?DateUtils.turnDate3(dateInicio):DateUtils.turnDate3(currentDate);
String starttime2 = DateUtils.turnDate4(dateInicio) != null?DateUtils.turnDate4(dateInicio):DateUtils.turnDate4(currentDate);
String prefixclause ="";

if (request.getParameter("ponumb") != null && !"".equals(request.getParameter("ponumb"))) {
	prefixclause +=" AND JDA_STOCK.PONUMB LIKE '"+request.getParameter("ponumb")+"%'";
}


if (request.getParameter("estado") != null && !"".equals(request.getParameter("estado"))) {
	
	if ("1".equals(request.getParameter("estado"))) {
		prefixclause +=" AND JDA_STOCK.EX14ERROR LIKE '%La OC se cargo correctamente%'";
	} else if ("2".equals(request.getParameter("estado"))) {
		prefixclause +=" AND JDA_STOCK.EX14ERROR LIKE '%No se especifica rut de cliente%'";
	} else if ("3".equals(request.getParameter("estado"))) { 
		prefixclause +=" AND JDA_STOCK.EX14ERROR LIKE '%-1%'";
	} else {
		prefixclause +=" ";
	}
}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <jsp:include page="../../include/head.jsp" />
	
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
    
    <jsp:include page="../../include/banner.jsp" />
	<jsp:include page="../../include/menu.jsp" />
    
    <div class="content">
        <div class="header">
            <h1 class="page-title">Reporte Cuadratura Stock</h1>
        </div>
        <%
        Connection connHora = null;
		PreparedStatement psHora = null;
		ResultSet rsHora = null;
		String SQLHora = null; 
		int totalCantidadHora = 0;
		try{
			Class.forName("oracle.jdbc.OracleDriver").newInstance();
			connHora = DriverManager.getConnection("jdbc:oracle:thin:@172.18.163.15:1521/XE","kpiweb","kpiweb");//
			connHora.setAutoCommit(false);
			SQLHora = 	" select * from ( select this_.id as id30_0_, SUBSTR(this_.fecha,0,13)||':00:00' as ultimaActualizacion, SUBSTR(this_.fecha,0,10)||' '||(TO_NUMBER((SUBSTR(this_.fecha,11,3)),'999')+1)||':00:00:00' AS proximaActualizacion from horario_vtav_act_stock this_ order by this_.fecha desc ) where rownum <= 1";
			
			//out.println("SQLHora: " + SQLHora);	
			psHora = connHora.prepareStatement(SQLHora, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			rsHora = psHora.executeQuery();
			connHora.commit();
			int contarHora = 0;
			while(rsHora.next()) {
				contarHora = contarHora + 1;
         %>
        
        <ul class="breadcrumb">
            <li><a href="home">Home</a> <span class="divider">/</span></li>
            <li class="active">Reporte Cuadratura Stock <span class="divider">/</span></li>
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
				<div class="btn-toolbar">
					<%
					if (exportToExcel != null) {
					%>
						<a class="btn" href="reporteOrdenDeCompraStockPrint?exportToExcel=YES"><i class="icon-book"></i> Exportar a Excel</a>
					<%
						} else {
					%>
						<a target="_blank" class="btn" href="reporteOrdenDeCompraStockPrint?exportToExcel=YES&posted=<%if(request.getParameter("posted") != null){%><%=request.getParameter("posted")%><%}else{%><%=""%><% } %>&dateInicio=<% if (request.getParameter("dateInicio") != null) { %><% try { SimpleDateFormat formatoFecha = new SimpleDateFormat("dd/MM/yyyy", Locale.getDefault()); formatoFecha.setLenient(false); formatoFecha.parse(request.getParameter("dateInicio"));%><%=request.getParameter("dateInicio").toString().trim()%><% } catch(ParseException  e) {%><%=currentDate%><% } %><%  } else {%><%=currentDate %> <% } %>&estado=<%if(request.getParameter("estado") != null){%><%=request.getParameter("estado")%><%}else{%><%=""%><% } %>&ponumb=<%if(request.getParameter("ponumb") != null){%><%=request.getParameter("ponumb")%><%}else{%><%=""%><% } %>"><i class="icon-book"></i> Exportar a Excel</a>
					<%
						} 
					%>
					<a class="btn" href='javascript:window.print(); void 0;'><i class="icon-print"></i> Imprimir</a> 
					<div class="btn-group"></div>
				</div>
				<br>
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="btn-toolbar">
							<form class="form-inline" id="f_all_user" method="get" action="reporteOrdenDeCompraStock">
								<input type="hidden" name="posted" id="posted" value="ok"/>
								<div class="form-group">
								<label>Estado&nbsp;</label>&nbsp;&nbsp;
								<select name="estado" id="estado" class="form-control" style="width:150px;">
					              <option value="-1">Todas los Estados</option>
					              <c:forEach items="${tipostocks}" var="listTipoEstado" varStatus="status">
					              	<option value="${listTipoEstado.id}" ${param.estado == listTipoEstado.id ? 'selected' : ''}>${listTipoEstado.description}</option>
					              </c:forEach>
					            </select>
					            &nbsp;&nbsp;
					            <label>&nbsp;&nbsp;OC JDA&nbsp;</label>
					            &nbsp;&nbsp;
								<input class="form-control span12" style="width:150px;" placeholder="Buscar OC JDA..." name="ponumb" id="ponumb" type="text" value="<%if(request.getParameter("ponumb") != null){%><%=request.getParameter("ponumb")%><%}else{%><%=""%><% } %>">
					            &nbsp;&nbsp;
					            <label>&nbsp;Fecha EOM&nbsp;</label>
					            &nbsp;&nbsp;
								<input type="text" value="<% if (request.getParameter("dateInicio") != null) { %><% try { SimpleDateFormat formatoFecha = new SimpleDateFormat("dd/MM/yyyy", Locale.getDefault()); formatoFecha.setLenient(false); formatoFecha.parse(request.getParameter("dateInicio"));%><%=request.getParameter("dateInicio").toString().trim()%><% } catch(ParseException  e) {%><%=currentDate%><% } %><%  } else {%><%=currentDate %> <% } %>" readonly name="dateInicio" id="dateInicio" class="form-control span12" style="width:150px;" />
 								</div>
 								<div class="form-group">
 								</div>
								<div class="btn-toolbar list-toolbar">
								<button class="btn btn-default" id="btn-all-user" ><i class="fa fa-search"></i> Buscar</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				
				<jsp:include page="../../include/messages.jsp" />
				<span class="label label-info">Cantidad JDA</span>
				<span class="label label-success">OC Cargada</span>
				<span class="label label-danger" style=" background-color:#d9534f">OC con Error</span>
				<span class="label label-warning">OC sin Error de Mensaje</span>
				<br></br>
				<div class="well" style="overflow:scroll; height:400px">
				<c:forEach items="${horariostocks}" var="horario" varStatus="status">
					<c:choose>
						<c:when test="${horario.estado == 2}">
							<table class="table table-bordered table-striped">
						      <thead>
						        <tr>
						          <th>#</th>
						          <th>Cantidad JDA</th>
								  <th>OC Cargada</th>
								  <th>OC con Error</th>
								  <th>OC sin Error de Mensaje</th>
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
										Class.forName("oracle.jdbc.OracleDriver").newInstance();
										connFecha = DriverManager.getConnection("jdbc:oracle:thin:@172.18.163.15:1521/XE","kpiweb","kpiweb");//
										connFecha.setAutoCommit(false);
										
										
										
										SQLFecha = 	" SELECT " +
													" COUNT(*) as totalJda, " + 
													" NVL( SUM(CASE WHEN JDA_STOCK.EX14ERROR LIKE '%La OC se cargo correctamente%' THEN 1 ELSE 0 END ),0 ) as totalOcOk, " + 
													" NVL( SUM(CASE WHEN (JDA_STOCK.Ex14error like '%El nombre de comprador debe tener un largo de a los mas 20 caracter%' OR JDA_STOCK.Ex14error like '%El producto con codigo%' OR JDA_STOCK.Ex14error like '%El proveedor indicado en el mensaje no corresponde al proveedor actual de la Orde%' OR JDA_STOCK.Ex14error like '%En la distribucion del producto con codigo%' OR JDA_STOCK.Ex14error like '%En la distribucion, el codigo del local 115 no esta especificado en el bloque de%' OR JDA_STOCK.Ex14error like '%En la distribucion, el codigo del local 12 no esta especificado en el bloque de m%' OR JDA_STOCK.Ex14error like '%Error al borrar despachos vigentes%' OR JDA_STOCK.Ex14error like '%La fecha de entrega es anterior a la de emision%' OR JDA_STOCK.Ex14error like '%La fecha de vigencia debe tener formato%' OR JDA_STOCK.Ex14error like '%La orden con el numero%' OR JDA_STOCK.Ex14error like '%La orden No%' OR JDA_STOCK.Ex14error like '%a Predistribucion no coincide con el detalle de la orden, para el Codigo Product%' OR JDA_STOCK.Ex14error like '%No se especifica el nombre de cliente%' OR JDA_STOCK.Ex14error like '%No se especifica la fecha comprometida cliente%' OR JDA_STOCK.Ex14error like '%No se especifica el nombre de cliente%' OR JDA_STOCK.Ex14error like '%No se especifica rut de cliente%' OR JDA_STOCK.Ex14error like '%No se especifica el nombre de cliente%' OR JDA_STOCK.Ex14error like '%No se especifica secpred, Orden%' OR JDA_STOCK.Ex14error like '%No se especifica tipo de orden%' OR JDA_STOCK.Ex14error like '%No se puede obtener la fecha de origen de la orden%' OR JDA_STOCK.Ex14error like '%No se puede reemplazar la OC ya que posee despachos%') THEN 1 ELSE 0 END ),0 ) as totalOcError, " + 
													" NVL( SUM(CASE WHEN JDA_STOCK.EX14ERROR = '-1' THEN 1 ELSE 0 END ),0 ) as totalOcSinErrorMensaje " + 		
													" from CUADRATURA_OC_VTAV_JDA_STOCK JDA_STOCK " + 
													" where 1 = 1 " + 
													" AND JDA_STOCK.POFECE >= '"+starttime+"' and JDA_STOCK.POFECE <= '"+starttime+"' " +
													" AND JDA_STOCK.NUMDO is null " + 
													"" + prefixclause + "" + 
													" " ;
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
								<td><span class="label label-info">
								<%
								DecimalFormat formatea = new DecimalFormat("###,###.##");
								out.println(formatea.format(rsFecha.getInt("totalJda")));
								%>
								</span></td>
								<td><span class="label label-success">
								<%
								out.println(formatea.format(rsFecha.getInt("totalOcOk")));
								%>
								</span></td>
								<td><span class="label label-danger" style=" background-color:#d9534f">
								<%
								out.println(formatea.format(rsFecha.getInt("totalOcError")));
								%>
								</span></td>
								<td><span class="label label-warning">
								<%
								out.println(formatea.format(rsFecha.getInt("totalOcSinErrorMensaje")));
								%>
								</span></td>
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
						     <table class="table table-bordered table-striped">
						      <thead>
						        <tr>
						          <th>#</th>
						          <th>POVNUB JDA</th>
						          <th>NUMDO JDA</th>
						          <th>F.C JDA</th>
						          <th>OC JDA</th>
						          <th class="der">Log B2B</th>
								  <th>Despa</th>
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
									Class.forName("oracle.jdbc.OracleDriver").newInstance();
									conn = DriverManager.getConnection("jdbc:oracle:thin:@172.18.163.15:1521/XE","kpiweb","kpiweb");//
									conn.setAutoCommit(false);
									SQLCumple = " SELECT " + 
												"  CASE WHEN JDA_STOCK.PONUMB IS NULL THEN '-' ELSE JDA_STOCK.PONUMB END as PONUMB, " +
												"  CASE WHEN JDA_STOCK.NUMDO IS NULL THEN '-' ELSE JDA_STOCK.NUMDO END as NUMDO, " +
												"  CASE WHEN JDA_STOCK.POFECE = '-1' THEN '-' ELSE JDA_STOCK.POFECE END AS POFECE, " +
												"  CASE WHEN JDA_STOCK.POVNUM = '-1' THEN '-' ELSE JDA_STOCK.POVNUM END AS POVNUM, " +
												"  CASE WHEN JDA_STOCK.EX14ERROR = '-1' THEN '-' ELSE JDA_STOCK.EX14ERROR END AS EX14ERROR, " +
												"  CASE WHEN JDA_STOCK.EX14ERROR LIKE '%La OC se cargo correctamente%' THEN 'Oc Cargada' ELSE CASE WHEN (JDA_STOCK.Ex14error like '%El nombre de comprador debe tener un largo de a los mas 20 caracter%' OR JDA_STOCK.Ex14error like '%El producto con codigo%' OR JDA_STOCK.Ex14error like '%El proveedor indicado en el mensaje no corresponde al proveedor actual de la Orde%' OR JDA_STOCK.Ex14error like '%En la distribucion del producto con codigo%' OR JDA_STOCK.Ex14error like '%En la distribucion, el codigo del local 115 no esta especificado en el bloque de%' OR JDA_STOCK.Ex14error like '%En la distribucion, el codigo del local 12 no esta especificado en el bloque de m%' OR JDA_STOCK.Ex14error like '%Error al borrar despachos vigentes%' OR JDA_STOCK.Ex14error like '%La fecha de entrega es anterior a la de emision%' OR JDA_STOCK.Ex14error like '%La fecha de vigencia debe tener formato%' OR JDA_STOCK.Ex14error like '%La orden con el numero%' OR JDA_STOCK.Ex14error like '%La orden No%' OR JDA_STOCK.Ex14error like '%a Predistribucion no coincide con el detalle de la orden, para el Codigo Product%' OR JDA_STOCK.Ex14error like '%No se especifica el nombre de cliente%' OR JDA_STOCK.Ex14error like '%No se especifica la fecha comprometida cliente%' OR JDA_STOCK.Ex14error like '%No se especifica el nombre de cliente%' OR JDA_STOCK.Ex14error like '%No se especifica rut de cliente%' OR JDA_STOCK.Ex14error like '%No se especifica el nombre de cliente%' OR JDA_STOCK.Ex14error like '%No se especifica secpred, Orden%' OR JDA_STOCK.Ex14error like '%No se especifica tipo de orden%' OR JDA_STOCK.Ex14error like '%No se puede obtener la fecha de origen de la orden%' OR JDA_STOCK.Ex14error like '%No se puede reemplazar la OC ya que posee despachos%') THEN 'Oc Error' ELSE CASE WHEN JDA_STOCK.EX14ERROR LIKE '%-1%' THEN 'Oc Sin Error Mensaje' ELSE  '-' END  END END as estado, " +
												"  CASE WHEN JDA_STOCK.DESPA IS NULL THEN '-' ELSE JDA_STOCK.DESPA END as DESPA " +
												" from CUADRATURA_OC_VTAV_JDA_STOCK JDA_STOCK " + 
												" where 1 = 1 " + 
												" AND JDA_STOCK.POFECE >= '"+starttime+"' and JDA_STOCK.POFECE <= '"+starttime+"' " +
												" AND JDA_STOCK.NUMDO is null " + 
												"" + prefixclause + "" + 
												" " ;
									//out.println("SQLCumpleI="+SQLCumple);
									//out.print("<br>");
									
									psCumple = conn.prepareStatement(SQLCumple, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
									rsCumple = psCumple.executeQuery();
									conn.commit();
									int h = 0;
									while(rsCumple.next()) {
										// start while Cumple
										h = h +1;
										contarCumple = contarCumple + 1;
								%>
							            <tr>
								          <td><%=contarCumple%></td>
											<td align="left" nowrap="nowrap"><%=rsCumple.getString("PONUMB")%></td>
											<td align="left" nowrap="nowrap"><%=rsCumple.getString("NUMDO")%></td>
											<td align="left" nowrap="nowrap"><%=rsCumple.getString("POFECE")%></td>
								          <td align="left" nowrap="nowrap">
										  <%
										if ("Oc Error".equals(rsCumple.getString("ESTADO"))) {
										%>
										<span class="label label-danger" style=" background-color:#d9534f"><%=rsCumple.getString("PONUMB")%></span>
										<% 	
										}  else if ("Oc Cargada".equals(rsCumple.getString("ESTADO"))) {
										%>
											<span class="label label-success"><%=rsCumple.getString("PONUMB")%></span>
											
										<%
										}  else if ("Oc Sin Error Mensaje".equals(rsCumple.getString("ESTADO"))) {
										%>	
											<span class="label label-warning"><%=rsCumple.getString("PONUMB")%></span>
										<%
										} else {
											
										%>
										<%=rsCumple.getString("PONUMB")%>
										<%
										}
										%>	
										</td>
										<td align="left" nowrap="nowrap" >
										<%
										if ("Oc Error".equals(rsCumple.getString("ESTADO"))) {
										%>
										<span class="label label-danger" style=" background-color:#d9534f"><%=rsCumple.getString("EX14ERROR")%></span>
										
										<% 	
										}  else if ("Oc Cargada".equals(rsCumple.getString("ESTADO"))) {
										%>
										
										<span class="label label-success"><%=rsCumple.getString("EX14ERROR")%></span>
										
										<%
										}  else if ("Oc Sin Error Mensaje".equals(rsCumple.getString("ESTADO"))) {
										%>	
											<span class="label label-warning"><%=rsCumple.getString("EX14ERROR")%></span>
										
										<% 	
										}  else {
										%>
										<%=rsCumple.getString("EX14ERROR")%>
										<%
										}
										%>
										</td>
										<td align="left" nowrap="nowrap"><%=rsCumple.getString("DESPA")%></td>
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
								
						        
						      </tbody>
						    </table>
						</div>
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
				</div>
				<script src="<c:url value="/js/Highcharts/highcharts.js"/>"></script>
				<script src="<c:url value="/js/Highcharts/modules/exporting.js"/>"></script>
				<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
				<!-- Modal Confirmacion Eliminar -->
				<div class="modal small hide fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				    <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
				        <h3 id="myModalLabel">Informe</h3>
				    </div>
				    <div class="modal-body">
				        <p class="error-text"><i class="icon-warning-sign modal-icon"></i>¿ Advertencia ?</p>
				    </div>
				    <div class="modal-footer">
				        <button class="btn" data-dismiss="modal" aria-hidden="true">Cancelar</button>
				        <button class="btn btn-danger"  data-dismiss="modal">Ok</button>
				    </div>
				</div>
				<jsp:include page="../../include/footer.jsp" />
	        </div>
        </div>
    </div>

    <script src="<c:url value="/js/bootstrap/js/bootstrap.js"/>"></script>
    <script type="text/javascript">
        $("[rel=tooltip]").tooltip();
        $(function() {
            $('.demo-cancel-click').click(function(){return false;});
        });
    </script>
    
  </body>
</html>


