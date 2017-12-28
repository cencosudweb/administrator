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
<%
Date dNow = new Date();
SimpleDateFormat ft = 
new SimpleDateFormat ("dd/MM/yyyy");
String currentDate = ft.format(dNow);
//out.println("date"+currentDate);
String exportToExcel = request.getParameter("exportToExcel");
if (exportToExcel != null && exportToExcel.toString().equalsIgnoreCase("YES")) {
	response.setContentType("application/vnd.ms-excel");
	response.setHeader("Content-Disposition", "inline; filename=" + "PrintUserExcel.xls");
}
String dateInicio =  request.getParameter("dateInicio");
String dateFin =  request.getParameter("dateFin");

//out.println("dateInicio="+dateInicio);
//out.println("dateFin="+dateFin);

String starttime = DateUtils.turnDate2(dateInicio) != null?DateUtils.turnDate2(dateInicio):DateUtils.turnDate2(currentDate);
String endtime = DateUtils.turnDate2(dateFin) != null?DateUtils.turnDate2(dateFin):DateUtils.turnDate2(currentDate);

//out.println("starttime"+starttime);
//out.println("endtime"+endtime);

String[] cumples = request.getParameterValues("tipo_estado");
String[] cumplimientos = request.getParameterValues("cumplimiento");
String[] cumplimientoResumenes = request.getParameterValues("cumple_resumen");
String[] responsables = request.getParameterValues("responsable");

String[] tipoFechas = request.getParameterValues("tipo_fecha");

String[] tipoReferencias = request.getParameterValues("tipo_referencia");

String prefixclauseReferencia ="";
String prefixclauseReferencia2 ="";
String prefixclauseReferenciaExport ="";


if (request.getParameterValues("tipo_referencia") != null) {
	prefixclauseReferencia +="AND (";
	prefixclauseReferencia2 +="AND (";
	prefixclauseReferenciaExport +="AND (";

	for(String tipoReferencia: tipoReferencias) {
		prefixclauseReferencia += "INVWMS.REF_FIELD_1 = '" +  tipoReferencia + "' OR ";
		prefixclauseReferencia2 += "INVWMS2.REF_FIELD_1 = '" +  tipoReferencia + "' OR ";
		prefixclauseReferenciaExport += "INVWMS2.REF_FIELD_1 = '" +  tipoReferencia + "' OR ";

	}
	prefixclauseReferencia += "INVWMS.REF_FIELD_1 = 'defaultid')";
	prefixclauseReferencia2 += "INVWMS2.REF_FIELD_1 = 'defaultid')";
	prefixclauseReferenciaExport += "INVWMS2.REF_FIELD_1 = 'defaultid')";
}

out.println("tipo_referencia ="+ request.getParameter("tipo_referencia") + "<br/>");

