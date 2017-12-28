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
				    <button id="btn-add-user" class="btn btn-primary"><i class="icon-plus"></i> Nuevo</button>
				    <button class="btn" disabled="disabled">Import</button>
				    <button class="btn">Export</button>
				    -->
				   
                	
					<div class="btn-group"></div>
				</div>
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="btn-toolbar">
							<form class="form-inline" id="f_all_user" method="get" action="reporteCuadraturaEnVerde">
								<input type="hidden" name="posted" id="posted" value="ok"/>
								<div class="form-group" >
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
									<label>&nbsp;Fecha&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
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
				<table><tr><td colspan="8">Por favor presionar boton buscar</td></tr></table>
				<div class="well" style="overflow:scroll; height:600px">
				      <table class="table">
						<thead>
				        <tr>
				          <th>#</th>
				          <th>Solicitud Origen</th>
				          <th>Distribuicion</th>
				          <th>Creacion</th>
				          <th>Cancelado</th>
				          <th>Estado</th>
				          <!--  
				          <th>Nº Solic. JDA</th>
				          <th>Msg. Error JDA</th>
				          <th>Fecha JDA</th>
				          -->
				          <th>Acciones</th>
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
								//SQLFecha = "SELECT  REPLACE (REPLACE (C1.FECHA_COMPROMISO_EOM, '00:', ''), '00','') AS FECHA_COMPROMISO_EOM,   NVL((select count(*) from CUMPLIMIENTO C2 WHERE 1 = 1 AND C2.FECHA_COMPROMISO_EOM = C1.FECHA_COMPROMISO_EOM "+prefixclauseCumple2 + prefixclauseCumplimiento2 + prefixclauseCumplimiento_resumen2 + prefixclauseTipoOrden2 + prefixclauseTipoVenta2 + prefixclauseClienteRetira2 + prefixclauseDescripcionEmpresa2 + prefixclauseTipoGuia2 + prefixclauseHorario2 + prefixclauseVentaEmpresa2+"),0) AS CANTIDAD from CUMPLIMIENTO C1 WHERE 1 = 1 AND C1.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-8, 'YYYY/MM/DD'),'/','-') AND C1.FECHA_COMPROMISO_EOM <= '"+starttime+"' GROUP BY C1.FECHA_COMPROMISO_EOM ORDER BY C1.FECHA_COMPROMISO_EOM ASC";
								/*SQLFecha = "SELECT  (select CVV_EOM_2.Solicitudoriginal from CUADRATURA_OC_VTAV_EOM CVV_EOM_2 where CVV_EOM_2.N_Orden_Distribu = CVV_EOM.N_Orden_Distribu) AS Solicitudoriginal, CVV_EOM.N_Orden_Distribu,(select to_char(REPLACE(CVV_EOM_2.Fecha_Creacion_Orden,',000000000',''))  from CUADRATURA_OC_VTAV_EOM CVV_EOM_2 where CVV_EOM_2.N_Orden_Distribu = CVV_EOM.N_Orden_Distribu) AS FECHA_CREACION_ORDEN, (select CVV_EOM_2.CANCELADO from CUADRATURA_OC_VTAV_EOM CVV_EOM_2 where CVV_EOM_2.N_Orden_Distribu = CVV_EOM.N_Orden_Distribu) AS CANCELADO, CASE WHEN (SELECT CVV_JDA.NUMDO FROM CUADRATURA_OC_VTAV_JDA CVV_JDA WHERE CVV_JDA.Pofece >= '20170418' AND CVV_JDA.Pofece <= '20170418' AND CVV_JDA.NUMDO = CVV_EOM.n_orden_distribu) IS NOT NULL THEN 'Encontrado' ELSE 'No Encontrado' END    as ENCONTRADOENJDA, CASE WHEN (SELECT CVV_JDA.NUMDO FROM CUADRATURA_OC_VTAV_JDA CVV_JDA WHERE CVV_JDA.Pofece >= '"+starttime+"' AND CVV_JDA.Pofece <= '"+starttime+"' AND CVV_JDA.NUMDO = CVV_EOM.n_orden_distribu) IS NOT NULL THEN (SELECT CVV_JDA.NUMDO FROM CUADRATURA_OC_VTAV_JDA CVV_JDA WHERE CVV_JDA.Pofece >= '"+starttime+"' AND CVV_JDA.Pofece <= '"+starttime+"' AND CVV_JDA.NUMDO = CVV_EOM.n_orden_distribu) ELSE 'Numero solicitud Jda No Encontrado' END    as NUMEROSOLICITUDJDA, CASE WHEN (SELECT CVV_JDA.EX14ERROR FROM CUADRATURA_OC_VTAV_JDA CVV_JDA WHERE CVV_JDA.Pofece >= '"+starttime+"' AND CVV_JDA.Pofece <= '"+starttime+"' AND CVV_JDA.NUMDO = CVV_EOM.n_orden_distribu) IS NOT NULL THEN (SELECT CVV_JDA.EX14ERROR FROM CUADRATURA_OC_VTAV_JDA CVV_JDA WHERE CVV_JDA.Pofece >= '"+starttime+"' AND CVV_JDA.Pofece <= '"+starttime+"' AND CVV_JDA.NUMDO = CVV_EOM.n_orden_distribu) ELSE 'Mensaje de Error Jda No Encontrado'  END    as MENSAJEERRORJDA, CASE WHEN (SELECT CVV_JDA.Pofece FROM CUADRATURA_OC_VTAV_JDA CVV_JDA WHERE CVV_JDA.Pofece >= '"+starttime+"' AND CVV_JDA.Pofece <= '"+starttime+"' AND CVV_JDA.NUMDO = CVV_EOM.n_orden_distribu) IS NOT NULL THEN (SELECT CVV_JDA.Pofece FROM CUADRATURA_OC_VTAV_JDA CVV_JDA WHERE CVV_JDA.Pofece >= '"+starttime+"' AND CVV_JDA.Pofece <= '"+starttime+"' AND CVV_JDA.NUMDO = CVV_EOM.n_orden_distribu) ELSE 'Fecha Jda No Encontrado'  END as POFECEJDA "+
										" from CUADRATURA_OC_VTAV_EOM CVV_EOM where CVV_EOM.fecha_creacion_orden >= TO_DATE('"+starttime2+"','DD/MM/YY')||' 00:00:00' and CVV_EOM.fecha_creacion_orden <= TO_DATE('"+starttime2+"','DD/MM/YY')||' 23:59:59' " + 
										" group by CVV_EOM.N_Orden_Distribu ORDER BY CVV_EOM.N_Orden_Distribu ASC ";
								*/		
								SQLFecha = "SELECT  (select CVV_EOM_2.Solicitudoriginal from CUADRATURA_OC_VTAV_EOM CVV_EOM_2 where CVV_EOM_2.N_Orden_Distribu = CVV_EOM.N_Orden_Distribu) AS Solicitudoriginal, CVV_EOM.N_Orden_Distribu,(select to_char(REPLACE(CVV_EOM_2.Fecha_Creacion_Orden,',000000000',''))  from CUADRATURA_OC_VTAV_EOM CVV_EOM_2 where CVV_EOM_2.N_Orden_Distribu = CVV_EOM.N_Orden_Distribu) AS FECHA_CREACION_ORDEN, (select CVV_EOM_2.CANCELADO from CUADRATURA_OC_VTAV_EOM CVV_EOM_2 where CVV_EOM_2.N_Orden_Distribu = CVV_EOM.N_Orden_Distribu) AS CANCELADO, CASE WHEN (SELECT CVV_JDA.NUMDO FROM CUADRATURA_OC_VTAV_JDA CVV_JDA WHERE CVV_JDA.Pofece >= '20170418' AND CVV_JDA.Pofece <= '20170418' AND CVV_JDA.NUMDO = CVV_EOM.n_orden_distribu) IS NOT NULL THEN 'Encontrado' ELSE 'No Encontrado' END    as ENCONTRADOENJDA, CASE WHEN (SELECT CVV_JDA.NUMDO FROM CUADRATURA_OC_VTAV_JDA CVV_JDA WHERE CVV_JDA.Pofece >= '"+starttime+"' AND CVV_JDA.Pofece <= '"+starttime+"' AND CVV_JDA.NUMDO = CVV_EOM.n_orden_distribu) IS NOT NULL THEN (SELECT CVV_JDA.NUMDO FROM CUADRATURA_OC_VTAV_JDA CVV_JDA WHERE CVV_JDA.Pofece >= '"+starttime+"' AND CVV_JDA.Pofece <= '"+starttime+"' AND CVV_JDA.NUMDO = CVV_EOM.n_orden_distribu) ELSE 'Numero solicitud Jda No Encontrado' END    as NUMEROSOLICITUDJDA, CASE WHEN (SELECT CVV_JDA.EX14ERROR FROM CUADRATURA_OC_VTAV_JDA CVV_JDA WHERE CVV_JDA.Pofece >= '"+starttime+"' AND CVV_JDA.Pofece <= '"+starttime+"' AND CVV_JDA.NUMDO = CVV_EOM.n_orden_distribu) IS NOT NULL THEN (SELECT CVV_JDA.EX14ERROR FROM CUADRATURA_OC_VTAV_JDA CVV_JDA WHERE CVV_JDA.Pofece >= '"+starttime+"' AND CVV_JDA.Pofece <= '"+starttime+"' AND CVV_JDA.NUMDO = CVV_EOM.n_orden_distribu) ELSE 'Mensaje de Error Jda No Encontrado'  END    as MENSAJEERRORJDA, CASE WHEN (SELECT CVV_JDA.Pofece FROM CUADRATURA_OC_VTAV_JDA CVV_JDA WHERE CVV_JDA.Pofece >= '"+starttime+"' AND CVV_JDA.Pofece <= '"+starttime+"' AND CVV_JDA.NUMDO = CVV_EOM.n_orden_distribu) IS NOT NULL THEN (SELECT CVV_JDA.Pofece FROM CUADRATURA_OC_VTAV_JDA CVV_JDA WHERE CVV_JDA.Pofece >= '"+starttime+"' AND CVV_JDA.Pofece <= '"+starttime+"' AND CVV_JDA.NUMDO = CVV_EOM.n_orden_distribu) ELSE 'Fecha Jda No Encontrado'  END as POFECEJDA "+
												" from CUADRATURA_OC_VTAV_EOM CVV_EOM where CVV_EOM.fecha_creacion_orden >= '"+starttime2+" 00:00:00' and CVV_EOM.fecha_creacion_orden <= '"+starttime2+" 23:59:59' " + 
												" group by CVV_EOM.N_Orden_Distribu ORDER BY CVV_EOM.N_Orden_Distribu ASC ";		

								//out.println("SQLFecha="+SQLFecha);
								//out.print("<br>");
								psFecha = connFecha.prepareStatement(SQLFecha, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
								rsFecha = psFecha.executeQuery();
								connFecha.commit();
								int contarFecha = 0;
								int totalProcentajeFecha = 0;
								while(rsFecha.next()) {
									contarFecha = contarFecha + 1;
									//totalCantidadFecha = totalCantidadFecha + rsFecha.getInt("CANTIDAD") ;
							%>
					  <tr>
					  	<td nowrap="nowrap"><%=contarFecha%></td>
						<td nowrap="nowrap"><%=rsFecha.getString("Solicitudoriginal") %></td>
						<td nowrap="nowrap"><%=rsFecha.getString("N_Orden_Distribu") %></td>
						<td nowrap="nowrap"><%=rsFecha.getString("FECHA_CREACION_ORDEN") %></td>
						<td nowrap="nowrap"><%=rsFecha.getString("CANCELADO") %></td>
						<td nowrap="nowrap"><%=rsFecha.getString("ENCONTRADOENJDA") %></td>
						<!--  
						<td nowrap="nowrap"><%=rsFecha.getString("NUMEROSOLICITUDJDA") %></td>
						<td nowrap="nowrap"><%=rsFecha.getString("MENSAJEERRORJDA") %></td>
						<td nowrap="nowrap"><%=rsFecha.getString("POFECEJDA") %></td>
						-->
						<td>
						<!--
						<a target="_blank" href="informacionEom?N_Orden_Distribu=<%=rsFecha.getString("N_Orden_Distribu") %>&dateInicio=<% if (request.getParameter("dateInicio") != null) { %><% try { SimpleDateFormat formatoFecha = new SimpleDateFormat("dd/MM/yyyy", Locale.getDefault()); formatoFecha.setLenient(false); formatoFecha.parse(request.getParameter("dateInicio"));%><%=request.getParameter("dateInicio").toString().trim()%><% } catch(ParseException  e) {%><%=currentDate%><% } %><%  } else {%><%=currentDate %> <% } %>" title="POP UP" ><i class="icon-signin"></i>EOM en JDA</a><br />
						<a target="_blank" href="informacionJda?numdo=<%=rsFecha.getString("N_Orden_Distribu") %>&dateInicio=<% if (request.getParameter("dateInicio") != null) { %><% try { SimpleDateFormat formatoFecha = new SimpleDateFormat("dd/MM/yyyy", Locale.getDefault()); formatoFecha.setLenient(false); formatoFecha.parse(request.getParameter("dateInicio"));%><%=request.getParameter("dateInicio").toString().trim()%><% } catch(ParseException  e) {%><%=currentDate%><% } %><%  } else {%><%=currentDate %> <% } %>" title="POP UP" ><i class="icon-signin"></i>JDA en Eom</a><br />
						-->
						<a href="#myModal" class="lockUnlock" modo='L' iduser="${user.id}" title="Deshabilitar" role="button" data-toggle="modal" style="margin-right: 15px"><i class="icon-ban-circle"></i> Ver</a>
						
						</td>
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
				</div>
				<br />
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


