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
	response.setHeader("Content-Disposition", "inline; filename=" + "DescargaPanelDinamicoExcel.xls");
}
String dateInicio =  request.getParameter("dateInicio");
String starttime = DateUtils.turnDate(dateInicio) != null?DateUtils.turnDate(dateInicio):DateUtils.turnDate(currentDate);
String[] cumples = request.getParameterValues("tipo_estado");
String[] cumplimientos = request.getParameterValues("cumplimiento");
String[] cumplimientoResumenes = request.getParameterValues("cumple_resumen");
String[] responsables = request.getParameterValues("responsable");
String[] tipoFechas = request.getParameterValues("tipo_fecha");
String[] tipoOrdenes = request.getParameterValues("tipo_orden");
String[] tipoVentas = request.getParameterValues("tipo_venta");
String[] clienteRetiras = request.getParameterValues("cliente_retira");
String[] descripcionEmpresas = request.getParameterValues("descripcion_empresa");
String[] tipoGuias = request.getParameterValues("tipo_guia");
String[] tipoHorarios = request.getParameterValues("tipo_horario");
String[] ventasEmpresas = request.getParameterValues("venta_empresa");
String prefixclauseCumple ="";
String prefixclauseCumple2 ="";
String prefixclauseCumpleExport ="";
String prefixclauseCumplimiento ="";
String prefixclauseCumplimiento2 ="";
String prefixclauseCumplimientoExport ="";
String prefixclauseCumplimiento_resumen ="";
String prefixclauseCumplimiento_resumen2 ="";
String prefixclauseCumplimiento_resumenExport ="";
String prefixclauseResponsable ="";
String prefixclauseResponsable2 ="";
String prefixclauseResponsableExport ="";
String prefixclauseTipoFecha ="";
String prefixclauseTipoFecha2 ="";
String prefixclauseTipoFechaExport ="";
String prefixclauseTipoOrden ="";
String prefixclauseTipoOrden2 ="";
String prefixclauseTipoOrdenExport ="";
String prefixclauseTipoVenta ="";
String prefixclauseTipoVenta2 ="";
String prefixclauseTipoVentaExport ="";
String prefixclauseClienteRetira ="";
String prefixclauseClienteRetira2 ="";
String prefixclauseClienteRetiraExport ="";
String prefixclauseDescripcionEmpresa ="";
String prefixclauseDescripcionEmpresa2 ="";
String prefixclauseDescripcionEmpresaExport ="";
String prefixclauseTipoGuia ="";
String prefixclauseTipoGuia2 ="";
String prefixclauseTipoGuiaExport ="";
String prefixclauseHorario ="";
String prefixclauseHorario2 ="";
String prefixclauseHorarioExport ="";
String prefixclauseVentaEmpresa ="";
String prefixclauseVentaEmpresa2 ="";
String prefixclauseVentaEmpresaExport ="";

if ("NULL".equals(request.getParameter("tipo_estado"))) {

} else {
	prefixclauseCumple +=" AND ( ";
	  prefixclauseCumple2 +=" AND ( ";
	  prefixclauseCumpleExport +=" AND ( ";

	  for(String cumple: cumples) {
		prefixclauseCumple += " C1.CUMPLE = '" +  cumple + "' OR ";
		prefixclauseCumple2 += " C2.CUMPLE = '" +  cumple + "' OR ";
		prefixclauseCumpleExport += " C2.CUMPLE = '" +  cumple + "' OR ";

	  }
	  prefixclauseCumple += " C1.CUMPLE = 'defaultid')";
	  prefixclauseCumple2 += " C2.CUMPLE = 'defaultid')";
	  prefixclauseCumpleExport += " C2.CUMPLE = 'defaultid')";
}


if ("NULL".equals(request.getParameter("tipo_orden"))) {
		
	} else {
		prefixclauseTipoOrden +=" AND ( ";
		prefixclauseTipoOrden2 +=" AND ( ";
		prefixclauseTipoOrdenExport +=" AND ( ";

		for(String tipoOrdene: tipoOrdenes) {
			prefixclauseTipoOrden += " C1.TIPO_ORDEN = '" +  tipoOrdene + "' OR ";
			prefixclauseTipoOrden2 += " C2.TIPO_ORDEN = '" +  tipoOrdene + "' OR ";
			prefixclauseTipoOrdenExport += " C2.TIPO_ORDEN = '" +  tipoOrdene + "' OR ";

		}
		prefixclauseTipoOrden += " C1.TIPO_ORDEN = 'defaultid') ";
		prefixclauseTipoOrden2 += " C2.TIPO_ORDEN = 'defaultid') ";
		prefixclauseTipoOrdenExport += " C2.TIPO_ORDEN = 'defaultid') ";
}


if ("NULL".equals(request.getParameter("tipo_venta"))) {
		

} else {
	prefixclauseTipoVenta +=" AND ( ";
	prefixclauseTipoVenta2 +=" AND ( ";
	prefixclauseTipoVentaExport +=" AND ( ";

	for(String tipoVenta: tipoVentas) {
		prefixclauseTipoVenta += " C1.TIPO_VENTA = '" +  tipoVenta + "' OR ";
		prefixclauseTipoVenta2 += " C2.TIPO_VENTA = '" +  tipoVenta + "' OR ";
		prefixclauseTipoVentaExport += " C2.TIPO_VENTA = '" +  tipoVenta + "' OR ";

	}
	prefixclauseTipoVenta+= " C1.TIPO_VENTA = 'defaultid') ";
	prefixclauseTipoVenta2+= " C2.TIPO_VENTA = 'defaultid') ";
	prefixclauseTipoVentaExport+= " C2.TIPO_VENTA = 'defaultid') ";
}

if ("NULL".equals(request.getParameter("cliente_retira"))) {
		
}  else {
	prefixclauseClienteRetira +=" AND ( ";
	prefixclauseClienteRetira2 +=" AND ( ";
	prefixclauseClienteRetiraExport +=" AND ( ";

	for(String clienteRetira: clienteRetiras) {
		prefixclauseClienteRetira += " C1.CLIENTE_RETIRA = '" +  clienteRetira + "' OR ";
		prefixclauseClienteRetira2 += " C2.CLIENTE_RETIRA = '" +  clienteRetira + "' OR ";
		prefixclauseClienteRetiraExport += " C2.CLIENTE_RETIRA = '" +  clienteRetira + "' OR ";

	}
	prefixclauseClienteRetira += " C1.TIPO_ORDEN = 'defaultid') ";
	prefixclauseClienteRetira2 += " C2.TIPO_ORDEN = 'defaultid') ";
	prefixclauseClienteRetiraExport += " C2.TIPO_ORDEN = 'defaultid') ";
		
}

