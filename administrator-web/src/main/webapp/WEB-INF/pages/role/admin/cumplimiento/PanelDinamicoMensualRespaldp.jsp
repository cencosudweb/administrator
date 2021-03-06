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
<%@ page import="com.cencosud.administrator.dto.users.CumplimientoTotalesDTO"%>
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
} 


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

} 
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
} 

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

}


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

} 

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

} 

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <jsp:include page="../../../include/head.jsp" />
	
 	<link rel="stylesheet" href="<c:url value="/css/bootstrap-multiselect.css"/>" type="text/css"/>
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
    
    <jsp:include page="../../../include/banner.jsp" />
	<jsp:include page="../../../include/menu.jsp" />
    
    <div class="content">
        <div class="header">
            <h1 class="page-title">Reporte Kpi Cumplimiento Logistico Dinamico</h1>
        </div>
        
        <ul class="breadcrumb">
            <li><a href="home">Home</a> <span class="divider">/</span></li>
            <li class="active">Reporte Kpi Cumplimiento Logistico Dinamico</li>
        </ul>

        <div class="container-fluid">
	        <div class="row-fluid">
				<div class="btn-toolbar">
				
					<!--  
				    <button id="btn-add-user" class="btn btn-primary"><i class="icon-plus"></i> Nuevo</button>
				    <button class="btn" disabled="disabled">Import</button>
				    <button class="btn">Export</button>
				    -->
				    
				    <%
				    if (exportToExcel != null) {
					%>
					
						<a class="btn" href="reportePanelDinamicoPrint?exportToExcel=YES"><i class="icon-book"></i> Exportar a Excel</a>
						
					<%
						} else {
					%>
					
						<a target="_blank" class="btn" href="reportePanelDinamicoPrint?exportToExcel=YES&posted=<%if(request.getParameter("posted") != null){%><%=request.getParameter("posted")%><%}else{%><%="NULL"%><% } %>&dateInicio=<% if (request.getParameter("dateInicio") != null) { %><% try { SimpleDateFormat formatoFecha = new SimpleDateFormat("dd/MM/yyyy", Locale.getDefault()); formatoFecha.setLenient(false); formatoFecha.parse(request.getParameter("dateInicio"));%><%=request.getParameter("dateInicio").toString().trim()%><% } catch(ParseException  e) {%><%=currentDate%><% } %><%  } else {%><%=currentDate %> <% } %>&tipo_orden=<%if(request.getParameter("tipo_orden") != null){%><%=request.getParameter("tipo_orden")%><%}else{%><%="NULL"%><% } %>&tipo_venta=<%if(request.getParameter("tipo_venta") != null){%><%=request.getParameter("tipo_venta")%><%}else{%><%="NULL"%><% } %>&cliente_retira=<%if(request.getParameter("cliente_retira") != null){%><%=request.getParameter("cliente_retira")%><%}else{%><%="NULL"%><% } %>&descripcion_empresa=<%if(request.getParameter("descripcion_empresa") != null){%><%=request.getParameter("descripcion_empresa")%><%}else{%><%="NULL"%><% } %>&tipo_guia=<%if(request.getParameter("tipo_guia") != null){%><%=request.getParameter("tipo_guia")%><%}else{%><%="NULL"%><% } %>&tipo_horario=<%if(request.getParameter("tipo_horario") != null){%><%=request.getParameter("tipo_horario")%><%}else{%><%="NULL"%><% } %>&venta_empresa=<%if(request.getParameter("venta_empresa") != null){%><%=request.getParameter("venta_empresa")%><%}else{%><%="NULL"%><% } %>&tipo_estado=<%if(request.getParameter("tipo_estado") != null){%><%=request.getParameter("tipo_estado")%><%}else{%><%="NULL"%><% } %>"><i class="icon-book"></i> Exportar a Excel</a>
						
					<%
						} 
					%>
				   
                	
					<div class="btn-group"></div>
				</div>
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="btn-toolbar">
							<form class="form-inline" id="f_all_user" method="get" action="reportePanelDinamicoMensual">
								<input type="hidden" name="posted" id="posted" value="ok"/>
								<div class="form-group" >
									<label>Tipo Orden&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
									<script type="text/javascript">
									$(document).ready(function() {
										$('#tipo_orden').multiselect({
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
									
									<select name="tipo_orden" id="tipo_orden" multiple="multiple">
										<c:forEach items="${ordenes}" var="orden" varStatus="status">
											<option value="${orden.description}" 
											<%
								           	if (request.getParameterValues("tipo_orden") != null) {
								        		
								        		for(String tipoOrdene: tipoOrdenes) {
								        	%>
								        		<c:set var="mySelectVar" value="<%=tipoOrdene%>"></c:set>
								        		<c:if test="${mySelectVar == orden.description}">selected</c:if>
										    <% 		
								        		}
								        	}
								           %>
											>
											<c:choose>
											    <c:when test="${orden.description=='-'}">(en blanco)</c:when>    
											    <c:otherwise>${orden.description}</c:otherwise>
											</c:choose>
											
											</option>
										</c:forEach>
			                        </select>
			                         <!-- ${param.tipo_orden == orden.description ? 'selected' : ''} -->
									<label>&nbsp;Tipo Venta&nbsp;</label>
									<script type="text/javascript">
									$(document).ready(function() {
										$('#tipo_venta').multiselect({
											includeSelectAllOption: true,
											enableFiltering: true,
											allSelectedText: 'No option left ...',
											maxHeight: 200,
											dropDown: true,
											buttonWidth: '200px'
										});
									});
									</script>
									&nbsp;
									<select name="tipo_venta" id="tipo_venta" multiple="multiple">
										<c:forEach items="${ventas}" var="venta" varStatus="status">
											<option value="${venta.description}"
											<%
								           	if (request.getParameterValues("tipo_venta") != null) {
								        		
								        		for(String tipoVenta: tipoVentas) {
								        	%>
								        		<c:set var="mySelectVar2" value="<%=tipoVenta%>"></c:set>
								        		<c:if test="${mySelectVar2 == venta.description}">selected</c:if>
										    <% 		
								        		}
								        	}
								           %>
											>
											<c:choose>
											    <c:when test="${venta.description=='-'}">(en blanco)</c:when>    
											    <c:otherwise>${venta.description}</c:otherwise>
											</c:choose>
											</option>
										</c:forEach>
			                        </select>
			                       
									&nbsp;
									<label>&nbsp;Cliente Retira&nbsp;</label>
									<script type="text/javascript">
									$(document).ready(function() {
										$('#cliente_retira').multiselect({
											includeSelectAllOption: true,
											enableFiltering: true,
											allSelectedText: 'No option left ...',
											maxHeight: 200,
											dropDown: true,
											buttonWidth: '200px'
										});
									});
									</script>
									&nbsp;
									<select name="cliente_retira" id="cliente_retira" multiple="multiple">
										<c:forEach items="${clientes}" var="cliente" varStatus="status">
											<option value="${cliente.description}"
											<%
								           	if (request.getParameterValues("cliente_retira") != null) {
								        		
								        		for(String clienteRetira: clienteRetiras) {
								        	%>
								        		<c:set var="mySelectVar3" value="<%=clienteRetira%>"></c:set>
								        		<c:if test="${mySelectVar3 == cliente.description}">selected</c:if>
										    <% 		
								        		}
								        	}
								           %>
											>
											<c:choose>
											    <c:when test="${cliente.description=='-'}">(en blanco)</c:when>    
											    <c:otherwise>${cliente.description}</c:otherwise>
											</c:choose>
											</option>
							            </c:forEach>
							        </select>
								</div>
								<br>
								<div class="form-group" >
									<label>Empresa Transporte&nbsp;</label>
									<script type="text/javascript">
									$(document).ready(function() {
										$('#descripcion_empresa').multiselect({
											includeSelectAllOption: true,
											  enableFiltering: true,
											  allSelectedText: 'No option left ...',
											  maxHeight: 200,
											  dropDown: true,
											  buttonWidth: '200px'
										});
									});
									</script>
									&nbsp;
									<select name="descripcion_empresa" id="descripcion_empresa" multiple="multiple">
										<c:forEach items="${empresas}" var="empresa" varStatus="status">
											<option value="${empresa.description}"
											<%
								           	if (request.getParameterValues("descripcion_empresa") != null) {
								        		
								        		for(String descripcionEmpresa: descripcionEmpresas) {
								        	%>
								        		<c:set var="mySelectVar4" value="<%=descripcionEmpresa%>"></c:set>
								        		<c:if test="${mySelectVar4 == empresa.description}">selected</c:if>
										    <% 		
								        		}
								        	}
								           %>
											>
											<c:choose>
											    <c:when test="${empresa.description =='-'}">(en blanco)</c:when>    
											    <c:otherwise>${empresa.description}</c:otherwise>
											</c:choose>
											</option>
								        </c:forEach>
								    </select>
									<label>&nbsp;Tipo Guia&nbsp;&nbsp;&nbsp;</label>
									 <script type="text/javascript">
									$(document).ready(function() {
										$('#tipo_guia').multiselect({
											includeSelectAllOption: true,
											  enableFiltering: true,
											  allSelectedText: 'No option left ...',
											  maxHeight: 200,
											  dropDown: true,
											  buttonWidth: '200px'
										});
									});
									</script>
									&nbsp;&nbsp;&nbsp;
									<select name="tipo_guia" id="tipo_guia" multiple="multiple">
										<c:forEach items="${guias}" var="guia" varStatus="status">
											<option value="${guia.description}"
											<%
								           	if (request.getParameterValues("tipo_guia") != null) {
								        		
								        		for(String tipoGuia: tipoGuias) {
								        	%>
								        		<c:set var="mySelectVar5" value="<%=tipoGuia%>"></c:set>
								        		<c:if test="${mySelectVar5 == guia.description}">selected</c:if>
										    <% 		
								        		}
								        	}
								           %>
											>
											<c:choose>
											    <c:when test="${guia.description=='-'}">(en blanco)</c:when>    
											    <c:otherwise>${guia.description}</c:otherwise>
											</c:choose>
											</option>
								        </c:forEach>
								    </select> 	
									&nbsp;
									<label>&nbsp;Horario&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
									<script type="text/javascript">
									$(document).ready(function() {
										$('#tipo_horario').multiselect({
											includeSelectAllOption: true,
											  enableFiltering: true,
											  allSelectedText: 'No option left ...',
											  maxHeight: 200,
											  dropDown: true,
											  buttonWidth: '200px'
										});
									});
									</script>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<select name="tipo_horario" id="tipo_horario" multiple="multiple">
										<c:forEach items="${horarios}" var="horario" varStatus="status">
											<option value="${horario.description}"
											<%
								           	if (request.getParameterValues("tipo_horario") != null) {
								        		
								        		for(String tipoHorario: tipoHorarios) {
								        	%>
								        		<c:set var="mySelectVar6" value="<%=tipoHorario%>"></c:set>
								        		<c:if test="${mySelectVar6 == horario.description}">selected</c:if>
										    <% 		
								        		}
								        	}
								           %>
											>
											<c:choose>
											    <c:when test="${horario.description=='-'}">(en blanco)</c:when>    
											    <c:otherwise>${horario.description}</c:otherwise>
											</c:choose>
											</option>
								        </c:forEach>
								    </select>
								</div>
								<br>
								<div class="form-group" >
									<label>Venta Empresa&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
									<script type="text/javascript">
									$(document).ready(function() {
										$('#venta_empresa').multiselect({
											includeSelectAllOption: true,
											  enableFiltering: true,
											  allSelectedText: 'No option left ...',
											  maxHeight: 200,
											  dropDown: true,
											  buttonWidth: '200px'
										});
									});
									</script>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<select name="venta_empresa" id="venta_empresa" multiple="multiple">
										<c:forEach items="${ventaempresas}" var="ventaempresa" varStatus="status">
											<option value="${ventaempresa.description}"
											<%
								           	if (request.getParameterValues("venta_empresa") != null) {
								        		
								        		for(String ventasEmpresa: ventasEmpresas) {
								        	%>
								        		<c:set var="mySelectVar7" value="<%=ventasEmpresa%>"></c:set>
								        		<c:if test="${mySelectVar7 == ventaempresa.description}">selected</c:if>
										    <% 		
								        		}
								        	}
								           %>
											>
											<c:choose>
											    <c:when test="${ventaempresa.description=='-'}">(en blanco)</c:when>    
											    <c:otherwise>${ventaempresa.description}</c:otherwise>
											</c:choose>
											</option>
								        </c:forEach>
								    </select> 
									&nbsp;
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
									<label>&nbsp;Fecha&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
									<select name="fromstatsmonth_sday" id="fromstatsmonth_sday" class="form-control" style="width: 200px">
					             <%
					             

									SimpleDateFormat format = new SimpleDateFormat ("MM");
									
									String[] monthname = {"January","February","March","April","May","June","July","August","September","October","November","December"};
									Calendar cal = Calendar.getInstance();
									
									Integer year_actual = (cal.get(Calendar.YEAR));


							     int i;
							     for (i=year_actual;i >= year_actual-1;i--) 
							     {
							    	 
							    	 Integer monthnumber;
							    	 if(year_actual==i) {
							    		   monthnumber = (Integer.parseInt(format.format(dNow)) - 1) ; // Month number without lead 0.
							    	 } else {
							    		  monthnumber=11;
							    	 }
							    	 
							    	 int j;
							    	 for (j=monthnumber;j>=0;j--)
							         {
							    		 String month_formated = String.format("%02d", j+1);
							    		 String selected;
							    		 if((i+"-"+month_formated).equals(request.getParameter("fromstatsmonth_sday")))	 
							    		 	 selected = "selected";
							    			     		 
							    		 else 
							    			 selected = "";
							    		 out.print("<option value="+i+"-"+ month_formated+"  "+selected+">"+monthname[j]+"-"+i+"</option>");
							         }
							    		 //out.print("<option value="+ i +">"+ i + "</option>");
							     }
							    %>
					            </select>
								</div>
								<br>
								<div class="form-group">
								<label>Comparar&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        						<select name="months_compare" id="months_compare" class="form-control" style="width: 200px">
					              <c:forEach items="${compare}" var="compares" varStatus="status">
					              	<option value="${compares.key}" ${param.months_compare == compares.key ? 'selected' : ''}>${compares.value}</option>
					              </c:forEach>
					            </select>
        					</div>
        					<br></br>
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
								SQLFecha = "SELECT  SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) AS FECHA_COMPROMISO_EOM,   NVL((select count(*) from CUMPLIMIENTO C2 WHERE 1 = 1 AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+prefixclauseCumple2 + prefixclauseCumplimiento2 + prefixclauseCumplimiento_resumen2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+"),0) AS CANTIDAD from CUMPLIMIENTO C1 WHERE 1 = 1 AND C1.FECHA_COMPROMISO_EOM >=  TO_CHAR(to_date((to_char(ADD_MONTHS(TO_CHAR(to_date('"+request.getParameter("fromstatsmonth_sday")+"-01', 'YYYY-MM-DD'), 'DD/MM/YY'),-6))), 'DD/MM/YY'), 'YYYY-MM-DD') AND C1.FECHA_COMPROMISO_EOM <= '"+request.getParameter("fromstatsmonth_sday")+"-31' GROUP BY SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) ORDER BY SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) ASC";
								//out.println("<BR>");
								//out.println("SQLFecha="+SQLFecha);
								//out.println("<BR>");
								
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
						
						//Primera Fila Cumple
						
						try{
							Class.forName("oracle.jdbc.OracleDriver").newInstance();
							conn = DriverManager.getConnection("jdbc:oracle:thin:@172.18.163.15:1521/XE","kpiweb","kpiweb");//
							conn.setAutoCommit(false);
							SQLCumple = "SELECT  C1.CUMPLE from CUMPLIMIENTO C1 WHERE  1 = 1 AND C1.FECHA_COMPROMISO_EOM >=  TO_CHAR(to_date((to_char(ADD_MONTHS(TO_CHAR(to_date('"+request.getParameter("fromstatsmonth_sday")+"-01', 'YYYY-MM-DD'), 'DD/MM/YY'),-6))), 'DD/MM/YY'), 'YYYY-MM-DD') AND C1.FECHA_COMPROMISO_EOM <= '"+request.getParameter("fromstatsmonth_sday")+"-31' " + prefixclauseCumple + "  GROUP BY C1.CUMPLE ORDER BY C1.CUMPLE ASC";
							//out.print("<br>");
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
									$("#ocultar_cumplimiento_<%=contarCumple%>").click(function() {
										alert('ocultar_cumplimiento_<%=contarCumple%>');


										<%
								        	SQLHideCumplimiento = "SELECT  C1.CUMPLE_RESUMEN from CUMPLIMIENTO C1 WHERE  1 = 1 AND C1.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND C1.FECHA_COMPROMISO_EOM >=  TO_CHAR(to_date((to_char(ADD_MONTHS(TO_CHAR(to_date('"+request.getParameter("fromstatsmonth_sday")+"-01', 'YYYY-MM-DD'), 'DD/MM/YY'),-6))), 'DD/MM/YY'), 'YYYY-MM-DD') AND C1.FECHA_COMPROMISO_EOM <= '"+request.getParameter("fromstatsmonth_sday")+"-31' GROUP BY C1.CUMPLE_RESUMEN ORDER BY C1.CUMPLE_RESUMEN ASC";
								        	psHideCumplimiento = conn.prepareStatement(SQLHideCumplimiento, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		                                    rsHideCumplimiento = psHideCumplimiento.executeQuery();
		                                    conn.commit();
											int contarHideCumplimiento = 0;
		                                    while(rsHideCumplimiento.next()) {
												contarHideCumplimiento = contarHideCumplimiento + 1;
		                                    %>
		                                    $("#cumplimiento_<%=contarCumple%>_<%=contarHideCumplimiento%>").hide('slow', function() {});
		                                    <%
											SQLHideCumpleResumen = "SELECT  C1.CUMPLIMIENTO_2 from CUMPLIMIENTO C1 WHERE  1 = 1 AND C1.FECHA_COMPROMISO_EOM >=  TO_CHAR(to_date((to_char(ADD_MONTHS(TO_CHAR(to_date('"+request.getParameter("fromstatsmonth_sday")+"-01', 'YYYY-MM-DD'), 'DD/MM/YY'),-6))), 'DD/MM/YY'), 'YYYY-MM-DD') AND C1.FECHA_COMPROMISO_EOM <= '"+request.getParameter("fromstatsmonth_sday")+"-31' AND C1.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND C1.CUMPLE_RESUMEN = '"+rsHideCumplimiento.getString("CUMPLE_RESUMEN")+"' GROUP BY C1.CUMPLIMIENTO_2 ORDER BY C1.CUMPLIMIENTO_2 ASC";
											psHideCumpleResumen = conn.prepareStatement(SQLHideCumpleResumen, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
											rsHideCumpleResumen = psHideCumpleResumen.executeQuery();
											conn.commit();
											int contarHideCumpleResumen = 0;
											while(rsHideCumpleResumen.next()) {
												contarHideCumpleResumen = contarHideCumpleResumen + 1;
											%>
											$("#cumple_resumen_<%=contarCumple%>_<%=contarHideCumplimiento%>_<%=contarHideCumpleResumen%>").hide('slow', function() {});

											<%
											SQLHideResponsable = "SELECT  C1.RESPONSABLE from CUMPLIMIENTO C1 WHERE  1 = 1 AND C1.FECHA_COMPROMISO_EOM >=  TO_CHAR(to_date((to_char(ADD_MONTHS(TO_CHAR(to_date('"+request.getParameter("fromstatsmonth_sday")+"-01', 'YYYY-MM-DD'), 'DD/MM/YY'),-6))), 'DD/MM/YY'), 'YYYY-MM-DD') AND C1.FECHA_COMPROMISO_EOM <= '"+request.getParameter("fromstatsmonth_sday")+"-31' AND C1.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND C1.CUMPLE_RESUMEN = '"+rsHideCumplimiento.getString("CUMPLE_RESUMEN")+"' AND C1.CUMPLIMIENTO_2 = '"+rsHideCumpleResumen.getString("CUMPLIMIENTO_2")+"' GROUP BY C1.RESPONSABLE ORDER BY C1.RESPONSABLE ASC";
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
										alert('mostrar_cumplimiento_<%=contarCumple%>');

										<%
							        	SQLShowCumplimiento = "SELECT  C1.CUMPLE_RESUMEN from CUMPLIMIENTO C1 WHERE  1 = 1 AND C1.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-8, 'YYYY/MM/DD'),'/','-') AND C1.FECHA_COMPROMISO_EOM <= '"+starttime+"' AND C1.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND C1.FECHA_COMPROMISO_EOM >=  TO_CHAR(to_date((to_char(ADD_MONTHS(TO_CHAR(to_date('"+request.getParameter("fromstatsmonth_sday")+"-01', 'YYYY-MM-DD'), 'DD/MM/YY'),-6))), 'DD/MM/YY'), 'YYYY-MM-DD') AND C1.FECHA_COMPROMISO_EOM <= '"+request.getParameter("fromstatsmonth_sday")+"-31' GROUP BY C1.CUMPLE_RESUMEN ORDER BY C1.CUMPLE_RESUMEN ASC";
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
										SQLShowCumpleResumen = "SELECT  C1.CUMPLIMIENTO_2 from CUMPLIMIENTO C1 WHERE  1 = 1 AND C1.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-8, 'YYYY/MM/DD'),'/','-') AND C1.FECHA_COMPROMISO_EOM <= '"+starttime+"' AND C1.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND C1.CUMPLE_RESUMEN = '"+rsShowCumplimiento.getString("CUMPLE_RESUMEN")+"'  GROUP BY C1.CUMPLIMIENTO_2 ORDER BY C1.CUMPLIMIENTO_2 ASC";
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

										$("#cumplimiento_<%=contarCumple%>_").show('slow', function() {});
										$("#ocultar_cumplimiento_<%=contarCumple%>").show('slow', function() {});
										$("#mostrar_cumplimiento_<%=contarCumple%>").hide('slow', function() {});
									});
								});	
								</script>
								<tr style="background-color:#8ea9db;color:#FFF; " >
									<td><button class="btn btn-default" id="ocultar_cumplimiento_<%=contarCumple%>" style="display:none"><img src="../images/minus2.gif" /></button><button class="btn btn-default" id="mostrar_cumplimiento_<%=contarCumple%>"><img src="../images/plus2.gif" /></button></td>
									<td align="left" nowrap="nowrap" ><!--  <i class="icon-reorder"></i>-->&nbsp;<%=rsCumple.getString("CUMPLE")%></td>
									<%
									//SQLCumple = "SELECT  C1.FECHA_COMPROMISO_EOM from CUMPLIMIENTO C1 WHERE  1 = 1 AND C1.FECHA_COMPROMISO_EOM >=  TO_CHAR(to_date((to_char(ADD_MONTHS(TO_CHAR(to_date('"+request.getParameter("fromstatsmonth_sday")+"-01', 'YYYY-MM-DD'), 'DD/MM/YY'),-3))), 'DD/MM/YY'), 'YYYY-MM-DD') AND C1.FECHA_COMPROMISO_EOM <= '"+request.getParameter("fromstatsmonth_sday")+"-31' " + prefixclauseCumple + "  GROUP BY C1.CUMPLE ORDER BY C1.CUMPLE ASC";
									//SQLShowFecha = "SELECT  C1.FECHA_COMPROMISO_EOM, NVL((select count(*) from CUMPLIMIENTO C2 WHERE 1 = 1 AND C2.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+ prefixclauseCumplimiento2 + prefixclauseCumplimiento_resumen2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+"),0) AS CANTIDAD,  NVL( (CASE WHEN ((select count(*) from CUMPLIMIENTO C2  where 1 = 1 AND C2.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+ prefixclauseCumplimiento2 + prefixclauseCumplimiento_resumen2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")>0 AND (select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+ prefixclauseCumple2 + prefixclauseCumplimiento2 + prefixclauseCumplimiento_resumen2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")>0)  THEN (ROUND( TO_NUMBER(( (select count(*) from CUMPLIMIENTO C2  where 1 = 1 AND C2.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+ prefixclauseCumplimiento2 + prefixclauseCumplimiento_resumen2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")/(select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+ prefixclauseCumple2 + prefixclauseCumplimiento2 + prefixclauseCumplimiento_resumen2  + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")  * 100) ), 2 )) ELSE 0 END),0) AS PORCENTAJE  from CUMPLIMIENTO C1 WHERE 1 = 1 AND C1.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-8, 'YYYY/MM/DD'),'/','-') AND C1.FECHA_COMPROMISO_EOM <= '"+starttime+"'  GROUP BY C1.FECHA_COMPROMISO_EOM ORDER BY C1.FECHA_COMPROMISO_EOM ASC";
									SQLShowFecha = "SELECT  SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) AS FECHA_COMPROMISO_EOM, NVL((select count(*) from CUMPLIMIENTO C2 WHERE 1 = 1 AND C2.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+ prefixclauseCumplimiento2 + prefixclauseCumplimiento_resumen2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+"),0) AS CANTIDAD,  NVL( (CASE WHEN ((select count(*) from CUMPLIMIENTO C2  where 1 = 1 AND C2.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+ prefixclauseCumplimiento2 + prefixclauseCumplimiento_resumen2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")>0 AND (select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+ prefixclauseCumple2 + prefixclauseCumplimiento2 + prefixclauseCumplimiento_resumen2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")>0)  THEN (ROUND( TO_NUMBER(( (select count(*) from CUMPLIMIENTO C2  where 1 = 1 AND C2.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+ prefixclauseCumplimiento2 + prefixclauseCumplimiento_resumen2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")/(select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+ prefixclauseCumple2 + prefixclauseCumplimiento2 + prefixclauseCumplimiento_resumen2  + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")  * 100) ), 2 )) ELSE 0 END),0) AS PORCENTAJE  from CUMPLIMIENTO C1 WHERE 1 = 1 AND C1.FECHA_COMPROMISO_EOM >=  TO_CHAR(to_date((to_char(ADD_MONTHS(TO_CHAR(to_date('"+request.getParameter("fromstatsmonth_sday")+"-01', 'YYYY-MM-DD'), 'DD/MM/YY'),-6))), 'DD/MM/YY'), 'YYYY-MM-DD') AND C1.FECHA_COMPROMISO_EOM <= '"+request.getParameter("fromstatsmonth_sday")+"-31'  GROUP BY SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) ORDER BY SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) ASC";
									
									//AND C1.FECHA_COMPROMISO_EOM >=  TO_CHAR(to_date((to_char(ADD_MONTHS(TO_CHAR(to_date('"+request.getParameter("fromstatsmonth_sday")+"-01', 'YYYY-MM-DD'), 'DD/MM/YY'),-3))), 'DD/MM/YY'), 'YYYY-MM-DD') AND C1.FECHA_COMPROMISO_EOM <= '"+request.getParameter("fromstatsmonth_sday")+"-31'
									
									//out.print("<br>");
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
										totalProcentajeCumple = totalProcentajeCumple + rsShowFecha.getInt("PORCENTAJE") ;
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
							
								<%
								// Segunda Fila Cumplimiento
								//SQLCumplimiento = "SELECT  C1.CUMPLE_RESUMEN from CUMPLIMIENTO C1 WHERE  1 = 1 AND C1.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-8, 'YYYY/MM/DD'),'/','-') AND C1.FECHA_COMPROMISO_EOM <= '"+starttime+"' AND C1.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' " +prefixclauseCumplimiento +  prefixclauseCumplimiento + prefixclauseCumplimiento_resumen + " GROUP BY C1.CUMPLE_RESUMEN ORDER BY C1.CUMPLE_RESUMEN ASC";
								//SQLCumplimiento = "SELECT  C1.CUMPLE_RESUMEN from CUMPLIMIENTO C1 WHERE  1 = 1 AND C1.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C1.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' " +prefixclauseCumplimiento +  prefixclauseCumplimiento + prefixclauseCumplimiento_resumen + " GROUP BY C1.CUMPLE_RESUMEN ORDER BY C1.CUMPLE_RESUMEN ASC";
								SQLCumplimiento = "SELECT C1.CUMPLE_RESUMEN from CUMPLIMIENTO C1 WHERE  1 = 1 AND C1.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C1.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' AND C1.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' " +prefixclauseCumplimiento +  prefixclauseCumplimiento + prefixclauseCumplimiento_resumen + " GROUP BY C1.CUMPLE_RESUMEN ORDER BY C1.CUMPLE_RESUMEN ASC";

								
								//out.print("<br>");
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
										$("#ocultar_cumple_resumen_<%=contarCumple%>_<%=contarCumplimiento%>").click(function() {
											//alert('ocultar_cumple_resumen_0');
											<%
											SQLHideCumpleResumen = "SELECT  C1.CUMPLIMIENTO_2 from CUMPLIMIENTO C1 WHERE  1 = 1  AND C1.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C1.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' AND C1.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND C1.CUMPLE_RESUMEN = '"+rsCumplimiento.getString("CUMPLE_RESUMEN")+"' GROUP BY C1.CUMPLIMIENTO_2 ORDER BY C1.CUMPLIMIENTO_2 ASC";
											psHideCumpleResumen = conn.prepareStatement(SQLHideCumpleResumen, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
											rsHideCumpleResumen = psHideCumpleResumen.executeQuery();
											conn.commit();
											int contarHideCumpleResumen = 0;
											while(rsHideCumpleResumen.next()) {
												contarHideCumpleResumen = contarHideCumpleResumen + 1;
											%>
												$("#cumple_resumen_<%=contarCumple%>_<%=contarCumplimiento%>_<%=contarHideCumpleResumen%>").hide('slow', function() {});
												<%
												SQLHideResponsable = "SELECT  C1.RESPONSABLE from CUMPLIMIENTO C1 WHERE  1 = 1 AND C1.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C1.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' AND C1.CUMPLE = '"+rsCumple.getString("CUMPLE")+"'  AND C1.CUMPLE_RESUMEN = '"+rsCumplimiento.getString("CUMPLE_RESUMEN")+"' AND C1.CUMPLIMIENTO_2 = '"+rsHideCumpleResumen.getString("CUMPLIMIENTO_2")+"' GROUP BY C1.RESPONSABLE ORDER BY C1.RESPONSABLE ASC";
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
											SQLShowCumpleResumen = "SELECT  C1.CUMPLIMIENTO_2 from CUMPLIMIENTO C1 WHERE  1 = 1 AND C1.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C1.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' AND C1.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND C1.CUMPLE_RESUMEN = '"+rsCumplimiento.getString("CUMPLE_RESUMEN")+"' GROUP BY C1.CUMPLIMIENTO_2 ORDER BY C1.CUMPLIMIENTO_2 ASC";
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
									<tr id="cumplimiento_<%=contarCumple%>_<%=contarCumplimiento%>" style="background-color:#d9e1f2;color:#000000;display:none" >
										<td><button class="btn btn-default" id="ocultar_cumple_resumen_<%=contarCumple%>_<%=contarCumplimiento%>" style="display:none"><img src="../images/minus2.gif" /></button><button class="btn btn-default" id="mostrar_cumple_resumen_<%=contarCumple%>_<%=contarCumplimiento%>"/><img src="../images/plus2.gif" /></td>
										<td nowrap="nowrap"><!--  <i class="icon-reorder"></i>-->&nbsp;<%=rsCumplimiento.getString("CUMPLE_RESUMEN")%></td>	 
										<%
										//SQLShowFecha = "SELECT  C1.FECHA_COMPROMISO_EOM, NVL((select count(*) from CUMPLIMIENTO C2 WHERE 1 = 1 AND C2.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND C2.CUMPLE_RESUMEN = '"+rsCumplimiento.getString("CUMPLE_RESUMEN")+"' AND C1.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C1.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+ prefixclauseCumplimiento_resumen2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+"),0) AS CANTIDAD,  NVL( (CASE WHEN ((select count(*) from CUMPLIMIENTO C2  where 1 = 1 AND C2.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND C2.CUMPLE_RESUMEN = '"+rsCumplimiento.getString("CUMPLE_RESUMEN")+"' AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+ prefixclauseCumplimiento_resumen2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")>0 AND (select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+ prefixclauseCumple2 + prefixclauseCumplimiento2 + prefixclauseCumplimiento_resumen2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")>0)  THEN (ROUND( TO_NUMBER(( (select count(*) from CUMPLIMIENTO C2  where 1 = 1 AND C2.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND C2.CUMPLE_RESUMEN = '"+rsCumplimiento.getString("CUMPLE_RESUMEN")+"' AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+ prefixclauseCumplimiento_resumen + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")/(select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+ prefixclauseCumple2 + prefixclauseCumplimiento2 + prefixclauseCumplimiento_resumen2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")  * 100) ), 2 )) ELSE 0 END),0) AS PORCENTAJE  from CUMPLIMIENTO C1 WHERE 1 = 1 AND C1.FECHA_COMPROMISO_EOM >=  TO_CHAR(to_date((to_char(ADD_MONTHS(TO_CHAR(to_date('"+request.getParameter("fromstatsmonth_sday")+"-01', 'YYYY-MM-DD'), 'DD/MM/YY'),-3))), 'DD/MM/YY'), 'YYYY-MM-DD') AND C1.FECHA_COMPROMISO_EOM <= '"+request.getParameter("fromstatsmonth_sday")+"-31' GROUP BY C1.FECHA_COMPROMISO_EOM ORDER BY C1.FECHA_COMPROMISO_EOM ASC";
										SQLShowFecha = "SELECT  SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) AS FECHA_COMPROMISO_EOM, NVL((select count(*) from CUMPLIMIENTO C2 WHERE 1 = 1 AND C2.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND C2.CUMPLE_RESUMEN = '"+rsCumplimiento.getString("CUMPLE_RESUMEN")+"' AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+ prefixclauseCumplimiento_resumen2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+"),0) AS CANTIDAD,  NVL( (CASE WHEN ((select count(*) from CUMPLIMIENTO C2  where 1 = 1 AND C2.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND C2.CUMPLE_RESUMEN = '"+rsCumplimiento.getString("CUMPLE_RESUMEN")+"' AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+ prefixclauseCumplimiento_resumen2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")>0 AND (select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+ prefixclauseCumple2 + prefixclauseCumplimiento2 + prefixclauseCumplimiento_resumen2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")>0)  THEN (ROUND( TO_NUMBER(( (select count(*) from CUMPLIMIENTO C2  where 1 = 1 AND C2.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND C2.CUMPLE_RESUMEN = '"+rsCumplimiento.getString("CUMPLE_RESUMEN")+"' AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+ prefixclauseCumplimiento_resumen + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")/(select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+ prefixclauseCumple2 + prefixclauseCumplimiento2 + prefixclauseCumplimiento_resumen2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")  * 100) ), 2 )) ELSE 0 END),0) AS PORCENTAJE  from CUMPLIMIENTO C1 WHERE 1 = 1 AND C1.FECHA_COMPROMISO_EOM >=  TO_CHAR(to_date((to_char(ADD_MONTHS(TO_CHAR(to_date('"+request.getParameter("fromstatsmonth_sday")+"-01', 'YYYY-MM-DD'), 'DD/MM/YY'),-6))), 'DD/MM/YY'), 'YYYY-MM-DD') AND C1.FECHA_COMPROMISO_EOM <= '"+request.getParameter("fromstatsmonth_sday")+"-31' GROUP BY SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) ORDER BY SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) ASC";
										//out.print("<br>");
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
									<%
									// Tercera Fila CumpleResumen
									//SQLCumpleResumen = "SELECT  C1.CUMPLIMIENTO_2 from CUMPLIMIENTO C1 WHERE  1 = 1 AND C1.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-8, 'YYYY/MM/DD'),'/','-') AND C1.FECHA_COMPROMISO_EOM <= '"+starttime+"' AND C1.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND C1.CUMPLE_RESUMEN = '"+rsCumplimiento.getString("CUMPLE_RESUMEN")+"' " +prefixclauseCumplimiento_resumen+ " GROUP BY C1.CUMPLIMIENTO_2 ORDER BY C1.CUMPLIMIENTO_2 ASC";
									SQLCumpleResumen = "SELECT  C1.CUMPLIMIENTO_2 from CUMPLIMIENTO C1 WHERE  1 = 1 AND C1.FECHA_COMPROMISO_EOM >=  TO_CHAR(to_date((to_char(ADD_MONTHS(TO_CHAR(to_date('"+request.getParameter("fromstatsmonth_sday")+"-01', 'YYYY-MM-DD'), 'DD/MM/YY'),-6))), 'DD/MM/YY'), 'YYYY-MM-DD') AND C1.FECHA_COMPROMISO_EOM <= '"+request.getParameter("fromstatsmonth_sday")+"-31' AND C1.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND C1.CUMPLE_RESUMEN = '"+rsCumplimiento.getString("CUMPLE_RESUMEN")+"' " +prefixclauseCumplimiento_resumen+ " GROUP BY C1.CUMPLIMIENTO_2 ORDER BY C1.CUMPLIMIENTO_2 ASC";
									//out.print("<br>");
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
											$("#ocultar_responsable_<%=contarCumple%>_<%=contarCumplimiento%>_<%=contarCumpleResumen%>").click(function() {
												//alert('ocultar_responsable_<%=contarCumple%>_<%=contarCumplimiento%>_<%=contarCumpleResumen%>');
												<%
												SQLHideResponsable = "SELECT  C1.RESPONSABLE from CUMPLIMIENTO C1 WHERE  1 = 1  AND C1.FECHA_COMPROMISO_EOM >=  TO_CHAR(to_date((to_char(ADD_MONTHS(TO_CHAR(to_date('"+request.getParameter("fromstatsmonth_sday")+"-01', 'YYYY-MM-DD'), 'DD/MM/YY'),-6))), 'DD/MM/YY'), 'YYYY-MM-DD') AND C1.FECHA_COMPROMISO_EOM <= '"+request.getParameter("fromstatsmonth_sday")+"-31' AND C1.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND C1.CUMPLE_RESUMEN = '"+rsCumplimiento.getString("CUMPLE_RESUMEN")+"' AND C1.CUMPLIMIENTO_2 = '"+rsCumpleResumen.getString("CUMPLIMIENTO_2")+"' GROUP BY C1.RESPONSABLE ORDER BY C1.RESPONSABLE ASC";
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
												SQLShowResponsable = "SELECT  C1.RESPONSABLE from CUMPLIMIENTO C1 WHERE  1 = 1  AND C1.FECHA_COMPROMISO_EOM >=  TO_CHAR(to_date((to_char(ADD_MONTHS(TO_CHAR(to_date('"+request.getParameter("fromstatsmonth_sday")+"-01', 'YYYY-MM-DD'), 'DD/MM/YY'),-6))), 'DD/MM/YY'), 'YYYY-MM-DD') AND C1.FECHA_COMPROMISO_EOM <= '"+request.getParameter("fromstatsmonth_sday")+"-31' AND C1.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND C1.CUMPLE_RESUMEN = '"+rsCumplimiento.getString("CUMPLE_RESUMEN")+"' AND C1.CUMPLIMIENTO_2 = '"+rsCumpleResumen.getString("CUMPLIMIENTO_2")+"'  GROUP BY C1.RESPONSABLE ORDER BY C1.RESPONSABLE ASC";
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
										<tr id="cumple_resumen_<%=contarCumple%>_<%=contarCumplimiento%>_<%=contarCumpleResumen%>"  style="background-color:#b7ecff;color:#000000;display:none">
											<td><button class="btn btn-default" id="ocultar_responsable_<%=contarCumple%>_<%=contarCumplimiento%>_<%=contarCumpleResumen%>" style="display:none"><img src="../images/minus2.gif" /></button><button class="btn btn-default" id="mostrar_responsable_<%=contarCumple%>_<%=contarCumplimiento%>_<%=contarCumpleResumen%>"/><img src="../images/plus2.gif" /></td>
											<td nowrap="nowrap"><!--  <i class="icon-reorder"></i>-->&nbsp;<%=rsCumpleResumen.getString("CUMPLIMIENTO_2")%></td>
											<%
											//SQLShowFecha = "SELECT  C1.FECHA_COMPROMISO_EOM, NVL((select count(*) from CUMPLIMIENTO C2 WHERE 1 = 1 AND C2.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND C2.CUMPLE_RESUMEN = '"+rsCumplimiento.getString("CUMPLE_RESUMEN")+"' AND C2.CUMPLIMIENTO_2 = '"+rsCumpleResumen.getString("CUMPLIMIENTO_2")+"' AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+ prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+"),0) AS CANTIDAD,  NVL( (CASE WHEN ((select count(*) from CUMPLIMIENTO C2  where 1 = 1 AND C2.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND C2.CUMPLE_RESUMEN = '"+rsCumplimiento.getString("CUMPLE_RESUMEN")+"' AND C2.CUMPLIMIENTO_2 = '"+rsCumpleResumen.getString("CUMPLIMIENTO_2")+"' AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+ prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")>0 AND (select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+ prefixclauseCumple2 + prefixclauseCumplimiento2 + prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")>0)  THEN (ROUND( TO_NUMBER(( (select count(*) from CUMPLIMIENTO C2  where 1 = 1 AND C2.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND C2.CUMPLE_RESUMEN = '"+rsCumplimiento.getString("CUMPLE_RESUMEN")+"' AND C2.CUMPLIMIENTO_2 = '"+rsCumpleResumen.getString("CUMPLIMIENTO_2")+"' AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+ prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")/(select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+prefixclauseCumple2 + prefixclauseCumplimiento2 + prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")  * 100) ), 2 )) ELSE 0 END),0) AS PORCENTAJE  from CUMPLIMIENTO C1 WHERE 1 = 1 AND C1.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-8, 'YYYY/MM/DD'),'/','-') AND C1.FECHA_COMPROMISO_EOM <= '"+starttime+"' GROUP BY C1.FECHA_COMPROMISO_EOM ORDER BY C1.FECHA_COMPROMISO_EOM ASC";
											SQLShowFecha = "SELECT  SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) AS FECHA_COMPROMISO_EOM, NVL((select count(*) from CUMPLIMIENTO C2 WHERE 1 = 1 AND C2.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND C2.CUMPLE_RESUMEN = '"+rsCumplimiento.getString("CUMPLE_RESUMEN")+"' AND C2.CUMPLIMIENTO_2 = '"+rsCumpleResumen.getString("CUMPLIMIENTO_2")+"' AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+ prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+"),0) AS CANTIDAD,  NVL( (CASE WHEN ((select count(*) from CUMPLIMIENTO C2  where 1 = 1 AND C2.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND C2.CUMPLE_RESUMEN = '"+rsCumplimiento.getString("CUMPLE_RESUMEN")+"' AND C2.CUMPLIMIENTO_2 = '"+rsCumpleResumen.getString("CUMPLIMIENTO_2")+"' AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+ prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")>0 AND (select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+ prefixclauseCumple2 + prefixclauseCumplimiento2 + prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")>0)  THEN (ROUND( TO_NUMBER(( (select count(*) from CUMPLIMIENTO C2  where 1 = 1 AND C2.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND C2.CUMPLE_RESUMEN = '"+rsCumplimiento.getString("CUMPLE_RESUMEN")+"' AND C2.CUMPLIMIENTO_2 = '"+rsCumpleResumen.getString("CUMPLIMIENTO_2")+"' AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+ prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")/(select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+prefixclauseCumple2 + prefixclauseCumplimiento2 + prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")  * 100) ), 2 )) ELSE 0 END),0) AS PORCENTAJE  from CUMPLIMIENTO C1 WHERE 1 = 1 AND C1.FECHA_COMPROMISO_EOM >=  TO_CHAR(to_date((to_char(ADD_MONTHS(TO_CHAR(to_date('"+request.getParameter("fromstatsmonth_sday")+"-01', 'YYYY-MM-DD'), 'DD/MM/YY'),-6))), 'DD/MM/YY'), 'YYYY-MM-DD') AND C1.FECHA_COMPROMISO_EOM <= '"+request.getParameter("fromstatsmonth_sday")+"-31' GROUP BY SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) ORDER BY SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) ASC";
											//out.print("<br>");
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
										<%
										// Cuarta Fila Responsable
										//SQLResponsable = "SELECT C1.RESPONSABLE from CUMPLIMIENTO C1 WHERE  1 = 1 AND C1.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-8, 'YYYY/MM/DD'),'/','-') AND C1.FECHA_COMPROMISO_EOM <= '"+starttime+"' AND C1.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND C1.CUMPLE_RESUMEN = '"+rsCumplimiento.getString("CUMPLE_RESUMEN")+"' AND C1.CUMPLIMIENTO_2 = '"+rsCumpleResumen.getString("CUMPLIMIENTO_2")+"' "+prefixclauseResponsable+" GROUP BY C1.RESPONSABLE ORDER BY C1.RESPONSABLE ASC";
										SQLResponsable = "SELECT C1.RESPONSABLE from CUMPLIMIENTO C1 WHERE  1 = 1 AND C1.FECHA_COMPROMISO_EOM >=  TO_CHAR(to_date((to_char(ADD_MONTHS(TO_CHAR(to_date('"+request.getParameter("fromstatsmonth_sday")+"-01', 'YYYY-MM-DD'), 'DD/MM/YY'),-6))), 'DD/MM/YY'), 'YYYY-MM-DD') AND C1.FECHA_COMPROMISO_EOM <= '"+request.getParameter("fromstatsmonth_sday")+"-31' AND C1.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND C1.CUMPLE_RESUMEN = '"+rsCumplimiento.getString("CUMPLE_RESUMEN")+"' AND C1.CUMPLIMIENTO_2 = '"+rsCumpleResumen.getString("CUMPLIMIENTO_2")+"' "+prefixclauseResponsable+" GROUP BY C1.RESPONSABLE ORDER BY C1.RESPONSABLE ASC";
										//out.print("<br>");
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
											<tr id="responsable_<%=contarCumple%>_<%=contarCumplimiento%>_<%=contarCumpleResumen%>_<%=contarResponsable%>" style="display:none">
												<td></td>
												<td style="background-color:#FFF;color:#000000" nowrap="nowrap"><!--  <i class="icon-reorder"></i>-->&nbsp;<%=rsResponsable.getString("RESPONSABLE")%></td>
												<%
												SQLShowFecha = "SELECT  SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) AS FECHA_COMPROMISO_EOM, NVL((select count(*) from CUMPLIMIENTO C2 WHERE 1 = 1 AND C2.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND C2.CUMPLE_RESUMEN = '"+rsCumplimiento.getString("CUMPLE_RESUMEN")+"' AND C2.CUMPLIMIENTO_2 = '"+rsCumpleResumen.getString("CUMPLIMIENTO_2")+"' AND RESPONSABLE = '"+rsResponsable.getString("RESPONSABLE")+"' AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+"),0) AS CANTIDAD,  NVL( (CASE WHEN ((select count(*) from CUMPLIMIENTO C2  where 1 = 1 AND C2.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND C2.CUMPLE_RESUMEN = '"+rsCumplimiento.getString("CUMPLE_RESUMEN")+"' AND C2.CUMPLIMIENTO_2 = '"+rsCumpleResumen.getString("CUMPLIMIENTO_2")+"' AND RESPONSABLE = '"+rsResponsable.getString("RESPONSABLE")+"' AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")>0 AND (select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+ prefixclauseCumple2 + prefixclauseCumplimiento2 + prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")>0)  THEN (ROUND( TO_NUMBER(( (select count(*) from CUMPLIMIENTO C2  where 1 = 1 AND C2.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND C2.CUMPLE_RESUMEN = '"+rsCumplimiento.getString("CUMPLE_RESUMEN")+"' AND C2.CUMPLIMIENTO_2 = '"+rsCumpleResumen.getString("CUMPLIMIENTO_2")+"' AND RESPONSABLE = '"+rsResponsable.getString("RESPONSABLE")+"' AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")/(select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+prefixclauseCumple2 + prefixclauseCumplimiento2 + prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")  * 100) ), 2 )) ELSE 0 END),0) AS PORCENTAJE  from CUMPLIMIENTO C1 WHERE 1 = 1 AND C1.FECHA_COMPROMISO_EOM >=  TO_CHAR(to_date((to_char(ADD_MONTHS(TO_CHAR(to_date('"+request.getParameter("fromstatsmonth_sday")+"-01', 'YYYY-MM-DD'), 'DD/MM/YY'),-6))), 'DD/MM/YY'), 'YYYY-MM-DD') AND C1.FECHA_COMPROMISO_EOM <= '"+request.getParameter("fromstatsmonth_sday")+"-31' GROUP BY SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) ORDER BY SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) ASC";
												//SQLShowFecha = "SELECT  C1.FECHA_COMPROMISO_EOM, NVL((select count(*) from CUMPLIMIENTO C2 WHERE 1 = 1 AND C2.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND C2.CUMPLE_RESUMEN = '"+rsCumplimiento.getString("CUMPLE_RESUMEN")+"' AND C2.CUMPLIMIENTO_2 = '"+rsCumpleResumen.getString("CUMPLIMIENTO_2")+"' AND RESPONSABLE = '"+rsResponsable.getString("RESPONSABLE")+"' AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+"),0) AS CANTIDAD,  NVL( (CASE WHEN ((select count(*) from CUMPLIMIENTO C2  where 1 = 1 AND C2.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND C2.CUMPLE_RESUMEN = '"+rsCumplimiento.getString("CUMPLE_RESUMEN")+"' AND C2.CUMPLIMIENTO_2 = '"+rsCumpleResumen.getString("CUMPLIMIENTO_2")+"' AND RESPONSABLE = '"+rsResponsable.getString("RESPONSABLE")+"' AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")>0 AND (select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+ prefixclauseCumple2 + prefixclauseCumplimiento2 + prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")>0)  THEN (ROUND( TO_NUMBER(( (select count(*) from CUMPLIMIENTO C2  where 1 = 1 AND C2.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND C2.CUMPLE_RESUMEN = '"+rsCumplimiento.getString("CUMPLE_RESUMEN")+"' AND C2.CUMPLIMIENTO_2 = '"+rsCumpleResumen.getString("CUMPLIMIENTO_2")+"' AND RESPONSABLE = '"+rsResponsable.getString("RESPONSABLE")+"' AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")/(select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+prefixclauseCumple2 + prefixclauseCumplimiento2 + prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")  * 100) ), 2 )) ELSE 0 END),0) AS PORCENTAJE  from CUMPLIMIENTO C1 WHERE 1 = 1 AND C1.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-8, 'YYYY/MM/DD'),'/','-') AND C1.FECHA_COMPROMISO_EOM <= '"+starttime+"' GROUP BY C1.FECHA_COMPROMISO_EOM ORDER BY C1.FECHA_COMPROMISO_EOM ASC";
												//out.print("<br>");
												//out.print("SQLShowFecha = "+SQLShowFecha);
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
						
						<tr style="background-color:#305496;color:#FFF">
							<td></td>
							<td>Total General</td>
							<%
							// Totales
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
								SQLTotal = "SELECT  REPLACE (REPLACE (CONCAT(''''||SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7),''''), '', ''), '','') AS FECHA_COMPROMISO_EOM, NVL((select count(*) from CUMPLIMIENTO C2 WHERE 1 = 1  AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+prefixclauseCumple2 + prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+"),0) AS CANTIDAD,  NVL( (CASE WHEN ((select count(*) from CUMPLIMIENTO C2  where 1 = 1  AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+ prefixclauseCumple2 + prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")>0 AND (select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+prefixclauseCumple2 + prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")>0)  THEN (ROUND( TO_NUMBER(( (select count(*) from CUMPLIMIENTO C2  where 1 = 1  AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+ prefixclauseCumple2 + prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")/(select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+prefixclauseCumple2 + prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")  * 100) ), 2 )) ELSE 0 END),0) AS PORCENTAJE  from CUMPLIMIENTO C1 WHERE 1 =1 AND C1.FECHA_COMPROMISO_EOM >=  TO_CHAR(to_date((to_char(ADD_MONTHS(TO_CHAR(to_date('"+request.getParameter("fromstatsmonth_sday")+"-01', 'YYYY-MM-DD'), 'DD/MM/YY'),-6))), 'DD/MM/YY'), 'YYYY-MM-DD') AND C1.FECHA_COMPROMISO_EOM <= '"+request.getParameter("fromstatsmonth_sday")+"-31' GROUP BY SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) ORDER BY SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) ASC";
								out.print("<br>");
								out.println("SQLTotal="+SQLTotal);
								out.print("<br>");
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
				<%
			Connection connGraph1 = null;
			PreparedStatement psGraph1 = null;
			ResultSet rsGraph1 = null;
			String SQLGraph1 = null;
			float resultTotalCumple1 = 0;
			float resultTotalCumple2 = 0;
			float resultTotalCumple3 = 0;

			int totalesCantidadGraficos1 = 0;
			int totalesCantidadGraficos2 = 0;
			int totalesCantidadGraficos3 = 0;
			
			float totalesProcentajeGraficos1 = 0;
			float totalesProcentajeGraficos2 = 0;
			float totalesProcentajeGraficos3 = 0;

			GraficosDTO graficoCumple1 = null;
			GraficosDTO graficoCumple2 = null;
			GraficosDTO graficoCumple3 = null;
			
			List<GraficosDTO> resultCumple1 = new ArrayList<GraficosDTO>();
			List<GraficosDTO> resultCumple2 = new ArrayList<GraficosDTO>();
			List<GraficosDTO> resultCumple3 = new ArrayList<GraficosDTO>();
			
			
			
			
			
			try{
				Class.forName("oracle.jdbc.OracleDriver").newInstance();
				connGraph1 = DriverManager.getConnection("jdbc:oracle:thin:@172.18.163.15:1521/XE","kpiweb","kpiweb");//
				connGraph1.setAutoCommit(false);
				
				if (request.getParameterValues("tipo_estado") != null) {
					//SQLGraph1= "SELECT  REPLACE(REPLACE (REPLACE (CONCAT(''''||C1.FECHA_COMPROMISO_EOM,''''), '00:', ''), '00',''),' ','') AS FECHA_COMPROMISO_EOM, NVL((select count(*) from CUMPLIMIENTO C2 WHERE 1 = 1 AND C2.CUMPLE = '1.- CUMPLE' AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+ prefixclauseCumple2 + prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+"),0) AS CANTIDAD,  NVL( (CASE WHEN ((select count(*) from CUMPLIMIENTO C2  where 1 = 1 AND C2.CUMPLE = '1.- CUMPLE' AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+prefixclauseCumple2 + prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")>0 AND (select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+ prefixclauseCumple2 + prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2  + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")>0)  THEN (ROUND( TO_NUMBER(( (select count(*) from CUMPLIMIENTO C2  where 1 = 1 AND C2.CUMPLE = '1.- CUMPLE' AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+ prefixclauseCumple2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")/(select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+prefixclauseCumple2 + prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2  + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")  * 100) ), 2 )) ELSE 0 END),0) AS PORCENTAJE, NVL((select count(*) from CUMPLIMIENTO C2 WHERE 1 = 1 AND C2.CUMPLE = '2.- ATRASADO' AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+ prefixclauseCumple2 + prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+"),0) AS CANTIDAD2,  NVL( (CASE WHEN ((select count(*) from CUMPLIMIENTO C2  where 1 = 1 AND C2.CUMPLE = '2.- ATRASADO' AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+ prefixclauseCumple2 + prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")>0 AND (select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+ prefixclauseCumple2 + prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2  + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")>0)  THEN (ROUND( TO_NUMBER(( (select count(*) from CUMPLIMIENTO C2  where 1 = 1 AND C2.CUMPLE = '2.- ATRASADO' AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+ prefixclauseCumple2  + prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")/(select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+ prefixclauseCumple2 + prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2  + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")  * 100) ), 2 )) ELSE 0 END),0) AS PORCENTAJE2, NVL((select count(*) from CUMPLIMIENTO C2 WHERE 1 = 1 AND C2.CUMPLE = '3.- NO CUMPLE' AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+ prefixclauseCumple2 + prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+"),0) AS CANTIDAD3,  NVL( (CASE WHEN ((select count(*) from CUMPLIMIENTO C2  where 1 = 1 AND C2.CUMPLE = '3.- NO CUMPLE' AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+prefixclauseCumple2 + prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")>0 AND (select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+ prefixclauseCumple2 + prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")>0)  THEN (ROUND( TO_NUMBER(( (select count(*) from CUMPLIMIENTO C2  where 1 = 1 AND C2.CUMPLE = '3.- NO CUMPLE' AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+prefixclauseCumple2 + prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")/(select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+prefixclauseCumple2 + prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")  * 100) ), 2 )) ELSE 0 END),0) AS PORCENTAJE3   from CUMPLIMIENTO C1 WHERE 1 = 1 AND C1.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-8, 'YYYY/MM/DD'),'/','-') AND C1.FECHA_COMPROMISO_EOM <= '"+starttime+"' AND C1.CUMPLE = '1.- CUMPLE'  GROUP BY C1.FECHA_COMPROMISO_EOM ORDER BY C1.FECHA_COMPROMISO_EOM ASC";
					SQLGraph1= "SELECT  REPLACE(REPLACE (REPLACE (CONCAT(''''||SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7),''''), '', ''), '',''),' ','') AS FECHA_COMPROMISO_EOM, NVL((select count(*) from CUMPLIMIENTO C2 WHERE 1 = 1 AND C2.CUMPLE = '1.- CUMPLE' AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+ prefixclauseCumple2 + prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+"),0) AS CANTIDAD,  NVL( (CASE WHEN ((select count(*) from CUMPLIMIENTO C2  where 1 = 1 AND C2.CUMPLE = '1.- CUMPLE' AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+prefixclauseCumple2 + prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")>0 AND (select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+ prefixclauseCumple2 + prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2  + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")>0)  THEN (ROUND( TO_NUMBER(( (select count(*) from CUMPLIMIENTO C2  where 1 = 1 AND C2.CUMPLE = '1.- CUMPLE' AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+ prefixclauseCumple2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")/(select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+prefixclauseCumple2 + prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2  + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")  * 100) ), 2 )) ELSE 0 END),0) AS PORCENTAJE, NVL((select count(*) from CUMPLIMIENTO C2 WHERE 1 = 1 AND C2.CUMPLE = '2.- ATRASADO' AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+ prefixclauseCumple2 + prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+"),0) AS CANTIDAD2,  NVL( (CASE WHEN ((select count(*) from CUMPLIMIENTO C2  where 1 = 1 AND C2.CUMPLE = '2.- ATRASADO' AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+ prefixclauseCumple2 + prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")>0 AND (select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+ prefixclauseCumple2 + prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2  + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")>0)  THEN (ROUND( TO_NUMBER(( (select count(*) from CUMPLIMIENTO C2  where 1 = 1 AND C2.CUMPLE = '2.- ATRASADO' AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+ prefixclauseCumple2  + prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")/(select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+ prefixclauseCumple2 + prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2  + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")  * 100) ), 2 )) ELSE 0 END),0) AS PORCENTAJE2, NVL((select count(*) from CUMPLIMIENTO C2 WHERE 1 = 1 AND C2.CUMPLE = '3.- NO CUMPLE' AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+ prefixclauseCumple2 + prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+"),0) AS CANTIDAD3,  NVL( (CASE WHEN ((select count(*) from CUMPLIMIENTO C2  where 1 = 1 AND C2.CUMPLE = '3.- NO CUMPLE' AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+prefixclauseCumple2 + prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")>0 AND (select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+ prefixclauseCumple2 + prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")>0)  THEN (ROUND( TO_NUMBER(( (select count(*) from CUMPLIMIENTO C2  where 1 = 1 AND C2.CUMPLE = '3.- NO CUMPLE' AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+prefixclauseCumple2 + prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")/(select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+prefixclauseCumple2 + prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")  * 100) ), 2 )) ELSE 0 END),0) AS PORCENTAJE3   from CUMPLIMIENTO C1 WHERE 1 = 1 AND C1.FECHA_COMPROMISO_EOM >=  TO_CHAR(to_date((to_char(ADD_MONTHS(TO_CHAR(to_date('"+request.getParameter("fromstatsmonth_sday")+"-01', 'YYYY-MM-DD'), 'DD/MM/YY'),-6))), 'DD/MM/YY'), 'YYYY-MM-DD') AND C1.FECHA_COMPROMISO_EOM <= '"+request.getParameter("fromstatsmonth_sday")+"-31' AND C1.CUMPLE = '1.- CUMPLE'  GROUP BY SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) ORDER BY SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) ASC";
				} else {
					//SQLGraph1= "SELECT  REPLACE(REPLACE (REPLACE (CONCAT(''''||C1.FECHA_COMPROMISO_EOM,''''), '00:', ''), '00',''),' ','') AS FECHA_COMPROMISO_EOM, NVL((select count(*) from CUMPLIMIENTO C2 WHERE 1 = 1 AND C2.CUMPLE = '1.- CUMPLE' AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+"),0) AS CANTIDAD,  NVL( (CASE WHEN ((select count(*) from CUMPLIMIENTO C2  where 1 = 1 AND C2.CUMPLE = '1.- CUMPLE' AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")>0 AND (select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+ prefixclauseCumple2 + prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2  + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")>0)  THEN (ROUND( TO_NUMBER(( (select count(*) from CUMPLIMIENTO C2  where 1 = 1 AND C2.CUMPLE = '1.- CUMPLE' AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")/(select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+prefixclauseCumple2 + prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2  + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")  * 100) ), 2 )) ELSE 0 END),0) AS PORCENTAJE, NVL((select count(*) from CUMPLIMIENTO C2 WHERE 1 = 1 AND C2.CUMPLE = '2.- ATRASADO' AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+ prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+"),0) AS CANTIDAD2,  NVL( (CASE WHEN ((select count(*) from CUMPLIMIENTO C2  where 1 = 1 AND C2.CUMPLE = '2.- ATRASADO' AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")>0 AND (select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+ prefixclauseCumple2 + prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2  + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")>0)  THEN (ROUND( TO_NUMBER(( (select count(*) from CUMPLIMIENTO C2  where 1 = 1 AND C2.CUMPLE = '2.- ATRASADO' AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")/(select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+ prefixclauseCumple2 + prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2  + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")  * 100) ), 2 )) ELSE 0 END),0) AS PORCENTAJE2, NVL((select count(*) from CUMPLIMIENTO C2 WHERE 1 = 1 AND C2.CUMPLE = '3.- NO CUMPLE' AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+ prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+"),0) AS CANTIDAD3,  NVL( (CASE WHEN ((select count(*) from CUMPLIMIENTO C2  where 1 = 1 AND C2.CUMPLE = '3.- NO CUMPLE' AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")>0 AND (select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+ prefixclauseCumple2 + prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")>0)  THEN (ROUND( TO_NUMBER(( (select count(*) from CUMPLIMIENTO C2  where 1 = 1 AND C2.CUMPLE = '3.- NO CUMPLE' AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")/(select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+prefixclauseCumple2 + prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")  * 100) ), 2 )) ELSE 0 END),0) AS PORCENTAJE3   from CUMPLIMIENTO C1 WHERE 1 = 1 AND C1.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-8, 'YYYY/MM/DD'),'/','-') AND C1.FECHA_COMPROMISO_EOM <= '"+starttime+"' AND C1.CUMPLE = '1.- CUMPLE'  GROUP BY C1.FECHA_COMPROMISO_EOM ORDER BY C1.FECHA_COMPROMISO_EOM ASC";
					SQLGraph1= "SELECT  REPLACE(REPLACE (REPLACE (CONCAT(''''||SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7),''''), '', ''), '',''),' ','') AS FECHA_COMPROMISO_EOM, NVL((select count(*) from CUMPLIMIENTO C2 WHERE 1 = 1 AND C2.CUMPLE = '1.- CUMPLE' AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+"),0) AS CANTIDAD,  NVL( (CASE WHEN ((select count(*) from CUMPLIMIENTO C2  where 1 = 1 AND C2.CUMPLE = '1.- CUMPLE' AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")>0 AND (select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+ prefixclauseCumple2 + prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2  + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")>0)  THEN (ROUND( TO_NUMBER(( (select count(*) from CUMPLIMIENTO C2  where 1 = 1 AND C2.CUMPLE = '1.- CUMPLE' AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")/(select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+prefixclauseCumple2 + prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2  + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")  * 100) ), 2 )) ELSE 0 END),0) AS PORCENTAJE, NVL((select count(*) from CUMPLIMIENTO C2 WHERE 1 = 1 AND C2.CUMPLE = '2.- ATRASADO' AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+ prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+"),0) AS CANTIDAD2,  NVL( (CASE WHEN ((select count(*) from CUMPLIMIENTO C2  where 1 = 1 AND C2.CUMPLE = '2.- ATRASADO' AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")>0 AND (select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+ prefixclauseCumple2 + prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2  + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")>0)  THEN (ROUND( TO_NUMBER(( (select count(*) from CUMPLIMIENTO C2  where 1 = 1 AND C2.CUMPLE = '2.- ATRASADO' AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")/(select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+ prefixclauseCumple2 + prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2  + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")  * 100) ), 2 )) ELSE 0 END),0) AS PORCENTAJE2, NVL((select count(*) from CUMPLIMIENTO C2 WHERE 1 = 1 AND C2.CUMPLE = '3.- NO CUMPLE' AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+ prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+"),0) AS CANTIDAD3,  NVL( (CASE WHEN ((select count(*) from CUMPLIMIENTO C2  where 1 = 1 AND C2.CUMPLE = '3.- NO CUMPLE' AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")>0 AND (select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+ prefixclauseCumple2 + prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")>0)  THEN (ROUND( TO_NUMBER(( (select count(*) from CUMPLIMIENTO C2  where 1 = 1 AND C2.CUMPLE = '3.- NO CUMPLE' AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")/(select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+prefixclauseCumple2 + prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")  * 100) ), 2 )) ELSE 0 END),0) AS PORCENTAJE3   from CUMPLIMIENTO C1 WHERE 1 = 1 AND C1.FECHA_COMPROMISO_EOM >=  TO_CHAR(to_date((to_char(ADD_MONTHS(TO_CHAR(to_date('"+request.getParameter("fromstatsmonth_sday")+"-01', 'YYYY-MM-DD'), 'DD/MM/YY'),-6))), 'DD/MM/YY'), 'YYYY-MM-DD') AND C1.FECHA_COMPROMISO_EOM <= '"+request.getParameter("fromstatsmonth_sday")+"-31' AND C1.CUMPLE = '1.- CUMPLE'  GROUP BY SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7)  ORDER BY SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7)  ASC";
					//SQLGraph1= "SELECT  REPLACE(REPLACE (REPLACE (CONCAT(''''||SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7),''''), '', ''), '',''),' ','') AS FECHA_COMPROMISO_EOM, NVL((select count(*) from CUMPLIMIENTO C2 WHERE 1 = 1 AND C2.CUMPLE = '1.- CUMPLE' AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+"),0) AS CANTIDAD,  NVL( (CASE WHEN ((select count(*) from CUMPLIMIENTO C2  where 1 = 1 AND C2.CUMPLE = '1.- CUMPLE' AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")>0 AND (select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+ prefixclauseCumple2 + prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2  + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")>0)  THEN (ROUND( TO_NUMBER(( (select count(*) from CUMPLIMIENTO C2  where 1 = 1 AND C2.CUMPLE = '1.- CUMPLE' AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")/(select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+prefixclauseCumple2 + prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2  + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")  * 100) ), 2 )) ELSE 0 END),0) AS PORCENTAJE, NVL((select count(*) from CUMPLIMIENTO C2 WHERE 1 = 1 AND C2.CUMPLE = '2.- ATRASADO' AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+ prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+"),0) AS CANTIDAD2,  NVL( (CASE WHEN ((select count(*) from CUMPLIMIENTO C2  where 1 = 1 AND C2.CUMPLE = '2.- ATRASADO' AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")>0 AND (select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+ prefixclauseCumple2 + prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2  + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")>0)  THEN (ROUND( TO_NUMBER(( (select count(*) from CUMPLIMIENTO C2  where 1 = 1 AND C2.CUMPLE = '2.- ATRASADO' AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")/(select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+ prefixclauseCumple2 + prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2  + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")  * 100) ), 2 )) ELSE 0 END),0) AS PORCENTAJE2, NVL((select count(*) from CUMPLIMIENTO C2 WHERE 1 = 1 AND C2.CUMPLE = '3.- NO CUMPLE' AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+ prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+"),0) AS CANTIDAD3,  NVL( (CASE WHEN ((select count(*) from CUMPLIMIENTO C2  where 1 = 1 AND C2.CUMPLE = '3.- NO CUMPLE' AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")>0 AND (select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+ prefixclauseCumple2 + prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")>0)  THEN (ROUND( TO_NUMBER(( (select count(*) from CUMPLIMIENTO C2  where 1 = 1 AND C2.CUMPLE = '3.- NO CUMPLE' AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")/(select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO_EOM >= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-01 00:00:00' AND C2.FECHA_COMPROMISO_EOM <= SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) || '-31 23:59:59' "+prefixclauseCumple2 + prefixclauseCumplimiento2 +prefixclauseCumplimiento_resumen2 + prefixclauseResponsable2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+")  * 100) ), 2 )) ELSE 0 END),0) AS PORCENTAJE3   from CUMPLIMIENTO C1 WHERE 1 = 1 AND C1.FECHA_COMPROMISO_EOM >=  TO_CHAR(to_date((to_char(ADD_MONTHS(TO_CHAR(to_date('"+request.getParameter("fromstatsmonth_sday")+"-01', 'YYYY-MM-DD'), 'DD/MM/YY'),-6))), 'DD/MM/YY'), 'YYYY-MM-DD') AND C1.FECHA_COMPROMISO_EOM <= '"+request.getParameter("fromstatsmonth_sday")+"-31'  GROUP BY SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) ORDER BY SUBSTR(C1.FECHA_COMPROMISO_EOM,0,7) ASC";
				} 
				out.print("<br>");
				out.println("SQLGraph1="+SQLGraph1);
				out.print("<br>");
				psGraph1 = connGraph1.prepareStatement(SQLGraph1, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
				rsGraph1 = psGraph1.executeQuery();
				connGraph1.commit();
				int contarCumple1 = 0;
				int contarCumple2 = 0;
				int contarCumple3 = 0;
				while(rsGraph1.next()) {
					
					graficoCumple1 = new GraficosDTO();
					graficoCumple1.setId(new Long(1));
					graficoCumple1.setFechaCompromiso(rsGraph1.getString("FECHA_COMPROMISO_EOM"));
					graficoCumple1.setCantidad(rsGraph1.getInt("CANTIDAD"));
					graficoCumple1.setPorcentaje(rsGraph1.getFloat("PORCENTAJE"));
					resultCumple1.add(graficoCumple1);

					graficoCumple2 = new GraficosDTO();
					graficoCumple2.setId(new Long(1));
					graficoCumple2.setFechaCompromiso(rsGraph1.getString("FECHA_COMPROMISO_EOM"));
					graficoCumple2.setCantidad(rsGraph1.getInt("CANTIDAD2"));
					graficoCumple2.setPorcentaje(rsGraph1.getFloat("PORCENTAJE2"));
					resultCumple2.add(graficoCumple2);

					graficoCumple3 = new GraficosDTO();
					graficoCumple3.setId(new Long(1));
					graficoCumple3.setFechaCompromiso(rsGraph1.getString("FECHA_COMPROMISO_EOM"));
					graficoCumple3.setCantidad(rsGraph1.getInt("CANTIDAD3"));
					graficoCumple3.setPorcentaje(rsGraph1.getFloat("PORCENTAJE3"));
					resultCumple3.add(graficoCumple3);
					
					
					// Cumple
					contarCumple1 = contarCumple1 + 1;
					totalesCantidadGraficos1 = totalesCantidadGraficos1 + rsGraph1.getInt("CANTIDAD") ;
					totalesProcentajeGraficos1 = totalesProcentajeGraficos1 + rsGraph1.getInt("PORCENTAJE") ;
					// Atrasado
					contarCumple2 = contarCumple2 + 1;
					totalesCantidadGraficos2 = totalesCantidadGraficos2 + rsGraph1.getInt("CANTIDAD2") ;
					totalesProcentajeGraficos2 = totalesProcentajeGraficos2 + rsGraph1.getInt("PORCENTAJE2") ;
					// No Cumple
					contarCumple3 = contarCumple3 + 1;
					totalesCantidadGraficos3 = totalesCantidadGraficos3 + rsGraph1.getInt("CANTIDAD3") ;
					totalesProcentajeGraficos3 = totalesProcentajeGraficos3 + rsGraph1.getInt("PORCENTAJE3") ;
					
					
					
				}  // end while Total
			} catch (SQLException exQL) {
				connGraph1.rollback();
				out.println("Error SQL: " + exQL.getMessage());	
			} catch (Exception ex) {
				connGraph1.rollback();
				out.println("Error: " + ex.getMessage());
			} finally {
				if (rsGraph1 != null) rsGraph1.close();
				if (psGraph1 != null) psGraph1.close();
				if (connGraph1 != null) connGraph1.close();
			} 	
			DecimalFormat df1 = new DecimalFormat("0.00"); 
			float resultTotalGraph1 = ((float ) ( (float ) totalesCantidadGraficos1 / (float )totalCantidadFecha) * 100);
			
			float resultTotalGraph2 = ((float ) ( (float ) totalesCantidadGraficos2 / (float )totalCantidadFecha) * 100);
			DecimalFormat df2 = new DecimalFormat("0.00"); 
			
			float resultTotalGraph3 = ((float ) ( (float ) totalesCantidadGraficos3 / (float )totalCantidadFecha) * 100);
			DecimalFormat df3 = new DecimalFormat("0.00"); 
			
			%>
			
			
			
			<br>
			<style type="text/css">