out.println("prefixclauseReferencia="+prefixclauseReferencia + "<br/>");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <jsp:include page="../../../include/head.jsp" />
	
 	<link rel="stylesheet" href="<c:url value="/css/bootstrap-multiselect.css"/>" type="text/css">
    <script type="text/javascript" src="<c:url value="/js/bootstrap-multiselect.js"/>"></script>
    
    
   <script src="<c:url value="/js/admin/call/call.all.js"/>" type="text/javascript"></script>
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
    
    <jsp:include page="../../../include/banner.jsp" />
	<jsp:include page="../../../include/menu.jsp" />
    
    <div class="content" style=" border:soli">
        <div class="header">
            <h1 class="page-title">Reporte Cuadratura</h1>
        </div>
        
        <ul class="breadcrumb">
            <li><a href="home">Home</a> <span class="divider">/</span></li>
            <li class="active">Reporte Cuadratura</li>
        </ul>

        <div class="container-fluid">
	        <div class="row-fluid">
				<div class="btn-toolbar">
					<div class="btn-group"></div>
				</div>
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="btn-toolbar">
							<form class="form-inline" id="f_all_user" method="get" action="reporteCuadraturaOrdenDeCompra">
								<div class="form-group" >
									<label>Referencias&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
									<script type="text/javascript">
									$(document).ready(function() {
										$('#tipo_referencia').multiselect({
											//nonSelectedText: 'Seleccione Tipo Orden',
											includeSelectAllOption: true,
											enableFiltering: true,
											allSelectedText: 'No option left ...',
											maxHeight: 200,
											dropDown: true,
											buttonWidth: '200px'
										});
									});
									</script>
									
									<select name="tipo_referencia" id="tipo_referencia" multiple="multiple">
										<c:forEach items="${references}" var="referencia" varStatus="status">
											<option value="${referencia.description}" 
											<%
								           	if (request.getParameterValues("tipo_referencia") != null) {
								        		
								        		for(String tipoReferencia: tipoReferencias) {
								        	%>
								        		<c:set var="mySelectVar" value="<%=tipoReferencia%>"></c:set>
								        		<c:if test="${mySelectVar == referencia.description}">selected</c:if>
										    <% 		
								        		}
								        	}
								           %>
											>
											<c:choose>
											    <c:when test="${referencia.description=='-'}">(en blanco)</c:when>    
											    <c:otherwise>${referencia.description}</c:otherwise>
											</c:choose>
											
											</option>
										</c:forEach>
			                        </select>
									
									&nbsp;&nbsp;
									<label>&nbsp;&nbsp;Fecha Inicio&nbsp;&nbsp;</label>
									<input type="text" value="<% if (request.getParameter("dateInicio") != null) { %><% try { SimpleDateFormat formatoFecha = new SimpleDateFormat("dd/MM/yyyy", Locale.getDefault()); formatoFecha.setLenient(false); formatoFecha.parse(request.getParameter("dateInicio"));%><%=request.getParameter("dateInicio").toString().trim()%><% } catch(ParseException  e) {%><%=currentDate%><% } %><%  } else {%><%=currentDate %> <% } %>" readonly name="dateInicio" id="dateInicio" class="form-control span12" style="width:200px;" />
									&nbsp;&nbsp;&nbsp;
									<label>&nbsp;&nbsp;Fecha Fin&nbsp;&nbsp;</label>
									<input type="text" value="<% if (request.getParameter("dateFin") != null) { %><% try { SimpleDateFormat formatoFecha = new SimpleDateFormat("dd/MM/yyyy", Locale.getDefault()); formatoFecha.setLenient(false); formatoFecha.parse(request.getParameter("dateFin"));%><%=request.getParameter("dateFin").toString().trim()%><% } catch(ParseException  e) {%><%=currentDate%><% } %><%  } else {%><%=currentDate %> <% } %>" readonly name="dateFin" id="dateFin" class="form-control span12" style="width:200px;" />
								</div>
								<br>
								<div class="btn-toolbar list-toolbar">
								  <button class="btn btn-default" id="btn-all-user">
									  <i class="fa fa-search"></i> Buscar
								  </button>
								</div>
							</form>
						</div>
					</div>
				</div>
				
				<jsp:include page="../../../include/messages.jsp" />
				
				<div class="well">
				    <table id="dataTables-example"  width="100%"  border="0" cellspacing="0" cellpadding="0" style="font-size:13px">
						<tr bgcolor="#305496" style="text-align:left; color:#FFF; font-size:13px; border: solid 1px #a6a6a6;">
							<th></th>
							<th align="left">Calculado&nbsp;</th>
							<th align="left">Referencia&nbsp;</th>
							<th align="left">Total&nbsp;</th>
							<th align="left">Asn&nbsp;</th>
							<th align="left">Cantidad&nbsp;</th>
							<th align="left">Diferencia&nbsp;</th>
							<th align="left">Estado&nbsp;</th>
					
						</tr>
						
						<!-- ################INICIO 0################## --> 
						<!-- Primera Fila Cumple  -->
						<%
						Connection conn = null;
						
						PreparedStatement psCumple = null;
						ResultSet rsCumple = null;
						String SQLCumple = null;
						
						PreparedStatement psCumplimiento = null;
						ResultSet rsCumplimiento = null;
						String SQLCumplimiento = null;
						
						
						
						//Ocultar
						PreparedStatement psHideCumple = null;
						ResultSet rsHideCumple = null;
						String SQLHideCumple = null;

						PreparedStatement psHideCumplimiento = null;
						ResultSet rsHideCumplimiento = null;
						String SQLHideCumplimiento = null;
						
						
						//Mostrar			
						PreparedStatement psShowCumple = null;
						ResultSet rsShowCumple = null;
						String SQLShowCumple = null;
													
						PreparedStatement psShowCumplimiento = null;
						ResultSet rsShowCumplimiento = null;
						String SQLShowCumplimiento = null;
	
						
						//
						PreparedStatement psShowFechaCumple = null;
						ResultSet rsShowFechaCumple = null;
						String SQLShowFechaCumple = null;
						
						PreparedStatement psShowFechaCumplimiento = null;
						ResultSet rsShowFechaCumplimiento = null;
						String SQLShowFechaCumplimiento = null;
						int contarCumple = 0;
								
						try{
							Class.forName("oracle.jdbc.OracleDriver").newInstance();
							conn = DriverManager.getConnection("jdbc:oracle:thin:@172.18.163.15:1521/XE","kpiweb","kpiweb");//
							conn.setAutoCommit(false);
							
							//Esto esd para el servidor
							SQLCumple = "SELECT " +
										" TO_CHAR(INVWMS.MOD_DATE_TIME, 'DD/MM/YYYY')  AS CALCULADO, " + 
										" TO_CHAR(INVWMS.MOD_DATE_TIME, 'DD/MM/YYYY')  AS CALCULADO2," + 
										" '#N/A' AS REFERENCIA, " + 
										" NVL((SELECT SUM(INVWMS2.UNITS_RCVD) FROM CUADRATURA_OC_WMS INVWMS2 WHERE 1 = 1 AND INVWMS2.MOD_DATE_TIME >=  TO_TIMESTAMP (TO_CHAR(INVWMS.MOD_DATE_TIME, 'DD/MM/YYYY')||' 00:00:00', 'DD/MM/YYYY HH24:MI:SS.FF') AND  INVWMS2.MOD_DATE_TIME <= TO_TIMESTAMP (TO_CHAR(INVWMS.MOD_DATE_TIME, 'DD/MM/YYYY')||' 23:59:59', 'DD/MM/YYYY HH24:MI:SS.FF')   AND INVWMS2.Tran_Type='603' AND INVWMS2.Tran_Code='02'  AND INVWMS2.Whse='012'),'-')  AS TOTAL, " + 
										" '#N/A' AS ASN,  " + 
										" '#N/A' AS CANTIDAD, " + 
										" '#N/A' AS DIF, " + 
										" '#N/A' AS ESTADO " + 
										" FROM CUADRATURA_OC_WMS INVWMS " + 
										" WHERE 1 = 1 " + 
										" AND  MOD_DATE_TIME >=  TO_TIMESTAMP ('"+starttime+" 00:00:00', 'DD/MM/YYYY HH24:MI:SS.FF') AND MOD_DATE_TIME <= TO_TIMESTAMP ('"+endtime+" 23:59:59', 'DD/MM/YYYY HH24:MI:SS.FF') " + 
										" GROUP BY TO_CHAR(MOD_DATE_TIME, 'DD/MM/YYYY') " +  
										" ORDER BY TO_CHAR(MOD_DATE_TIME, 'DD/MM/YYYY') ASC ";
							
							//out.println("SQLCumple="+SQLCumple);
							//out.print("<br>");
							
							psCumple = conn.prepareStatement(SQLCumple, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
							rsCumple = psCumple.executeQuery();
							conn.commit();
							
							while(rsCumple.next()) {
								// start while Cumple
								contarCumple = contarCumple + 1;
								String SQLHideCumplimiento11 = "SELECT  INVWMS.REF_FIELD_1 AS REFERENCIA FROM INVENTARIO_WMS INVWMS WHERE INVWMS.MOD_DATE_TIME >=  TO_TIMESTAMP ('"+rsCumple.getString("CALCULADO")+" 00:00:00', 'DD/MM/YYYY HH24:MI:SS.FF') AND INVWMS.MOD_DATE_TIME <= TO_TIMESTAMP ('"+rsCumple.getString("CALCULADO")+" 23:59:59', 'DD/MM/YYYY HH24:MI:SS.FF')   GROUP BY INVWMS.REF_FIELD_1";
								
						%>
								<script type="text/javascript">
									$(function(){
										<!--0-->
										$("#ocultar_cumplimiento_<%=contarCumple%>").click(function() {
											//alert('ocultar_cumplimiento_<%=contarCumple%>');
											<%
								        	//Esto es para el servidor
								        	SQLHideCumplimiento = 	" SELECT  " + 
																	" INVWMS.REF_FIELD_1 AS REFERENCIA " + 
																	" FROM CUADRATURA_OC_WMS INVWMS " + 
																	" WHERE INVWMS.MOD_DATE_TIME >=  TO_TIMESTAMP ('"+rsCumple.getString("CALCULADO")+" 00:00:00', 'DD/MM/YYYY HH24:MI:SS.FF')  AND INVWMS.MOD_DATE_TIME <= TO_TIMESTAMP ('"+rsCumple.getString("CALCULADO")+" 23:59:59', 'DD/MM/YYYY HH24:MI:SS.FF')   " + 
																	" GROUP BY INVWMS.REF_FIELD_1";

								        	psHideCumplimiento = conn.prepareStatement(SQLHideCumplimiento, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		                                    rsHideCumplimiento = psHideCumplimiento.executeQuery();
		                                    conn.commit();
											int contarHideCumplimiento = 0;
		                                    while(rsHideCumplimiento.next()) {
												contarHideCumplimiento = contarHideCumplimiento + 1;
		                                    %>
												$("#cumplimiento_<%=contarCumple%>_<%=contarHideCumplimiento%>").hide('slow', function() {});
											<%
											}
											%>
											$("#mostrar_cumplimiento_<%=contarCumple%>").show('slow', function() {});
											$("#ocultar_cumplimiento_<%=contarCumple%>").hide('slow', function() {});
										});
										
										$("#mostrar_cumplimiento_<%=contarCumple%>").click(function() {
											//alert('mostrar_cumplimiento_<%=contarCumple%>');
											<%
								        	SQLShowCumplimiento = 	" SELECT " +  
																	"INVWMS.REF_FIELD_1 AS REFERENCIA " + 
																	" FROM CUADRATURA_OC_WMS INVWMS WHERE INVWMS.MOD_DATE_TIME >=  TO_TIMESTAMP ('"+rsCumple.getString("CALCULADO")+" 00:00:00', 'DD/MM/YYYY HH24:MI:SS.FF')  AND INVWMS.MOD_DATE_TIME <= TO_TIMESTAMP ('"+rsCumple.getString("CALCULADO")+" 23:59:59', 'DD/MM/YYYY HH24:MI:SS.FF')  " + 
																	" GROUP BY INVWMS.REF_FIELD_1";
								        	psShowCumplimiento = conn.prepareStatement(SQLShowCumplimiento, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		                                    rsShowCumplimiento = psShowCumplimiento.executeQuery();
		                                    conn.commit();
											int contarShowCumplimiento = 0;
		                                    while(rsShowCumplimiento.next()) {
												contarShowCumplimiento = contarShowCumplimiento + 1;
		                                    %>
												$("#cumplimiento_<%=contarCumple%>_<%=contarShowCumplimiento%>").show('slow', function() {});
											<%
											}
											%>
											$("#ocultar_cumplimiento_<%=contarCumple%>").show('slow', function() {});
											$("#mostrar_cumplimiento_<%=contarCumple%>").hide('slow', function() {});
										});
									});
								</script>
								<tr style="background-color:#8ea9db;color:#FFF; " >
									<td><button class="btn btn-default" id="ocultar_cumplimiento_<%=contarCumple%>" style="display:none"><img src="../images/minus2.gif" /></button><button id="mostrar_cumplimiento_<%=contarCumple%>"><img src="../images/plus2.gif" /></button></td>
									<td align="left" nowrap="nowrap"><%=rsCumple.getString("CALCULADO")%> - <%=rsCumple.getString("CALCULADO2")%></td>
									<td align="left" nowrap="nowrap"><%=rsCumple.getString("REFERENCIA")%></td>
									<td align="left" nowrap="nowrap"><%=rsCumple.getString("TOTAL")%></td>
									<td align="left" nowrap="nowrap"><%=rsCumple.getString("ASN")%></td>
									<td align="left" nowrap="nowrap"><%=rsCumple.getString("CANTIDAD")%></td>
									<td align="left" nowrap="nowrap"><%=rsCumple.getString("DIF")%></td>
									<td align="left" nowrap="nowrap"><%=rsCumple.getString("ESTADO")%></td>
								</tr>
							
								<!-- Segunda Fila Cumplimiento -->
								<%
								//Esto es para el servidor
								SQLCumplimiento = 	" SELECT  " + 
													" INVWMS.REF_FIELD_1 AS REFERENCIA, " + 
													" NVL(SUM(INVWMS.UNITS_RCVD),0) AS TOTAL, " + 
													" NVL((SELECT Citaan  FROM CUADRATURA_OC_JDA INVJDA2 WHERE 1 = 1 AND INVJDA2.Poloc=12  AND INVJDA2.Pordat>160619 AND INVJDA2.Citaan = INVWMS.REF_FIELD_1 GROUP BY INVJDA2.Citaan),'-') AS ASN, " + 
													" NVL((SELECT SUM(INVJDA2.Pounts)  FROM CUADRATURA_OC_JDA INVJDA2 WHERE 1 = 1 AND INVJDA2.Poloc=12  AND INVJDA2.Pordat>160619 AND INVJDA2.Citaan = INVWMS.REF_FIELD_1 GROUP BY INVJDA2.Citaan),'-') AS CANTIDAD, " + 
													" NVL(( (SELECT SUM(INVJDA2.Pounts)  FROM CUADRATURA_OC_JDA INVJDA2 WHERE 1 = 1 AND INVJDA2.Poloc=12  AND INVJDA2.Pordat>160619 AND INVJDA2.Citaan = INVWMS.REF_FIELD_1 GROUP BY INVJDA2.Citaan ) - SUM(INVWMS.UNITS_RCVD) ),'-') AS DIF, " +
													" (CASE WHEN (SELECT Citaan  FROM CUADRATURA_OC_JDA INVJDA2 WHERE 1 = 1 AND INVJDA2.Poloc=12  AND INVJDA2.Pordat>160619 AND INVJDA2.Citaan = INVWMS.REF_FIELD_1 GROUP BY INVJDA2.Citaan) = 0 THEN 'Sin Actualizar'  ELSE CASE  WHEN ( (SELECT SUM(INVJDA2.Pounts)  FROM CUADRATURA_OC_JDA INVJDA2 WHERE 1 = 1 AND INVJDA2.Poloc=12  AND INVJDA2.Pordat>160619 AND INVJDA2.Citaan = INVWMS.REF_FIELD_1 GROUP BY INVJDA2.Citaan ) - SUM(INVWMS.UNITS_RCVD) ) < 0  THEN 'Proceso Parcial'  ELSE  CASE  WHEN ( (SELECT SUM(INVJDA2.Pounts)  FROM CUADRATURA_OC_JDA INVJDA2 WHERE 1 = 1 AND INVJDA2.Poloc=12  AND INVJDA2.Pordat>160619 AND INVJDA2.Citaan = INVWMS.REF_FIELD_1 GROUP BY INVJDA2.Citaan ) - SUM(INVWMS.UNITS_RCVD) ) > 0  THEN 'Diferencia'  ELSE  CASE  WHEN ( (SELECT SUM(INVJDA2.Pounts)  FROM CUADRATURA_OC_JDA INVJDA2 WHERE 1 = 1 AND INVJDA2.Poloc=12  AND INVJDA2.Pordat>160619 AND INVJDA2.Citaan = INVWMS.REF_FIELD_1 GROUP BY INVJDA2.Citaan ) - SUM(INVWMS.UNITS_RCVD) ) = 0  THEN 'Procesado Ok'  ELSE  'N/A' END  END  END END ) AS ESTADO " + 
													" FROM INVENTARIO_WMS INVWMS " + 
													" WHERE INVWMS.MOD_DATE_TIME >=  TO_TIMESTAMP ('"+rsCumple.getString("CALCULADO")+" 00:00:00', 'DD/MM/YYYY HH24:MI:SS.FF')  AND INVWMS.MOD_DATE_TIME <= TO_TIMESTAMP ('"+rsCumple.getString("CALCULADO")+" 23:59:59', 'DD/MM/YYYY HH24:MI:SS.FF') " +
													" AND INVWMS.Tran_Type='603' " + 
													" AND INVWMS.Tran_Code='02' " +
													" AND INVWMS.Whse='012' "+prefixclauseReferencia+" GROUP BY INVWMS.REF_FIELD_1";
								
								//out.println("SQLCumplimiento="+SQLCumplimiento);
								//out.print("<br>");
								psCumplimiento = conn.prepareStatement(SQLCumplimiento, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
								rsCumplimiento = psCumplimiento.executeQuery();
								conn.commit();
								int contarCumplimiento = 0;
								while(rsCumplimiento.next()) {
									contarCumplimiento = contarCumplimiento + 1;
									//out.print("contarCumplimiento = "+contarCumplimiento);
									//out.print("<br>");
								%>
									<tr id="cumplimiento_<%=contarCumple%>_<%=contarCumplimiento%>" style="background-color:#d9e1f2;color:#000000;display:none" >
										<td><img src="../images/calendar.png" /></td>
										<td nowrap="nowrap"><%=rsCumple.getString("CALCULADO")%> - <%=rsCumple.getString("CALCULADO2")%></td>	 
										<td nowrap="nowrap"><%=rsCumplimiento.getString("REFERENCIA")%></td>	 
										<td nowrap="nowrap"><%=rsCumplimiento.getString("TOTAL")%></td>	 
										<td nowrap="nowrap"><%=rsCumplimiento.getString("ASN")%></td>	 
										<td nowrap="nowrap"><%=rsCumplimiento.getString("CANTIDAD")%></td>	 
										<td nowrap="nowrap"><%=rsCumplimiento.getString("DIF")%></td>	 
										<td nowrap="nowrap"><%=rsCumplimiento.getString("ESTADO")%></td>	 
									</tr>
										<%
								} // end while Cumplimiento
							}  // end while Cumple
						} catch (SQLException exQL) {
							conn.rollback();
							out.println("Error SQL: " + exQL.getMessage());	
						} catch (Exception ex) {
							conn.rollback();
							out.println("Error: " + ex.getMessage());
						} finally {
							if (rsCumple != null) rsCumple.close();
							if (rsCumplimiento != null) rsCumplimiento.close();
							
							if (psCumple != null) psCumple.close();
							if (psCumplimiento != null) psCumplimiento.close();
							
							if (rsHideCumple != null) rsHideCumple.close();
							if (rsHideCumplimiento != null) rsHideCumplimiento.close();
							if (rsShowCumple != null) rsShowCumple.close();
							if (rsShowCumplimiento != null) rsShowCumplimiento.close();
							
							if (psHideCumple != null) psHideCumple.close();
							if (psHideCumplimiento != null) psHideCumplimiento.close();
							if (psShowCumple != null) psShowCumple.close();
							if (psShowCumplimiento != null) psShowCumplimiento.close();
							if (conn != null) conn.close();
						} 
						%>
						<!-- ################FIN 0################## --> 						
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
		<script src="<c:url value="/js/Highcharts/highcharts.js"/>"></script>
		<script src="<c:url value="/js/Highcharts/modules/exporting.js"/>"></script>

		<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
		
		
				<!-- Modal Confirmacion Eliminar -->
				<div class="modal small hide fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				    <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
				        <h3 id="myModalLabel">Confirme</h3>
				    </div>
				    <div class="modal-body">
				        <p class="error-text"><i class="icon-warning-sign modal-icon"></i>¿ Realmente desea modificar el estado ?</p>
				    </div>
				    <div class="modal-footer">
				        <button class="btn" data-dismiss="modal" aria-hidden="true">Cancelar</button>
				        <button class="btn btn-danger"  data-dismiss="modal">Cambiar</button>
				    </div>
				</div>
				<jsp:include page="../../../include/footer.jsp" />
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