if ("NULL".equals(request.getParameter("descripcion_empresa"))) {

} else {
	prefixclauseDescripcionEmpresa +=" AND( ";
	prefixclauseDescripcionEmpresa2 +=" AND ( ";
	prefixclauseDescripcionEmpresaExport +=" AND ( ";

	for(String descripcionEmpresa: descripcionEmpresas) {
		prefixclauseDescripcionEmpresa += " C1.DESC_EMP = '" +  descripcionEmpresa + "' OR ";
		prefixclauseDescripcionEmpresa2 += " C2.DESC_EMP = '" +  descripcionEmpresa + "' OR ";
		prefixclauseDescripcionEmpresaExport += " C2.DESC_EMP = '" +  descripcionEmpresa + "' OR ";

	}
	prefixclauseDescripcionEmpresa+= "C1.DESC_EMP = 'defaultid')";
	prefixclauseDescripcionEmpresa2+= "C2.DESC_EMP = 'defaultid')";
	prefixclauseDescripcionEmpresaExport+= "C2.DESC_EMP = 'defaultid')";
}

	if ("NULL".equals(request.getParameter("tipo_guia"))) {

	} else {
		prefixclauseTipoGuia +=" AND ( ";
		prefixclauseTipoGuia2 +=" AND ( ";
		prefixclauseTipoGuiaExport +=" AND ( ";

		for(String tipoGuia: tipoGuias) {
			prefixclauseTipoGuia += " C1.TIPOGUI = '" +  tipoGuia + "' OR ";
			prefixclauseTipoGuia2 += " C2.TIPOGUI = '" +  tipoGuia + "' OR ";
			prefixclauseTipoGuiaExport += " C2.TIPOGUI = '" +  tipoGuia + "' OR ";

		}
		prefixclauseTipoGuia+= " C1.TIPOGUI = 'defaultid') ";
		prefixclauseTipoGuia2+= " C2.TIPOGUI = 'defaultid') ";
		prefixclauseTipoGuiaExport+= " C2.TIPOGUI = 'defaultid') ";
	}

	if ("NULL".equals(request.getParameter("tipo_horario"))) {

	} else {
		prefixclauseHorario +=" AND ( ";
		prefixclauseHorario2 +=" AND ( ";
		prefixclauseHorarioExport +=" AND (" ;

		for(String tipoHorario: tipoHorarios) {
			prefixclauseHorario += " C1.HORARIO = '" +  tipoHorario + "' OR ";
			prefixclauseHorario2 += " C2.HORARIO = '" +  tipoHorario + "' OR ";
			prefixclauseHorarioExport += " C2.HORARIO = '" +  tipoHorario + "' OR ";

		}
		prefixclauseHorario+= " C1.HORARIO = 'defaultid') ";
		prefixclauseHorario2+= " C2.HORARIO = 'defaultid') ";
		prefixclauseHorarioExport+= " C2.HORARIO = 'defaultid') ";
	}

	if ("NULL".equals(request.getParameter("venta_empresa"))) {

	}  else {
		prefixclauseVentaEmpresa +=" AND ( ";
		prefixclauseVentaEmpresa2 +=" AND ( ";
		prefixclauseVentaEmpresaExport +=" AND ( ";

		for(String ventasEmpresa: ventasEmpresas) {
			prefixclauseVentaEmpresa += " C1.VENTA_EMPRESA = '" +  ventasEmpresa + "' OR ";
			prefixclauseVentaEmpresa2 += " C2.VENTA_EMPRESA = '" +  ventasEmpresa + "' OR ";
			prefixclauseVentaEmpresaExport += " C2.VENTA_EMPRESA = '" +  ventasEmpresa + "' OR ";

		}
		prefixclauseVentaEmpresa+= " C1.VENTA_EMPRESA = 'defaultid') ";
		prefixclauseVentaEmpresa2+= " C2.VENTA_EMPRESA = 'defaultid') ";
		prefixclauseVentaEmpresaExport+= " C2.VENTA_EMPRESA = 'defaultid') ";
	}



//out.println("tipo_orden ="+ request.getParameter("tipo_orden") + "<br/>");
//out.println("prefixclauseTipoOrden1="+prefixclauseTipoOrden + "<br/>");
//out.println("prefixclauseDescripcionEmpresa1="+prefixclauseDescripcionEmpresa + "<br/>");
//out.println("prefixclauseTipoOrden1="+prefixclauseTipoOrden + "<br/>");
//out.println("prefixclauseTipoOrden2="+prefixclauseTipoOrden2 + "<br/>");

//out.println("prefixclauseCumple="+prefixclauseCumple + "<br/>");
//out.println("prefixclauseCumple="+prefixclauseCumple + "<br/>");
/*
out.println("prefixclauseCumple1="+prefixclauseCumple + "<br/>");
out.println("prefixclauseCumple2="+prefixclauseCumple2 + "<br/>");
*/
/**/