${demo.css}
		</style>
		<script type="text/javascript">
		$(function () {
		    $('#container').highcharts({
		        chart: {
		            type: 'line'
		        },
		        title: {
		            text: 'Grafico Ordenes de Compra'
		        },
		        subtitle: {
		            text: 'Source: cencosud.com'
		        },
		        xAxis: {
		            categories: [<% for(int l=0;l<resultCumple1.size();l++) {%><%=resultCumple1.get(l).getFechaCompromiso()+","%><%}%>'-']
		        },
		        yAxis: {
		            title: {
		                text: 'Porcentaje'
		            }
		        },
				tooltip: {
					valueSuffix: ' %'
				},
		        plotOptions: {
		            line: {
		                dataLabels: {
		                    enabled: true
		                },
		                enableMouseTracking: true
		            }
		        },
		        series: [{
		            name: 'Cumple',
		            data: [<% String cadenaPorcentaje1 = ""; for(int h=0;h<resultCumple1.size();h++) { cadenaPorcentaje1 += String.valueOf(resultCumple1.get(h).getPorcentaje()+",");}%><%=cadenaPorcentaje1.substring(0, cadenaPorcentaje1.length()-1)%>]
		        }, {
		            name: 'Atrasado',
		            data: [<% String cadenaPorcentaje2 = ""; for(int k=0;k<resultCumple2.size();k++) { cadenaPorcentaje2 += String.valueOf(resultCumple2.get(k).getPorcentaje()+",");}%><%=cadenaPorcentaje2.substring(0, cadenaPorcentaje2.length()-1)%>]
		        }, {
		            name: 'No Cumple',
		            data: [<% String cadenaPorcentaje3 = ""; for(int j=0;j<resultCumple3.size();j++) { cadenaPorcentaje3 += String.valueOf(resultCumple3.get(j).getPorcentaje()+",");}%><%=cadenaPorcentaje3.substring(0, cadenaPorcentaje3.length()-1)%>]
		        }]
		    });
		});
		</script>
		</c:if>					
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


