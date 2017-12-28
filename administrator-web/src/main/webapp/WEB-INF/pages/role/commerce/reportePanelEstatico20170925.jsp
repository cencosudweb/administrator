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

<%@ page import="com.cencosud.administrator.dto.users.CumplimientoGraficosDTO"%>
<%@ page import="com.cencosud.administrator.dto.users.CumplimientoTotalesDTO"%>
<%@ page import="com.cencosud.administrator.dto.users.CumplimientoCabeceraDTO"%>

<%@ page import="com.cencosud.administrator.dto.users.GraficosDTO"%>
<%@ page import="com.cencosud.administrator.web.utils.DateUtils"%>
<%@ page import="com.cencosud.administrator.web.utils.StringUtils"%>
<%
Date dNow = new Date();
SimpleDateFormat ft = 
new SimpleDateFormat ("dd/MM/yyyy");
String currentDate = ft.format(dNow);
//out.println("date"+currentDate);
String exportToExcel = request.getParameter("exportToExcel");
if (exportToExcel != null && exportToExcel.toString().equalsIgnoreCase("YES")) {
	response.setContentType("application/vnd.ms-excel");
	response.setHeader("Content-Disposition", "inline; filename=" + "DescargaPanelDinamicoExcel.xls");
}
String dateInicio =  request.getParameter("dateInicio");
//out.println("dateInicio="+dateInicio);
String starttime = DateUtils.turnDate(dateInicio) != null?DateUtils.turnDate(dateInicio):DateUtils.turnDate(currentDate);
//out.println("starttime"+starttime);

String[] tipoOrdenes = request.getParameterValues("tipo_orden");
String[] tipoVentas = request.getParameterValues("tipo_venta");
String[] tipoGuias = request.getParameterValues("tipo_guia");

String prefixclause ="";
String prefixclauseSub ="";

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





if (request.getParameterValues("tipo_orden") != null) {
	prefixclause +=" AND ( ";
	prefixclauseSub +=" AND ( ";

	
	prefixclauseTipoOrden +=" AND ( ";
	prefixclauseTipoOrden2 +=" AND ( ";
	prefixclauseTipoOrdenExport +=" AND ( ";

	for(String tipoOrdene: tipoOrdenes) {
		prefixclause += " TC.ID_TIPO_ORDEN = " +  tipoOrdene + " OR ";
		prefixclauseSub += " TTC2.ID_TIPO_ORDEN = " +  tipoOrdene + " OR ";

		prefixclauseTipoOrden += " TC.ID_TIPO_ORDEN = " +  tipoOrdene + " OR ";
		prefixclauseTipoOrden2 += " TC2.ID_TIPO_ORDEN = " +  tipoOrdene + " OR ";
		prefixclauseTipoOrdenExport += " TC2.ID_TIPO_ORDEN = " +  tipoOrdene + " OR ";

	}
	prefixclause += " TC.ID_TIPO_ORDEN = -1) ";
	prefixclauseSub += " TTC2.ID_TIPO_ORDEN = -1) ";

	prefixclauseTipoOrden += " TC.ID_TIPO_ORDEN = -1) ";
	prefixclauseTipoOrden2 += " TC2.ID_TIPO_ORDEN = -1) ";
	prefixclauseTipoOrdenExport += " TC2.ID_TIPO_ORDEN = -1) ";
} 


if (request.getParameterValues("tipo_venta") != null) {
	prefixclause +=" AND ( ";
	prefixclauseSub +=" AND ( ";


	prefixclauseTipoVenta +=" AND ( ";
	prefixclauseTipoVenta2 +=" AND ( ";
	prefixclauseTipoVentaExport +=" AND ( ";

	for(String tipoVenta: tipoVentas) {
		prefixclause += " TC.ID_TIPO_VENTA = " +  tipoVenta + " OR ";
		prefixclauseSub += " TTC2.ID_TIPO_VENTA = " +  tipoVenta + " OR ";

		prefixclauseTipoVenta += " TC.ID_TIPO_VENTA = " +  tipoVenta + " OR ";
		prefixclauseTipoVenta2 += " TC2.ID_TIPO_VENTA = " +  tipoVenta + " OR ";
		prefixclauseTipoVentaExport += " TC2.ID_TIPO_VENTA = " +  tipoVenta + " OR ";

	}
	prefixclause+= " TC.ID_TIPO_VENTA = -1) ";
	prefixclauseSub+= " TTC2.ID_TIPO_VENTA = -1) ";


	prefixclauseTipoVenta+= " TC.ID_TIPO_VENTA = -1) ";
	prefixclauseTipoVenta2+= " TC2.ID_TIPO_VENTA = -1) ";
	prefixclauseTipoVentaExport+= " TC2.ID_TIPO_VENTA = -1) ";

} 




if (request.getParameterValues("tipo_guia") != null) {
	prefixclause +=" AND ( ";
	prefixclauseSub +=" AND ( ";

	prefixclauseTipoGuia +=" AND ( ";
	prefixclauseTipoGuia2 +=" AND ( ";
	prefixclauseTipoGuiaExport +=" AND ( ";

	for(String tipoGuia: tipoGuias) {

		prefixclause += " TC.ID_TIPOGUI = " +  tipoGuia + " OR ";
		prefixclauseSub += " TTC2.ID_TIPOGUI = " +  tipoGuia + " OR ";

		prefixclauseTipoGuia += " TC.ID_TIPOGUI = " +  tipoGuia + " OR ";
		prefixclauseTipoGuia2 += " TC2.ID_TIPOGUI = " +  tipoGuia + " OR ";
		prefixclauseTipoGuiaExport += " TC2.ID_TIPOGUI = " +  tipoGuia + " OR ";

	}
	prefixclause+= " TC.ID_TIPOGUI = -1) ";
	prefixclauseSub+= " TTC2.ID_TIPOGUI = -1) ";

	prefixclauseTipoGuia+= " TC.ID_TIPOGUI = -1) ";
	prefixclauseTipoGuia2+= " TC2.ID_TIPOGUI = -1) ";
	prefixclauseTipoGuiaExport+= " TC2.ID_TIPOGUI = -1) ";

} 


