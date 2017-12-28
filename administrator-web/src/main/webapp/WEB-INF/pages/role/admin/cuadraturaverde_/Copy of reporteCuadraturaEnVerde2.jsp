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
	response.setHeader("Content-Disposition", "inline; filename=" + "PrintVentaEnVerdeExcel.xls");
}
String dateInicio =  request.getParameter("dateInicio");


out.println("estado="+request.getParameter("estado"));

//out.println("dateInicio="+dateInicio);
//String starttime = DateUtils.turnDate(dateInicio) != null?DateUtils.turnDate(dateInicio):DateUtils.turnDate(currentDate);

String starttime = DateUtils.turnDate3(dateInicio) != null?DateUtils.turnDate3(dateInicio):DateUtils.turnDate3(currentDate);
String starttime2 = DateUtils.turnDate4(dateInicio) != null?DateUtils.turnDate4(dateInicio):DateUtils.turnDate4(currentDate);

out.println("starttime="+starttime);
out.println("starttime2="+starttime2);

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

if (request.getParameterValues("tipo_estado") != null) {
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


if (request.getParameterValues("cumplimiento") != null) {
	prefixclauseCumplimiento +=" AND ( ";
	prefixclauseCumplimiento2 +=" AND ( ";
	prefixclauseCumplimientoExport +=" AND ( ";

	for(String cumplimiento: cumplimientos) {
		prefixclauseCumplimiento += " C1.CUMPLE_RESUMEN = '" +  cumplimiento + "' OR ";
		prefixclauseCumplimiento2 += " C2.CUMPLE_RESUMEN = '" +  cumplimiento + "' OR ";
		prefixclauseCumplimientoExport += " C2.CUMPLE_RESUMEN = '" +  cumplimiento + "' OR ";

	}
	prefixclauseCumplimiento += " C1.CUMPLE_RESUMEN = 'defaultid') ";
	prefixclauseCumplimiento2 += " C2.CUMPLE_RESUMEN = 'defaultid') ";
	prefixclauseCumplimientoExport += " C2.CUMPLE_RESUMEN = 'defaultid') ";
}

if (request.getParameterValues("cumple_resumen") != null) {
	prefixclauseCumplimiento_resumen +=" AND ( ";
	prefixclauseCumplimiento_resumen2 +=" AND ( ";
	prefixclauseCumplimiento_resumenExport +=" AND ( ";

	for(String cumplimientoResumene: cumplimientoResumenes) {
		prefixclauseCumplimiento_resumen += " C1.CUMPLIMIENTO_2 = '" +  cumplimientoResumene + "' OR ";
		prefixclauseCumplimiento_resumen2 += " C2.CUMPLIMIENTO_2 = '" +  cumplimientoResumene + "' OR ";
		prefixclauseCumplimiento_resumenExport += " C2.CUMPLIMIENTO_2 = '" +  cumplimientoResumene + "' OR ";
	}
	prefixclauseCumplimiento_resumen += " C1.CUMPLIMIENTO_2 = 'defaultid') ";
	prefixclauseCumplimiento_resumen2 += " C2.CUMPLIMIENTO_2 = 'defaultid') ";
	prefixclauseCumplimiento_resumenExport += " C2.CUMPLIMIENTO_2 = 'defaultid') ";
}

if (request.getParameterValues("responsable") != null) {
	prefixclauseResponsable +=" AND ( ";
	prefixclauseResponsable2 +=" AND ( ";
	prefixclauseResponsableExport +=" AND ( ";

	for(String responsable: responsables) {
		prefixclauseResponsable += " C1.RESPONSABLE = '" +  responsable + "' OR ";
		prefixclauseResponsable2 += " C2.RESPONSABLE = '" +  responsable + "' OR ";
		prefixclauseResponsableExport += " C2.RESPONSABLE = '" +  responsable + "' OR ";
	}
	prefixclauseResponsable+= " C1.RESPONSABLE = 'defaultid') ";
	prefixclauseResponsable2+= " C2.RESPONSABLE = 'defaultid') ";
	prefixclauseResponsableExport+= " C2.RESPONSABLE = 'defaultid') ";
}


if (request.getParameterValues("tipo_orden") != null) {
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
} /*else {
	prefixclauseTipoOrden +=" AND ( C1.TIPO_ORDEN = 'POS Paris' OR C1.TIPO_ORDEN = 'POS Johnson' OR C1.TIPO_ORDEN = 'Paris.cl' OR C1.TIPO_ORDEN = '-') ";
	prefixclauseTipoOrden2 +=" AND ( C2.TIPO_ORDEN = 'POS Paris' OR C2.TIPO_ORDEN = 'POS Johnson' OR C2.TIPO_ORDEN = 'Paris.cl' OR C2.TIPO_ORDEN = '-')  ";
}
*/


if (request.getParameterValues("tipo_venta") != null) {
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

} /*else {
	prefixclauseTipoVenta +=" AND ( C1.TIPO_VENTA = 'VEV CD' OR C1.TIPO_VENTA = 'CD DESPACHA')  ";
	prefixclauseTipoVenta2 +=" AND ( C2.TIPO_VENTA = 'VEV CD' OR C2.TIPO_VENTA = 'CD DESPACHA')  ";
}
*/

if (request.getParameterValues("cliente_retira") != null) {
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
} /*else {
	prefixclauseClienteRetira+= " AND (C1.CLIENTE_RETIRA = 'NO' OR C1.CLIENTE_RETIRA = '-') ";
	prefixclauseClienteRetira2+= " AND (C2.CLIENTE_RETIRA = 'NO' OR C2.CLIENTE_RETIRA = '-') ";
}
*/

if (request.getParameterValues("descripcion_empresa") != null) {
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

} /*else {
	prefixclauseDescripcionEmpresa +=" AND(C1.DESC_EMP = 'URZUA Y AHUMADA LTDA. (PI-PAU)' OR C1.DESC_EMP = 'Transportes Retail S.A' OR C1.DESC_EMP = 'TRANSPORTES EFRAEL Y COMPANIA LIMITIDA' OR C1.DESC_EMP = 'Transporte, Tecnologia Y Giros Egt Ltda.' OR C1.DESC_EMP = 'Stevens' OR C1.DESC_EMP = 'Sociedad De Transportes Matta Spa' OR C1.DESC_EMP = 'SERVICIOS LOGISTICOS DGA S.A.' OR C1.DESC_EMP = 'Rosa Maria Saa Diaz' OR C1.DESC_EMP = 'Logistica La Frontera Ltda.' OR C1.DESC_EMP = 'DANIEL ALEJANDRO BERRIOS RODRIGUEZ' OR C1.DESC_EMP = '-') ";
	prefixclauseDescripcionEmpresa2 +=" AND(C2.DESC_EMP = 'URZUA Y AHUMADA LTDA. (PI-PAU)' OR C2.DESC_EMP = 'Transportes Retail S.A' OR C2.DESC_EMP = 'TRANSPORTES EFRAEL Y COMPANIA LIMITIDA' OR C2.DESC_EMP = 'Transporte, Tecnologia Y Giros Egt Ltda.' OR C2.DESC_EMP = 'Stevens' OR C2.DESC_EMP = 'Sociedad De Transportes Matta Spa' OR C2.DESC_EMP = 'SERVICIOS LOGISTICOS DGA S.A.' OR C2.DESC_EMP = 'Rosa Maria Saa Diaz' OR C2.DESC_EMP = 'Logistica La Frontera Ltda.' OR C2.DESC_EMP = 'DANIEL ALEJANDRO BERRIOS RODRIGUEZ' OR C2.DESC_EMP = '-') ";
}*/


if (request.getParameterValues("tipo_guia") != null) {
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

} /*else {
	prefixclauseTipoGuia +=" AND (C1.TIPOGUI = '0' OR C1.TIPOGUI = '-') ";
	prefixclauseTipoGuia2 +=" AND (C2.TIPOGUI = '0' OR C2.TIPOGUI = '-') ";
}
*/

if (request.getParameterValues("tipo_horario") != null) {
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

if (request.getParameterValues("venta_empresa") != null) {
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

} /*else {
	prefixclauseVentaEmpresa +=" AND (C1.VENTA_EMPRESA = 'NO') ";
	prefixclauseVentaEmpresa2 +=" AND (C2.VENTA_EMPRESA = 'NO') ";
}*/



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
            <h1 class="page-title">Reporte Kpi Cumplimiento Despacho</h1>
        </div>
        
        <ul class="breadcrumb">
            <li><a href="home">Home</a> <span class="divider">/</span></li>
            <li class="active">Reporte Kpi Cumplimiento Despacho</li>
        </ul>

        <div class="container-fluid">
	        <div class="row-fluid">
				<div class="btn-toolbar">
					<!--  
					<a class="btn" href="downloadExcelUser?posted=<%if(request.getParameter("posted") != null){%><%=request.getParameter("posted")%><%}else{%><%=""%><% } %>">Export Excel</a>
				    <a class="btn" href="viewCSVUser?posted=<%if(request.getParameter("posted") != null){%><%=request.getParameter("posted")%><%}else{%><%=""%><% } %>">Export CSV</a>
				    <a class="btn" href="downloadPDFUser?posted=<%if(request.getParameter("posted") != null){%><%=request.getParameter("posted")%><%}else{%><%=""%><% } %>" target="_new">Export PDF</a>
					-->
									<%
					if (exportToExcel == null) {
					%>
						<a class="btn" href="reporteCuadraturaEnVerde2?exportToExcel=YES"><i class="icon-plus"></i>Imprimir a Excel</a>
					<%
						}
					%>
					<a class="btn" href='javascript:window.print(); void 0;'>Imprimir</a> 
				
					 <!--  
				    <button id="btn-add-user" class="btn btn-primary"><i class="icon-plus"></i> Nuevo</button>
				    <button class="btn" disabled="disabled">Import</button>
				    <button class="btn">Export</button>
				    -->
				   
                	
					<div class="btn-group"></div>
				</div>
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="btn-toolbar">
							<form class="form-inline" id="f_all_user" method="get" action="reporteCuadraturaEnVerde2">
								<input type="hidden" name="posted" id="posted" value="ok"/>
								<div class="form-group" >
									<label>&nbsp;Estado&nbsp;</label>
									<select name="estado" id="estado" class=".wrapper">
									<option value="-1">Todos</option>
										<option value="Encontrado">Encontrado</option>
										<option value="No Encontrado">No Encontrado</option>
								    </select>
								    &nbsp;&nbsp;
									<!--  
									<label>&nbsp;Estado&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
									<script type="text/javascript">
									$(document).ready(function() {
										$('#tipo_estado').multiselect({
											includeSelectAllOption: true,
											  enableFiltering: true,
											  allSelectedText: 'No option left ...',
											  maxHeight: 200,
											  dropDown: true,
											  buttonWidth: '200px'
										});
									  });
									</script>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<select name="tipo_estado" id="tipo_estado" multiple="multiple" class=".wrapper">
										<c:forEach items="${estadocumples}" var="estado" varStatus="status" >
											<option value="${estado.description}"
											<%
								           	if (request.getParameterValues("tipo_estado") != null) {
								        		
								        		for(String cumple: cumples) {
								        	%>
								        		<c:set var="mySelectVar8" value="<%=cumple%>"></c:set>
								        		<c:if test="${mySelectVar8 == estado.description}">selected</c:if>
										    <% 		
								        		}
								        	}
								           %>
											>${estado.description}</option>
								        </c:forEach>
								    </select>
									&nbsp;
									-->
									&nbsp;
									<label>&nbsp;Fecha&nbsp;</label>
									<input type="text" value="<% if (request.getParameter("dateInicio") != null) { %><% try { SimpleDateFormat formatoFecha = new SimpleDateFormat("dd/MM/yyyy", Locale.getDefault()); formatoFecha.setLenient(false); formatoFecha.parse(request.getParameter("dateInicio"));%><%=request.getParameter("dateInicio").toString().trim()%><% } catch(ParseException  e) {%><%=currentDate%><% } %><%  } else {%><%=currentDate %> <% } %>" readonly name="dateInicio" id="dateInicio" class="form-control span12" style="width:200px;" />
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
				<div class="well" style="overflow:scroll; height:600px">
					
					<table id="dataTables-example"  width="100%"  border="0" cellspacing="0" cellpadding="0" style="font-size:13px">
					
						
						<tr bgcolor="#305496" style="text-align:left; color:#FFF; font-size:13px; border: solid 1px #a6a6a6;">
							<th></th>
							<th align="left">Total EOM&nbsp;</th>
							<th align="left">Total JDA&nbsp;</th>
						</tr>
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
											" ( select count(*)   from CUADRATURA_OC_VTAV_EOM VTA_EOM  where 1 = 1 AND VTA_EOM.FECHA_CREACION_ORDEN >= '"+starttime2+" 00:00:00' and VTA_EOM.FECHA_CREACION_ORDEN <= '"+starttime2+" 23:59:59') as totalEom, " + 
											" (select count(*)   from CUADRATURA_OC_VTAV_JDA VTA_JDA  where 1 = 1 and VTA_JDA.POFECE >= '"+starttime+"' AND VTA_JDA.POFECE <= '"+starttime+"') as totalJda " +
											" from dual";
											
								out.println("SQLFecha="+SQLFecha);
								out.print("<br>");
								psFecha = connFecha.prepareStatement(SQLFecha, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
								rsFecha = psFecha.executeQuery();
								connFecha.commit();
								int contarFecha = 0;
								int totalProcentajeFecha = 0;
								while(rsFecha.next()) {
									contarFecha = contarFecha + 1;
									
							%>
						
						<tr style="background-color:#8ea9db;color:#FFF; " >
							<td></td>
							<td align="left" nowrap="nowrap"><%=rsFecha.getString("totalEom")%></td>
							<td align="left" nowrap="nowrap"><%=rsFecha.getString("totalJda")%></td>
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
					</table>
					<br>					
				    <table id="dataTables-example"  width="100%"  border="0" cellspacing="0" cellpadding="0" style="font-size:13px">
						<tr bgcolor="#305496" style="text-align:left; color:#FFF; font-size:13px; border: solid 1px #a6a6a6;">
							<th></th>
							<th align="left">
							Solicitud Origen&nbsp;
							</th>
							<th align="left">Distribuicion&nbsp;</th>
							<th align="left">Creacion&nbsp;</th>
							<th align="left">Cancelado&nbsp;</th>
							<th align="left">Estado&nbsp;</th>
							<!--  
							<td align="left" WIDTH="50">Total Q</td>
							<td align="left" WIDTH="50">Total %</td>
							-->
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
	
						
						int contarCumple = 0;
								
						try{
							Class.forName("oracle.jdbc.OracleDriver").newInstance();
							conn = DriverManager.getConnection("jdbc:oracle:thin:@172.18.163.15:1521/XE","kpiweb","kpiweb");//
							conn.setAutoCommit(false);
							
							if ("Encontrado".equals(request.getParameter("estado"))) {
								SQLCumple = " SELECT " + 
										"  (select VTA_EOM_2.SOLICITUDORIGINAL from CUADRATURA_OC_VTAV_EOM VTA_EOM_2 where VTA_EOM_2.N_ORDEN_DISTRIBU = VTA_EOM.N_ORDEN_DISTRIBU) AS SOLICITUDORIGINAL, " +
										"  VTA_EOM.N_ORDEN_DISTRIBU, " +
										"  (select to_char(REPLACE(VTA_EOM_2.FECHA_CREACION_ORDEN,',000000000',''))  from CUADRATURA_OC_VTAV_EOM VTA_EOM_2 where VTA_EOM_2.N_Orden_Distribu = VTA_EOM.N_ORDEN_DISTRIBU) AS FECHA_CREACION_ORDEN, " +
										"  (select VTA_EOM_2.CANCELADO from CUADRATURA_OC_VTAV_EOM VTA_EOM_2 where VTA_EOM_2.N_ORDEN_DISTRIBU = VTA_EOM.N_ORDEN_DISTRIBU) AS CANCELADO, " +
										"  CASE WHEN (SELECT VTA_JDA.NUMDO FROM CUADRATURA_OC_VTAV_JDA VTA_JDA WHERE VTA_JDA.POFECE >= '"+starttime+"' AND VTA_JDA.POFECE <= '"+starttime+"' AND VTA_JDA.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU) IS NOT NULL THEN 'Encontrado' ELSE 'No Encontrado' END    as ENCONTRADOENJDA " +
										" from CUADRATURA_OC_VTAV_EOM VTA_EOM " + 
										" where 1 = 1 " + 
										" AND  VTA_EOM.N_ORDEN_DISTRIBU  IN (SELECT VTA_JDA.NUMDO FROM CUADRATURA_OC_VTAV_JDA VTA_JDA WHERE VTA_JDA.POFECE >= '"+starttime+"' AND VTA_JDA.POFECE <= '"+starttime+"' AND VTA_JDA.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU) " +
										" AND VTA_EOM.FECHA_CREACION_ORDEN >= '"+starttime2+" 00:00:00' and VTA_EOM.FECHA_CREACION_ORDEN <= '"+starttime2+" 23:59:59' " +
										" GROUP BY VTA_EOM.N_ORDEN_DISTRIBU " +
										" ORDER BY VTA_EOM.N_ORDEN_DISTRIBU ASC ";
								
							} else if ("No Encontrado".equals(request.getParameter("estado"))) {
								SQLCumple = " SELECT " + 
										"  (select VTA_EOM_2.SOLICITUDORIGINAL from CUADRATURA_OC_VTAV_EOM VTA_EOM_2 where VTA_EOM_2.N_ORDEN_DISTRIBU = VTA_EOM.N_ORDEN_DISTRIBU) AS SOLICITUDORIGINAL, " +
										"  VTA_EOM.N_ORDEN_DISTRIBU, " +
										"  (select to_char(REPLACE(VTA_EOM_2.FECHA_CREACION_ORDEN,',000000000',''))  from CUADRATURA_OC_VTAV_EOM VTA_EOM_2 where VTA_EOM_2.N_Orden_Distribu = VTA_EOM.N_ORDEN_DISTRIBU) AS FECHA_CREACION_ORDEN, " +
										"  (select VTA_EOM_2.CANCELADO from CUADRATURA_OC_VTAV_EOM VTA_EOM_2 where VTA_EOM_2.N_ORDEN_DISTRIBU = VTA_EOM.N_ORDEN_DISTRIBU) AS CANCELADO, " +
										"  CASE WHEN (SELECT VTA_JDA.NUMDO FROM CUADRATURA_OC_VTAV_JDA VTA_JDA WHERE VTA_JDA.POFECE >= '"+starttime+"' AND VTA_JDA.POFECE <= '"+starttime+"' AND VTA_JDA.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU) IS NOT NULL THEN 'Encontrado' ELSE 'No Encontrado' END    as ENCONTRADOENJDA " +
										" from CUADRATURA_OC_VTAV_EOM VTA_EOM " + 
										" where 1 = 1 " + 
										" AND  VTA_EOM.N_ORDEN_DISTRIBU  NOT IN (SELECT VTA_JDA.NUMDO FROM CUADRATURA_OC_VTAV_JDA VTA_JDA WHERE VTA_JDA.POFECE >= '"+starttime+"' AND VTA_JDA.POFECE <= '"+starttime+"' AND VTA_JDA.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU) " +
										" AND VTA_EOM.FECHA_CREACION_ORDEN >= '"+starttime2+" 00:00:00' and VTA_EOM.FECHA_CREACION_ORDEN <= '"+starttime2+" 23:59:59' " +
										" GROUP BY VTA_EOM.N_ORDEN_DISTRIBU " +
										" ORDER BY VTA_EOM.N_ORDEN_DISTRIBU ASC ";
							} else {
								
								SQLCumple = " SELECT " + 
										"  (select VTA_EOM_2.SOLICITUDORIGINAL from CUADRATURA_OC_VTAV_EOM VTA_EOM_2 where VTA_EOM_2.N_ORDEN_DISTRIBU = VTA_EOM.N_ORDEN_DISTRIBU) AS SOLICITUDORIGINAL, " +
										"  VTA_EOM.N_ORDEN_DISTRIBU, " +
										"  (select to_char(REPLACE(VTA_EOM_2.FECHA_CREACION_ORDEN,',000000000',''))  from CUADRATURA_OC_VTAV_EOM VTA_EOM_2 where VTA_EOM_2.N_Orden_Distribu = VTA_EOM.N_ORDEN_DISTRIBU) AS FECHA_CREACION_ORDEN, " +
										"  (select VTA_EOM_2.CANCELADO from CUADRATURA_OC_VTAV_EOM VTA_EOM_2 where VTA_EOM_2.N_ORDEN_DISTRIBU = VTA_EOM.N_ORDEN_DISTRIBU) AS CANCELADO, " +
										"  CASE WHEN (SELECT VTA_JDA.NUMDO FROM CUADRATURA_OC_VTAV_JDA VTA_JDA WHERE VTA_JDA.POFECE >= '"+starttime+"' AND VTA_JDA.POFECE <= '"+starttime+"' AND VTA_JDA.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU) IS NOT NULL THEN 'Encontrado' ELSE 'No Encontrado' END    as ENCONTRADOENJDA " +
										" from CUADRATURA_OC_VTAV_EOM VTA_EOM " + 
										" where 1 = 1 " + 
										" AND VTA_EOM.FECHA_CREACION_ORDEN >= '"+starttime2+" 00:00:00' and VTA_EOM.FECHA_CREACION_ORDEN <= '"+starttime2+" 23:59:59' " +
										" GROUP BY VTA_EOM.N_ORDEN_DISTRIBU " +
										" ORDER BY VTA_EOM.N_ORDEN_DISTRIBU ASC ";
							}
							
							out.println("SQLCumple="+SQLCumple);
							out.print("<br>");
							
							
							
							
							psCumple = conn.prepareStatement(SQLCumple, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
							rsCumple = psCumple.executeQuery();
							conn.commit();
							
							while(rsCumple.next()) {
								// start while Cumple
								// TO_TIMESTAMP ('04/05/17', 'DD-MM-YY')
								contarCumple = contarCumple + 1;

								
								
								
						%>
						
								<script type="text/javascript">
									$(function(){
										<!--0-->
										$("#ocultar_cumplimiento_<%=contarCumple%>").click(function() {
											//alert('ocultar_cumplimiento_<%=contarCumple%>');
											<%
								        	
								        	/*
								        	SQLHideCumplimiento = 	" SELECT  " + 
																	" VTA_JDA.NUMDO " + 
																	" FROM CUADRATURA_OC_VTAV_JDA VTA_JDA " +
																	" WHERE 1 = 1 " +
																	" AND VTA_JDA.POFECE >= '"+starttime+"' AND VTA_JDA.POFECE <= '"+starttime+"' " +
																	" AND VTA_JDA.NUMDO = '"+rsCumple.getString("N_ORDEN_DISTRIBU")+"' ";

								        	
								        	psHideCumplimiento = conn.prepareStatement(SQLHideCumplimiento, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		                                    rsHideCumplimiento = psHideCumplimiento.executeQuery();
		                                    conn.commit();
											int contarHideCumplimiento = 0;
		                                    while(rsHideCumplimiento.next()) {
												contarHideCumplimiento = contarHideCumplimiento + 1;
											*/	
		                                    %>
												$("#cumplimiento_<%=contarCumple%>").hide('slow', function() {});
											<%
											//}
											%>
											$("#mostrar_cumplimiento_<%=contarCumple%>").show('slow', function() {});
											$("#ocultar_cumplimiento_<%=contarCumple%>").hide('slow', function() {});
										});
										
										$("#mostrar_cumplimiento_<%=contarCumple%>").click(function() {
											//alert('mostrar_cumplimiento_<%=contarCumple%>');
											<%
											/*
											SQLShowCumplimiento = 	" SELECT  " + 
																	" VTA_JDA.NUMDO " + 
																	" FROM CUADRATURA_OC_VTAV_JDA VTA_JDA " +
																	" WHERE 1 = 1 " +
																	" AND VTA_JDA.POFECE >= '"+starttime+"' AND VTA_JDA.POFECE <= '"+starttime+"' " +
																	" AND VTA_JDA.NUMDO = '"+rsCumple.getString("N_ORDEN_DISTRIBU")+"' ";
								        	psShowCumplimiento = conn.prepareStatement(SQLShowCumplimiento, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		                                    rsShowCumplimiento = psShowCumplimiento.executeQuery();
		                                    conn.commit();
											int contarShowCumplimiento = 0;
		                                    while(rsShowCumplimiento.next()) {
												contarShowCumplimiento = contarShowCumplimiento + 1;
											*/
		                                    %>
												
												$("#cumplimiento_<%=contarCumple%>").show('slow', function() {});
											<%
											//}
											%>
											$("#ocultar_cumplimiento_<%=contarCumple%>").show('slow', function() {});
											$("#mostrar_cumplimiento_<%=contarCumple%>").hide('slow', function() {});
										});
									});
								</script>
								<tr 
								
								<%
								
								
								if ("No Encontrado".equals(rsCumple.getString("ENCONTRADOENJDA"))) {
								%>
								style="background-color:#DF0101;color:#FFF;" 
								<% 	
								}  else {
								%>
								style="background-color:#8ea9db;color:#FFF;" 
								<%
								}
								%>
								>
									<td><button class="btn btn-default" id="ocultar_cumplimiento_<%=contarCumple%>" style="display:none"><img src="../images/minus2.gif" /></button><button class="btn btn-default" id="mostrar_cumplimiento_<%=contarCumple%>"><img src="../images/plus2.gif" /></button></td>
									<td align="left" nowrap="nowrap"><%=rsCumple.getString("SOLICITUDORIGINAL")%></td>
									<td align="left" nowrap="nowrap"><%=rsCumple.getString("N_ORDEN_DISTRIBU")%></td>
									<td align="left" nowrap="nowrap"><%=rsCumple.getString("FECHA_CREACION_ORDEN")%></td>
									<td align="left" nowrap="nowrap"><%=rsCumple.getString("CANCELADO")%></td>
									<td align="left" nowrap="nowrap"><%=rsCumple.getString("ENCONTRADOENJDA")%></td>
								</tr>
								
								
							
								<!-- Segunda Fila Cumplimiento -->
								<%
								//Esto es para el servidor
								SQLCumplimiento = 	" SELECT  " + 
													" VTA_JDA.POVNUM, VTA_JDA.NUMDO, VTA_JDA.POFECE, VTA_JDA.EX14ERROR, VTA_JDA.POHORE " + 
													" FROM CUADRATURA_OC_VTAV_JDA VTA_JDA " +
													" WHERE 1 = 1 " +
													" AND VTA_JDA.POFECE >= '"+starttime+"' AND VTA_JDA.POFECE <= '"+starttime+"' " +
													" AND VTA_JDA.NUMDO = '"+rsCumple.getString("N_ORDEN_DISTRIBU")+"' ";
																	
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
										
									</script>
									
									<!--  
									<tr id="cumplimiento_<%=contarCumple%>_<%=contarCumplimiento%>" style="background-color:#d9e1f2;text-align:left;font-size:13px;color:#000000;display:none" >
									-->
									<tr id="cumplimiento_<%=contarCumple%>" style="background-color:#d9e1f2;text-align:left;font-size:13px;color:#000000;display:none" >
									
										<td>
										<!--  <img src="../images/details.gif" />-->
										<i class="icon-table"></i> 
										<table>
											<tr>
												<td>-</td>
											</tr>
										</table>
										</td>
										<td nowrap="nowrap" style="text-align:left;font-size:13px;color:#000000">
										<% //=rsCumplimiento.getString("POVNUM")%>
										Povnum
										<table>
											<tr>
												<td nowrap="nowrap" style="text-align:left;font-size:13px;color:#000000"><%=rsCumplimiento.getString("POVNUM")%></td>
											</tr>
										</table>
										</td>	 
										<td nowrap="nowrap" style="text-align:left;font-size:13px;color:#000000">
										Numero
										<% //=rsCumplimiento.getString("NUMDO")%>
										<table>
											<tr>
												<td nowrap="nowrap" style="text-align:left;font-size:13px;color:#000000"><%=rsCumplimiento.getString("NUMDO")%></td>
											</tr>
										</table>
										</td> 
										<td nowrap="nowrap" style="text-align:left;font-size:13px;color:#000000">
										Fecha
										<% //=rsCumplimiento.getString("POFECE")%>
										<table>
											<tr>
												<td nowrap="nowrap" style="text-align:left;font-size:13px;color:#000000"><%=rsCumplimiento.getString("POFECE")%></td>
											</tr>
										</table>
										</td>	 
										<td nowrap="nowrap" style="text-align:left;font-size:13px;color:#000000">
										Mensaje
										<% //=rsCumplimiento.getString("EX14ERROR")%>
										<table>
											<tr>
												<td nowrap="nowrap" style="text-align:left;font-size:13px;color:#000000"><%=rsCumplimiento.getString("EX14ERROR")%></td>
											</tr>
										</table>
										</td>	 
										<td nowrap="nowrap" style="text-align:left;font-size:13px;color:#000000">
										Cuenta
										<% //=rsCumplimiento.getString("POHORE")%>
										<table>
											<tr>
												<td nowrap="nowrap" style="text-align:left;font-size:13px;color:#000000"><%=rsCumplimiento.getString("POHORE")%></td>
											</tr>
										</table>
										</td>	 
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
						<!--    
						<tr style="background-color:#305496;color:#FFF">
							<td></td>
							<td>Total General</td>
							<td>X</td>
							<td>X</td>
							<td>X</td>
							<td>X</td>
							<td>X</td>
							<td>X</td>
						</tr>
						-->
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
			<!---->
	
		
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