//out.println("prefixclauseTipoOrden="+prefixclauseTipoOrden + "<br/>");
//out.println("prefixclauseTipoVenta="+prefixclauseTipoVenta + "<br/>");
//out.println("prefixclauseClienteRetira="+prefixclauseClienteRetira + "<br/>");
//out.println("prefixclauseDescripcionEmpresa="+prefixclauseDescripcionEmpresa + "<br/>");
//out.println("prefixclauseTipoGuia="+prefixclauseTipoGuia + "<br/>");
//out.println("prefixclauseHorario="+prefixclauseHorario + "<br/>");
//out.println("prefixclauseVentaEmpresa="+prefixclauseVentaEmpresa + "<br/>");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <jsp:include page="../../include/head.jsp" />
	
 	<link rel="stylesheet" href="<c:url value="/css/bootstrap-multiselect.css"/>" type="text/css">
    <script type="text/javascript" src="<c:url value="/js/bootstrap-multiselect.js"/>"></script>
    
    
   <script src="<c:url value="/js/admin/call/call.all.js"/>" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/datepicker/jquery.ui.all.css"/>"/>
    <script src="<c:url value="/js/jquery.ui.core.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/js/jquery.ui.datepicker.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/js/jquery.ui.datepicker-es.js"/>" type="text/javascript"></script>


    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="../../../assets/ico/favicon.ico"/>
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../../../assets/ico/apple-touch-icon-144-precomposed.png"/>
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../../../assets/ico/apple-touch-icon-114-precomposed.png"/>
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../../../assets/ico/apple-touch-icon-72-precomposed.png"/>
    <link rel="apple-touch-icon-precomposed" href="../../../assets/ico/apple-touch-icon-57-precomposed.png"/>
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
            <h1 class="page-title">Reporte Kpi Cumplimiento Logistico Estatico</h1>
        </div>
        
        <ul class="breadcrumb">
            <li><a href="home">Home</a> <span class="divider">/</span></li>
            <li class="active">Reporte Kpi Cumplimiento Logistico Estatico</li>
        </ul>

        <div class="container-fluid">
	        <div class="row-fluid">
				<jsp:include page="../../include/messages.jsp" />
				<c:if test="${posted == null}"><tr><td colspan="8">Por favor presionar boton buscar</td></tr></c:if>
				<c:if test="${posted != null}">
				<div class="well">
				    <table id="dataTables-example"  width="100%"  border="0" cellspacing="0" cellpadding="0" style="font-size:13px">
						<tr bgcolor="#305496" style="text-align:left; color:#FFF; font-size:13px; border: solid 1px #a6a6a6;">
							<td></td>
							<td>Estado</td>
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
								SQLFecha = "SELECT  REPLACE (REPLACE (C1.FECHA_COMPROMISO_EOM, '00:', ''), '00','') AS FECHA_COMPROMISO_EOM,   NVL((select count(*) from CUMPLIMIENTO C2 WHERE 1 = 1 AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+prefixclauseCumple2 + prefixclauseCumplimiento2 + prefixclauseCumplimiento_resumen2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+"),0) AS CANTIDAD from CUMPLIMIENTO C1 WHERE 1 = 1 AND C1.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-1, 'YYYY/MM/DD'),'/','-') AND C1.FECHA_COMPROMISO_EOM <= '"+starttime+"' GROUP BY C1.FECHA_COMPROMISO_EOM ORDER BY C1.FECHA_COMPROMISO_EOM ASC";
								//out.println("SQLFecha="+SQLFecha);
								psFecha = connFecha.prepareStatement(SQLFecha, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
								rsFecha = psFecha.executeQuery();
								connFecha.commit();
								int contarFecha = 0;
								int totalProcentajeFecha = 0;
								while(rsFecha.next()) {
									contarFecha = contarFecha + 1;
									totalCantidadFecha = totalCantidadFecha + rsFecha.getInt("CANTIDAD") ;
							%>
							<th>
								<%=rsFecha.getString("FECHA_COMPROMISO_EOM")%>&nbsp;
								<table>
									<tr>
										<td>
											<table>
												<tr>
													<td style="color:#FFF;font-size:13px" align="left" WIDTH="50">Q</td>
													<td style="color:#FFF;font-size:13px" align="left" WIDTH="50">%</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</th>
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
							<td align="left" WIDTH="50">Total Q</td>
							<td align="left" WIDTH="50">Total %</td>
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
						
						PreparedStatement psCumpleResumen = null;
						ResultSet rsCumpleResumen = null;
						String SQLCumpleResumen = null;
						
						PreparedStatement psResponsable = null;
						ResultSet rsResponsable = null;
						String SQLResponsable = null;
						
						//Ocultar
						PreparedStatement psHideCumple = null;
						ResultSet rsHideCumple = null;
						String SQLHideCumple = null;

						PreparedStatement psHideCumplimiento = null;
						ResultSet rsHideCumplimiento = null;
						String SQLHideCumplimiento = null;
						
						PreparedStatement psHideCumpleResumen = null;
						ResultSet rsHideCumpleResumen = null;
						String SQLHideCumpleResumen = null;

						PreparedStatement psHideResponsable = null;
						ResultSet rsHideResponsable = null;
						String SQLHideResponsable = null;

						
						//Mostrar			
						PreparedStatement psShowCumple = null;
						ResultSet rsShowCumple = null;
						String SQLShowCumple = null;
													
						PreparedStatement psShowCumplimiento = null;
						ResultSet rsShowCumplimiento = null;
						String SQLShowCumplimiento = null;
	
						PreparedStatement psShowCumpleResumen = null;
						ResultSet rsShowCumpleResumen = null;
						String SQLShowCumpleResumen = null;
	
						PreparedStatement psShowResponsable = null;
						ResultSet rsShowResponsable = null;
						String SQLShowResponsable = null;
						
						//
						PreparedStatement psShowFechaCumple = null;
						ResultSet rsShowFechaCumple = null;
						String SQLShowFechaCumple = null;
						
						PreparedStatement psShowFechaCumplimiento = null;
						ResultSet rsShowFechaCumplimiento = null;
						String SQLShowFechaCumplimiento = null;
						
						PreparedStatement psShowFechaCumpleResumen = null;
						ResultSet rsShowFechaCumpleResumen = null;
						String SQLShowFechaCumpleResumen = null;
						
						PreparedStatement psShowFechaResponsable = null;
						ResultSet rsShowFechaResponsable = null;
						String SQLShowFechaResponsable = null;
						
						PreparedStatement psShowFecha = null;
						ResultSet rsShowFecha = null;
						String SQLShowFecha = null;
						
						try{
							Class.forName("oracle.jdbc.OracleDriver").newInstance();
							conn = DriverManager.getConnection("jdbc:oracle:thin:@172.18.163.15:1521/XE","kpiweb","kpiweb");//
							conn.setAutoCommit(false);
							SQLCumple = "SELECT  C1.CUMPLE from CUMPLIMIENTO C1 WHERE  1 = 1 " + prefixclauseCumple + "  GROUP BY C1.CUMPLE ORDER BY C1.CUMPLE ASC";
							//out.println("SQLCumple="+SQLCumple);
							//out.print("<br>");
							psCumple = conn.prepareStatement(SQLCumple, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
							rsCumple = psCumple.executeQuery();
							conn.commit();
							int contarCumple = 0;
							while(rsCumple.next()) {
								// start while Cumple
								contarCumple = contarCumple + 1;
						%>
								<script type="text/javascript">
									$(function(){
										<!--0-->
										$("#ocultar_cumplimiento_<%=contarCumple%>").click(function() {
											//alert('ocultar_cumplimiento_<%=contarCumple%>');
											<%
								        	SQLHideCumplimiento = "SELECT  CUMPLE_RESUMEN from CUMPLIMIENTO WHERE  1=1 AND CUMPLE = '"+rsCumple.getString("CUMPLE")+"' GROUP BY CUMPLE_RESUMEN ORDER BY CUMPLE_RESUMEN ASC";
								        	psHideCumplimiento = conn.prepareStatement(SQLHideCumplimiento, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		                                    rsHideCumplimiento = psHideCumplimiento.executeQuery();
		                                    conn.commit();
											int contarHideCumplimiento = 0;
		                                    while(rsHideCumplimiento.next()) {
												contarHideCumplimiento = contarHideCumplimiento + 1;
		                                    %>
												$("#cumplimiento_<%=contarCumple%>_<%=contarHideCumplimiento%>").hide('slow', function() {});
												<%
												SQLHideCumpleResumen = "SELECT  CUMPLIMIENTO_2 from CUMPLIMIENTO WHERE  1=1 AND CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND CUMPLE_RESUMEN = '"+rsHideCumplimiento.getString("CUMPLE_RESUMEN")+"' GROUP BY CUMPLIMIENTO_2 ORDER BY CUMPLIMIENTO_2 ASC";
												psHideCumpleResumen = conn.prepareStatement(SQLHideCumpleResumen, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
												rsHideCumpleResumen = psHideCumpleResumen.executeQuery();
												conn.commit();
												int contarHideCumpleResumen = 0;
												while(rsHideCumpleResumen.next()) {
													contarHideCumpleResumen = contarHideCumpleResumen + 1;
												%>
													$("#cumple_resumen_<%=contarCumple%>_<%=contarHideCumplimiento%>_<%=contarHideCumpleResumen%>").hide('slow', function() {});
													<%
													SQLHideResponsable = "SELECT  RESPONSABLE from CUMPLIMIENTO WHERE  1=1 AND CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND CUMPLE_RESUMEN = '"+rsHideCumplimiento.getString("CUMPLE_RESUMEN")+"' AND CUMPLIMIENTO_2 = '"+rsHideCumpleResumen.getString("CUMPLIMIENTO_2")+"' GROUP BY RESPONSABLE ORDER BY RESPONSABLE ASC";
													psHideResponsable = conn.prepareStatement(SQLHideResponsable, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
													rsHideResponsable = psHideResponsable.executeQuery();
													conn.commit();
													int contarHideResponsable = 0;
													while(rsHideResponsable.next()) {
														contarHideResponsable = contarHideResponsable + 1;
													%>
														$("#responsable_<%=contarCumple%>_<%=contarHideCumplimiento%>_<%=contarHideCumpleResumen%>_<%=contarHideResponsable%>").hide('slow', function() {});
													<%
													}
													%>
													$("#mostrar_responsable_<%=contarCumple%>_<%=contarHideCumplimiento%>_<%=contarHideCumpleResumen%>").show('slow', function() {});//Mostrar responsable
												<%
												}
												%>
												$("#mostrar_cumple_resumen_<%=contarCumple%>_<%=contarHideCumplimiento%>").show('slow', function() {});//Mostrar cumple resumen
											<%
											}
											%>
											$("#mostrar_cumplimiento_<%=contarCumple%>").show('slow', function() {});
											$("#ocultar_cumplimiento_<%=contarCumple%>").hide('slow', function() {});
										});
										
										$("#mostrar_cumplimiento_<%=contarCumple%>").click(function() {
											//alert('mostrar_cumplimiento_<%=contarCumple%>');
											<%
								        	SQLShowCumplimiento = "SELECT  CUMPLE_RESUMEN from CUMPLIMIENTO WHERE  1=1 AND CUMPLE = '"+rsCumple.getString("CUMPLE")+"' GROUP BY CUMPLE_RESUMEN ORDER BY CUMPLE_RESUMEN ASC";
								        	psShowCumplimiento = conn.prepareStatement(SQLShowCumplimiento, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		                                    rsShowCumplimiento = psShowCumplimiento.executeQuery();
		                                    conn.commit();
											int contarShowCumplimiento = 0;
		                                    while(rsShowCumplimiento.next()) {
												contarShowCumplimiento = contarShowCumplimiento + 1;
		                                    %>
												$("#cumplimiento_<%=contarCumple%>_<%=contarShowCumplimiento%>").show('slow', function() {});
												$("#ocultar_cumple_resumen_<%=contarCumple%>_<%=contarShowCumplimiento%>").hide('slow', function() {});//Mostrar cumple resumen
												<%
												SQLShowCumpleResumen = "SELECT  CUMPLIMIENTO_2 from CUMPLIMIENTO WHERE  1=1 AND CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND CUMPLE_RESUMEN = '"+rsShowCumplimiento.getString("CUMPLE_RESUMEN")+"'  GROUP BY CUMPLIMIENTO_2 ORDER BY CUMPLIMIENTO_2 ASC";
												psShowCumpleResumen = conn.prepareStatement(SQLShowCumpleResumen, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
												rsShowCumpleResumen = psShowCumpleResumen.executeQuery();
												conn.commit();
												int contarShowCumpleResumen = 0;
												while(rsShowCumpleResumen.next()) {
													contarShowCumpleResumen = contarShowCumpleResumen + 1;
												%>
													$("#ocultar_responsable_<%=contarCumple%>_<%=contarShowCumplimiento%>_<%=contarShowCumpleResumen%>").hide('slow', function() {});////
												<%
												}
												%>
											<%
											}
											%>
											$("#ocultar_cumplimiento_<%=contarCumple%>").show('slow', function() {});
											$("#mostrar_cumplimiento_<%=contarCumple%>").hide('slow', function() {});
										});
									});
								</script>
								<tr style="background-color:#8ea9db;color:#FFF; " >
									<td>-</td>
									<td align="left" nowrap="nowrap" ><i class="icon-reorder"></i>&nbsp;<%=rsCumple.getString("CUMPLE")%></td>
									<%
									
									SQLShowFecha = "SELECT  C1.FECHA_COMPROMISO_EOM, NVL((select count(*) from CUMPLIMIENTO C2 WHERE 1 = 1 AND C2.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+ prefixclauseCumplimiento2 + prefixclauseCumplimiento_resumen2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+"),0) AS CANTIDAD,  NVL( (CASE WHEN ((select count(*) from CUMPLIMIENTO C2  where 1 = 1 AND C2.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+ prefixclauseCumplimiento2 + prefixclauseCumplimiento_resumen2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")>0 AND (select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+ prefixclauseCumple2 + prefixclauseCumplimiento2 + prefixclauseCumplimiento_resumen2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")>0)  THEN (ROUND( TO_NUMBER(( (select count(*) from CUMPLIMIENTO C2  where 1 = 1 AND C2.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+ prefixclauseCumplimiento2 + prefixclauseCumplimiento_resumen2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")/(select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+ prefixclauseCumple2 + prefixclauseCumplimiento2 + prefixclauseCumplimiento_resumen2  + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")  * 100) ), 2 )) ELSE 0 END),0) AS PORCENTAJE  from CUMPLIMIENTO C1 WHERE 1 = 1 AND C1.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-1, 'YYYY/MM/DD'),'/','-') AND C1.FECHA_COMPROMISO_EOM <= '"+starttime+"'  GROUP BY C1.FECHA_COMPROMISO_EOM ORDER BY C1.FECHA_COMPROMISO_EOM ASC";
									//out.println("SQLShowFechaCumple="+SQLShowFecha);
									//out.print("<br>");
								    psShowFecha = conn.prepareStatement(SQLShowFecha, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		                            rsShowFecha = psShowFecha.executeQuery();
		                            conn.commit();
		                            int contarShowFechaCumple = 0;
									int totalCantidadCumple = 0;
									int totalProcentajeCumple = 0;
		                            while(rsShowFecha.next()) {
		                            	contarShowFechaCumple = contarShowFechaCumple + 1;
										totalCantidadCumple = totalCantidadCumple + rsShowFecha.getInt("CANTIDAD") ;
		                            %>		
									<td>
										<table>
											<tr>
												<td>
													<table>
														<tr>
															<td  style="color:#FFF;font-size:13px" align="left" WIDTH="50" nowrap="nowrap">
															<%
															 DecimalFormat formatea = new DecimalFormat("###,###.##");
															 out.println(formatea.format(rsShowFecha.getInt("CANTIDAD")));
															 %>
															</td>
															<td  style="color:#FFF;font-size:13px" align="left" WIDTH="50" nowrap="nowrap">
															<%
															DecimalFormat df = new DecimalFormat("0.00"); 
															out.println(df.format(rsShowFecha.getFloat("PORCENTAJE"))+"%");
															%>
															</td>
														</tr>
													</table>
												</td>
											</tr>
										</table>
									</td>
									<%
									}
									%>
									<td align="left" WIDTH="50" nowrap="nowrap"><fmt:formatNumber maxFractionDigits="3" value="<%=totalCantidadCumple%>"  type="number"/></td>
									<td align="left" WIDTH="50" nowrap="nowrap">
									<%
									if (totalCantidadCumple == 0 && totalCantidadFecha == 0) {
										out.println("-");
									} else {
										float resultCumple = ((float ) ( (float ) totalCantidadCumple / (float )totalCantidadFecha) * 100);
										DecimalFormat df = new DecimalFormat("0.00"); 
										out.println(df.format(resultCumple));
									}
									%>
									%</td>
								</tr>
							
								<!-- Segunda Fila Cumplimiento -->
								<%
								SQLCumplimiento = "SELECT  C1.CUMPLE_RESUMEN from CUMPLIMIENTO C1 WHERE  1=1 AND C1.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' " +prefixclauseCumplimiento +  prefixclauseCumplimiento + prefixclauseCumplimiento_resumen + " GROUP BY C1.CUMPLE_RESUMEN ORDER BY C1.CUMPLE_RESUMEN ASC";
								//out.println("SQLCumplimiento="+SQLCumplimiento);
								//out.print("<br>");
								psCumplimiento = conn.prepareStatement(SQLCumplimiento, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
								rsCumplimiento = psCumplimiento.executeQuery();
								conn.commit();
								int contarCumplimiento = 0;
								while(rsCumplimiento.next()) {
									// start while Cumplimiento
									contarCumplimiento = contarCumplimiento + 1;
									//out.print("contarCumplimiento = "+contarCumplimiento);
									//out.print("<br>");
								%>
						
									<script type="text/javascript">
										$(function(){
											<!--0-->
											$("#ocultar_cumple_resumen_<%=contarCumple%>_<%=contarCumplimiento%>").click(function() {
												//alert('ocultar_cumple_resumen_0');
												<%
												SQLHideCumpleResumen = "SELECT  CUMPLIMIENTO_2 from CUMPLIMIENTO WHERE  1=1 AND CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND CUMPLE_RESUMEN = '"+rsCumplimiento.getString("CUMPLE_RESUMEN")+"' GROUP BY CUMPLIMIENTO_2 ORDER BY CUMPLIMIENTO_2 ASC";
												psHideCumpleResumen = conn.prepareStatement(SQLHideCumpleResumen, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
												rsHideCumpleResumen = psHideCumpleResumen.executeQuery();
												conn.commit();
												int contarHideCumpleResumen = 0;
												while(rsHideCumpleResumen.next()) {
													contarHideCumpleResumen = contarHideCumpleResumen + 1;
												%>
													$("#cumple_resumen_<%=contarCumple%>_<%=contarCumplimiento%>_<%=contarHideCumpleResumen%>").hide('slow', function() {});
													<%
													SQLHideResponsable = "SELECT  RESPONSABLE from CUMPLIMIENTO WHERE  1=1 AND CUMPLE = '"+rsCumple.getString("CUMPLE")+"'  AND CUMPLE_RESUMEN = '"+rsCumplimiento.getString("CUMPLE_RESUMEN")+"' AND CUMPLIMIENTO_2 = '"+rsHideCumpleResumen.getString("CUMPLIMIENTO_2")+"' GROUP BY RESPONSABLE ORDER BY RESPONSABLE ASC";
													psHideResponsable = conn.prepareStatement(SQLHideResponsable, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
													rsHideResponsable = psHideResponsable.executeQuery();
													conn.commit();
													int contarHideResponsable = 0;
													while(rsHideResponsable.next()) {
														contarHideResponsable = contarHideResponsable + 1;
													%>
												
													$("#responsable_<%=contarCumple%>_<%=contarCumplimiento%>_<%=contarHideCumpleResumen%>_<%=contarHideResponsable%>").hide('slow', function() {});
													<%
													}
													%>
													$("#mostrar_responsable_<%=contarCumple%>_<%=contarCumplimiento%>_<%=contarHideCumpleResumen%>").show('slow', function() {});////
												<%
												}
												%>
												$("#ocultar_cumple_resumen_<%=contarCumple%>_<%=contarCumplimiento%>").hide('slow', function() {});
												$("#mostrar_cumple_resumen_<%=contarCumple%>_<%=contarCumplimiento%>").show('slow', function() {});
											});
											$("#mostrar_cumple_resumen_<%=contarCumple%>_<%=contarCumplimiento%>").click(function() {
												//alert('mostrar_cumple_resumen_<%=contarCumple%>_<%=contarCumplimiento%>');
												<%
												SQLShowCumpleResumen = "SELECT  CUMPLIMIENTO_2 from CUMPLIMIENTO WHERE  1=1 AND CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND CUMPLE_RESUMEN = '"+rsCumplimiento.getString("CUMPLE_RESUMEN")+"' GROUP BY CUMPLIMIENTO_2 ORDER BY CUMPLIMIENTO_2 ASC";
												psShowCumpleResumen = conn.prepareStatement(SQLShowCumpleResumen, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
												rsShowCumpleResumen = psShowCumpleResumen.executeQuery();
												conn.commit();
												int contarShowCumpleResumen = 0;
												while(rsShowCumpleResumen.next()) {
													contarShowCumpleResumen = contarShowCumpleResumen + 1;
												%>
													$("#cumple_resumen_<%=contarCumple%>_<%=contarCumplimiento%>_<%=contarShowCumpleResumen%>").show('slow', function() {});
													$("#ocultar_responsable_<%=contarCumple%>_<%=contarCumplimiento%>_<%=contarShowCumpleResumen%>").hide('slow', function() {});//;
												<%
												}
												%>
												$("#ocultar_cumple_resumen_<%=contarCumple%>_<%=contarCumplimiento%>").show('slow', function() {});
												$("#mostrar_cumple_resumen_<%=contarCumple%>_<%=contarCumplimiento%>").hide('slow', function() {});
											});	
										});
									</script>
									<tr id="cumplimiento_<%=contarCumple%>_<%=contarCumplimiento%>" style="background-color:#d9e1f2;color:#000000;" >
										<td>-</td>
										<td nowrap="nowrap"><i class="icon-reorder"></i>&nbsp;<%=rsCumplimiento.getString("CUMPLE_RESUMEN")%></td>	 
										<%
										SQLShowFecha = "SELECT  C1.FECHA_COMPROMISO_EOM, NVL((select count(*) from CUMPLIMIENTO C2 WHERE 1 = 1 AND C2.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND C2.CUMPLE_RESUMEN = '"+rsCumplimiento.getString("CUMPLE_RESUMEN")+"' AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+ prefixclauseCumplimiento_resumen2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+"),0) AS CANTIDAD,  NVL( (CASE WHEN ((select count(*) from CUMPLIMIENTO C2  where 1 = 1 AND C2.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND C2.CUMPLE_RESUMEN = '"+rsCumplimiento.getString("CUMPLE_RESUMEN")+"' AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+ prefixclauseCumplimiento_resumen2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")>0 AND (select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+ prefixclauseCumple2 + prefixclauseCumplimiento2 + prefixclauseCumplimiento_resumen2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")>0)  THEN (ROUND( TO_NUMBER(( (select count(*) from CUMPLIMIENTO C2  where 1 = 1 AND C2.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND C2.CUMPLE_RESUMEN = '"+rsCumplimiento.getString("CUMPLE_RESUMEN")+"' AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+ prefixclauseCumplimiento_resumen + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")/(select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+ prefixclauseCumple2 + prefixclauseCumplimiento2 + prefixclauseCumplimiento_resumen2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")  * 100) ), 2 )) ELSE 0 END),0) AS PORCENTAJE  from CUMPLIMIENTO C1 WHERE 1 = 1 AND C1.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-1, 'YYYY/MM/DD'),'/','-') AND C1.FECHA_COMPROMISO_EOM <= '"+starttime+"' GROUP BY C1.FECHA_COMPROMISO_EOM ORDER BY C1.FECHA_COMPROMISO_EOM ASC";
										//out.print("SQLShowFechaCumplimiento = "+SQLShowFecha);
										//out.print("<br>");
										psShowFecha = conn.prepareStatement(SQLShowFecha, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
										rsShowFecha = psShowFecha.executeQuery();
										conn.commit();
										int contarShowFechaCumplimiento = 0;
										int totalCantidadCumplimiento = 0;
										int totalProcentajeCumplimiento = 0;
										while(rsShowFecha.next()) {
											contarShowFechaCumplimiento = contarShowFechaCumplimiento + 1;
											totalCantidadCumplimiento = totalCantidadCumplimiento + rsShowFecha.getInt("CANTIDAD") ;
										%>						
										<td>
											<table>
												<tr>
													<td>
														<table>
															<tr>
																<td style="font-size:13px" align="left" WIDTH="50" nowrap="nowrap">
																<%
																 DecimalFormat formatea = new DecimalFormat("###,###.##");
																 out.println(formatea.format(rsShowFecha.getInt("CANTIDAD")));
																 %>
																</td>
																<td style="font-size:13px" align="left" WIDTH="50" nowrap="nowrap">
																<%
																DecimalFormat df = new DecimalFormat("0.00"); 
															 	out.println(df.format(rsShowFecha.getFloat("PORCENTAJE"))+"%");
																%></td>
															</tr>
														</table>
													</td>
												</tr>
											</table>
										</td>
										<%
										}
										%>
										<td align="left" WIDTH="50" nowrap="nowrap"><fmt:formatNumber maxFractionDigits="3" value="<%=totalCantidadCumplimiento%>"  type="number"/></td>
										<td align="left" WIDTH="50" nowrap="nowrap">
										<%
										if (totalCantidadCumplimiento == 0 && totalCantidadFecha == 0) {
											out.println("-");
										} else {
											float resultCumplimiento = ((float ) ( (float ) totalCantidadCumplimiento / (float )totalCantidadFecha) * 100);
											DecimalFormat df = new DecimalFormat("0.00"); 
											out.println(df.format(resultCumplimiento));
										}
										%>
										%</td>
									</tr>
									<!-- Tercera Fila CumpleResumen -->
									<%
									SQLCumpleResumen = "SELECT  C1.CUMPLIMIENTO_2 from CUMPLIMIENTO C1 WHERE  1=1 AND C1.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND C1.CUMPLE_RESUMEN = '"+rsCumplimiento.getString("CUMPLE_RESUMEN")+"' " +prefixclauseCumplimiento_resumen+ " GROUP BY C1.CUMPLIMIENTO_2 ORDER BY C1.CUMPLIMIENTO_2 ASC";
									//out.println("SQLCumpleResumen="+SQLCumpleResumen);
									//out.print("<br>");
									psCumpleResumen = conn.prepareStatement(SQLCumpleResumen, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
									rsCumpleResumen = psCumpleResumen.executeQuery();
									conn.commit();
									int contarCumpleResumen = 0;
									while(rsCumpleResumen.next()) {
										contarCumpleResumen = contarCumpleResumen + 1;
									%>
										<script type="text/javascript">
											$(function(){
												<!--0-->
												$("#ocultar_responsable_<%=contarCumple%>_<%=contarCumplimiento%>_<%=contarCumpleResumen%>").click(function() {
													//alert('ocultar_responsable_<%=contarCumple%>_<%=contarCumplimiento%>_<%=contarCumpleResumen%>');
													<%
													SQLHideResponsable = "SELECT  RESPONSABLE from CUMPLIMIENTO WHERE  1 = 1  AND CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND CUMPLE_RESUMEN = '"+rsCumplimiento.getString("CUMPLE_RESUMEN")+"' AND CUMPLIMIENTO_2 = '"+rsCumpleResumen.getString("CUMPLIMIENTO_2")+"' GROUP BY RESPONSABLE ORDER BY RESPONSABLE ASC";
													psHideResponsable = conn.prepareStatement(SQLHideResponsable, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
													rsHideResponsable = psHideResponsable.executeQuery();
													conn.commit();
													int contarHideResponsable = 0;
													while(rsHideResponsable.next()) {
														contarHideResponsable = contarHideResponsable + 1;
													%>
														$("#responsable_<%=contarCumple%>_<%=contarCumplimiento%>_<%=contarCumpleResumen%>_<%=contarHideResponsable%>").hide('slow', function() {});
													<%
													}
													%>
													$("#mostrar_responsable_<%=contarCumple%>_<%=contarCumplimiento%>_<%=contarCumpleResumen%>").show('slow', function() {});
													$("#ocultar_responsable_<%=contarCumple%>_<%=contarCumplimiento%>_<%=contarCumpleResumen%>").hide('slow', function() {});
												});
												$("#mostrar_responsable_<%=contarCumple%>_<%=contarCumplimiento%>_<%=contarCumpleResumen%>").click(function() {
													//alert('mostrar_responsable_<%=contarCumple%>_<%=contarCumplimiento%>_<%=contarCumpleResumen%>');
													<%
													SQLShowResponsable = "SELECT  RESPONSABLE from CUMPLIMIENTO WHERE  1 = 1  AND CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND CUMPLE_RESUMEN = '"+rsCumplimiento.getString("CUMPLE_RESUMEN")+"' AND CUMPLIMIENTO_2 = '"+rsCumpleResumen.getString("CUMPLIMIENTO_2")+"'  GROUP BY RESPONSABLE ORDER BY RESPONSABLE ASC";
													psShowResponsable = conn.prepareStatement(SQLShowResponsable, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
													rsShowResponsable = psShowResponsable.executeQuery();
													conn.commit();
													int contarShowResponsable = 0;
													while(rsShowResponsable.next()) {
														contarShowResponsable = contarShowResponsable + 1;
													%>
														$("#responsable_<%=contarCumple%>_<%=contarCumplimiento%>_<%=contarCumpleResumen%>_<%=contarShowResponsable%>").show('slow', function() {});
													<%
													}
													%>
													$("#ocultar_responsable_<%=contarCumple%>_<%=contarCumplimiento%>_<%=contarCumpleResumen%>").show('slow', function() {});
													$("#mostrar_responsable_<%=contarCumple%>_<%=contarCumplimiento%>_<%=contarCumpleResumen%>").hide('slow', function() {});
												});	
											});
										</script>
										<tr id="cumple_resumen_<%=contarCumple%>_<%=contarCumplimiento%>_<%=contarCumpleResumen%>"  style="background-color:#b7ecff;color:#000000;">
											<td>-</td>
											<td nowrap="nowrap"><i class="icon-reorder"></i>&nbsp;<%=rsCumpleResumen.getString("CUMPLIMIENTO_2")%></td>
											<%
											SQLShowFecha = "SELECT  C1.FECHA_COMPROMISO_EOM, NVL((select count(*) from CUMPLIMIENTO C2 WHERE 1 = 1 AND C2.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND C2.CUMPLE_RESUMEN = '"+rsCumplimiento.getString("CUMPLE_RESUMEN")+"' AND C2.CUMPLIMIENTO_2 = '"+rsCumpleResumen.getString("CUMPLIMIENTO_2")+"' AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+ prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+"),0) AS CANTIDAD,  NVL( (CASE WHEN ((select count(*) from CUMPLIMIENTO C2  where 1 = 1 AND C2.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND C2.CUMPLE_RESUMEN = '"+rsCumplimiento.getString("CUMPLE_RESUMEN")+"' AND C2.CUMPLIMIENTO_2 = '"+rsCumpleResumen.getString("CUMPLIMIENTO_2")+"' AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+ prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")>0 AND (select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+ prefixclauseCumple2 + prefixclauseCumplimiento2 + prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")>0)  THEN (ROUND( TO_NUMBER(( (select count(*) from CUMPLIMIENTO C2  where 1 = 1 AND C2.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND C2.CUMPLE_RESUMEN = '"+rsCumplimiento.getString("CUMPLE_RESUMEN")+"' AND C2.CUMPLIMIENTO_2 = '"+rsCumpleResumen.getString("CUMPLIMIENTO_2")+"' AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+ prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")/(select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+prefixclauseCumple2 + prefixclauseCumplimiento2 + prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")  * 100) ), 2 )) ELSE 0 END),0) AS PORCENTAJE  from CUMPLIMIENTO C1 WHERE 1 = 1 AND C1.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-1, 'YYYY/MM/DD'),'/','-') AND C1.FECHA_COMPROMISO_EOM <= '"+starttime+"' GROUP BY C1.FECHA_COMPROMISO_EOM ORDER BY C1.FECHA_COMPROMISO_EOM ASC";
											//out.print("SQLShowFechaCumpleResumen = "+SQLShowFecha);
											//out.print("<br>");
											psShowFecha = conn.prepareStatement(SQLShowFecha, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
											rsShowFecha = psShowFecha.executeQuery();
											conn.commit();
											int contarShowFechaCumpleResumen = 0;
											int totalCantidadCumpleResumen = 0;
											int totalProcentajeCumpleResumen = 0;
											while(rsShowFecha.next()) {
												contarShowFechaCumpleResumen = contarShowFechaCumpleResumen + 1;
												totalCantidadCumpleResumen = totalCantidadCumpleResumen + rsShowFecha.getInt("CANTIDAD") ;
											%>	
												<td>
													<table>
														<tr>
															<td>
																<table>
																	<tr>
																		<td style="font-size:13px" align="left" WIDTH="50" nowrap="nowrap">
																		<%
																		 DecimalFormat formatea = new DecimalFormat("###,###.##");
																		 out.println(formatea.format(rsShowFecha.getInt("CANTIDAD")));
																		 %>
																		</td>
																		<td style="font-size:13px" align="left" WIDTH="50" nowrap="nowrap">
																		<%
																		DecimalFormat df = new DecimalFormat("0.00"); 
																		 out.println(df.format(rsShowFecha.getFloat("PORCENTAJE"))+"%");
																		%></td>
																	</tr>
																</table>
															</td>
														</tr>
													</table>
												</td>
											<%
											}
											%>
											<td align="left" WIDTH="50" nowrap="nowrap"><fmt:formatNumber maxFractionDigits="3" value="<%=totalCantidadCumpleResumen%>"  type="number"/></td>
											<td align="left" WIDTH="50" nowrap="nowrap">
											<%
											if (totalCantidadCumpleResumen == 0 && totalCantidadFecha == 0) {
												out.println("-");
											} else {
												float resultCumpleResumen = ((float ) ( (float )  totalCantidadCumpleResumen / (float )totalCantidadFecha) * 100);
												DecimalFormat df = new DecimalFormat("0.00"); 
												out.println(df.format(resultCumpleResumen)+"%");
											}
											%></td>
										</tr>
										<!-- Cuarta Fila Responsable -->
										<%
										SQLResponsable = "SELECT  C1.RESPONSABLE from CUMPLIMIENTO C1 WHERE  1 = 1 AND C1.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND C1.CUMPLE_RESUMEN = '"+rsCumplimiento.getString("CUMPLE_RESUMEN")+"' AND C1.CUMPLIMIENTO_2 = '"+rsCumpleResumen.getString("CUMPLIMIENTO_2")+"' "+prefixclauseResponsable+" GROUP BY C1.RESPONSABLE ORDER BY C1.RESPONSABLE ASC";
										//out.println("SQLResponsable="+SQLResponsable);
										//out.print("<br>");
										psResponsable = conn.prepareStatement(SQLResponsable, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
										rsResponsable = psResponsable.executeQuery();
										conn.commit();
										int contarResponsable = 0;
										while(rsResponsable.next()) {
											// start while Responsable
											contarResponsable = contarResponsable + 1;
											//out.print("contarResponsable = "+contarResponsable);
											//out.print("<br>");
											
										%>
											<tr id="responsable_<%=contarCumple%>_<%=contarCumplimiento%>_<%=contarCumpleResumen%>_<%=contarResponsable%>">
												<td>-</td>
												<td style="background-color:#FFF;color:#000000" nowrap="nowrap"><i class="icon-reorder"></i>&nbsp;<%=rsResponsable.getString("RESPONSABLE")%></td>
												<%
												SQLShowFecha = "SELECT  C1.FECHA_COMPROMISO_EOM, NVL((select count(*) from CUMPLIMIENTO C2 WHERE 1 = 1 AND C2.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND C2.CUMPLE_RESUMEN = '"+rsCumplimiento.getString("CUMPLE_RESUMEN")+"' AND C2.CUMPLIMIENTO_2 = '"+rsCumpleResumen.getString("CUMPLIMIENTO_2")+"' AND RESPONSABLE = '"+rsResponsable.getString("RESPONSABLE")+"' AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+"),0) AS CANTIDAD,  NVL( (CASE WHEN ((select count(*) from CUMPLIMIENTO C2  where 1 = 1 AND C2.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND C2.CUMPLE_RESUMEN = '"+rsCumplimiento.getString("CUMPLE_RESUMEN")+"' AND C2.CUMPLIMIENTO_2 = '"+rsCumpleResumen.getString("CUMPLIMIENTO_2")+"' AND RESPONSABLE = '"+rsResponsable.getString("RESPONSABLE")+"' AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")>0 AND (select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+ prefixclauseCumple2 + prefixclauseCumplimiento2 + prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")>0)  THEN (ROUND( TO_NUMBER(( (select count(*) from CUMPLIMIENTO C2  where 1 = 1 AND C2.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND C2.CUMPLE_RESUMEN = '"+rsCumplimiento.getString("CUMPLE_RESUMEN")+"' AND C2.CUMPLIMIENTO_2 = '"+rsCumpleResumen.getString("CUMPLIMIENTO_2")+"' AND RESPONSABLE = '"+rsResponsable.getString("RESPONSABLE")+"' AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")/(select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+prefixclauseCumple2 + prefixclauseCumplimiento2 + prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")  * 100) ), 2 )) ELSE 0 END),0) AS PORCENTAJE  from CUMPLIMIENTO C1 WHERE 1 = 1 AND C1.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-1, 'YYYY/MM/DD'),'/','-') AND C1.FECHA_COMPROMISO_EOM <= '"+starttime+"' GROUP BY C1.FECHA_COMPROMISO_EOM ORDER BY C1.FECHA_COMPROMISO_EOM ASC";
												//out.print("SQLShowFechaResponsable = "+SQLShowFecha);
												//out.print("<br>");
												psShowFecha = conn.prepareStatement(SQLShowFecha, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
												rsShowFecha = psShowFecha.executeQuery();
												conn.commit();
												int contarShowFechaResponsable = 0;
												int totalCantidadResponsable = 0;
												int totalProcentajeResponsable = 0;
												while(rsShowFecha.next()) {
													contarShowFechaResponsable = contarShowFechaResponsable + 1;
													totalCantidadResponsable = totalCantidadResponsable + rsShowFecha.getInt("CANTIDAD") ;
												%>	
												<td>
													<table>
														<tr>
															<td>
																<table>
																	<tr>
																		<td style="font-size:13px" align="left" WIDTH="50" nowrap="nowrap">
																		<%
																		 DecimalFormat formatea = new DecimalFormat("###,###.##");
																		 out.println(formatea.format(rsShowFecha.getInt("CANTIDAD")));
															 			%>
																		</td>
																		<td style="font-size:13px" align="left" WIDTH="50" nowrap="nowrap">
																		<%
																		DecimalFormat df = new DecimalFormat("0.00"); 
																		out.println(df.format(rsShowFecha.getFloat("PORCENTAJE"))+"%");
																		%></td>
																	</tr>
																</table>
															</td>
														</tr>
													</table>
												</td>
												<%
												}
												%>
												<td align="left" WIDTH="50" nowrap="nowrap"><fmt:formatNumber maxFractionDigits="3" value="<%=totalCantidadResponsable%>"  type="number"/></td>
												<td align="left" WIDTH="50" nowrap="nowrap">
												<%
												if (totalCantidadResponsable == 0 && totalCantidadFecha == 0) {
													out.println("-");
												} else {
													float resultResponsable = ((float ) ( (float ) totalCantidadResponsable / (float )totalCantidadFecha) * 100);
													DecimalFormat df = new DecimalFormat("0.00"); 
													out.println(df.format(resultResponsable)+"%");
												}
												%></td>
											</tr>
										<%
										}	// end while Resumen
									} //end while CumpleResumen 
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
							if (rsCumpleResumen != null) rsCumpleResumen.close();
							if (rsResponsable != null) rsResponsable.close();
							
							if (psCumple != null) psCumple.close();
							if (psCumplimiento != null) psCumplimiento.close();
							if (psCumpleResumen != null) psCumpleResumen.close();
							if (psResponsable != null) psResponsable.close();
							
							if (rsHideCumple != null) rsHideCumple.close();
							if (rsHideCumplimiento != null) rsHideCumplimiento.close();
							if (rsHideCumpleResumen != null) rsHideCumpleResumen.close();
							if (rsHideResponsable != null) rsHideResponsable.close();
							if (rsShowCumple != null) rsShowCumple.close();
							if (rsShowCumplimiento != null) rsShowCumplimiento.close();
							if (rsShowCumpleResumen != null) rsShowCumpleResumen.close();
							if (rsShowResponsable != null) rsShowResponsable.close();
							
							if (psHideCumple != null) psHideCumple.close();
							if (psHideCumplimiento != null) psHideCumplimiento.close();
							if (psHideCumpleResumen != null) psHideCumpleResumen.close();
							if (psHideResponsable != null) psHideResponsable.close();
							if (psShowCumple != null) psShowCumple.close();
							if (psShowCumplimiento != null) psShowCumplimiento.close();
							if (psShowCumpleResumen != null) psShowCumpleResumen.close();
							if (psShowResponsable != null) psShowResponsable.close();
							
							if (psShowFecha != null) psShowFecha.close();
							if (rsShowFecha != null) rsShowFecha.close();

							if (conn != null) conn.close();
						} 
						%>
						<!-- ################FIN 0################## --> 
						<tr style="background-color:#305496;color:#FFF">
							<td></td>
							<td>Total General</td>
							<%
							Connection connTotal = null;
							PreparedStatement psTotal = null;
							ResultSet rsTotal = null;
							String SQLTotal = null;
							int totalesCantidad = 0;
							int totalesProcentaje = 0;
							
							int totalesCantidadCumple = 0;
							
							GraficosDTO grafico = null;
							List<GraficosDTO> result = new ArrayList<GraficosDTO>();
							try{
								Class.forName("oracle.jdbc.OracleDriver").newInstance();
								connTotal = DriverManager.getConnection("jdbc:oracle:thin:@172.18.163.15:1521/XE","kpiweb","kpiweb");//
								connTotal.setAutoCommit(false);
								SQLTotal = "SELECT  REPLACE (REPLACE (CONCAT(''''||C1.FECHA_COMPROMISO_EOM,''''), '00:', ''), '00.0','') AS FECHA_COMPROMISO_EOM, NVL((select count(*) from CUMPLIMIENTO C2 WHERE 1 = 1  AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+prefixclauseCumple2 + prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+"),0) AS CANTIDAD,  NVL( (CASE WHEN ((select count(*) from CUMPLIMIENTO C2  where 1 = 1  AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+ prefixclauseCumple2 + prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")>0 AND (select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+prefixclauseCumple2 + prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")>0)  THEN (ROUND( TO_NUMBER(( (select count(*) from CUMPLIMIENTO C2  where 1 = 1  AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+ prefixclauseCumple2 + prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")/(select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+prefixclauseCumple2 + prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")  * 100) ), 2 )) ELSE 0 END),0) AS PORCENTAJE  from CUMPLIMIENTO C1 WHERE 1 =1 AND C1.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-1, 'YYYY/MM/DD'),'/','-') AND C1.FECHA_COMPROMISO_EOM <= '"+starttime+"' GROUP BY C1.FECHA_COMPROMISO_EOM ORDER BY C1.FECHA_COMPROMISO_EOM ASC";
								//out.println("SQLTotal="+SQLTotal);
								//out.print("<br>");
								psTotal = connTotal.prepareStatement(SQLTotal, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
								rsTotal = psTotal.executeQuery();
								connTotal.commit();
								int contarTotal = 0;
							
								while(rsTotal.next()) {
									
									grafico = new GraficosDTO();
									grafico.setId(new Long(1));
									grafico.setFechaCompromiso(rsTotal.getString("FECHA_COMPROMISO_EOM"));
									grafico.setCantidad(rsTotal.getInt("CANTIDAD"));
									grafico.setPorcentaje(rsTotal.getFloat("PORCENTAJE"));
									result.add(grafico);
									contarTotal = contarTotal + 1;
									totalesCantidad = totalesCantidad + rsTotal.getInt("CANTIDAD") ;
									totalesProcentaje = totalesProcentaje + rsTotal.getInt("PORCENTAJE") ;
							%>
							<th>
								<table>
									<tr>
										<td>
											<table>
												<tr>
													<td style="color:#FFF;font-size:13px" align="left" WIDTH="50" nowrap="nowrap">
													<%
													DecimalFormat formatea = new DecimalFormat("###,###.##");
													out.println(formatea.format(rsTotal.getInt("CANTIDAD")));
													%>
													</td>
													<td style="color:#FFF;font-size:13px" align="left" WIDTH="55" nowrap="nowrap">
													<%
													DecimalFormat df = new DecimalFormat("0.00"); 
													out.println(df.format(rsTotal.getFloat("PORCENTAJE"))+"%");
													%>
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</th>
							
							<%
								}  // end while Total
							} catch (SQLException exQL) {
								connTotal.rollback();
								out.println("Error SQL: " + exQL.getMessage());	
							} catch (Exception ex) {
								connTotal.rollback();
								out.println("Error: " + ex.getMessage());
							} finally {
								if (rsTotal != null) rsTotal.close();
								if (psTotal != null) psTotal.close();
								if (connTotal != null) connTotal.close();
							} 
							%>
							
							<td nowrap="nowrap"><fmt:formatNumber maxFractionDigits="3" value="<%=totalesCantidad%>"  type="number"/></td>
							<td nowrap="nowrap">
							<%
							float resultTotal = 0;
							if (totalesCantidad == 0 && totalCantidadFecha == 0) {
								out.println("-");
								resultTotal = 0;
							} else {
								resultTotal = ((float ) ( (float ) totalesCantidad / (float )totalCantidadFecha) * 100);
								DecimalFormat df = new DecimalFormat("0.00"); 
								out.println(df.format(resultTotal));
							}
							%>%
							
							
							</td>
						</tr>
					</table>
				</div>
				<br>
		</c:if>					
	        </div>
        </div>
    </div>
  </body>
</html>