//out.println("prefixclause ="+ prefixclause+ "<br/>");
//out.println("prefixclauseSub ="+ prefixclauseSub+ "<br/>");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <jsp:include page="../../include/head.jsp" />
	
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
	
    <style type="text/css">
	#dvLoading { 
		/*background: rgba(0,0,0,.5) url(../images/cargando2.gif) no-repeat center center; */
		background:#FFF url(../images/cargando2.gif) no-repeat center center; 
		height: 100px; 
		width: 100px; 
		position: fixed; 
		z-index: 1000; 
		left: 50%; 
		top: 50%;
	}
	</style>
	<div id="dvLoading">
	</div>
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
            <h1 class="page-title">Reporte Kpi Cumplimiento Logistico Estatico</h1>
        </div>
        
        <ul class="breadcrumb">
            <li><a href="home">Home</a> <span class="divider">/</span></li>
            <li class="active">Reporte Kpi Cumplimiento Logistico Estatico</li>
        </ul>

        <div class="container-fluid">
	        <div class="row-fluid">
				<div class="btn-toolbar">
					
				    <!--  
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
				   -->
                	
					<div class="btn-group"></div>
				</div>
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="btn-toolbar">
							<form class="form-inline" id="f_all_user" method="get" action="reportePanelEstatico">
							
								<input type="hidden" name="posted" id="posted" value="ok"/>
								<div class="form-group" >
									<label>Canal&nbsp;&nbsp;&nbsp;</label>
									<script type="text/javascript">
									$(document).ready(function() {
										$('#tipo_orden').multiselect({
											//nonSelectedText: 'Seleccione Tipo Orden',
											includeSelectAllOption: true,
											enableFiltering: true,
											allSelectedText: 'No option left ...',
											maxHeight: 200,
											dropDown: true,
											buttonWidth: '180px'
										});
									});
									</script>
									
									<select name="tipo_orden" id="tipo_orden" multiple="multiple">
										<c:forEach items="${ordenes}" var="orden" varStatus="status">
											<option value="${orden.id}" 
											<%
								           	if (request.getParameterValues("tipo_orden") != null) {
								        		
								        		for(String tipoOrdene: tipoOrdenes) {
								        	%>
								        		<c:set var="mySelectVar" value="<%=tipoOrdene%>"></c:set>
								        		<c:if test="${mySelectVar == orden.id}">selected</c:if>
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
			                        <label>&nbsp;Tipo Despacho&nbsp;</label>
									<script type="text/javascript">
									$(document).ready(function() {
										$('#tipo_venta').multiselect({
											includeSelectAllOption: true,
											enableFiltering: true,
											allSelectedText: 'No option left ...',
											maxHeight: 200,
											dropDown: true,
											buttonWidth: '180px'
										});
									});
									</script>
									&nbsp;
									<select name="tipo_venta" id="tipo_venta" multiple="multiple">
										<c:forEach items="${ventas}" var="venta" varStatus="status">
											<option value="${venta.id}"
											<%
								           	if (request.getParameterValues("tipo_venta") != null) {
								        		
								        		for(String tipoVenta: tipoVentas) {
								        	%>
								        		<c:set var="mySelectVar2" value="<%=tipoVenta%>"></c:set>
								        		<c:if test="${mySelectVar2 == venta.id}">selected</c:if>
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
			                        <label>&nbsp;Tipo Guia&nbsp;&nbsp;&nbsp;</label>
									 <script type="text/javascript">
									$(document).ready(function() {
										$('#tipo_guia').multiselect({
											includeSelectAllOption: true,
											  enableFiltering: true,
											  allSelectedText: 'No option left ...',
											  maxHeight: 200,
											  dropDown: true,
											  buttonWidth: '180px'
										});
									});
									</script>
									&nbsp;&nbsp;&nbsp;
									<select name="tipo_guia" id="tipo_guia" multiple="multiple">
										<c:forEach items="${guias}" var="guia" varStatus="status">
											<option value="${guia.id}"
											<%
								           	if (request.getParameterValues("tipo_guia") != null) {
								        		
								        		for(String tipoGuia: tipoGuias) {
								        	%>
								        		<c:set var="mySelectVar5" value="<%=tipoGuia%>"></c:set>
								        		<c:if test="${mySelectVar5 == guia.id}">selected</c:if>
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
									<label>&nbsp;Fecha&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
									<input type="text" value="<% if (request.getParameter("dateInicio") != null) { %><% try { SimpleDateFormat formatoFecha = new SimpleDateFormat("dd/MM/yyyy", Locale.getDefault()); formatoFecha.setLenient(false); formatoFecha.parse(request.getParameter("dateInicio"));%><%=request.getParameter("dateInicio").toString().trim()%><% } catch(ParseException  e) {%><%=currentDate%><% } %><%  } else {%><%=currentDate %> <% } %>" readonly name="dateInicio" id="dateInicio" class="form-control span12" style="width:100px;" />
	
							        
							        
							        
							        
								</div>
								
								<br>
								<div class="btn-toolbar list-toolbar">
								  <button class="btn btn-primary" id="btn-all-user">
									  <i class="icon-search"></i> Buscar
								  </button>
								</div>
							</form>
						</div>
					</div>
				</div>
				
				<jsp:include page="../../include/messages.jsp" />
				<c:if test="${posted == null}"><tr><td colspan="8">Por favor presionar boton buscar</td></tr></c:if>
				<c:if test="${posted != null}">
				<div class="well" style="overflow:scroll;">
					<%
						Connection connFecha = null;
						PreparedStatement psFecha = null;
						ResultSet rsFecha = null;
						String SQLFecha = null; 
							
						CumplimientoCabeceraDTO cabecera = null;
						CumplimientoTotalesDTO total = null;
						CumplimientoGraficosDTO graficoCumple1 = null;
						CumplimientoGraficosDTO graficoCumple2 = null;
						CumplimientoGraficosDTO graficoCumple3 = null;
						List<CumplimientoCabeceraDTO> resultCabecera = new ArrayList<CumplimientoCabeceraDTO>();
						List<CumplimientoTotalesDTO> resultTotal = new ArrayList<CumplimientoTotalesDTO>();
						List<CumplimientoGraficosDTO> resultCumple1 = new ArrayList<CumplimientoGraficosDTO>();
						List<CumplimientoGraficosDTO> resultCumple2 = new ArrayList<CumplimientoGraficosDTO>();
						List<CumplimientoGraficosDTO> resultCumple3 = new ArrayList<CumplimientoGraficosDTO>();
							
						int contarFecha = 0;
						int totalProcentajeFecha = 0;
						int totalCantidadFecha = 0;
						int totalesCantidadGraficos1 = 0;
						int totalesCantidadGraficos2 = 0;
						int totalesCantidadGraficos3 = 0;
						try{
							Class.forName("oracle.jdbc.OracleDriver").newInstance();
							connFecha = DriverManager.getConnection("jdbc:oracle:thin:@172.18.163.15:1521/XE","kpiweb","kpiweb");//
							connFecha.setAutoCommit(false);
							SQLFecha = 	"	SELECT  " + 
										"		TC.FECHA_COMPROMISO_EOM  " +
										"		,(REPLACE(REPLACE (REPLACE (CONCAT(''''||TC.FECHA_COMPROMISO_EOM,''''), '00:', ''), '00',''),' ','')) AS FECHA_COMPROMISO_EOM_GRAFICO" +
										" 		,NVL(COUNT(*),0) AS CANTIDAD " + 
										" 		,SUM(CASE  WHEN TC.ID_CUMPLE = 1 THEN  1 ELSE 0 END) as CUMPLE " + 
										" 		,SUM(CASE  WHEN TC.ID_CUMPLE = 2 THEN  1 ELSE 0 END) as ATRASADO " + 
										" 		,SUM(CASE  WHEN TC.ID_CUMPLE = 3 THEN  1 ELSE 0 END) as NOCUMPLE " +
										" 		,SUM(CASE WHEN (TC.ID_CUMPLE = 1 OR TC.ID_CUMPLE = 2 OR TC.ID_CUMPLE = 3) THEN 1 ELSE 0 END) as TOTAL " +
										"	from CUMPLIMIENTO_KPIWEB_ESTATICO TC " + 
										"	WHERE 1 = 1 " +
										"	" + prefixclause +
										"	AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-8, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' " +
										"	GROUP BY TC.FECHA_COMPROMISO_EOM " +
										"	ORDER BY TC.FECHA_COMPROMISO_EOM ASC";
							//out.println("<BR>");
							//out.println("SQLFecha="+SQLFecha);
							//out.println("<BR>");
							psFecha = connFecha.prepareStatement(SQLFecha, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
							rsFecha = psFecha.executeQuery();
							connFecha.commit();
							while(rsFecha.next()) {
								contarFecha = contarFecha + 1;
								totalCantidadFecha = totalCantidadFecha + rsFecha.getInt("CANTIDAD") ;
													
								cabecera = new CumplimientoCabeceraDTO();
								cabecera.setId(new Long(1));
								cabecera.setFechaCompromiso(rsFecha.getString("FECHA_COMPROMISO_EOM"));
								cabecera.setCantidad(100);
								cabecera.setPorcentaje(100);
								resultCabecera.add(cabecera);

								total = new CumplimientoTotalesDTO();
								total.setId(new Long(1));
								total.setFechaCompromiso(rsFecha.getString("FECHA_COMPROMISO_EOM"));
								total.setCantidad(rsFecha.getInt("CANTIDAD"));
								total.setPorcentaje(100);
								resultTotal.add(total);
									
								graficoCumple1 = new CumplimientoGraficosDTO();
								graficoCumple1.setId(new Long(1));
								graficoCumple1.setFechaCompromiso(rsFecha.getString("FECHA_COMPROMISO_EOM_GRAFICO"));
								graficoCumple1.setCantidad(rsFecha.getInt("CUMPLE"));
								graficoCumple1.setTotal(rsFecha.getInt("TOTAL"));
								graficoCumple1.setPorcentaje(Float.parseFloat( StringUtils.Redondear(String.valueOf(((float ) ( (float ) rsFecha.getInt("CUMPLE") / (float )rsFecha.getInt("TOTAL")) * 100)),2)));
								resultCumple1.add(graficoCumple1);
									
								graficoCumple2 = new CumplimientoGraficosDTO();
								graficoCumple2.setId(new Long(1));
								graficoCumple2.setFechaCompromiso(rsFecha.getString("FECHA_COMPROMISO_EOM_GRAFICO"));
								graficoCumple2.setCantidad(rsFecha.getInt("ATRASADO"));
								graficoCumple2.setTotal(rsFecha.getInt("TOTAL"));
								graficoCumple2.setPorcentaje(Float.parseFloat( StringUtils.Redondear(String.valueOf(((float ) ( (float ) rsFecha.getInt("ATRASADO") / (float )rsFecha.getInt("TOTAL")) * 100)),2)));
								resultCumple2.add(graficoCumple2);
									
								graficoCumple3 = new CumplimientoGraficosDTO();
								graficoCumple3.setId(new Long(1));
								graficoCumple3.setFechaCompromiso(rsFecha.getString("FECHA_COMPROMISO_EOM_GRAFICO"));
								graficoCumple3.setCantidad(rsFecha.getInt("NOCUMPLE"));
								graficoCumple3.setTotal(rsFecha.getInt("TOTAL"));
								graficoCumple3.setPorcentaje(Float.parseFloat( StringUtils.Redondear(String.valueOf(((float ) ( (float ) rsFecha.getInt("NOCUMPLE") / (float )rsFecha.getInt("TOTAL")) * 100)),2)));
								resultCumple3.add(graficoCumple3);
									
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
					
					<%
					if (contarFecha != 0) {
					%>
				    <table id="dataTables-example"  width="100%"  border="0" cellspacing="0" cellpadding="0" style="font-size:13px">
						<tr bgcolor="#305496" style="text-align:left; color:#FFF; font-size:13px; border: solid 1px #a6a6a6;">
							<td></td>
							<td>Estado</td>
							<%
							for(int c=0;c<resultCabecera.size();c++) {

							%>
							<th>
								<%=resultCabecera.get(c).getFechaCompromiso()%>&nbsp;
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
							SQLCumple = "	SELECT  " +
										"		TC.ID_CUMPLE, EC.DESCRIPTION AS CUMPLE " +
										"	from CUMPLIMIENTO_KPIWEB_ESTATICO TC " + 
										//"	INNER JOIN ESTADO_CUMPLE EC ON TC.ID_CUMPLE = EC.ID " + 
										"	LEFT JOIN ESTADO_CUMPLE EC ON TC.ID_CUMPLE = EC.ID " + 
										//"	RIGHT  JOIN ESTADO_CUMPLE EC ON TC.ID_CUMPLE = EC.ID " + 
										"	WHERE  1 = 1  " + 
										" 	" + prefixclause + 
										" 	AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-8, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' " +
										"	GROUP BY TC.ID_CUMPLE, EC.DESCRIPTION " + 
										"	ORDER BY TC.ID_CUMPLE ASC";
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
											<%
								        	SQLHideCumplimiento = "SELECT  TC.ID_CUMPLE_RESUMEN from CUMPLIMIENTO_KPIWEB_ESTATICO TC WHERE  1 = 1 AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-8, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' AND TC.ID_CUMPLE = "+rsCumple.getInt("ID_CUMPLE")+" GROUP BY TC.ID_CUMPLE_RESUMEN ORDER BY TC.ID_CUMPLE_RESUMEN ASC";
								        	psHideCumplimiento = conn.prepareStatement(SQLHideCumplimiento, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		                                    rsHideCumplimiento = psHideCumplimiento.executeQuery();
		                                    conn.commit();
											int contarHideCumplimiento = 0;
		                                    while(rsHideCumplimiento.next()) {
												contarHideCumplimiento = contarHideCumplimiento + 1;
		                                    %>
												$("#cumplimiento_<%=contarCumple%>_<%=contarHideCumplimiento%>").hide('slow', function() {});
												<%
												SQLHideCumpleResumen = "SELECT  TC.ID_CUMPLIMIENTO_2 from CUMPLIMIENTO_KPIWEB_ESTATICO TC WHERE  1 = 1 AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-8, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' AND TC.ID_CUMPLE = "+rsCumple.getInt("ID_CUMPLE")+" AND TC.ID_CUMPLE_RESUMEN = "+rsHideCumplimiento.getInt("ID_CUMPLE_RESUMEN")+" GROUP BY TC.ID_CUMPLIMIENTO_2 ORDER BY TC.ID_CUMPLIMIENTO_2 ASC";
												psHideCumpleResumen = conn.prepareStatement(SQLHideCumpleResumen, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
												rsHideCumpleResumen = psHideCumpleResumen.executeQuery();
												conn.commit();
												int contarHideCumpleResumen = 0;
												while(rsHideCumpleResumen.next()) {
													contarHideCumpleResumen = contarHideCumpleResumen + 1;
												%>
													$("#cumple_resumen_<%=contarCumple%>_<%=contarHideCumplimiento%>_<%=contarHideCumpleResumen%>").hide('slow', function() {});
													
													
													<%
													SQLHideResponsable = "SELECT  TC.ID_RESPONSABLE from CUMPLIMIENTO_KPIWEB_ESTATICO TC WHERE  1 = 1 AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-8, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' AND TC.ID_CUMPLE = "+rsCumple.getInt("ID_CUMPLE")+" AND TC.ID_CUMPLE_RESUMEN = "+rsHideCumplimiento.getInt("ID_CUMPLE_RESUMEN")+" AND TC.ID_CUMPLIMIENTO_2 = "+rsHideCumpleResumen.getInt("ID_CUMPLIMIENTO_2")+" GROUP BY TC.ID_RESPONSABLE ORDER BY TC.ID_RESPONSABLE ASC";
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
											<%
								        	SQLShowCumplimiento = "SELECT  TC.ID_CUMPLE_RESUMEN from CUMPLIMIENTO_KPIWEB_ESTATICO TC WHERE  1 = 1 AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-8, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' AND TC.ID_CUMPLE = "+rsCumple.getInt("ID_CUMPLE")+" GROUP BY TC.ID_CUMPLE_RESUMEN ORDER BY TC.ID_CUMPLE_RESUMEN ASC";
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
												SQLShowCumpleResumen = "SELECT  TC.ID_CUMPLIMIENTO_2 from CUMPLIMIENTO_KPIWEB_ESTATICO TC WHERE  1 = 1 AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-8, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' AND TC.ID_CUMPLE = "+rsCumple.getInt("ID_CUMPLE")+" AND TC.ID_CUMPLE_RESUMEN = "+rsShowCumplimiento.getInt("ID_CUMPLE_RESUMEN")+"  GROUP BY TC.ID_CUMPLIMIENTO_2 ORDER BY TC.ID_CUMPLIMIENTO_2 ASC";
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
									<td><button class="btn btn-default" id="ocultar_cumplimiento_<%=contarCumple%>" style="display:none;width:50px;"><img src="../images/minus2.gif" /></button><button class="btn btn-default" id="mostrar_cumplimiento_<%=contarCumple%>" style=" width:50px;"><img src="../images/plus2.gif" /></button></td>
									<!--  
									<td align="left" nowrap="nowrap" ><i class="icon-reorder"></i>&nbsp; <%=rsCumple.getInt("ID_CUMPLE")%> </td>
									-->
									<td align="left" nowrap="nowrap" ><i class="icon-reorder"></i>&nbsp;<%=rsCumple.getString("CUMPLE")%> </td>
									
									
									<%
									SQLShowFecha = 	"	SELECT " + 
													"		TC.FECHA_COMPROMISO_EOM" + 
													
													" 		,(SUM(CASE WHEN (TC.ID_CUMPLE = "+rsCumple.getInt("ID_CUMPLE")+" "+prefixclause+") THEN 1 ELSE 0 END) ) AS CANTIDAD " +		
													"	from CUMPLIMIENTO_KPIWEB_ESTATICO TC " +
													"	WHERE 1 = 1 " + 
													"	AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-8, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"'  " + 
													"	GROUP BY TC.FECHA_COMPROMISO_EOM " +
													"	ORDER BY TC.FECHA_COMPROMISO_EOM ASC";
									
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
															//DecimalFormat df = new DecimalFormat("0.00"); 
															
															for(int h=0;h<resultTotal.size();h++) {
																//out.print("FT1="+String.valueOf(resultTotal.get(h).getFechaCompromiso().substring(0,10)+"-<br>"));
																//out.print("FT2="+String.valueOf(rsShowFecha.getString("FECHA_COMPROMISO_EOM").substring(0,10))+"-<br>");

																//if( String.valueOf(resultTotal.get(h).getFechaCompromiso().substring(0,10)) == String.valueOf(rsShowFecha.getString("FECHA_COMPROMISO_EOM").substring(0,10))) {
																if( String.valueOf(resultTotal.get(h).getFechaCompromiso().substring(0,10)).equals(String.valueOf(rsShowFecha.getString("FECHA_COMPROMISO_EOM").substring(0,10)))) {
																		
																	//out.print("FIND<br>"+resultTotal.get(h).getCantidad());
																	out.println( StringUtils.Redondear( String.valueOf( Float.parseFloat( (String.valueOf(((float ) ( (float ) rsShowFecha.getInt("CANTIDAD") / (float )resultTotal.get(h).getCantidad()) * 100)))  ) ),2)+"%");
																} else {
																	//out.print("NOFIND<br>");
																	//out.println( "0"+"%");
																}
															}
															//out.print("<br>");
															//out.println( StringUtils.Redondear( String.valueOf( Float.parseFloat( (String.valueOf(((float ) ( (float ) rsShowFecha.getInt("CANTIDAD") / (float )rsShowFecha.getInt("TOTAL")) * 100)))  ) ),2)+"%");
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
								
								SQLCumplimiento = 	"	SELECT  " +
													"		TC.ID_CUMPLE_RESUMEN, ECR.DESCRIPTION AS CUMPLE_RESUMEN " +
													"	from CUMPLIMIENTO_KPIWEB_ESTATICO TC " + 
													"	LEFT JOIN  ESTADO_CUMPLE_RESUMEN ECR ON TC.ID_CUMPLE_RESUMEN =  ECR.ID " +
													"	WHERE  1 = 1 " +
													"	AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-8, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' " + 
													"	AND TC.ID_CUMPLE = "+rsCumple.getInt("ID_CUMPLE")+" " + 
													"	GROUP BY TC.ID_CUMPLE_RESUMEN, ECR.DESCRIPTION " + 
													"	ORDER BY TC.ID_CUMPLE_RESUMEN ASC";
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
								%>
						
									<script type="text/javascript">
										$(function(){
											$("#ocultar_cumple_resumen_<%=contarCumple%>_<%=contarCumplimiento%>").click(function() {
												<%
												SQLHideCumpleResumen = "SELECT  TC.ID_CUMPLIMIENTO_2 from CUMPLIMIENTO_KPIWEB_ESTATICO TC WHERE  1 = 1 AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-8, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' AND TC.ID_CUMPLE = "+rsCumple.getInt("ID_CUMPLE")+" AND TC.ID_CUMPLE_RESUMEN = "+rsCumplimiento.getInt("ID_CUMPLE_RESUMEN")+" GROUP BY TC.ID_CUMPLIMIENTO_2 ORDER BY TC.ID_CUMPLIMIENTO_2 ASC";
												psHideCumpleResumen = conn.prepareStatement(SQLHideCumpleResumen, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
												rsHideCumpleResumen = psHideCumpleResumen.executeQuery();
												conn.commit();
												int contarHideCumpleResumen = 0;
												while(rsHideCumpleResumen.next()) {
													contarHideCumpleResumen = contarHideCumpleResumen + 1;
												%>
													$("#cumple_resumen_<%=contarCumple%>_<%=contarCumplimiento%>_<%=contarHideCumpleResumen%>").hide('slow', function() {});
													<%
													SQLHideResponsable = "SELECT  TC.ID_RESPONSABLE from CUMPLIMIENTO_KPIWEB_ESTATICO TC WHERE  1 = 1 AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-8, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' AND TC.ID_CUMPLE = "+rsCumple.getInt("ID_CUMPLE")+"  AND TC.ID_CUMPLE_RESUMEN = "+rsCumplimiento.getInt("ID_CUMPLE_RESUMEN")+" AND TC.ID_CUMPLIMIENTO_2 = "+rsHideCumpleResumen.getInt("ID_CUMPLIMIENTO_2")+" GROUP BY TC.ID_RESPONSABLE ORDER BY TC.ID_RESPONSABLE ASC";
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
												<%
												SQLShowCumpleResumen = "SELECT  TC.ID_CUMPLIMIENTO_2 from CUMPLIMIENTO_KPIWEB_ESTATICO TC WHERE  1 = 1 AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-8, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' AND TC.ID_CUMPLE = "+rsCumple.getInt("ID_CUMPLE")+" AND TC.ID_CUMPLE_RESUMEN = "+rsCumplimiento.getInt("ID_CUMPLE_RESUMEN")+" GROUP BY TC.ID_CUMPLIMIENTO_2 ORDER BY TC.ID_CUMPLIMIENTO_2 ASC";
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
										<td><button class="btn btn-default" id="ocultar_cumple_resumen_<%=contarCumple%>_<%=contarCumplimiento%>" style="display:none;width:50px;"><img src="../images/minus2.gif" /></button><button class="btn btn-default" id="mostrar_cumple_resumen_<%=contarCumple%>_<%=contarCumplimiento%>" style=" width:50px;"/><img src="../images/plus2.gif" /></td>
										<!--  <td nowrap="nowrap"><i class="icon-reorder"></i>&nbsp;<%=rsCumplimiento.getInt("ID_CUMPLE_RESUMEN")%></td>-->
										<td nowrap="nowrap"><i class="icon-reorder"></i>&nbsp;<%=rsCumplimiento.getString("CUMPLE_RESUMEN")%></td>	 

										

										<%
										SQLShowFecha = 	"	SELECT " + 
														"		TC.FECHA_COMPROMISO_EOM AS  FECHA_COMPROMISO_EOM" +
														"		,(SUM(CASE WHEN (TC.ID_CUMPLE = "+rsCumple.getInt("ID_CUMPLE")+" AND TC.ID_CUMPLE_RESUMEN = "+rsCumplimiento.getInt("ID_CUMPLE_RESUMEN")+" "+prefixclause+") THEN 1 ELSE 0 END) ) AS CANTIDAD " +
														"	from CUMPLIMIENTO_KPIWEB_ESTATICO TC " +
														"	WHERE 1 = 1 " +
														"	AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-8, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' " +
														"	GROUP BY TC.FECHA_COMPROMISO_EOM " + 
														"	ORDER BY TC.FECHA_COMPROMISO_EOM ASC";
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
																//DecimalFormat df = new DecimalFormat("0.00"); 
																for(int h=0;h<resultTotal.size();h++) {
																//out.print("FT1="+String.valueOf(resultTotal.get(h).getFechaCompromiso().substring(0,10)+"-<br>"));
																//out.print("FT2="+String.valueOf(rsShowFecha.getString("FECHA_COMPROMISO_EOM").substring(0,10))+"-<br>");

																//if( String.valueOf(resultTotal.get(h).getFechaCompromiso().substring(0,10)) == String.valueOf(rsShowFecha.getString("FECHA_COMPROMISO_EOM").substring(0,10))) {
																if( String.valueOf(resultTotal.get(h).getFechaCompromiso().substring(0,10)).equals(String.valueOf(rsShowFecha.getString("FECHA_COMPROMISO_EOM").substring(0,10)))) {
																		
																	//out.print("FIND<br>"+resultTotal.get(h).getCantidad());
																	out.println( StringUtils.Redondear( String.valueOf( Float.parseFloat( (String.valueOf(((float ) ( (float ) rsShowFecha.getInt("CANTIDAD") / (float )resultTotal.get(h).getCantidad()) * 100)))  ) ),2)+"%");
																} else {
																	//out.print("NOFIND<br>");
																	//out.println( "0"+"%");
																}
																}
																
																//out.println( StringUtils.Redondear( String.valueOf( Float.parseFloat( (String.valueOf(((float ) ( (float ) rsShowFecha.getInt("CANTIDAD") / (float )rsShowFecha.getInt("TOTAL")) * 100)))  ) ),2)+"%");
																
															 	//out.println(df.format(rsShowFecha.getFloat("PORCENTAJE"))+"%");
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
									SQLCumpleResumen = 	"	SELECT  " + 
														"		TC.ID_CUMPLIMIENTO_2, EC.DESCRIPTION AS CUMPLIMIENTO_2" + 
														"	from CUMPLIMIENTO_KPIWEB_ESTATICO TC " +
														"	LEFT JOIN  ESTADO_CUMPLIMIENTO EC ON TC.ID_CUMPLIMIENTO_2 =  EC.ID " +
														"	WHERE  1 = 1 " + 
														"	AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-8, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' " + 
														"	AND TC.ID_CUMPLE = "+rsCumple.getInt("ID_CUMPLE")+" " +
														"	AND TC.ID_CUMPLE_RESUMEN = "+rsCumplimiento.getInt("ID_CUMPLE_RESUMEN")+"  " + 
														"	GROUP BY TC.ID_CUMPLIMIENTO_2, EC.DESCRIPTION " +
														"	ORDER BY TC.ID_CUMPLIMIENTO_2 ASC";
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
													<%
													SQLHideResponsable = "SELECT  TC.ID_RESPONSABLE from CUMPLIMIENTO_KPIWEB_ESTATICO TC WHERE  1 = 1  AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-8, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' AND TC.ID_CUMPLE = "+rsCumple.getInt("ID_CUMPLE")+" AND TC.ID_CUMPLE_RESUMEN = "+rsCumplimiento.getInt("ID_CUMPLE_RESUMEN")+" AND TC.ID_CUMPLIMIENTO_2 = "+rsCumpleResumen.getInt("ID_CUMPLIMIENTO_2")+" GROUP BY TC.ID_RESPONSABLE ORDER BY TC.ID_RESPONSABLE ASC";
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
													<%
													SQLShowResponsable = "SELECT  TC.ID_RESPONSABLE from CUMPLIMIENTO_KPIWEB_ESTATICO TC WHERE  1 = 1  AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-8, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' AND TC.ID_CUMPLE = "+rsCumple.getInt("ID_CUMPLE")+" AND TC.ID_CUMPLE_RESUMEN = "+rsCumplimiento.getInt("ID_CUMPLE_RESUMEN")+" AND TC.ID_CUMPLIMIENTO_2 = "+rsCumpleResumen.getInt("ID_CUMPLIMIENTO_2")+"  GROUP BY TC.ID_RESPONSABLE ORDER BY TC.ID_RESPONSABLE ASC";
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
											<td><button class="btn btn-default" id="ocultar_responsable_<%=contarCumple%>_<%=contarCumplimiento%>_<%=contarCumpleResumen%>" style="display:none;width:50px;"><img src="../images/minus2.gif" /></button><button class="btn btn-default" id="mostrar_responsable_<%=contarCumple%>_<%=contarCumplimiento%>_<%=contarCumpleResumen%>" style=" width:50px;"/><img src="../images/plus2.gif" /></td>
											<!--  <td nowrap="nowrap"><i class="icon-reorder"></i>&nbsp;<%=rsCumpleResumen.getInt("ID_CUMPLIMIENTO_2")%></td>-->
											<td nowrap="nowrap"><i class="icon-reorder"></i>&nbsp;<%=rsCumpleResumen.getString("CUMPLIMIENTO_2")%></td>


											<%
											SQLShowFecha = 	"	SELECT  " +
															"		TC.FECHA_COMPROMISO_EOM " +
															" 		,(SUM(CASE WHEN (TC.ID_CUMPLE = "+rsCumple.getInt("ID_CUMPLE")+" AND TC.ID_CUMPLE_RESUMEN = "+rsCumplimiento.getInt("ID_CUMPLE_RESUMEN")+" AND TC.ID_CUMPLIMIENTO_2 = "+rsCumpleResumen.getInt("ID_CUMPLIMIENTO_2")+" "+prefixclause+") THEN 1 ELSE 0 END) ) AS CANTIDAD " + 
															"	from CUMPLIMIENTO_KPIWEB_ESTATICO TC " +
															"	WHERE 1 = 1 " + 
															"	AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-8, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' " +
															"	GROUP BY TC.FECHA_COMPROMISO_EOM " + 
															"	ORDER BY TC.FECHA_COMPROMISO_EOM ASC";
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
																		//DecimalFormat df = new DecimalFormat("0.00"); 
																		for(int h=0;h<resultTotal.size();h++) {
																		//out.print("FT1="+String.valueOf(resultTotal.get(h).getFechaCompromiso().substring(0,10)+"-<br>"));
																		//out.print("FT2="+String.valueOf(rsShowFecha.getString("FECHA_COMPROMISO_EOM").substring(0,10))+"-<br>");

																		//if( String.valueOf(resultTotal.get(h).getFechaCompromiso().substring(0,10)) == String.valueOf(rsShowFecha.getString("FECHA_COMPROMISO_EOM").substring(0,10))) {
																		if( String.valueOf(resultTotal.get(h).getFechaCompromiso().substring(0,10)).equals(String.valueOf(rsShowFecha.getString("FECHA_COMPROMISO_EOM").substring(0,10)))) {
																				
																			//out.print("FIND<br>"+resultTotal.get(h).getCantidad());
																			out.println( StringUtils.Redondear( String.valueOf( Float.parseFloat( (String.valueOf(((float ) ( (float ) rsShowFecha.getInt("CANTIDAD") / (float )resultTotal.get(h).getCantidad()) * 100)))  ) ),2)+"%");
																		} else {
																			//out.print("NOFIND<br>");
																			//out.println( "0"+"%");
																		}
																		}
																		//out.println( StringUtils.Redondear( String.valueOf( Float.parseFloat( (String.valueOf(((float ) ( (float ) rsShowFecha.getInt("CANTIDAD") / (float )rsShowFecha.getInt("TOTAL")) * 100)))  ) ),2)+"%");
																		
																		//out.println(df.format(rsShowFecha.getFloat("PORCENTAJE"))+"%");
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
										SQLResponsable = 	"	SELECT " + 
															"		TC.ID_RESPONSABLE, ER.DESCRIPTION AS RESPONSABLE  " +
															"	from CUMPLIMIENTO_KPIWEB_ESTATICO TC " + 
															"	LEFT JOIN  ESTADO_RESPONSABLE ER ON TC.ID_RESPONSABLE =  ER.ID " +
															"	WHERE  1 = 1 " + 
															"	AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-8, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' " +
															"	AND TC.ID_CUMPLE = "+rsCumple.getInt("ID_CUMPLE")+" " +
															"	AND TC.ID_CUMPLE_RESUMEN = "+rsCumplimiento.getInt("ID_CUMPLE_RESUMEN")+" " +
															"	AND TC.ID_CUMPLIMIENTO_2 = "+rsCumpleResumen.getInt("ID_CUMPLIMIENTO_2")+" " + 
															"	GROUP BY TC.ID_RESPONSABLE, ER.DESCRIPTION " + 
															"	ORDER BY TC.ID_RESPONSABLE ASC";
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
												<!--  <td style="background-color:#FFF;color:#000000" nowrap="nowrap"><i class="icon-reorder"></i>&nbsp;<%=rsResponsable.getInt("ID_RESPONSABLE")%></td>-->
												<td style="background-color:#FFF;color:#000000" nowrap="nowrap"><i class="icon-reorder"></i>&nbsp;<%=rsResponsable.getString("RESPONSABLE")%></td>

												
												<%
												SQLShowFecha =	"	SELECT  " +
																"		TC.FECHA_COMPROMISO_EOM " +
																//" 		,(SUM(CASE WHEN (TC.ID_CUMPLE = "+rsCumple.getInt("ID_CUMPLE")+" AND TC.ID_CUMPLIMIENTO_2 = "+rsCumpleResumen.getInt("ID_CUMPLIMIENTO_2")+" AND TC.ID_RESPONSABLE = "+rsResponsable.getInt("ID_RESPONSABLE")+" "+prefixclause+") THEN 1 ELSE 0 END) ) AS CANTIDAD " + 
																" 		,(SUM(CASE WHEN (TC.ID_CUMPLE = "+rsCumple.getInt("ID_CUMPLE")+" AND TC.ID_CUMPLE_RESUMEN = "+rsCumplimiento.getInt("ID_CUMPLE_RESUMEN")+" AND TC.ID_CUMPLIMIENTO_2 = "+rsCumpleResumen.getInt("ID_CUMPLIMIENTO_2")+" AND TC.ID_RESPONSABLE = "+rsResponsable.getInt("ID_RESPONSABLE")+" "+prefixclause+") THEN 1 ELSE 0 END) ) AS CANTIDAD " + 
																
																"	from CUMPLIMIENTO_KPIWEB_ESTATICO TC " + 
 																"	WHERE 1 = 1 " + 
																"	AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-8, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' " +
																"	GROUP BY TC.FECHA_COMPROMISO_EOM " +
																"	ORDER BY TC.FECHA_COMPROMISO_EOM ASC";
												//out.print("<br>");
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
																		//DecimalFormat df = new DecimalFormat("0.00"); 
																		for(int h=0;h<resultTotal.size();h++) {
																		//out.print("FT1="+String.valueOf(resultTotal.get(h).getFechaCompromiso().substring(0,10)+"-<br>"));
																		//out.print("FT2="+String.valueOf(rsShowFecha.getString("FECHA_COMPROMISO_EOM").substring(0,10))+"-<br>");

																		//if( String.valueOf(resultTotal.get(h).getFechaCompromiso().substring(0,10)) == String.valueOf(rsShowFecha.getString("FECHA_COMPROMISO_EOM").substring(0,10))) {
																		if( String.valueOf(resultTotal.get(h).getFechaCompromiso().substring(0,10)).equals(String.valueOf(rsShowFecha.getString("FECHA_COMPROMISO_EOM").substring(0,10)))) {
																				
																			//out.print("FIND<br>"+resultTotal.get(h).getCantidad());
																			out.println( StringUtils.Redondear( String.valueOf( Float.parseFloat( (String.valueOf(((float ) ( (float ) rsShowFecha.getInt("CANTIDAD") / (float )resultTotal.get(h).getCantidad()) * 100)))  ) ),2)+"%");
																		} else {
																			//out.print("NOFIND<br>");
																			//out.println( "0"+"%");
																		}
																		}
																		//out.println( StringUtils.Redondear( String.valueOf( Float.parseFloat( (String.valueOf(((float ) ( (float ) rsShowFecha.getInt("CANTIDAD") / (float )rsShowFecha.getInt("TOTAL")) * 100)))  ) ),2)+"%");
																		
																		//out.println(df.format(rsShowFecha.getFloat("PORCENTAJE"))+"%");
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
										}	// end while Resumenee
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
							int totalesCantidadN = 0;
							float totalesProcentajeN = 0;
							for(int h=0;h<resultTotal.size();h++) { 
								totalesCantidadN = totalesCantidadN + resultTotal.get(h).getCantidad();
								//totalesProcentaje = totalesProcentaje + resultTotal.get(h).getPorcentaje();
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
													out.println(formatea.format(resultTotal.get(h).getCantidad()));
													%>
													</td>
													<td style="color:#FFF;font-size:13px" align="left" WIDTH="55" nowrap="nowrap">
													<%
													DecimalFormat df = new DecimalFormat("0.00"); 
													out.println(df.format((resultTotal.get(h).getCantidad()/resultTotal.get(h).getCantidad()) * 100)+"%");
													%>
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</th>
							<%
							}
							%>
							<td nowrap="nowrap"><fmt:formatNumber maxFractionDigits="3" value="<%=totalesCantidadN%>"  type="number"/></td>
							<td nowrap="nowrap">
 							<%
							float resultTotalN1 = 0;
							if (totalesCantidadN == 0 && totalCantidadFecha == 0) {
								out.println("-");
								resultTotalN1 = 0;
							} else {
								resultTotalN1 = ((float ) ( (float ) totalesCantidadN / (float )totalCantidadFecha) * 100);
								DecimalFormat df = new DecimalFormat("0.00"); 
								out.println(df.format(resultTotalN1));
							}
							%>%
							
							
							</td>
							
							
						</tr>	
					</table>
					<br>
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
								data: [<% String cadenaPorcentaje1 = "";   for(int h=0;h<resultCumple1.size();h++) { cadenaPorcentaje1 += String.valueOf(resultCumple1.get(h).getPorcentaje()+",");}%><%=cadenaPorcentaje1.substring(0, cadenaPorcentaje1.length()-1)%>]
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
					<%
					} else {
					%>
				
					<table>
						<tr><td colspan="8">No se encontraron datos</td></tr>
					</table>
					<%
					}
					%>
				</div>
				
				
				
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
    <script type="text/javascript">
		$(window).load(function () {
			$('#dvLoading').fadeOut(1000);
		});
		
    </script>
  </body>
</html>


