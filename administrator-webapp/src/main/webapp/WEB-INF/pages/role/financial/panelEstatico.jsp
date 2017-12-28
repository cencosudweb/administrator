<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
<%@ page import="com.cencosud.administrator.web.utils.StringUtils"%>
<%@ page import="com.cencosud.administrator.web.utils.InicializarMIS"%>

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

SimpleDateFormat format = new SimpleDateFormat ("MM");

String[] monthname = {"January","February","March","April","May","June","July","August","September","October","November","December"};
Calendar cal = Calendar.getInstance();

Integer year_actual = (cal.get(Calendar.YEAR));

String dateInicio =  request.getParameter("dateInicio");
//out.println("dateInicio="+dateInicio);
//String dateInicio =  dateInicio;
//out.println("dateInicio="+dateInicio);

String starttime = DateUtils.turnDate(dateInicio) != null?DateUtils.turnDate(dateInicio): DateUtils.turnDate(DateUtils.restarDiaFecha(currentDate,"1"));
//out.println("starttime="+starttime);




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







if ("".equals(request.getParameter("tipo_orden")) || request.getParameter("tipo_orden") == null) {
} else {
	prefixclause += " AND  TC.ID_TIPO_ORDEN = " +  request.getParameter("tipo_orden") + "  ";
	prefixclauseSub += " AND TC2.ID_TIPO_ORDEN = " +  request.getParameter("tipo_orden") + "  ";
	
}




if ("".equals(request.getParameter("tipo_venta")) || request.getParameter("tipo_venta") == null) {
}  else {
	prefixclause += " AND TC.ID_TIPO_VENTA = " +  request.getParameter("tipo_venta") + "  ";
	prefixclauseSub += " AND TC2.ID_TIPO_VENTA = " +  request.getParameter("tipo_venta") + "  ";

}

if ("".equals(request.getParameter("tipo_guia")) || request.getParameter("tipo_guia") == null) {

}  else {
	prefixclause += " AND TC.ID_TIPOGUI = " +  request.getParameter("tipo_guia") + "  ";
	prefixclauseSub += " AND TTC2.ID_TIPOGUI = " +  request.getParameter("tipo_guia") + "  ";

}

InicializarMIS inicializarMIS = new InicializarMIS();
try {
	inicializarMIS.init();
} catch (Exception e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}




%>




<c:set var="totales" value="${ cantTotal }"/>
<!--  
#1:<c:out value="${totales}" />
#2:<%=pageContext.getAttribute("totales") %>
-->





<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html ng-app="loginApp" ng-controller="mainCtrl">
  <head>
    <jsp:include page="../../include/head.jsp" />
 <link rel="stylesheet" href="<c:url value="/js/jquery-ui.css"/>"/>
  <link rel="stylesheet" href="<c:url value="/js/style.css"/>"/>
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
	  $("#dateInicio").datepicker({
			changeMonth: true,
			changeYear: true,
			dateFormat: 'dd/mm/yy',
			minDate: new Date(2010, 1 - 1, 1),
			yearRange: '2010:2030',
			showOn: "button",
			buttonImage: "/administrator-webapp/images/calendar.png",
			buttonImageOnly: true
		});

    
  } );

  
  </script>
  
  <script src="<c:url value="/js/angular/lib/angular.min.js"/>"></script>
  <script src="<c:url value="/js/angular/app.js"/>"></script>
 <script src="<c:url value="/js/angular/servicios/login_service.js"/>"></script>
  
  
  
  </head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <jsp:include page="../../include/banner.jsp" />
  <jsp:include page="../../include/menu.jsp" />

  

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Panel
        <small>Control panel Version 1.0</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="home"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Reporte Kpi Cumplimiento Logistico Estatico</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      		<!--
      		<div ng-if="cumple.respuestaCas.CODIGO_RESPUESTA == 1">
	            <div class="alert alert-success">
					<button type="button" class="close" data-dismiss="alert">X</button>
				   {{ cumple.respuestaCas.DESCRIPCION_RESPUESTA }}
				</div>
            </div>
            <div class="row">
            <div ng-if="cumple.respuestaCas.CODIGO_RESPUESTA == 0">
	            <div class="alert alert-error">
					<button type="button" class="close" data-dismiss="alert">X</button>
				    {{ cumple.respuestaCas.DESCRIPCION_RESPUESTA }}
				</div>
            </div>
            </div>
            -->


	  		<div class="row">
				<!-- left column -->
				<div class="col-md-12">
				  <!-- general form elements -->
				  <div class="box box-primary">
					<div class="box-header with-border">
					  <h3 class="box-title">Consulta</h3>
					</div>
					<!-- /.box-header -->
					<!-- form start -->
					
					
					
					<form class="forma" id="f_all_user" method="get" action="panelEstatico">
						<input type="hidden" name="posted" id="posted" value="ok"/>
					  <div class="box-body">
						<div class="form-group">
						  <label for="exampleInputEmail1">Fecha</label>
						   	<input type="text" value="<% if (request.getParameter("dateInicio") != null) { %><% try { SimpleDateFormat formatoFecha = new SimpleDateFormat("dd/MM/yyyy", Locale.getDefault()); formatoFecha.setLenient(false); formatoFecha.parse(request.getParameter("dateInicio"));%><%=request.getParameter("dateInicio").toString().trim()%><% } catch(ParseException  e) {%><%=DateUtils.restarDiaFecha(currentDate,"1")%><% } %><%  } else {%><%=DateUtils.restarDiaFecha(currentDate,"1") %> <% } %>" readonly name="dateInicio" id="dateInicio" class="form-control" />
						  <!--  
						 	<input type="text" value="<% if (request.getParameter("dateInicio") != null) { %><% try { SimpleDateFormat formatoFecha = new SimpleDateFormat("dd/MM/yyyy", Locale.getDefault()); formatoFecha.setLenient(false); formatoFecha.parse(request.getParameter("dateInicio"));%><%=request.getParameter("dateInicio").toString().trim()%><% } catch(ParseException  e) {%><%=currentDate%><% } %><%  } else {%><%=currentDate %> <% } %>" readonly name="dateInicio" id="dateInicio" class="form-control span12" style="width:170px;" />
						 	-->
						</div>  
					<div class="form-group">
						<label for="tipo_orden">Canal</label>
						<select name="tipo_orden" id="tipo_orden" class="form-control">
					    	<option value="">Todas los Canales</option>
					        <c:forEach items="${ordenes}" var="orden" varStatus="status">
					        	<option value="${orden.id}" ${param.tipo_orden == orden.id ? 'selected' : ''}>${orden.description}</option>
					        </c:forEach>
					    </select>
					</div>
					<div class="form-group">
						<label for="tipo_guia">Tipo de Guia</label>
						<select name="tipo_guia" id="tipo_guia" class="form-control">
					    	<option value="">Todas las Guias</option>
					        <c:forEach items="${guias}" var="guia" varStatus="status">
					        	<option value="${guia.id}" ${param.tipo_guia == guia.id ? 'selected' : ''}>${guia.description}</option>
					        </c:forEach>
					    </select>
					</div>
					<div class="form-group">
						<label for="tipo_venta">Tipo de Despacho</label>
						<select name="tipo_venta" id="tipo_venta" class="form-control">
					    	<option value="">Todas las Ventas</option>
					        <c:forEach items="${ventas}" var="venta" varStatus="status">
					        	<option value="${venta.id}" ${param.tipo_venta == venta.id ? 'selected' : ''}>${venta.description}</option>
					        </c:forEach>
					    </select>
					</div>
					  
					  <!-- /.box-body -->
					  <div class="box-footer">
						<button type="submit"  class="btn btn-primary">Consultar</button>
					  </div>
					</form>
				  </div>
				  <!-- /.box -->
				</div>
			</div>		
			

			 

            <div class="row">
				<div class="col-md-12">
				  <div class="box">
				  	<c:choose>
						<c:when test="${ cantCumple > 0 || cantAtrasado> 0  || cantNoCumple > 0 || cantTotal > 0}">
						  <div class="row">
							<div class="col-md-12">
							  <div class="box">
								<div class="box-header with-border">
								  <h3 class="box-title">Reporte Kpi Cumplimiento Logistico Estatico</h3>
								  <div class="box-tools pull-right">
									<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
									</button>
								  </div>
								</div>
								<!-- ./box-body -->
								<div class="box-footer">
									<div class="row">
										<div class="col-sm-12 col-xs-12">
										  <div class="description-block">
										  	<span class="description-percentage text-blue">
										  	<i class="fa fa-caret-right"> 
										    <span style="font-size:15px">
										       <c:choose>
													  <c:when test="${ cantCumple > 0}">
													  	<fmt:formatNumber pattern="#,###,#00" value="${ cantCumple }"  type="number"/>
													  	<!--
													  		<c:out value="${ cantCumple }"/>
													  	-->
													  </c:when>
													  <c:otherwise>
													  0
													  </c:otherwise>
												  </c:choose>
										    </span>
										  	</i> 
											</span>
											<h5 class="description-header" style="font-size:40px">
											<span>
												<c:choose>
													  <c:when test="${ porcentajeCumple == '0.00'}">
													  	  0
													  </c:when>
													  <c:otherwise>
													  ${ porcentajeCumple } %
													  </c:otherwise>
												  </c:choose> 
										    </span>
											</h5>
											<span class="description-text" style="font-size:20px">1.- CUMPLE</span>
											</br>
											
											<div class="box-body">
											<c:choose>
												<c:when test="${ cantCumple > 0}">
													<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#modal-default">
								                	Mostrar Cumple
								              		</button>
												</c:when>
												<c:otherwise>
													<button type="button" class="btn btn-info btn-lg disabled" data-toggle="" data-target="">
								                	No Hay Datos
								              		</button>
												</c:otherwise>
											</c:choose>
								            </div>
								            
								            <div class="modal fade" id="modal-default">
									          <div class="modal-dialog">
									            <div class="modal-content">
									              <div class="modal-header">
									                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
									                  <span aria-hidden="true">&times;</span></button>
									                <h4 class="modal-title">Informacion Cumple</h4>
									              </div>
									              <div class="modal-body">
									                <p>Detalle</p>
													<!-- /.box-header -->
									            <div class="box-body table-responsive">
									               <table id="dataTables-example"  width="100%"  border="0" cellspacing="0" cellpadding="0" style="font-size:15px">
									                        <tr bgcolor="#23527c" style="text-align:left; color:#FFF; font-size:15px; border: solid 1px #a6a6a6;">
									                          <td></td>
									                          <td>ESTADO</td>
									                          <th>
									                            <table>
									                              <tr>
									                                <td>
									                                  <table>
									                                    <tr>
									                                      <td style="color:#FFF;font-size:15px" align="left" WIDTH="50">Q</td>
									                                      <td style="color:#FFF;font-size:15px" align="left" WIDTH="50">%</td>
									                                    </tr>
									                                  </table>
									                                </td>
									                              </tr>
									                            </table>
									                          </th>
									                        </tr>
									               </table>            
									               <table id="dataTables-example"  width="100%"  border="0" cellspacing="0" cellpadding="0" style="font-size:15px">
												<tr bgcolor="#23527c" style="text-align:left; color:#FFF; font-size:15px; border: solid 1px #a6a6a6;">
													<td></td>
													<td>ESTADO</td>
													<%
													for(int c=0;c<1;c++) {
						
													%>
													<th>
														<%=""%>&nbsp;
														<table>
															<tr>
																<td>
																	<table>
																		<tr>
																			<td style="color:#FFF;font-size:15px" align="left" WIDTH="50">Q</td>
																			<td style="color:#FFF;font-size:15px" align="left" WIDTH="50">%</td>
																		</tr>
																	</table>
																</td>
															</tr>
														</table>
													</th>
													<%
													}
													%>
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
													Class.forName(InicializarMIS.getPropiedad("jdbc.driverClassName")).newInstance();
													conn = DriverManager.getConnection(InicializarMIS.getPropiedad("jdbc.databaseurl"),InicializarMIS.getPropiedad("jdbc.username"),InicializarMIS.getPropiedad("jdbc.password"));//
													
													//Class.forName("com.mysql.jdbc.Driver").newInstance();
													//conn = DriverManager.getConnection("jdbc:mysql://txddb.cqjxibnc2qub.us-west-2.rds.amazonaws.com/trazabilidad","adminuser","s4cc2ss943");//
													
													conn.setAutoCommit(false);
													SQLCumple = "	SELECT  " +
																"		TC.ID_CUMPLE, EC.DESCRIPTION AS CUMPLE " +
																"	from cumplimiento_kpiweb TC " + 
																//"	INNER JOIN estado_cumple EC ON TC.ID_CUMPLE = EC.ID " + 
																"	LEFT JOIN estado_cumple EC ON TC.ID_CUMPLE = EC.ID " + 
																//"	RIGHT  JOIN estado_cumple EC ON TC.ID_CUMPLE = EC.ID " + 
																"	WHERE  1 = 1  " + 
																"   AND TC.ID_CUMPLE = 1 "  +
																" 	AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-0, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' " +
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
														        	SQLHideCumplimiento = "SELECT  TC.ID_CUMPLE_RESUMEN from cumplimiento_kpiweb TC WHERE  1 = 1 AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-0, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' AND TC.ID_CUMPLE = "+rsCumple.getInt("ID_CUMPLE")+" GROUP BY TC.ID_CUMPLE_RESUMEN ORDER BY TC.ID_CUMPLE_RESUMEN ASC";
														        	psHideCumplimiento = conn.prepareStatement(SQLHideCumplimiento, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
								                                    rsHideCumplimiento = psHideCumplimiento.executeQuery();
								                                    conn.commit();
																	int contarHideCumplimiento = 0;
								                                    while(rsHideCumplimiento.next()) {
																		contarHideCumplimiento = contarHideCumplimiento + 1;
								                                    %>
																		$("#cumplimiento_<%=contarCumple%>_<%=contarHideCumplimiento%>").hide('slow', function() {});
																		<%
																		SQLHideCumpleResumen = "SELECT  TC.ID_CUMPLIMIENTO_2 from cumplimiento_kpiweb TC WHERE  1 = 1 AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-0, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' AND TC.ID_CUMPLE = "+rsCumple.getInt("ID_CUMPLE")+" AND TC.ID_CUMPLE_RESUMEN = "+rsHideCumplimiento.getInt("ID_CUMPLE_RESUMEN")+" GROUP BY TC.ID_CUMPLIMIENTO_2 ORDER BY TC.ID_CUMPLIMIENTO_2 ASC";
																		psHideCumpleResumen = conn.prepareStatement(SQLHideCumpleResumen, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
																		rsHideCumpleResumen = psHideCumpleResumen.executeQuery();
																		conn.commit();
																		int contarHideCumpleResumen = 0;
																		while(rsHideCumpleResumen.next()) {
																			contarHideCumpleResumen = contarHideCumpleResumen + 1;
																		%>
																			$("#cumple_resumen_<%=contarCumple%>_<%=contarHideCumplimiento%>_<%=contarHideCumpleResumen%>").hide('slow', function() {});
																			
																			
																			<%
																			SQLHideResponsable = "SELECT  TC.ID_RESPONSABLE from cumplimiento_kpiweb TC WHERE  1 = 1 AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-0, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' AND TC.ID_CUMPLE = "+rsCumple.getInt("ID_CUMPLE")+" AND TC.ID_CUMPLE_RESUMEN = "+rsHideCumplimiento.getInt("ID_CUMPLE_RESUMEN")+" AND TC.ID_CUMPLIMIENTO_2 = "+rsHideCumpleResumen.getInt("ID_CUMPLIMIENTO_2")+" GROUP BY TC.ID_RESPONSABLE ORDER BY TC.ID_RESPONSABLE ASC";
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
														        	SQLShowCumplimiento = "SELECT  TC.ID_CUMPLE_RESUMEN from cumplimiento_kpiweb TC WHERE  1 = 1 AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-0, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' AND TC.ID_CUMPLE = "+rsCumple.getInt("ID_CUMPLE")+" GROUP BY TC.ID_CUMPLE_RESUMEN ORDER BY TC.ID_CUMPLE_RESUMEN ASC";
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
																		SQLShowCumpleResumen = "SELECT  TC.ID_CUMPLIMIENTO_2 from cumplimiento_kpiweb TC WHERE  1 = 1 AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-0, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' AND TC.ID_CUMPLE = "+rsCumple.getInt("ID_CUMPLE")+" AND TC.ID_CUMPLE_RESUMEN = "+rsShowCumplimiento.getInt("ID_CUMPLE_RESUMEN")+"  GROUP BY TC.ID_CUMPLIMIENTO_2 ORDER BY TC.ID_CUMPLIMIENTO_2 ASC";
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
														<!--  
														<tr style="background-color:#3b5998;color:#FFF;" >
															<td>
															
															<button class="btn btn-block btn-default btn-lg" id="ocultar_cumplimiento_<%=contarCumple%>" style="display:none;margin-top: 0px;">
															<i class="fa fa-minus" aria-hidden="true"></i>
															</button>
															<button class="btn btn-block btn-default btn-lg" id="mostrar_cumplimiento_<%=contarCumple%>" style="margin-top: 0px;">
															<i class="fa fa-plus" aria-hidden="true"></i>
															</button>
															
															</td>
															<td align="left" nowrap="nowrap" ><i class="icon-reorder"></i>&nbsp;<%=rsCumple.getString("CUMPLE")%> </td>
															
															
															<%
															SQLShowFecha = 	"	SELECT " + 
																			"		TC.FECHA_COMPROMISO_EOM" + 
																			
																			" 		,(SUM(CASE WHEN (TC.ID_CUMPLE = "+rsCumple.getInt("ID_CUMPLE")+" "+""+") THEN 1 ELSE 0 END) ) AS CANTIDAD " +		
																			" 		,SUM(CASE WHEN (TC.ID_CUMPLE = 1 OR TC.ID_CUMPLE = 2 OR TC.ID_CUMPLE = 3) THEN 1 ELSE 0 END) as TOTAL " +
																			"	from cumplimiento_kpiweb TC " +
																			"	WHERE 1 = 1 " + 
																			" " + prefixclause +
																			"	AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-0, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"'  " + 
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
																					<td  style="color:#FFF;font-size:15px" align="left" WIDTH="50" nowrap="nowrap">
																					<%
																					 DecimalFormat formatea = new DecimalFormat("###,###.##");
																					 out.println(formatea.format(rsShowFecha.getInt("CANTIDAD")));
																					 %>
																					</td>
																					<td  style="color:#FFF;font-size:15px" align="left" WIDTH="50" nowrap="nowrap">
																					<%
																					
																					
																					if (rsShowFecha.getInt("CANTIDAD") > 0 ) {
																						out.println( StringUtils.Redondear( String.valueOf( Float.parseFloat( (String.valueOf(((float ) ( (float ) rsShowFecha.getInt("CANTIDAD") / (float ) rsShowFecha.getInt("TOTAL")  ) * 100)))  ) ),2)+"%");
																					} else {
																						out.println( "-");																
																					}
																					
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
															
														</tr>
														-->
													
														<%
														// Segunda Fila Cumplimiento
														
														SQLCumplimiento = 	"	SELECT  " +
																			"		TC.ID_CUMPLE_RESUMEN, ECR.DESCRIPTION AS CUMPLE_RESUMEN " +
																			"	from cumplimiento_kpiweb TC " + 
																			"	LEFT JOIN  estado_cumple_resumen ECR ON TC.ID_CUMPLE_RESUMEN =  ECR.ID " +
																			"	WHERE  1 = 1 " +
																			"	AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-0, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' " + 
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
																		SQLHideCumpleResumen = "SELECT  TC.ID_CUMPLIMIENTO_2 from cumplimiento_kpiweb TC WHERE  1 = 1 AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-0, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' AND TC.ID_CUMPLE = "+rsCumple.getInt("ID_CUMPLE")+" AND TC.ID_CUMPLE_RESUMEN = "+rsCumplimiento.getInt("ID_CUMPLE_RESUMEN")+" GROUP BY TC.ID_CUMPLIMIENTO_2 ORDER BY TC.ID_CUMPLIMIENTO_2 ASC";
																		psHideCumpleResumen = conn.prepareStatement(SQLHideCumpleResumen, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
																		rsHideCumpleResumen = psHideCumpleResumen.executeQuery();
																		conn.commit();
																		int contarHideCumpleResumen = 0;
																		while(rsHideCumpleResumen.next()) {
																			contarHideCumpleResumen = contarHideCumpleResumen + 1;
																		%>
																			$("#cumple_resumen_<%=contarCumple%>_<%=contarCumplimiento%>_<%=contarHideCumpleResumen%>").hide('slow', function() {});
																			<%
																			SQLHideResponsable = "SELECT  TC.ID_RESPONSABLE from cumplimiento_kpiweb TC WHERE  1 = 1 AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-0, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' AND TC.ID_CUMPLE = "+rsCumple.getInt("ID_CUMPLE")+"  AND TC.ID_CUMPLE_RESUMEN = "+rsCumplimiento.getInt("ID_CUMPLE_RESUMEN")+" AND TC.ID_CUMPLIMIENTO_2 = "+rsHideCumpleResumen.getInt("ID_CUMPLIMIENTO_2")+" GROUP BY TC.ID_RESPONSABLE ORDER BY TC.ID_RESPONSABLE ASC";
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
																		SQLShowCumpleResumen = "SELECT  TC.ID_CUMPLIMIENTO_2 from cumplimiento_kpiweb TC WHERE  1 = 1 AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-0, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' AND TC.ID_CUMPLE = "+rsCumple.getInt("ID_CUMPLE")+" AND TC.ID_CUMPLE_RESUMEN = "+rsCumplimiento.getInt("ID_CUMPLE_RESUMEN")+" GROUP BY TC.ID_CUMPLIMIENTO_2 ORDER BY TC.ID_CUMPLIMIENTO_2 ASC";
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
															<!--  
															<tr id="cumplimiento_<%=contarCumple%>_<%=contarCumplimiento%>" style="background-color:#007bb6;color:#FFF;" >
																<td>
																<button class="btn btn-block btn-default btn-lg" id="ocultar_cumple_resumen_<%=contarCumple%>_<%=contarCumplimiento%>" style="display:none;margin-top: 0px;">
																<i class="fa fa-minus" aria-hidden="true"></i>
																</button>
																<button class="btn btn-block btn-default btn-lg" id="mostrar_cumple_resumen_<%=contarCumple%>_<%=contarCumplimiento%>" style="margin-top: 0px;">
																<i class="fa fa-plus" aria-hidden="true"></i>
																</button>
																</td>
																<td align="left" nowrap="nowrap"><i class="icon-reorder"></i>&nbsp;<%=rsCumplimiento.getString("CUMPLE_RESUMEN")%></td>	 
						
																
						
																<%
																SQLShowFecha = 	"	SELECT " + 
																				"		TC.FECHA_COMPROMISO_EOM AS  FECHA_COMPROMISO_EOM" +
																				"		,(SUM(CASE WHEN (TC.ID_CUMPLE = "+rsCumple.getInt("ID_CUMPLE")+" AND TC.ID_CUMPLE_RESUMEN = "+rsCumplimiento.getInt("ID_CUMPLE_RESUMEN")+" "+""+") THEN 1 ELSE 0 END) ) AS CANTIDAD " +
																				" 		,SUM(CASE WHEN (TC.ID_CUMPLE = 1 OR TC.ID_CUMPLE = 2 OR TC.ID_CUMPLE = 3) THEN 1 ELSE 0 END) as TOTAL " +
																				
																				"	from cumplimiento_kpiweb TC " +
																				"	WHERE 1 = 1 " +
																				" " + prefixclause +														
																				"	AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-0, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' " +
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
																						<td style="font-size:15px" align="left" WIDTH="50" nowrap="nowrap">
																						<%
																						 DecimalFormat formatea = new DecimalFormat("###,###.##");
																						 out.println(formatea.format(rsShowFecha.getInt("CANTIDAD")));
																						 %>
																						</td>
																						<td style="font-size:15px" align="left" WIDTH="50" nowrap="nowrap">
																						<%
																						if (rsShowFecha.getInt("CANTIDAD") > 0 ) {
																							out.println( StringUtils.Redondear( String.valueOf( Float.parseFloat( (String.valueOf(((float ) ( (float ) rsShowFecha.getInt("CANTIDAD") / (float ) rsShowFecha.getInt("TOTAL")  ) * 100)))  ) ),2)+"%");
																						} else {
																							out.println( "-");																
																						}
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
																
															</tr>
															-->
															<%
															// Tercera Fila CumpleResumen
															SQLCumpleResumen = 	"	SELECT  " + 
																				"		TC.ID_CUMPLIMIENTO_2, EC.DESCRIPTION AS CUMPLIMIENTO_2" + 
																				"	from cumplimiento_kpiweb TC " +
																				"	LEFT JOIN  estado_cumplimiento EC ON TC.ID_CUMPLIMIENTO_2 =  EC.ID " +
																				"	WHERE  1 = 1 " + 
																				"	AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-0, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' " + 
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
																			SQLHideResponsable = "SELECT  TC.ID_RESPONSABLE from cumplimiento_kpiweb TC WHERE  1 = 1  AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-0, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' AND TC.ID_CUMPLE = "+rsCumple.getInt("ID_CUMPLE")+" AND TC.ID_CUMPLE_RESUMEN = "+rsCumplimiento.getInt("ID_CUMPLE_RESUMEN")+" AND TC.ID_CUMPLIMIENTO_2 = "+rsCumpleResumen.getInt("ID_CUMPLIMIENTO_2")+" GROUP BY TC.ID_RESPONSABLE ORDER BY TC.ID_RESPONSABLE ASC";
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
																			SQLShowResponsable = "SELECT  TC.ID_RESPONSABLE from cumplimiento_kpiweb TC WHERE  1 = 1  AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-0, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' AND TC.ID_CUMPLE = "+rsCumple.getInt("ID_CUMPLE")+" AND TC.ID_CUMPLE_RESUMEN = "+rsCumplimiento.getInt("ID_CUMPLE_RESUMEN")+" AND TC.ID_CUMPLIMIENTO_2 = "+rsCumpleResumen.getInt("ID_CUMPLIMIENTO_2")+"  GROUP BY TC.ID_RESPONSABLE ORDER BY TC.ID_RESPONSABLE ASC";
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
																<tr id="cumple_resumen_<%=contarCumple%>_<%=contarCumplimiento%>_<%=contarCumpleResumen%>"  style="background-color:#55acee;color:#FFF;">
																	<td>
																	<button class="btn btn-block btn-default btn-lg" id="ocultar_responsable_<%=contarCumple%>_<%=contarCumplimiento%>_<%=contarCumpleResumen%>" style="display:none;margin-top: 0px;">
																	<i class="fa fa-minus" aria-hidden="true"></i>
																	</button>
																	<button class="btn btn-block btn-default btn-lg" id="mostrar_responsable_<%=contarCumple%>_<%=contarCumplimiento%>_<%=contarCumpleResumen%>" style="margin-top: 0px;"/>
																	<i class="fa fa-plus" aria-hidden="true"></i>
																	</td>
																	<td align="left" nowrap="nowrap"><i class="icon-reorder"></i>&nbsp;<%=rsCumpleResumen.getString("CUMPLIMIENTO_2")%></td>
						
						
																	<%
																	SQLShowFecha = 	"	SELECT  " +
																					"		TC.FECHA_COMPROMISO_EOM " +
																					" 		,(SUM(CASE WHEN (TC.ID_CUMPLE = "+rsCumple.getInt("ID_CUMPLE")+" AND TC.ID_CUMPLE_RESUMEN = "+rsCumplimiento.getInt("ID_CUMPLE_RESUMEN")+" AND TC.ID_CUMPLIMIENTO_2 = "+rsCumpleResumen.getInt("ID_CUMPLIMIENTO_2")+" "+""+") THEN 1 ELSE 0 END) ) AS CANTIDAD " + 
																					" 		,SUM(CASE WHEN (TC.ID_CUMPLE = 1 OR TC.ID_CUMPLE = 2 OR TC.ID_CUMPLE = 3) THEN 1 ELSE 0 END) as TOTAL " +
						
																					"	from cumplimiento_kpiweb TC " +
																					"	WHERE 1 = 1 " + 
																					" " + prefixclause +	
																					"	AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-0, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' " +
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
																								<td style="font-size:15px" align="left" WIDTH="50" nowrap="nowrap">
																								<%
																								 DecimalFormat formatea = new DecimalFormat("###,###.##");
																								 out.println(formatea.format(rsShowFecha.getInt("CANTIDAD")));
																								 %>
																								</td>
																								<td style="font-size:15px" align="left" WIDTH="50" nowrap="nowrap">
																								<%
																								if (rsShowFecha.getInt("CANTIDAD") > 0 ) {
																									out.println( StringUtils.Redondear( String.valueOf( Float.parseFloat( (String.valueOf(((float ) ( (float ) rsShowFecha.getInt("CANTIDAD") / (float ) rsShowFecha.getInt("TOTAL")  ) * 100)))  ) ),2)+"%");
																								} else {
																									out.println( "-");																
																								}
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
																	
																</tr>
																<%
																// Cuarta Fila Responsable
																SQLResponsable = 	"	SELECT " + 
																					"		TC.ID_RESPONSABLE, ER.DESCRIPTION AS RESPONSABLE  " +
																					"	from cumplimiento_kpiweb TC " + 
																					"	LEFT JOIN  estado_responsable ER ON TC.ID_RESPONSABLE =  ER.ID " +
																					"	WHERE  1 = 1 " + 
																					"	AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-0, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' " +
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
																		<td>
																		<button class="btn btn-block btn-default btn-lg disabled"  style="margin-top: 0px;">-</button>
																		</td>
																		<td align="left" style="background-color:#FFF;color:#000000" nowrap="nowrap"><i class="icon-reorder"></i>&nbsp;<%=rsResponsable.getString("RESPONSABLE")%></td>
						
																		
																		<%
																		SQLShowFecha =	"	SELECT  " +
																						"		TC.FECHA_COMPROMISO_EOM " +
																						//" 		,(SUM(CASE WHEN (TC.ID_CUMPLE = "+rsCumple.getInt("ID_CUMPLE")+" AND TC.ID_CUMPLIMIENTO_2 = "+rsCumpleResumen.getInt("ID_CUMPLIMIENTO_2")+" AND TC.ID_RESPONSABLE = "+rsResponsable.getInt("ID_RESPONSABLE")+" "+prefixclause+") THEN 1 ELSE 0 END) ) AS CANTIDAD " + 
																						" 		,(SUM(CASE WHEN (TC.ID_CUMPLE = "+rsCumple.getInt("ID_CUMPLE")+" AND TC.ID_CUMPLE_RESUMEN = "+rsCumplimiento.getInt("ID_CUMPLE_RESUMEN")+" AND TC.ID_CUMPLIMIENTO_2 = "+rsCumpleResumen.getInt("ID_CUMPLIMIENTO_2")+" AND TC.ID_RESPONSABLE = "+rsResponsable.getInt("ID_RESPONSABLE")+" "+""+") THEN 1 ELSE 0 END) ) AS CANTIDAD " + 
																						" 		,SUM(CASE WHEN (TC.ID_CUMPLE = 1 OR TC.ID_CUMPLE = 2 OR TC.ID_CUMPLE = 3) THEN 1 ELSE 0 END) as TOTAL " +
																						
																						"	from cumplimiento_kpiweb TC " + 
						 																"	WHERE 1 = 1 " + 
						 																" " + prefixclause +	
						 																"	AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-0, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' " +
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
																								<td style="font-size:15px" align="left" WIDTH="50" nowrap="nowrap">
																								<%
																								 DecimalFormat formatea = new DecimalFormat("###,###.##");
																								 out.println(formatea.format(rsShowFecha.getInt("CANTIDAD")));
																					 			%>
																								</td>
																								<td style="font-size:15px" align="left" WIDTH="50" nowrap="nowrap">
																								<%
																								if (rsShowFecha.getInt("CANTIDAD") > 0 ) {
																									out.println( StringUtils.Redondear( String.valueOf( Float.parseFloat( (String.valueOf(((float ) ( (float ) rsShowFecha.getInt("CANTIDAD") / (float ) rsShowFecha.getInt("TOTAL")  ) * 100)))  ) ),2)+"%");
																								} else {
																									out.println( "-");																
																								}
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
											</table>
									            </div>
									            <!-- /.box-body -->
									
									                
									              </div>
									              <div class="modal-footer">
									                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Cerrar</button>
									              </div>
									            </div>
									            <!-- /.modal-content -->
									          </div>
									          <!-- /.modal-dialog -->
									        </div>
									        <!-- /.modal -->
								            
								            
								            
								           
										  </div>
										  <!-- /.description-block -->
										</div>
								  	</div>
			
								  	<div class="box-header with-border"></div>
			
								  	<!-- /.row -->
								  	<div class="row">
										<div class="col-sm-12 col-xs-12">
										  <div class="description-block">
										  	<span class="description-percentage text-blue">
										  	<i class="fa fa-caret-right"> 
										  	<span style="font-size:15px">
										        <c:choose>
													  <c:when test="${ cantAtrasado > 0}">
													  	<fmt:formatNumber pattern="#,###,#00" value="${ cantAtrasado }"  type="number"/>
													  </c:when>
													  <c:otherwise>
													  0
													  </c:otherwise>
												  </c:choose> 
										    </span>
										  	</i> 
											</span>
											
											<h5 class="description-header" style="font-size:40px">
											<span>
			
												<c:choose>
													  <c:when test="${ porcentajeAtrasado == '0.00'}">
													  	  0
													  </c:when>
													  <c:otherwise>
													  ${ porcentajeAtrasado } %
													  </c:otherwise>
												  </c:choose> 
										       
										    </span>
											</h5>
											<span class="description-text" style="font-size:20px">2.- ATRASADO</span>
											</br>
											
											
											<div class="box-body">
								              <c:choose>
												<c:when test="${ cantAtrasado > 0}">
													<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#modal-default2">
								                	Mostrar Atrasado
								              		</button>
												</c:when>
												<c:otherwise>
													<button type="button" class="btn btn-info btn-lg disabled" data-toggle="" data-target="">
								               		 No Hay datos
								              		</button>
												</c:otherwise>
											</c:choose>
								            </div>
								            
								            
								            <div class="modal fade" id="modal-default2">
									          <div class="modal-dialog">
									            <div class="modal-content">
									              <div class="modal-header">
									                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
									                  <span aria-hidden="true">&times;</span></button>
									                <h4 class="modal-title">Informacion Atrasado</h4>
									              </div>
									              <div class="modal-body">
									                <p>Detalle</p>
													<!-- /.box-header -->
									            <div class="box-body table-responsive">
									               <table id="dataTables-example"  width="100%"  border="0" cellspacing="0" cellpadding="0" style="font-size:15px">
									                        <tr bgcolor="#23527c" style="text-align:left; color:#FFF; font-size:15px; border: solid 1px #a6a6a6;">
									                          <td></td>
									                          <td>ESTADO</td>
									                          <th>
									                            <table>
									                              <tr>
									                                <td>
									                                  <table>
									                                    <tr>
									                                      <td style="color:#FFF;font-size:15px" align="left" WIDTH="50">Q</td>
									                                      <td style="color:#FFF;font-size:15px" align="left" WIDTH="50">%</td>
									                                    </tr>
									                                  </table>
									                                </td>
									                              </tr>
									                            </table>
									                          </th>
									                        </tr>
									               </table>            
									               <table id="dataTables-example"  width="100%"  border="0" cellspacing="0" cellpadding="0" style="font-size:15px">
												<tr bgcolor="#23527c" style="text-align:left; color:#FFF; font-size:15px; border: solid 1px #a6a6a6;">
													<td></td>
													<td>ESTADO</td>
													<%
													for(int c2=0;c2<1;c2++) {
						
													%>
													<th>
														<%=""%>&nbsp;
														<table>
															<tr>
																<td>
																	<table>
																		<tr>
																			<td style="color:#FFF;font-size:15px" align="left" WIDTH="50">Q</td>
																			<td style="color:#FFF;font-size:15px" align="left" WIDTH="50">%</td>
																		</tr>
																	</table>
																</td>
															</tr>
														</table>
													</th>
													<%
													}
													%>
												</tr>
												
												
												
												
												
												<%
												Connection conn2 = null;
												
												PreparedStatement psCumple2 = null;
												ResultSet rsCumple2 = null;
												String SQLCumple2 = null;
												
												PreparedStatement psCumplimiento2 = null;
												ResultSet rsCumplimiento2 = null;
												String SQLCumplimiento2 = null;
												
												PreparedStatement psCumpleResumen2 = null;
												ResultSet rsCumpleResumen2 = null;
												String SQLCumpleResumen2 = null;
												
												PreparedStatement psResponsable2 = null;
												ResultSet rsResponsable2 = null;
												String SQLResponsable2 = null;
												
												//Ocultar
												PreparedStatement psHideCumple2 = null;
												ResultSet rsHideCumple2 = null;
												String SQLHideCumple2 = null;
						
												PreparedStatement psHideCumplimiento2 = null;
												ResultSet rsHideCumplimiento2 = null;
												String SQLHideCumplimiento2 = null;
												
												PreparedStatement psHideCumpleResumen2 = null;
												ResultSet rsHideCumpleResumen2 = null;
												String SQLHideCumpleResumen2 = null;
						
												PreparedStatement psHideResponsable2 = null;
												ResultSet rsHideResponsable2 = null;
												String SQLHideResponsable2 = null;
						
												
												//Mostrar			
												PreparedStatement psShowCumple2 = null;
												ResultSet rsShowCumple2 = null;
												String SQLShowCumple2 = null;
																			
												PreparedStatement psShowCumplimiento2= null;
												ResultSet rsShowCumplimiento2 = null;
												String SQLShowCumplimiento2 = null;
							
												PreparedStatement psShowCumpleResumen2 = null;
												ResultSet rsShowCumpleResumen2 = null;
												String SQLShowCumpleResumen2 = null;
							
												PreparedStatement psShowResponsable2 = null;
												ResultSet rsShowResponsable2 = null;
												String SQLShowResponsable2 = null;
												
												//
												PreparedStatement psShowFechaCumple2 = null;
												ResultSet rsShowFechaCumple2 = null;
												String SQLShowFechaCumple2 = null;
												
												PreparedStatement psShowFechaCumplimiento2 = null;
												ResultSet rsShowFechaCumplimiento2 = null;
												String SQLShowFechaCumplimiento2 = null;
												
												PreparedStatement psShowFechaCumpleResumen2 = null;
												ResultSet rsShowFechaCumpleResumen2 = null;
												String SQLShowFechaCumpleResumen2 = null;
												
												PreparedStatement psShowFechaResponsable2 = null;
												ResultSet rsShowFechaResponsable2 = null;
												String SQLShowFechaResponsable2 = null;
												
												PreparedStatement psShowFecha2 = null;
												ResultSet rsShowFecha2 = null;
												String SQLShowFecha2 = null;
												
												//Primera Fila Cumple
												
												try{
													Class.forName("oracle.jdbc.OracleDriver").newInstance();
													conn2 = DriverManager.getConnection("jdbc:oracle:thin:@172.18.163.15:1521/XE","kpiweb","kpiweb");//
													
													
													//Class.forName("com.mysql.jdbc.Driver").newInstance();
													//conn2 = DriverManager.getConnection("jdbc:mysql://txddb.cqjxibnc2qub.us-west-2.rds.amazonaws.com/trazabilidad","adminuser","s4cc2ss943");//
													
													
													conn2.setAutoCommit(false);
													SQLCumple2 = "	SELECT  " +
																"		TC.ID_CUMPLE, EC.DESCRIPTION AS CUMPLE " +
																"	from cumplimiento_kpiweb TC " + 
																//"	INNER JOIN estado_cumple EC ON TC.ID_CUMPLE = EC.ID " + 
																"	LEFT JOIN estado_cumple EC ON TC.ID_CUMPLE = EC.ID " + 
																//"	RIGHT  JOIN estado_cumple EC ON TC.ID_CUMPLE = EC.ID " + 
																"	WHERE  1 = 1  " + 
																"   AND TC.ID_CUMPLE = 2 "  +
																" 	AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-0, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' " +
																"	GROUP BY TC.ID_CUMPLE, EC.DESCRIPTION " + 
																"	ORDER BY TC.ID_CUMPLE ASC";
													//out.print("<br>");
													//out.println("SQLCumple2="+SQLCumple2);
													//out.print("<br>");
													psCumple2 = conn2.prepareStatement(SQLCumple2, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
													rsCumple2 = psCumple2.executeQuery();
													conn2.commit();
													int contarCumple2 = 0;
													while(rsCumple2.next()) {
														// start while Cumple
														contarCumple2 = contarCumple2 + 1;
												%>
														<script type="text/javascript">
														
															$(function(){
																$("#ocultar_cumplimiento2_<%=contarCumple2%>").click(function() {
																	<%
														        	SQLHideCumplimiento2 = "SELECT  TC.ID_CUMPLE_RESUMEN from cumplimiento_kpiweb TC WHERE  1 = 1 AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-0, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' AND TC.ID_CUMPLE = "+rsCumple2.getInt("ID_CUMPLE")+" GROUP BY TC.ID_CUMPLE_RESUMEN ORDER BY TC.ID_CUMPLE_RESUMEN ASC";
														        	psHideCumplimiento2 = conn2.prepareStatement(SQLHideCumplimiento2, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
								                                    rsHideCumplimiento2 = psHideCumplimiento2.executeQuery();
								                                    conn2.commit();
																	int contarHideCumplimiento2 = 0;
								                                    while(rsHideCumplimiento2.next()) {
																		contarHideCumplimiento2 = contarHideCumplimiento2 + 1;
								                                    %>
																		$("#cumplimiento2_<%=contarCumple2%>_<%=contarHideCumplimiento2%>").hide('slow', function() {});
																		<%
																		SQLHideCumpleResumen2 = "SELECT  TC.ID_CUMPLIMIENTO_2 from cumplimiento_kpiweb TC WHERE  1 = 1 AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-0, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' AND TC.ID_CUMPLE = "+rsCumple2.getInt("ID_CUMPLE")+" AND TC.ID_CUMPLE_RESUMEN = "+rsHideCumplimiento2.getInt("ID_CUMPLE_RESUMEN")+" GROUP BY TC.ID_CUMPLIMIENTO_2 ORDER BY TC.ID_CUMPLIMIENTO_2 ASC";
																		psHideCumpleResumen2 = conn2.prepareStatement(SQLHideCumpleResumen2, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
																		rsHideCumpleResumen2 = psHideCumpleResumen2.executeQuery();
																		conn2.commit();
																		int contarHideCumpleResumen2 = 0;
																		while(rsHideCumpleResumen2.next()) {
																			contarHideCumpleResumen2 = contarHideCumpleResumen2 + 1;
																		%>
																			$("#cumple_resumen2_<%=contarCumple2%>_<%=contarHideCumplimiento2%>_<%=contarHideCumpleResumen2%>").hide('slow', function() {});
																			
																			
																			<%
																			SQLHideResponsable2 = "SELECT  TC.ID_RESPONSABLE from cumplimiento_kpiweb TC WHERE  1 = 1 AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-0, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' AND TC.ID_CUMPLE = "+rsCumple2.getInt("ID_CUMPLE")+" AND TC.ID_CUMPLE_RESUMEN = "+rsHideCumplimiento2.getInt("ID_CUMPLE_RESUMEN")+" AND TC.ID_CUMPLIMIENTO_2 = "+rsHideCumpleResumen2.getInt("ID_CUMPLIMIENTO_2")+" GROUP BY TC.ID_RESPONSABLE ORDER BY TC.ID_RESPONSABLE ASC";
																			psHideResponsable2 = conn2.prepareStatement(SQLHideResponsable2, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
																			rsHideResponsable2 = psHideResponsable2.executeQuery();
																			conn2.commit();
																			int contarHideResponsable2 = 0;
																			while(rsHideResponsable2.next()) {
																				contarHideResponsable2 = contarHideResponsable2 + 1;
																			%>
																				$("#responsable2_<%=contarCumple2%>_<%=contarHideCumplimiento2%>_<%=contarHideCumpleResumen2%>_<%=contarHideResponsable2%>").hide('slow', function() {});
																			<%
																			}
																			%>
																			$("#mostrar_responsable2_<%=contarCumple2%>_<%=contarHideCumplimiento2%>_<%=contarHideCumpleResumen2%>").show('slow', function() {});//Mostrar responsable
																			
																		<%
																		}
																		%>
																		$("#mostrar_cumple_resumen2_<%=contarCumple2%>_<%=contarHideCumplimiento2%>").show('slow', function() {});//Mostrar cumple resumen
																	<%
																	}
																	%>
																	$("#mostrar_cumplimiento2_<%=contarCumple2%>").show('slow', function() {});
																	$("#ocultar_cumplimiento2_<%=contarCumple2%>").hide('slow', function() {});
																});
																
																$("#mostrar_cumplimiento2_<%=contarCumple2%>").click(function() {
																	<%
														        	SQLShowCumplimiento2 = "SELECT  TC.ID_CUMPLE_RESUMEN from cumplimiento_kpiweb TC WHERE  1 = 1 AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-0, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' AND TC.ID_CUMPLE = "+rsCumple2.getInt("ID_CUMPLE")+" GROUP BY TC.ID_CUMPLE_RESUMEN ORDER BY TC.ID_CUMPLE_RESUMEN ASC";
														        	psShowCumplimiento2 = conn2.prepareStatement(SQLShowCumplimiento2, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
								                                    rsShowCumplimiento2 = psShowCumplimiento2.executeQuery();
								                                    conn2.commit();
																	int contarShowCumplimiento2 = 0;
								                                    while(rsShowCumplimiento2.next()) {
																		contarShowCumplimiento2 = contarShowCumplimiento2 + 1;
								                                    %>
																		$("#cumplimiento2_<%=contarCumple2%>_<%=contarShowCumplimiento2%>").show('slow', function() {});
																		$("#ocultar_cumple_resumen2_<%=contarCumple2%>_<%=contarShowCumplimiento2%>").hide('slow', function() {});//Mostrar cumple resumen
																		<%
																		SQLShowCumpleResumen2 = "SELECT  TC.ID_CUMPLIMIENTO_2 from cumplimiento_kpiweb TC WHERE  1 = 1 AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-0, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' AND TC.ID_CUMPLE = "+rsCumple2.getInt("ID_CUMPLE")+" AND TC.ID_CUMPLE_RESUMEN = "+rsShowCumplimiento2.getInt("ID_CUMPLE_RESUMEN")+"  GROUP BY TC.ID_CUMPLIMIENTO_2 ORDER BY TC.ID_CUMPLIMIENTO_2 ASC";
																		psShowCumpleResumen2 = conn2.prepareStatement(SQLShowCumpleResumen2, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
																		rsShowCumpleResumen2 = psShowCumpleResumen2.executeQuery();
																		conn2.commit();
																		int contarShowCumpleResumen2 = 0;
																		while(rsShowCumpleResumen2.next()) {
																			contarShowCumpleResumen2 = contarShowCumpleResumen2 + 1;
																		%>
																			$("#ocultar_responsable2_<%=contarCumple2%>_<%=contarShowCumplimiento2%>_<%=contarShowCumpleResumen2%>").hide('slow', function() {});////
																		<%
																		}
																		%>
																	<%
																	}
																	%>
																	$("#ocultar_cumplimiento2_<%=contarCumple2%>").show('slow', function() {});
																	$("#mostrar_cumplimiento2_<%=contarCumple2%>").hide('slow', function() {});
																});
															});
														</script>
														<!--  
														<tr style="background-color:#3b5998;color:#FFF; " >
															<td><button class="btn btn-block btn-default btn-lg" id="ocultar_cumplimiento2_<%=contarCumple2%>" style="display:none;margin-top: 0px;"><i class="fa fa-minus" aria-hidden="true"></i></button><button class="btn btn-block btn-default btn-lg" id="mostrar_cumplimiento2_<%=contarCumple2%>" style="margin-top: 0px;"><i class="fa fa-plus" aria-hidden="true"></i></button></td>
															<td align="left" nowrap="nowrap" ><i class="icon-reorder"></i>&nbsp;<%=rsCumple2.getString("CUMPLE")%> </td>
															
															
															<%
															SQLShowFecha2 = 	"	SELECT " + 
																			"		TC.FECHA_COMPROMISO_EOM" + 
																			
																			" 		,(SUM(CASE WHEN (TC.ID_CUMPLE = "+rsCumple2.getInt("ID_CUMPLE")+" "+""+") THEN 1 ELSE 0 END) ) AS CANTIDAD " +		
																			" 		,SUM(CASE WHEN (TC.ID_CUMPLE = 1 OR TC.ID_CUMPLE = 2 OR TC.ID_CUMPLE = 3) THEN 1 ELSE 0 END) as TOTAL " +
																			"	from cumplimiento_kpiweb TC " +
																			"	WHERE 1 = 1 " + 
																			" " + prefixclause +
																			"	AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-0, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"'  " + 
																			"	GROUP BY TC.FECHA_COMPROMISO_EOM " +
																			"	ORDER BY TC.FECHA_COMPROMISO_EOM ASC";
															
															//out.print("<br>");
															//out.println("SQLShowFechaCumple2="+SQLShowFecha2);
															//out.print("<br>");
														    psShowFecha2 = conn2.prepareStatement(SQLShowFecha2, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
								                            rsShowFecha2 = psShowFecha2.executeQuery();
								                            conn2.commit();
								                            int contarShowFechaCumple2 = 0;
															int totalCantidadCumple2 = 0;
															int totalProcentajeCumple2 = 0;
								                            while(rsShowFecha2.next()) {
								                            	contarShowFechaCumple2 = contarShowFechaCumple2 + 1;
																totalCantidadCumple2 = totalCantidadCumple2 + rsShowFecha2.getInt("CANTIDAD") ;
																
								                            %>		
															<td>
																<table>
																	<tr>
																		<td>
																			<table>
																				<tr>
																					<td  style="color:#FFF;font-size:15px" align="left" WIDTH="50" nowrap="nowrap">
																					<%
																					 DecimalFormat formatea = new DecimalFormat("###,###.##");
																					 out.println(formatea.format(rsShowFecha2.getInt("CANTIDAD")));
																					 %>
																					</td>
																					<td  style="color:#FFF;font-size:15px" align="left" WIDTH="50" nowrap="nowrap">
																					<%
																					
																					
																					if (rsShowFecha2.getInt("CANTIDAD") > 0 ) {
																						out.println( StringUtils.Redondear( String.valueOf( Float.parseFloat( (String.valueOf(((float ) ( (float ) rsShowFecha2.getInt("CANTIDAD") / (float ) rsShowFecha2.getInt("TOTAL")  ) * 100)))  ) ),2)+"%");
																					} else {
																						out.println( "-");																
																					}
																					
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
															
														</tr>
														-->
													
														<%
														// Segunda Fila Cumplimiento
														
														SQLCumplimiento2 = 	"	SELECT  " +
																			"		TC.ID_CUMPLE_RESUMEN, ECR.DESCRIPTION AS CUMPLE_RESUMEN " +
																			"	from cumplimiento_kpiweb TC " + 
																			"	LEFT JOIN  estado_cumple_resumen ECR ON TC.ID_CUMPLE_RESUMEN =  ECR.ID " +
																			"	WHERE  1 = 1 " +
																			"	AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-0, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' " + 
																			"	AND TC.ID_CUMPLE = "+rsCumple2.getInt("ID_CUMPLE")+" " + 
																			"	GROUP BY TC.ID_CUMPLE_RESUMEN, ECR.DESCRIPTION " + 
																			"	ORDER BY TC.ID_CUMPLE_RESUMEN ASC";
														//out.print("<br>");
														//out.println("SQLCumplimiento2="+SQLCumplimiento2);
														//out.print("<br>");
														psCumplimiento2 = conn2.prepareStatement(SQLCumplimiento2, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
														rsCumplimiento2 = psCumplimiento2.executeQuery();
														conn2.commit();
														int contarCumplimiento2 = 0;
														while(rsCumplimiento2.next()) {
															// start while Cumplimiento
															contarCumplimiento2 = contarCumplimiento2 + 1;
														%>
												
															<script type="text/javascript">
																$(function(){
																	$("#ocultar_cumple_resumen2_<%=contarCumple2%>_<%=contarCumplimiento2%>").click(function() {
																		<%
																		SQLHideCumpleResumen2 = "SELECT  TC.ID_CUMPLIMIENTO_2 from cumplimiento_kpiweb TC WHERE  1 = 1 AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-0, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' AND TC.ID_CUMPLE = "+rsCumple2.getInt("ID_CUMPLE")+" AND TC.ID_CUMPLE_RESUMEN = "+rsCumplimiento2.getInt("ID_CUMPLE_RESUMEN")+" GROUP BY TC.ID_CUMPLIMIENTO_2 ORDER BY TC.ID_CUMPLIMIENTO_2 ASC";
																		psHideCumpleResumen2 = conn2.prepareStatement(SQLHideCumpleResumen2, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
																		rsHideCumpleResumen2 = psHideCumpleResumen2.executeQuery();
																		conn2.commit();
																		int contarHideCumpleResumen2 = 0;
																		while(rsHideCumpleResumen2.next()) {
																			contarHideCumpleResumen2 = contarHideCumpleResumen2 + 1;
																		%>
																			$("#cumple_resumen2_<%=contarCumple2%>_<%=contarCumplimiento2%>_<%=contarHideCumpleResumen2%>").hide('slow', function() {});
																			<%
																			SQLHideResponsable2 = "SELECT  TC.ID_RESPONSABLE from cumplimiento_kpiweb TC WHERE  1 = 1 AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-0, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' AND TC.ID_CUMPLE = "+rsCumple2.getInt("ID_CUMPLE")+"  AND TC.ID_CUMPLE_RESUMEN = "+rsCumplimiento2.getInt("ID_CUMPLE_RESUMEN")+" AND TC.ID_CUMPLIMIENTO_2 = "+rsHideCumpleResumen2.getInt("ID_CUMPLIMIENTO_2")+" GROUP BY TC.ID_RESPONSABLE ORDER BY TC.ID_RESPONSABLE ASC";
																			psHideResponsable2 = conn2.prepareStatement(SQLHideResponsable2, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
																			rsHideResponsable2 = psHideResponsable2.executeQuery();
																			conn2.commit();
																			int contarHideResponsable2 = 0;
																			while(rsHideResponsable2.next()) {
																				contarHideResponsable2 = contarHideResponsable2 + 1;
																			%>
																		
																			$("#responsable2_<%=contarCumple2%>_<%=contarCumplimiento2%>_<%=contarHideCumpleResumen2%>_<%=contarHideResponsable2%>").hide('slow', function() {});
																			<%
																			}
																			%>
																			$("#mostrar_responsable2_<%=contarCumple2%>_<%=contarCumplimiento2%>_<%=contarHideCumpleResumen2%>").show('slow', function() {});////
																		<%
																		}
																		%>
																		$("#ocultar_cumple_resumen2_<%=contarCumple2%>_<%=contarCumplimiento2%>").hide('slow', function() {});
																		$("#mostrar_cumple_resumen2_<%=contarCumple2%>_<%=contarCumplimiento2%>").show('slow', function() {});
																	});
																	$("#mostrar_cumple_resumen2_<%=contarCumple2%>_<%=contarCumplimiento2%>").click(function() {
																		<%
																		SQLShowCumpleResumen2 = "SELECT  TC.ID_CUMPLIMIENTO_2 from cumplimiento_kpiweb TC WHERE  1 = 1 AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-0, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' AND TC.ID_CUMPLE = "+rsCumple2.getInt("ID_CUMPLE")+" AND TC.ID_CUMPLE_RESUMEN = "+rsCumplimiento2.getInt("ID_CUMPLE_RESUMEN")+" GROUP BY TC.ID_CUMPLIMIENTO_2 ORDER BY TC.ID_CUMPLIMIENTO_2 ASC";
																		psShowCumpleResumen2 = conn2.prepareStatement(SQLShowCumpleResumen2, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
																		rsShowCumpleResumen2 = psShowCumpleResumen2.executeQuery();
																		conn2.commit();
																		int contarShowCumpleResumen2 = 0;
																		while(rsShowCumpleResumen2.next()) {
																			contarShowCumpleResumen2 = contarShowCumpleResumen2 + 1;
																		%>
																			$("#cumple_resumen2_<%=contarCumple2%>_<%=contarCumplimiento2%>_<%=contarShowCumpleResumen2%>").show('slow', function() {});
																			$("#ocultar_responsable2_<%=contarCumple2%>_<%=contarCumplimiento2%>_<%=contarShowCumpleResumen2%>").hide('slow', function() {});
																		<%
																		}
																		%>
																		$("#ocultar_cumple_resumen2_<%=contarCumple2%>_<%=contarCumplimiento2%>").show('slow', function() {});
																		$("#mostrar_cumple_resumen2_<%=contarCumple2%>_<%=contarCumplimiento2%>").hide('slow', function() {});
																	});	
																});
															</script>
															<!--  
															<tr id="cumplimiento2_<%=contarCumple2%>_<%=contarCumplimiento2%>" style="background-color:#007bb6;color:#FFF;" >
																<td><button class="btn btn-block btn-default btn-lg" id="ocultar_cumple_resumen2_<%=contarCumple2%>_<%=contarCumplimiento2%>" style="display:none;margin-top: 0px;"><i class="fa fa-minus" aria-hidden="true"></i></button><button class="btn btn-block btn-default btn-lg" id="mostrar_cumple_resumen2_<%=contarCumple2%>_<%=contarCumplimiento2%>" style="margin-top: 0px;"/><i class="fa fa-plus" aria-hidden="true"></i></td>
																<td align="left" nowrap="nowrap"><i class="icon-reorder"></i>&nbsp;<%=rsCumplimiento2.getString("CUMPLE_RESUMEN")%></td>	 
						
																
						
																<%
																SQLShowFecha2 = 	"	SELECT " + 
																				"		TC.FECHA_COMPROMISO_EOM AS  FECHA_COMPROMISO_EOM" +
																				"		,(SUM(CASE WHEN (TC.ID_CUMPLE = "+rsCumple2.getInt("ID_CUMPLE")+" AND TC.ID_CUMPLE_RESUMEN = "+rsCumplimiento2.getInt("ID_CUMPLE_RESUMEN")+" "+""+") THEN 1 ELSE 0 END) ) AS CANTIDAD " +
																				" 		,SUM(CASE WHEN (TC.ID_CUMPLE = 1 OR TC.ID_CUMPLE = 2 OR TC.ID_CUMPLE = 3) THEN 1 ELSE 0 END) as TOTAL " +
																				
																				"	from cumplimiento_kpiweb TC " +
																				"	WHERE 1 = 1 " +
																				" " + prefixclause +														
																				"	AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-0, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' " +
																				"	GROUP BY TC.FECHA_COMPROMISO_EOM " + 
																				"	ORDER BY TC.FECHA_COMPROMISO_EOM ASC";
																//out.print("<br>");
																//out.print("SQLShowFechaCumplimiento = "+SQLShowFecha);
																//out.print("<br>");
																psShowFecha2 = conn2.prepareStatement(SQLShowFecha2, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
																rsShowFecha2 = psShowFecha2.executeQuery();
																conn2.commit();
																int contarShowFechaCumplimiento2 = 0;
																int totalCantidadCumplimiento2 = 0;
																int totalProcentajeCumplimiento2 = 0;
																while(rsShowFecha2.next()) {
																	contarShowFechaCumplimiento2 = contarShowFechaCumplimiento2 + 1;
																	totalCantidadCumplimiento2 = totalCantidadCumplimiento2 + rsShowFecha2.getInt("CANTIDAD") ;
																%>						
																<td>
																	<table>
																		<tr>
																			<td>
																				<table>
																					<tr>
																						<td style="font-size:15px" align="left" width="50" nowrap="nowrap">
																						<%
																						 DecimalFormat formatea = new DecimalFormat("###,###.##");
																						 out.println(formatea.format(rsShowFecha2.getInt("CANTIDAD")));
																						 %>
																						</td>
																						<td style="font-size:15px" align="left" WIDTH="50" nowrap="nowrap">
																						<%
																						if (rsShowFecha2.getInt("CANTIDAD") > 0 ) {
																							out.println( StringUtils.Redondear( String.valueOf( Float.parseFloat( (String.valueOf(((float ) ( (float ) rsShowFecha2.getInt("CANTIDAD") / (float ) rsShowFecha2.getInt("TOTAL")  ) * 100)))  ) ),2)+"%");
																						} else {
																							out.println( "-");																
																						}
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
																
															</tr>
															-->
															<%
															// Tercera Fila CumpleResumen
															SQLCumpleResumen2 = 	"	SELECT  " + 
																				"		TC.ID_CUMPLIMIENTO_2, EC.DESCRIPTION AS CUMPLIMIENTO_2" + 
																				"	from cumplimiento_kpiweb TC " +
																				"	LEFT JOIN  estado_cumplimiento EC ON TC.ID_CUMPLIMIENTO_2 =  EC.ID " +
																				"	WHERE  1 = 1 " + 
																				"	AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-0, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' " + 
																				"	AND TC.ID_CUMPLE = "+rsCumple2.getInt("ID_CUMPLE")+" " +
																				"	AND TC.ID_CUMPLE_RESUMEN = "+rsCumplimiento2.getInt("ID_CUMPLE_RESUMEN")+"  " + 
																				"	GROUP BY TC.ID_CUMPLIMIENTO_2, EC.DESCRIPTION " +
																				"	ORDER BY TC.ID_CUMPLIMIENTO_2 ASC";
															//out.print("<br>");
															//out.println("SQLCumpleResumen="+SQLCumpleResumen);
															//out.print("<br>");
															psCumpleResumen2 = conn2.prepareStatement(SQLCumpleResumen2, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
															rsCumpleResumen2 = psCumpleResumen2.executeQuery();
															conn2.commit();
															int contarCumpleResumen2 = 0;
															while(rsCumpleResumen2.next()) {
																contarCumpleResumen2 = contarCumpleResumen2 + 1;
															%>
																<script type="text/javascript">
																	$(function(){
																		$("#ocultar_responsable2_<%=contarCumple2%>_<%=contarCumplimiento2%>_<%=contarCumpleResumen2%>").click(function() {
																			<%
																			SQLHideResponsable2 = "SELECT  TC.ID_RESPONSABLE from cumplimiento_kpiweb TC WHERE  1 = 1  AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-0, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' AND TC.ID_CUMPLE = "+rsCumple2.getInt("ID_CUMPLE")+" AND TC.ID_CUMPLE_RESUMEN = "+rsCumplimiento2.getInt("ID_CUMPLE_RESUMEN")+" AND TC.ID_CUMPLIMIENTO_2 = "+rsCumpleResumen2.getInt("ID_CUMPLIMIENTO_2")+" GROUP BY TC.ID_RESPONSABLE ORDER BY TC.ID_RESPONSABLE ASC";
																			psHideResponsable2 = conn2.prepareStatement(SQLHideResponsable2, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
																			rsHideResponsable2 = psHideResponsable2.executeQuery();
																			conn2.commit();
																			int contarHideResponsable2 = 0;
																			while(rsHideResponsable2.next()) {
																				contarHideResponsable2 = contarHideResponsable2 + 1;
																			%>
																				$("#responsable2_<%=contarCumple2%>_<%=contarCumplimiento2%>_<%=contarCumpleResumen2%>_<%=contarHideResponsable2%>").hide('slow', function() {});
																			<%
																			}
																			%>
																			$("#mostrar_responsable2_<%=contarCumple2%>_<%=contarCumplimiento2%>_<%=contarCumpleResumen2%>").show('slow', function() {});
																			$("#ocultar_responsable2_<%=contarCumple2%>_<%=contarCumplimiento2%>_<%=contarCumpleResumen2%>").hide('slow', function() {});
																		});
																		$("#mostrar_responsable2_<%=contarCumple2%>_<%=contarCumplimiento2%>_<%=contarCumpleResumen2%>").click(function() {
																			<%
																			SQLShowResponsable2 = "SELECT  TC.ID_RESPONSABLE from cumplimiento_kpiweb TC WHERE  1 = 1  AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-0, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' AND TC.ID_CUMPLE = "+rsCumple2.getInt("ID_CUMPLE")+" AND TC.ID_CUMPLE_RESUMEN = "+rsCumplimiento2.getInt("ID_CUMPLE_RESUMEN")+" AND TC.ID_CUMPLIMIENTO_2 = "+rsCumpleResumen2.getInt("ID_CUMPLIMIENTO_2")+"  GROUP BY TC.ID_RESPONSABLE ORDER BY TC.ID_RESPONSABLE ASC";
																			psShowResponsable2 = conn2.prepareStatement(SQLShowResponsable2, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
																			rsShowResponsable2 = psShowResponsable2.executeQuery();
																			conn2.commit();
																			int contarShowResponsable2 = 0;
																			while(rsShowResponsable2.next()) {
																				contarShowResponsable2 = contarShowResponsable2 + 1;
																			%>
																				$("#responsable2_<%=contarCumple2%>_<%=contarCumplimiento2%>_<%=contarCumpleResumen2%>_<%=contarShowResponsable2%>").show('slow', function() {});
																			<%
																			}
																			%>
																			$("#ocultar_responsable2_<%=contarCumple2%>_<%=contarCumplimiento2%>_<%=contarCumpleResumen2%>").show('slow', function() {});
																			$("#mostrar_responsable2_<%=contarCumple2%>_<%=contarCumplimiento2%>_<%=contarCumpleResumen2%>").hide('slow', function() {});
																		});	
																	});
																</script>
																<tr id="cumple_resumen2_<%=contarCumple2%>_<%=contarCumplimiento2%>_<%=contarCumpleResumen2%>"  style="background-color:#55acee;color:#FFF;">
																	<td><button class="btn btn-block btn-default btn-lg" id="ocultar_responsable2_<%=contarCumple2%>_<%=contarCumplimiento2%>_<%=contarCumpleResumen2%>" style="display:none;margin-top: 0px;"><i class="fa fa-minus" aria-hidden="true"></i></button><button class="btn btn-block btn-default btn-lg" id="mostrar_responsable2_<%=contarCumple2%>_<%=contarCumplimiento2%>_<%=contarCumpleResumen2%>" style=" margin-top: 0px;"/><i class="fa fa-plus" aria-hidden="true"></i></td>
																	
																	<td align="left" nowrap="nowrap"><i class="icon-reorder"></i>&nbsp;<%=rsCumpleResumen2.getString("CUMPLIMIENTO_2")%></td>
						
						
																	<%
																	SQLShowFecha2 = 	"	SELECT  " +
																					"		TC.FECHA_COMPROMISO_EOM " +
																					" 		,(SUM(CASE WHEN (TC.ID_CUMPLE = "+rsCumple2.getInt("ID_CUMPLE")+" AND TC.ID_CUMPLE_RESUMEN = "+rsCumplimiento2.getInt("ID_CUMPLE_RESUMEN")+" AND TC.ID_CUMPLIMIENTO_2 = "+rsCumpleResumen2.getInt("ID_CUMPLIMIENTO_2")+" "+""+") THEN 1 ELSE 0 END) ) AS CANTIDAD " + 
																					" 		,SUM(CASE WHEN (TC.ID_CUMPLE = 1 OR TC.ID_CUMPLE = 2 OR TC.ID_CUMPLE = 3) THEN 1 ELSE 0 END) as TOTAL " +
						
																					"	from cumplimiento_kpiweb TC " +
																					"	WHERE 1 = 1 " + 
																					" " + prefixclause +	
																					"	AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-0, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' " +
																					"	GROUP BY TC.FECHA_COMPROMISO_EOM " + 
																					"	ORDER BY TC.FECHA_COMPROMISO_EOM ASC";
																	//out.print("<br>");
																	//out.print("SQLShowFechaCumpleResumen = "+SQLShowFecha);
																	//out.print("<br>");
																	psShowFecha2 = conn2.prepareStatement(SQLShowFecha2, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
																	rsShowFecha2 = psShowFecha2.executeQuery();
																	conn2.commit();
																	int contarShowFechaCumpleResumen2 = 0;
																	int totalCantidadCumpleResumen2 = 0;
																	int totalProcentajeCumpleResumen2 = 0;
																	while(rsShowFecha2.next()) {
																		contarShowFechaCumpleResumen2 = contarShowFechaCumpleResumen2 + 1;
																		totalCantidadCumpleResumen2 = totalCantidadCumpleResumen2 + rsShowFecha2.getInt("CANTIDAD") ;
																	%>	
																		<td>
																			<table>
																				<tr>
																					<td>
																						<table>
																							<tr>
																								<td style="font-size:15px" align="left" WIDTH="50" nowrap="nowrap">
																								<%
																								 DecimalFormat formatea = new DecimalFormat("###,###.##");
																								 out.println(formatea.format(rsShowFecha2.getInt("CANTIDAD")));
																								 %>
																								</td>
																								<td style="font-size:15px" align="left" WIDTH="50" nowrap="nowrap">
																								<%
																								if (rsShowFecha2.getInt("CANTIDAD") > 0 ) {
																									out.println( StringUtils.Redondear( String.valueOf( Float.parseFloat( (String.valueOf(((float ) ( (float ) rsShowFecha2.getInt("CANTIDAD") / (float ) rsShowFecha2.getInt("TOTAL")  ) * 100)))  ) ),2)+"%");
																								} else {
																									out.println( "-");																
																								}
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
																	
																</tr>
																<%
																// Cuarta Fila Responsable
																SQLResponsable2 = 	"	SELECT " + 
																					"		TC.ID_RESPONSABLE, ER.DESCRIPTION AS RESPONSABLE  " +
																					"	from cumplimiento_kpiweb TC " + 
																					"	LEFT JOIN  estado_responsable ER ON TC.ID_RESPONSABLE =  ER.ID " +
																					"	WHERE  1 = 1 " + 
																					"	AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-0, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' " +
																					"	AND TC.ID_CUMPLE = "+rsCumple2.getInt("ID_CUMPLE")+" " +
																					"	AND TC.ID_CUMPLE_RESUMEN = "+rsCumplimiento2.getInt("ID_CUMPLE_RESUMEN")+" " +
																					"	AND TC.ID_CUMPLIMIENTO_2 = "+rsCumpleResumen2.getInt("ID_CUMPLIMIENTO_2")+" " + 
																					"	GROUP BY TC.ID_RESPONSABLE, ER.DESCRIPTION " + 
																					"	ORDER BY TC.ID_RESPONSABLE ASC";
																//out.print("<br>");
																//out.println("SQLResponsable="+SQLResponsable);
																//out.print("<br>");
																psResponsable2 = conn2.prepareStatement(SQLResponsable2, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
																rsResponsable2 = psResponsable2.executeQuery();
																conn2.commit();
																int contarResponsable2 = 0;
																while(rsResponsable2.next()) {
																	// start while Responsable
																	contarResponsable2 = contarResponsable2 + 1;
																	//out.print("contarResponsable = "+contarResponsable);
																	//out.print("<br>");
																	
																%>
																	<tr id="responsable2_<%=contarCumple2%>_<%=contarCumplimiento2%>_<%=contarCumpleResumen2%>_<%=contarResponsable2%>" style="display:none">
																		<td>
																			<button class="btn btn-block btn-default btn-lg disabled"  style="margin-top: 0px;">-</button>
																		</td>
																		<td align="left" style="background-color:#FFF;color:#000000" nowrap="nowrap"><i class="icon-reorder"></i>&nbsp;<%=rsResponsable2.getString("RESPONSABLE")%></td>
						
																		
																		<%
																		SQLShowFecha2 =	"	SELECT  " +
																						"		TC.FECHA_COMPROMISO_EOM " +
																						//" 		,(SUM(CASE WHEN (TC.ID_CUMPLE = "+rsCumple.getInt("ID_CUMPLE")+" AND TC.ID_CUMPLIMIENTO_2 = "+rsCumpleResumen.getInt("ID_CUMPLIMIENTO_2")+" AND TC.ID_RESPONSABLE = "+rsResponsable.getInt("ID_RESPONSABLE")+" "+prefixclause+") THEN 1 ELSE 0 END) ) AS CANTIDAD " + 
																						" 		,(SUM(CASE WHEN (TC.ID_CUMPLE = "+rsCumple2.getInt("ID_CUMPLE")+" AND TC.ID_CUMPLE_RESUMEN = "+rsCumplimiento2.getInt("ID_CUMPLE_RESUMEN")+" AND TC.ID_CUMPLIMIENTO_2 = "+rsCumpleResumen2.getInt("ID_CUMPLIMIENTO_2")+" AND TC.ID_RESPONSABLE = "+rsResponsable2.getInt("ID_RESPONSABLE")+" "+""+") THEN 1 ELSE 0 END) ) AS CANTIDAD " + 
																						" 		,SUM(CASE WHEN (TC.ID_CUMPLE = 1 OR TC.ID_CUMPLE = 2 OR TC.ID_CUMPLE = 3) THEN 1 ELSE 0 END) as TOTAL " +
																						
																						"	from cumplimiento_kpiweb TC " + 
						 																"	WHERE 1 = 1 " + 
						 																" " + prefixclause +	
						 																"	AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-0, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' " +
																						"	GROUP BY TC.FECHA_COMPROMISO_EOM " +
																						"	ORDER BY TC.FECHA_COMPROMISO_EOM ASC";
																		//out.print("<br>");
																		//out.print("SQLShowFechaResponsable = "+SQLShowFecha);
																		//out.print("<br>");
																		psShowFecha2 = conn2.prepareStatement(SQLShowFecha2, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
																		rsShowFecha2 = psShowFecha2.executeQuery();
																		conn2.commit();
																		int contarShowFechaResponsable2 = 0;
																		int totalCantidadResponsable2 = 0;
																		int totalProcentajeResponsable2 = 0;
																		while(rsShowFecha2.next()) {
																			contarShowFechaResponsable2 = contarShowFechaResponsable2 + 1;
																			totalCantidadResponsable2 = totalCantidadResponsable2 + rsShowFecha2.getInt("CANTIDAD") ;
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
																								 out.println(formatea.format(rsShowFecha2.getInt("CANTIDAD")));
																					 			%>
																								</td>
																								<td style="font-size:13px" align="left" WIDTH="50" nowrap="nowrap">
																								<%
																								if (rsShowFecha2.getInt("CANTIDAD") > 0 ) {
																									out.println( StringUtils.Redondear( String.valueOf( Float.parseFloat( (String.valueOf(((float ) ( (float ) rsShowFecha2.getInt("CANTIDAD") / (float ) rsShowFecha2.getInt("TOTAL")  ) * 100)))  ) ),2)+"%");
																								} else {
																									out.println( "-");																
																								}
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
																		
																	</tr>
																<%
																}	// end while Resumenee
															} //end while CumpleResumen 
														} // end while Cumplimiento
													}  // end while Cumple
												} catch (SQLException exQL) {
													conn2.rollback();
													out.println("Error SQL: " + exQL.getMessage());	
												} catch (Exception ex) {
													conn2.rollback();
													out.println("Error: " + ex.getMessage());
												} finally {
													if (rsCumple2 != null) rsCumple2.close();
													if (rsCumplimiento2 != null) rsCumplimiento2.close();
													if (rsCumpleResumen2 != null) rsCumpleResumen2.close();
													if (rsResponsable2 != null) rsResponsable2.close();
													
													if (psCumple2 != null) psCumple2.close();
													if (psCumplimiento2 != null) psCumplimiento2.close();
													if (psCumpleResumen2 != null) psCumpleResumen2.close();
													if (psResponsable2 != null) psResponsable2.close();
													
													if (rsHideCumple2 != null) rsHideCumple2.close();
													if (rsHideCumplimiento2 != null) rsHideCumplimiento2.close();
													if (rsHideCumpleResumen2 != null) rsHideCumpleResumen2.close();
													if (rsHideResponsable2 != null) rsHideResponsable2.close();
													if (rsShowCumple2 != null) rsShowCumple2.close();
													if (rsShowCumplimiento2 != null) rsShowCumplimiento2.close();
													if (rsShowCumpleResumen2 != null) rsShowCumpleResumen2.close();
													if (rsShowResponsable2 != null) rsShowResponsable2.close();
													
													if (psHideCumple2 != null) psHideCumple2.close();
													if (psHideCumplimiento2 != null) psHideCumplimiento2.close();
													if (psHideCumpleResumen2 != null) psHideCumpleResumen2.close();
													if (psHideResponsable2 != null) psHideResponsable2.close();
													if (psShowCumple2 != null) psShowCumple2.close();
													if (psShowCumplimiento2 != null) psShowCumplimiento2.close();
													if (psShowCumpleResumen2 != null) psShowCumpleResumen2.close();
													if (psShowResponsable2 != null) psShowResponsable2.close();
													
													if (psShowFecha2 != null) psShowFecha2.close();
													if (rsShowFecha2 != null) rsShowFecha2.close();
						
													if (conn2 != null) conn2.close();
												} 
												%>
											</table>
									            </div>
									            <!-- /.box-body -->
									
									                
									              </div>
									              <div class="modal-footer">
									                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Cerrar</button>
									              </div>
									            </div>
									            <!-- /.modal-content -->
									          </div>
									          <!-- /.modal-dialog -->
									        </div>
									        <!-- /.modal -->
								            
								           
										  </div>
										  <!-- /.description-block -->
										</div>
								  	</div>
			
								  	<div class="box-header with-border"></div>
			
								  	
								  	<!-- /.row -->
								  	<div class="row">
										<div class="col-sm-12 col-xs-12">
										  <div class="description-block">
										  	<span class="description-percentage text-blue">
										  	<i class="fa fa-caret-right"> 
										  	<span style="font-size:15px">
										        <c:choose>
													  <c:when test="${ cantNoCumple > 0}">
													  	<fmt:formatNumber pattern="#,###,#00" value="${ cantNoCumple }"  type="number"/>
													  </c:when>
													  <c:otherwise>
													  0
													  </c:otherwise>
												  </c:choose> 
										    </span>
										  	</i> 
											</span>
											
											<h5 class="description-header" style="font-size:40px">
											<span>
			
												<c:choose>
													  <c:when test="${ porcentajeNoCumple == '0.00'}">
													  	  0
													  </c:when>
													  <c:otherwise>
													  ${ porcentajeNoCumple } %
													  </c:otherwise>
												  </c:choose> 
										    </span>
											</h5>
											<span class="description-text" style="font-size:20px">3.- NO CUMPLE</span>
											</br>
											 <div class="box-body">
								              <c:choose>
												<c:when test="${ cantNoCumple > 0}">
													<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#modal-default3">
								                	Mostrar No Cumple
								              		</button>
												</c:when>
												<c:otherwise>
													<button type="button" class="btn btn-info btn-lg" data-toggle="" data-target="">
									                No Hay Datos
									              </button>
												</c:otherwise>
											</c:choose>
								            </div>
								            
								            
								            <div class="modal fade" id="modal-default3">
									          <div class="modal-dialog">
									            <div class="modal-content">
									              <div class="modal-header">
									                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
									                  <span aria-hidden="true">&times;</span></button>
									                <h4 class="modal-title">Informacion No Cumple</h4>
									              </div>
									              <div class="modal-body">
									                <p>Detalle</p>
													<!-- /.box-header -->
									            <div class="box-body table-responsive">
									               <table id="dataTables-example"  width="100%"  border="0" cellspacing="0" cellpadding="0" style="font-size:15px">
												<tr bgcolor="#23527c" style="text-align:left; color:#FFF; font-size:15px; border: solid 1px #a6a6a6;">
													<td></td>
													<td>ESTADO</td>
													<%
													for(int c3=0;c3<1;c3++) {
						
													%>
													<th>
														<%=""%>&nbsp;
														<table>
															<tr>
																<td>
																	<table>
																		<tr>
																			<td style="color:#FFF;font-size:15px" align="left" WIDTH="50">Q</td>
																			<td style="color:#FFF;font-size:15px" align="left" WIDTH="50">%</td>
																		</tr>
																	</table>
																</td>
															</tr>
														</table>
													</th>
													<%
													}
													%>
												</tr>
												
												<%
												Connection conn3 = null;
												
												PreparedStatement psCumple3 = null;
												ResultSet rsCumple3 = null;
												String SQLCumple3 = null;
												
												PreparedStatement psCumplimiento3 = null;
												ResultSet rsCumplimiento3 = null;
												String SQLCumplimiento3 = null;
												
												PreparedStatement psCumpleResumen3 = null;
												ResultSet rsCumpleResumen3 = null;
												String SQLCumpleResumen3 = null;
												
												PreparedStatement psResponsable3 = null;
												ResultSet rsResponsable3 = null;
												String SQLResponsable3 = null;
												
												//Ocultar
												PreparedStatement psHideCumple3 = null;
												ResultSet rsHideCumple3 = null;
												String SQLHideCumple3 = null;
						
												PreparedStatement psHideCumplimiento3 = null;
												ResultSet rsHideCumplimiento3 = null;
												String SQLHideCumplimiento3 = null;
												
												PreparedStatement psHideCumpleResumen3 = null;
												ResultSet rsHideCumpleResumen3 = null;
												String SQLHideCumpleResumen3 = null;
						
												PreparedStatement psHideResponsable3 = null;
												ResultSet rsHideResponsable3 = null;
												String SQLHideResponsable3 = null;
						
												
												//Mostrar			
												PreparedStatement psShowCumple3 = null;
												ResultSet rsShowCumple3 = null;
												String SQLShowCumple3 = null;
																			
												PreparedStatement psShowCumplimiento3= null;
												ResultSet rsShowCumplimiento3 = null;
												String SQLShowCumplimiento3 = null;
							
												PreparedStatement psShowCumpleResumen3 = null;
												ResultSet rsShowCumpleResumen3 = null;
												String SQLShowCumpleResumen3 = null;
							
												PreparedStatement psShowResponsable3 = null;
												ResultSet rsShowResponsable3 = null;
												String SQLShowResponsable3 = null;
												
												//
												PreparedStatement psShowFechaCumple3 = null;
												ResultSet rsShowFechaCumple3 = null;
												String SQLShowFechaCumple3 = null;
												
												PreparedStatement psShowFechaCumplimiento3 = null;
												ResultSet rsShowFechaCumplimiento3 = null;
												String SQLShowFechaCumplimiento3 = null;
												
												PreparedStatement psShowFechaCumpleResumen3 = null;
												ResultSet rsShowFechaCumpleResumen3 = null;
												String SQLShowFechaCumpleResumen3 = null;
												
												PreparedStatement psShowFechaResponsable3 = null;
												ResultSet rsShowFechaResponsable3 = null;
												String SQLShowFechaResponsable3 = null;
												
												PreparedStatement psShowFecha3 = null;
												ResultSet rsShowFecha3 = null;
												String SQLShowFecha3 = null;
												
												//Primera Fila Cumple
												
												try{
													Class.forName("oracle.jdbc.OracleDriver").newInstance();
													conn3 = DriverManager.getConnection("jdbc:oracle:thin:@172.18.163.15:1521/XE","kpiweb","kpiweb");//
													
													//Class.forName("com.mysql.jdbc.Driver").newInstance();
													//conn3 = DriverManager.getConnection("jdbc:mysql://txddb.cqjxibnc2qub.us-west-2.rds.amazonaws.com/trazabilidad","adminuser","s4cc2ss943");//
													
													
													conn3.setAutoCommit(false);
													SQLCumple3 = "	SELECT  " +
																"		TC.ID_CUMPLE, EC.DESCRIPTION AS CUMPLE " +
																"	from cumplimiento_kpiweb TC " + 
																//"	INNER JOIN estado_cumple EC ON TC.ID_CUMPLE = EC.ID " + 
																"	LEFT JOIN estado_cumple EC ON TC.ID_CUMPLE = EC.ID " + 
																//"	RIGHT  JOIN estado_cumple EC ON TC.ID_CUMPLE = EC.ID " + 
																"	WHERE  1 = 1  " + 
																"   AND TC.ID_CUMPLE = 3 "  +
																" 	AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-0, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' " +
																"	GROUP BY TC.ID_CUMPLE, EC.DESCRIPTION " + 
																"	ORDER BY TC.ID_CUMPLE ASC";
													//out.print("<br>");
													//out.println("SQLCumple3="+SQLCumple3);
													//out.print("<br>");
													psCumple3 = conn3.prepareStatement(SQLCumple3, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
													rsCumple3 = psCumple3.executeQuery();
													conn3.commit();
													int contarCumple3 = 0;
													while(rsCumple3.next()) {
														// start while Cumple
														contarCumple3 = contarCumple3 + 1;
												%>
														<script type="text/javascript">
														
															$(function(){
																$("#ocultar_cumplimiento3_<%=contarCumple3%>").click(function() {
																	<%
														        	SQLHideCumplimiento3 = "SELECT  TC.ID_CUMPLE_RESUMEN from cumplimiento_kpiweb TC WHERE  1 = 1 AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-0, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' AND TC.ID_CUMPLE = "+rsCumple3.getInt("ID_CUMPLE")+" GROUP BY TC.ID_CUMPLE_RESUMEN ORDER BY TC.ID_CUMPLE_RESUMEN ASC";
														        	psHideCumplimiento3 = conn3.prepareStatement(SQLHideCumplimiento3, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
								                                    rsHideCumplimiento3 = psHideCumplimiento3.executeQuery();
								                                    conn3.commit();
																	int contarHideCumplimiento3 = 0;
								                                    while(rsHideCumplimiento3.next()) {
																		contarHideCumplimiento3 = contarHideCumplimiento3 + 1;
								                                    %>
																		$("#cumplimiento3_<%=contarCumple3%>_<%=contarHideCumplimiento3%>").hide('slow', function() {});
																		<%
																		SQLHideCumpleResumen3 = "SELECT  TC.ID_CUMPLIMIENTO_2 from cumplimiento_kpiweb TC WHERE  1 = 1 AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-0, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' AND TC.ID_CUMPLE = "+rsCumple3.getInt("ID_CUMPLE")+" AND TC.ID_CUMPLE_RESUMEN = "+rsHideCumplimiento3.getInt("ID_CUMPLE_RESUMEN")+" GROUP BY TC.ID_CUMPLIMIENTO_2 ORDER BY TC.ID_CUMPLIMIENTO_2 ASC";
																		psHideCumpleResumen3 = conn3.prepareStatement(SQLHideCumpleResumen3, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
																		rsHideCumpleResumen3 = psHideCumpleResumen3.executeQuery();
																		conn3.commit();
																		int contarHideCumpleResumen3 = 0;
																		while(rsHideCumpleResumen3.next()) {
																			contarHideCumpleResumen3 = contarHideCumpleResumen3 + 1;
																		%>
																			$("#cumple_resumen3_<%=contarCumple3%>_<%=contarHideCumplimiento3%>_<%=contarHideCumpleResumen3%>").hide('slow', function() {});
																			
																			
																			<%
																			SQLHideResponsable3 = "SELECT  TC.ID_RESPONSABLE from cumplimiento_kpiweb TC WHERE  1 = 1 AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-0, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' AND TC.ID_CUMPLE = "+rsCumple3.getInt("ID_CUMPLE")+" AND TC.ID_CUMPLE_RESUMEN = "+rsHideCumplimiento3.getInt("ID_CUMPLE_RESUMEN")+" AND TC.ID_CUMPLIMIENTO_2 = "+rsHideCumpleResumen3.getInt("ID_CUMPLIMIENTO_2")+" GROUP BY TC.ID_RESPONSABLE ORDER BY TC.ID_RESPONSABLE ASC";
																			psHideResponsable3 = conn3.prepareStatement(SQLHideResponsable3, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
																			rsHideResponsable3 = psHideResponsable3.executeQuery();
																			conn3.commit();
																			int contarHideResponsable3 = 0;
																			while(rsHideResponsable3.next()) {
																				contarHideResponsable3 = contarHideResponsable3 + 1;
																			%>
																				$("#responsable3_<%=contarCumple3%>_<%=contarHideCumplimiento3%>_<%=contarHideCumpleResumen3%>_<%=contarHideResponsable3%>").hide('slow', function() {});
																			<%
																			}
																			%>
																			$("#mostrar_responsable3_<%=contarCumple3%>_<%=contarHideCumplimiento3%>_<%=contarHideCumpleResumen3%>").show('slow', function() {});//Mostrar responsable
																			
																		<%
																		}
																		%>
																		$("#mostrar_cumple_resumen3_<%=contarCumple3%>_<%=contarHideCumplimiento3%>").show('slow', function() {});//Mostrar cumple resumen
																	<%
																	}
																	%>
																	$("#mostrar_cumplimiento3_<%=contarCumple3%>").show('slow', function() {});
																	$("#ocultar_cumplimiento3_<%=contarCumple3%>").hide('slow', function() {});
																});
																
																$("#mostrar_cumplimiento3_<%=contarCumple3%>").click(function() {
																	<%
														        	SQLShowCumplimiento3 = "SELECT  TC.ID_CUMPLE_RESUMEN from cumplimiento_kpiweb TC WHERE  1 = 1 AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-0, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' AND TC.ID_CUMPLE = "+rsCumple3.getInt("ID_CUMPLE")+" GROUP BY TC.ID_CUMPLE_RESUMEN ORDER BY TC.ID_CUMPLE_RESUMEN ASC";
														        	psShowCumplimiento3 = conn3.prepareStatement(SQLShowCumplimiento3, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
								                                    rsShowCumplimiento3 = psShowCumplimiento3.executeQuery();
								                                    conn3.commit();
																	int contarShowCumplimiento3 = 0;
								                                    while(rsShowCumplimiento3.next()) {
																		contarShowCumplimiento3 = contarShowCumplimiento3 + 1;
								                                    %>
																		$("#cumplimiento3_<%=contarCumple3%>_<%=contarShowCumplimiento3%>").show('slow', function() {});
																		$("#ocultar_cumple_resumen3_<%=contarCumple3%>_<%=contarShowCumplimiento3%>").hide('slow', function() {});//Mostrar cumple resumen
																		<%
																		SQLShowCumpleResumen3 = "SELECT  TC.ID_CUMPLIMIENTO_2 from cumplimiento_kpiweb TC WHERE  1 = 1 AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-0, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' AND TC.ID_CUMPLE = "+rsCumple3.getInt("ID_CUMPLE")+" AND TC.ID_CUMPLE_RESUMEN = "+rsShowCumplimiento3.getInt("ID_CUMPLE_RESUMEN")+"  GROUP BY TC.ID_CUMPLIMIENTO_2 ORDER BY TC.ID_CUMPLIMIENTO_2 ASC";
																		psShowCumpleResumen3 = conn3.prepareStatement(SQLShowCumpleResumen3, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
																		rsShowCumpleResumen3 = psShowCumpleResumen3.executeQuery();
																		conn3.commit();
																		int contarShowCumpleResumen3 = 0;
																		while(rsShowCumpleResumen3.next()) {
																			contarShowCumpleResumen3 = contarShowCumpleResumen3 + 1;
																		%>
																			$("#ocultar_responsable3_<%=contarCumple3%>_<%=contarShowCumplimiento3%>_<%=contarShowCumpleResumen3%>").hide('slow', function() {});////
																		<%
																		}
																		%>
																	<%
																	}
																	%>
																	$("#ocultar_cumplimiento3_<%=contarCumple3%>").show('slow', function() {});
																	$("#mostrar_cumplimiento3_<%=contarCumple3%>").hide('slow', function() {});
																});
															});
														</script>
														<!--  
														<tr style="background-color:#3b5998;color:#FFF; " >
															<td><button class="btn btn-block btn-default btn-lg" id="ocultar_cumplimiento3_<%=contarCumple3%>" style="display:none;margin-top: 0px;"><i class="fa fa-minus" aria-hidden="true"></i></button><button class="btn btn-block btn-default btn-lg" id="mostrar_cumplimiento3_<%=contarCumple3%>" style=" margin-top: 0px;"/><i class="fa fa-plus" aria-hidden="true"></i></td>
														
															<td align="left" nowrap="nowrap" ><i class="icon-reorder"></i>&nbsp;<%=rsCumple3.getString("CUMPLE")%> </td>
															
															
															<%
															SQLShowFecha3 = 	"	SELECT " + 
																			"		TC.FECHA_COMPROMISO_EOM" + 
																			
																			" 		,(SUM(CASE WHEN (TC.ID_CUMPLE = "+rsCumple3.getInt("ID_CUMPLE")+" "+""+") THEN 1 ELSE 0 END) ) AS CANTIDAD " +		
																			" 		,SUM(CASE WHEN (TC.ID_CUMPLE = 1 OR TC.ID_CUMPLE = 3 OR TC.ID_CUMPLE = 3) THEN 1 ELSE 0 END) as TOTAL " +
																			"	from cumplimiento_kpiweb TC " +
																			"	WHERE 1 = 1 " + 
																			" " + prefixclause +
																			"	AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-0, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"'  " + 
																			"	GROUP BY TC.FECHA_COMPROMISO_EOM " +
																			"	ORDER BY TC.FECHA_COMPROMISO_EOM ASC";
															
															//out.print("<br>");
															//out.println("SQLShowFechaCumple3="+SQLShowFecha3);
															//out.print("<br>");
														    psShowFecha3 = conn3.prepareStatement(SQLShowFecha3, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
								                            rsShowFecha3 = psShowFecha3.executeQuery();
								                            conn3.commit();
								                            int contarShowFechaCumple3 = 0;
															int totalCantidadCumple3 = 0;
															int totalProcentajeCumple3 = 0;
								                            while(rsShowFecha3.next()) {
								                            	contarShowFechaCumple3 = contarShowFechaCumple3 + 1;
																totalCantidadCumple3 = totalCantidadCumple3 + rsShowFecha3.getInt("CANTIDAD") ;
																
								                            %>		
															<td>
																<table>
																	<tr>
																		<td>
																			<table>
																				<tr>
																					<td  style="color:#FFF;font-size:15px" align="left" WIDTH="50" nowrap="nowrap">
																					<%
																					 DecimalFormat formatea = new DecimalFormat("###,###.##");
																					 out.println(formatea.format(rsShowFecha3.getInt("CANTIDAD")));
																					 %>
																					</td>
																					<td  style="color:#FFF;font-size:15px" align="left" WIDTH="50" nowrap="nowrap">
																					<%
																					
																					
																					if (rsShowFecha3.getInt("CANTIDAD") > 0 ) {
																						out.println( StringUtils.Redondear( String.valueOf( Float.parseFloat( (String.valueOf(((float ) ( (float ) rsShowFecha3.getInt("CANTIDAD") / (float ) rsShowFecha3.getInt("TOTAL")  ) * 100)))  ) ),2)+"%");
																					} else {
																						out.println( "-");																
																					}
																					
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
															
														</tr>
														-->
													
														<%
														// Segunda Fila Cumplimiento
														
														SQLCumplimiento3 = 	"	SELECT  " +
																			"		TC.ID_CUMPLE_RESUMEN, ECR.DESCRIPTION AS CUMPLE_RESUMEN " +
																			"	from cumplimiento_kpiweb TC " + 
																			"	LEFT JOIN  estado_cumple_resumen ECR ON TC.ID_CUMPLE_RESUMEN =  ECR.ID " +
																			"	WHERE  1 = 1 " +
																			"	AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-0, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' " + 
																			"	AND TC.ID_CUMPLE = "+rsCumple3.getInt("ID_CUMPLE")+" " + 
																			"	GROUP BY TC.ID_CUMPLE_RESUMEN, ECR.DESCRIPTION " + 
																			"	ORDER BY TC.ID_CUMPLE_RESUMEN ASC";
														//out.print("<br>");
														//out.println("SQLCumplimiento3="+SQLCumplimiento3);
														//out.print("<br>");
														psCumplimiento3 = conn3.prepareStatement(SQLCumplimiento3, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
														rsCumplimiento3 = psCumplimiento3.executeQuery();
														conn3.commit();
														int contarCumplimiento3 = 0;
														while(rsCumplimiento3.next()) {
															// start while Cumplimiento
															contarCumplimiento3 = contarCumplimiento3 + 1;
														%>
												
															<script type="text/javascript">
																$(function(){
																	$("#ocultar_cumple_resumen3_<%=contarCumple3%>_<%=contarCumplimiento3%>").click(function() {
																		<%
																		SQLHideCumpleResumen3 = "SELECT  TC.ID_CUMPLIMIENTO_2 from cumplimiento_kpiweb TC WHERE  1 = 1 AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-0, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' AND TC.ID_CUMPLE = "+rsCumple3.getInt("ID_CUMPLE")+" AND TC.ID_CUMPLE_RESUMEN = "+rsCumplimiento3.getInt("ID_CUMPLE_RESUMEN")+" GROUP BY TC.ID_CUMPLIMIENTO_2 ORDER BY TC.ID_CUMPLIMIENTO_2 ASC";
																		psHideCumpleResumen3 = conn3.prepareStatement(SQLHideCumpleResumen3, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
																		rsHideCumpleResumen3 = psHideCumpleResumen3.executeQuery();
																		conn3.commit();
																		int contarHideCumpleResumen3 = 0;
																		while(rsHideCumpleResumen3.next()) {
																			contarHideCumpleResumen3 = contarHideCumpleResumen3 + 1;
																		%>
																			$("#cumple_resumen3_<%=contarCumple3%>_<%=contarCumplimiento3%>_<%=contarHideCumpleResumen3%>").hide('slow', function() {});
																			<%
																			SQLHideResponsable3 = "SELECT  TC.ID_RESPONSABLE from cumplimiento_kpiweb TC WHERE  1 = 1 AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-0, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' AND TC.ID_CUMPLE = "+rsCumple3.getInt("ID_CUMPLE")+"  AND TC.ID_CUMPLE_RESUMEN = "+rsCumplimiento3.getInt("ID_CUMPLE_RESUMEN")+" AND TC.ID_CUMPLIMIENTO_2 = "+rsHideCumpleResumen3.getInt("ID_CUMPLIMIENTO_2")+" GROUP BY TC.ID_RESPONSABLE ORDER BY TC.ID_RESPONSABLE ASC";
																			psHideResponsable3 = conn3.prepareStatement(SQLHideResponsable3, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
																			rsHideResponsable3 = psHideResponsable3.executeQuery();
																			conn3.commit();
																			int contarHideResponsable3 = 0;
																			while(rsHideResponsable3.next()) {
																				contarHideResponsable3 = contarHideResponsable3 + 1;
																			%>
																		
																			$("#responsable3_<%=contarCumple3%>_<%=contarCumplimiento3%>_<%=contarHideCumpleResumen3%>_<%=contarHideResponsable3%>").hide('slow', function() {});
																			<%
																			}
																			%>
																			$("#mostrar_responsable3_<%=contarCumple3%>_<%=contarCumplimiento3%>_<%=contarHideCumpleResumen3%>").show('slow', function() {});////
																		<%
																		}
																		%>
																		$("#ocultar_cumple_resumen3_<%=contarCumple3%>_<%=contarCumplimiento3%>").hide('slow', function() {});
																		$("#mostrar_cumple_resumen3_<%=contarCumple3%>_<%=contarCumplimiento3%>").show('slow', function() {});
																	});
																	$("#mostrar_cumple_resumen3_<%=contarCumple3%>_<%=contarCumplimiento3%>").click(function() {
																		<%
																		SQLShowCumpleResumen3 = "SELECT  TC.ID_CUMPLIMIENTO_2 from cumplimiento_kpiweb TC WHERE  1 = 1 AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-0, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' AND TC.ID_CUMPLE = "+rsCumple3.getInt("ID_CUMPLE")+" AND TC.ID_CUMPLE_RESUMEN = "+rsCumplimiento3.getInt("ID_CUMPLE_RESUMEN")+" GROUP BY TC.ID_CUMPLIMIENTO_2 ORDER BY TC.ID_CUMPLIMIENTO_2 ASC";
																		psShowCumpleResumen3 = conn3.prepareStatement(SQLShowCumpleResumen3, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
																		rsShowCumpleResumen3 = psShowCumpleResumen3.executeQuery();
																		conn3.commit();
																		int contarShowCumpleResumen3 = 0;
																		while(rsShowCumpleResumen3.next()) {
																			contarShowCumpleResumen3 = contarShowCumpleResumen3 + 1;
																		%>
																			$("#cumple_resumen3_<%=contarCumple3%>_<%=contarCumplimiento3%>_<%=contarShowCumpleResumen3%>").show('slow', function() {});
																			$("#ocultar_responsable3_<%=contarCumple3%>_<%=contarCumplimiento3%>_<%=contarShowCumpleResumen3%>").hide('slow', function() {});
																		<%
																		}
																		%>
																		$("#ocultar_cumple_resumen3_<%=contarCumple3%>_<%=contarCumplimiento3%>").show('slow', function() {});
																		$("#mostrar_cumple_resumen3_<%=contarCumple3%>_<%=contarCumplimiento3%>").hide('slow', function() {});
																	});	
																});
															</script>
															
															<tr id="cumplimiento3_<%=contarCumple3%>_<%=contarCumplimiento3%>" style="background-color:#007bb6;color:#FFF;" >
																
																<td><button class="btn btn-block btn-default btn-lg" id="ocultar_cumple_resumen3_<%=contarCumple3%>_<%=contarCumplimiento3%>" style="display:none;margin-top: 0px;"><i class="fa fa-minus" aria-hidden="true"></i></button><button class="btn btn-block btn-default btn-lg" id="mostrar_cumple_resumen3_<%=contarCumple3%>_<%=contarCumplimiento3%>" style="margin-top: 0px; "/><i class="fa fa-plus" aria-hidden="true"></i></td>
																<td align="left" nowrap="nowrap"><i class="icon-reorder"></i>&nbsp;<%=rsCumplimiento3.getString("CUMPLE_RESUMEN")%></td>	 
						
																
						
																<%
																SQLShowFecha3 = 	"	SELECT " + 
																				"		TC.FECHA_COMPROMISO_EOM AS  FECHA_COMPROMISO_EOM" +
																				"		,(SUM(CASE WHEN (TC.ID_CUMPLE = "+rsCumple3.getInt("ID_CUMPLE")+" AND TC.ID_CUMPLE_RESUMEN = "+rsCumplimiento3.getInt("ID_CUMPLE_RESUMEN")+" "+""+") THEN 1 ELSE 0 END) ) AS CANTIDAD " +
																				" 		,SUM(CASE WHEN (TC.ID_CUMPLE = 1 OR TC.ID_CUMPLE = 3 OR TC.ID_CUMPLE = 3) THEN 1 ELSE 0 END) as TOTAL " +
																				
																				"	from cumplimiento_kpiweb TC " +
																				"	WHERE 1 = 1 " +
																				" " + prefixclause +														
																				"	AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-0, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' " +
																				"	GROUP BY TC.FECHA_COMPROMISO_EOM " + 
																				"	ORDER BY TC.FECHA_COMPROMISO_EOM ASC";
																//out.print("<br>");
																//out.print("SQLShowFechaCumplimiento = "+SQLShowFecha);
																//out.print("<br>");
																psShowFecha3 = conn3.prepareStatement(SQLShowFecha3, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
																rsShowFecha3 = psShowFecha3.executeQuery();
																conn3.commit();
																int contarShowFechaCumplimiento3 = 0;
																int totalCantidadCumplimiento3 = 0;
																int totalProcentajeCumplimiento3 = 0;
																while(rsShowFecha3.next()) {
																	contarShowFechaCumplimiento3 = contarShowFechaCumplimiento3 + 1;
																	totalCantidadCumplimiento3 = totalCantidadCumplimiento3 + rsShowFecha3.getInt("CANTIDAD") ;
																%>						
																<td>
																	<table>
																		<tr>
																			<td>
																				<table>
																					<tr>
																						<td style="font-size:15px" align="left" WIDTH="50" nowrap="nowrap">
																						<%
																						 DecimalFormat formatea = new DecimalFormat("###,###.##");
																						 out.println(formatea.format(rsShowFecha3.getInt("CANTIDAD")));
																						 %>
																						</td>
																						<td style="font-size:15px" align="left" WIDTH="50" nowrap="nowrap">
																						<%
																						if (rsShowFecha3.getInt("CANTIDAD") > 0 ) {
																							out.println( StringUtils.Redondear( String.valueOf( Float.parseFloat( (String.valueOf(((float ) ( (float ) rsShowFecha3.getInt("CANTIDAD") / (float ) rsShowFecha3.getInt("TOTAL")  ) * 100)))  ) ),2)+"%");
																						} else {
																							out.println( "-");																
																						}
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
																
															</tr>
															<%
															// Tercera Fila CumpleResumen
															SQLCumpleResumen3 = 	"	SELECT  " + 
																				"		TC.ID_CUMPLIMIENTO_2, EC.DESCRIPTION AS CUMPLIMIENTO_2" + 
																				"	from cumplimiento_kpiweb TC " +
																				"	LEFT JOIN  estado_cumplimiento EC ON TC.ID_CUMPLIMIENTO_2 =  EC.ID " +
																				"	WHERE  1 = 1 " + 
																				"	AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-0, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' " + 
																				"	AND TC.ID_CUMPLE = "+rsCumple3.getInt("ID_CUMPLE")+" " +
																				"	AND TC.ID_CUMPLE_RESUMEN = "+rsCumplimiento3.getInt("ID_CUMPLE_RESUMEN")+"  " + 
																				"	GROUP BY TC.ID_CUMPLIMIENTO_2, EC.DESCRIPTION " +
																				"	ORDER BY TC.ID_CUMPLIMIENTO_2 ASC";
															//out.print("<br>");
															//out.println("SQLCumpleResumen="+SQLCumpleResumen);
															//out.print("<br>");
															psCumpleResumen3 = conn3.prepareStatement(SQLCumpleResumen3, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
															rsCumpleResumen3 = psCumpleResumen3.executeQuery();
															conn3.commit();
															int contarCumpleResumen3 = 0;
															while(rsCumpleResumen3.next()) {
																contarCumpleResumen3 = contarCumpleResumen3 + 1;
															%>
																<script type="text/javascript">
																	$(function(){
																		$("#ocultar_responsable3_<%=contarCumple3%>_<%=contarCumplimiento3%>_<%=contarCumpleResumen3%>").click(function() {
																			<%
																			SQLHideResponsable3 = "SELECT  TC.ID_RESPONSABLE from cumplimiento_kpiweb TC WHERE  1 = 1  AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-0, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' AND TC.ID_CUMPLE = "+rsCumple3.getInt("ID_CUMPLE")+" AND TC.ID_CUMPLE_RESUMEN = "+rsCumplimiento3.getInt("ID_CUMPLE_RESUMEN")+" AND TC.ID_CUMPLIMIENTO_2 = "+rsCumpleResumen3.getInt("ID_CUMPLIMIENTO_2")+" GROUP BY TC.ID_RESPONSABLE ORDER BY TC.ID_RESPONSABLE ASC";
																			psHideResponsable3 = conn3.prepareStatement(SQLHideResponsable3, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
																			rsHideResponsable3 = psHideResponsable3.executeQuery();
																			conn3.commit();
																			int contarHideResponsable3 = 0;
																			while(rsHideResponsable3.next()) {
																				contarHideResponsable3 = contarHideResponsable3 + 1;
																			%>
																				$("#responsable3_<%=contarCumple3%>_<%=contarCumplimiento3%>_<%=contarCumpleResumen3%>_<%=contarHideResponsable3%>").hide('slow', function() {});
																			<%
																			}
																			%>
																			$("#mostrar_responsable3_<%=contarCumple3%>_<%=contarCumplimiento3%>_<%=contarCumpleResumen3%>").show('slow', function() {});
																			$("#ocultar_responsable3_<%=contarCumple3%>_<%=contarCumplimiento3%>_<%=contarCumpleResumen3%>").hide('slow', function() {});
																		});
																		$("#mostrar_responsable3_<%=contarCumple3%>_<%=contarCumplimiento3%>_<%=contarCumpleResumen3%>").click(function() {
																			<%
																			SQLShowResponsable3 = "SELECT  TC.ID_RESPONSABLE from cumplimiento_kpiweb TC WHERE  1 = 1  AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-0, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' AND TC.ID_CUMPLE = "+rsCumple3.getInt("ID_CUMPLE")+" AND TC.ID_CUMPLE_RESUMEN = "+rsCumplimiento3.getInt("ID_CUMPLE_RESUMEN")+" AND TC.ID_CUMPLIMIENTO_2 = "+rsCumpleResumen3.getInt("ID_CUMPLIMIENTO_2")+"  GROUP BY TC.ID_RESPONSABLE ORDER BY TC.ID_RESPONSABLE ASC";
																			psShowResponsable3 = conn3.prepareStatement(SQLShowResponsable3, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
																			rsShowResponsable3 = psShowResponsable3.executeQuery();
																			conn3.commit();
																			int contarShowResponsable3 = 0;
																			while(rsShowResponsable3.next()) {
																				contarShowResponsable3 = contarShowResponsable3 + 1;
																			%>
																				$("#responsable3_<%=contarCumple3%>_<%=contarCumplimiento3%>_<%=contarCumpleResumen3%>_<%=contarShowResponsable3%>").show('slow', function() {});
																			<%
																			}
																			%>
																			$("#ocultar_responsable3_<%=contarCumple3%>_<%=contarCumplimiento3%>_<%=contarCumpleResumen3%>").show('slow', function() {});
																			$("#mostrar_responsable3_<%=contarCumple3%>_<%=contarCumplimiento3%>_<%=contarCumpleResumen3%>").hide('slow', function() {});
																		});	
																	});
																</script>
																<tr id="cumple_resumen3_<%=contarCumple3%>_<%=contarCumplimiento3%>_<%=contarCumpleResumen3%>"  style="background-color:#55acee;color:#FFF;display:none">
																	<td><button class="btn btn-block btn-default btn-lg" id="ocultar_responsable3_<%=contarCumple3%>_<%=contarCumplimiento3%>_<%=contarCumpleResumen3%>" style="display:none;margin-top: 0px;"><i class="fa fa-minus" aria-hidden="true"></i></button><button class="btn btn-block btn-default btn-lg" id="mostrar_responsable3_<%=contarCumple3%>_<%=contarCumplimiento3%>_<%=contarCumpleResumen3%>" style=" margin-top: 0px;"/><i class="fa fa-plus" aria-hidden="true"></i></td>
																	<td align="left" nowrap="nowrap"><i class="icon-reorder"></i>&nbsp;<%=rsCumpleResumen3.getString("CUMPLIMIENTO_2")%></td>
						
						
																	<%
																	SQLShowFecha3 = 	"	SELECT  " +
																					"		TC.FECHA_COMPROMISO_EOM " +
																					" 		,(SUM(CASE WHEN (TC.ID_CUMPLE = "+rsCumple3.getInt("ID_CUMPLE")+" AND TC.ID_CUMPLE_RESUMEN = "+rsCumplimiento3.getInt("ID_CUMPLE_RESUMEN")+" AND TC.ID_CUMPLIMIENTO_2 = "+rsCumpleResumen3.getInt("ID_CUMPLIMIENTO_2")+" "+""+") THEN 1 ELSE 0 END) ) AS CANTIDAD " + 
																					" 		,SUM(CASE WHEN (TC.ID_CUMPLE = 1 OR TC.ID_CUMPLE = 3 OR TC.ID_CUMPLE = 3) THEN 1 ELSE 0 END) as TOTAL " +
						
																					"	from cumplimiento_kpiweb TC " +
																					"	WHERE 1 = 1 " + 
																					" " + prefixclause +	
																					"	AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-0, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' " +
																					"	GROUP BY TC.FECHA_COMPROMISO_EOM " + 
																					"	ORDER BY TC.FECHA_COMPROMISO_EOM ASC";
																	//out.print("<br>");
																	//out.print("SQLShowFechaCumpleResumen3 = "+SQLShowFecha3);
																	//out.print("<br>");
																	psShowFecha3 = conn3.prepareStatement(SQLShowFecha3, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
																	rsShowFecha3 = psShowFecha3.executeQuery();
																	conn3.commit();
																	int contarShowFechaCumpleResumen3 = 0;
																	int totalCantidadCumpleResumen3 = 0;
																	int totalProcentajeCumpleResumen3 = 0;
																	while(rsShowFecha3.next()) {
																		contarShowFechaCumpleResumen3 = contarShowFechaCumpleResumen3 + 1;
																		totalCantidadCumpleResumen3 = totalCantidadCumpleResumen3 + rsShowFecha3.getInt("CANTIDAD") ;
																	%>	
																		<td>
																			<table>
																				<tr>
																					<td>
																						<table>
																							<tr>
																								<td style="font-size:15px" align="left" WIDTH="50" nowrap="nowrap">
																								<%
																								 DecimalFormat formatea = new DecimalFormat("###,###.##");
																								 out.println(formatea.format(rsShowFecha3.getInt("CANTIDAD")));
																								 %>
																								</td>
																								<td style="font-size:15px" align="left" WIDTH="50" nowrap="nowrap">
																								<%
																								if (rsShowFecha3.getInt("CANTIDAD") > 0 ) {
																									out.println( StringUtils.Redondear( String.valueOf( Float.parseFloat( (String.valueOf(((float ) ( (float ) rsShowFecha3.getInt("CANTIDAD") / (float ) rsShowFecha3.getInt("TOTAL")  ) * 100)))  ) ),2)+"%");
																								} else {
																									out.println( "-");																
																								}
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
																	
																</tr>
																<%
																// Cuarta Fila Responsable
																SQLResponsable3 = 	"	SELECT " + 
																					"		TC.ID_RESPONSABLE, ER.DESCRIPTION AS RESPONSABLE  " +
																					"	from cumplimiento_kpiweb TC " + 
																					"	LEFT JOIN  estado_responsable ER ON TC.ID_RESPONSABLE =  ER.ID " +
																					"	WHERE  1 = 1 " + 
																					"	AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-0, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' " +
																					"	AND TC.ID_CUMPLE = "+rsCumple3.getInt("ID_CUMPLE")+" " +
																					"	AND TC.ID_CUMPLE_RESUMEN = "+rsCumplimiento3.getInt("ID_CUMPLE_RESUMEN")+" " +
																					"	AND TC.ID_CUMPLIMIENTO_2 = "+rsCumpleResumen3.getInt("ID_CUMPLIMIENTO_2")+" " + 
																					"	GROUP BY TC.ID_RESPONSABLE, ER.DESCRIPTION " + 
																					"	ORDER BY TC.ID_RESPONSABLE ASC";
																//out.print("<br>");
																//out.println("SQLResponsable="+SQLResponsable);
																//out.print("<br>");
																psResponsable3 = conn3.prepareStatement(SQLResponsable3, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
																rsResponsable3 = psResponsable3.executeQuery();
																conn3.commit();
																int contarResponsable3 = 0;
																while(rsResponsable3.next()) {
																	// start while Responsable
																	contarResponsable3 = contarResponsable3 + 1;
																	//out.print("contarResponsable = "+contarResponsable);
																	//out.print("<br>");
																	
																%>
																	<tr id="responsable3_<%=contarCumple3%>_<%=contarCumplimiento3%>_<%=contarCumpleResumen3%>_<%=contarResponsable3%>" style="display:none">
																		<td>
																		<button class="btn btn-block btn-default btn-lg disabled"  style="margin-top: 0px;">-</button>
																		</td>
																		<td align="left" style="background-color:#FFF;color:#000000" nowrap="nowrap"><i class="icon-reorder"></i>&nbsp;<%=rsResponsable3.getString("RESPONSABLE")%></td>
						
																		
																		<%
																		SQLShowFecha3 =	"	SELECT  " +
																						"		TC.FECHA_COMPROMISO_EOM " +
																						//" 		,(SUM(CASE WHEN (TC.ID_CUMPLE = "+rsCumple.getInt("ID_CUMPLE")+" AND TC.ID_CUMPLIMIENTO_3 = "+rsCumpleResumen.getInt("ID_CUMPLIMIENTO_3")+" AND TC.ID_RESPONSABLE = "+rsResponsable.getInt("ID_RESPONSABLE")+" "+prefixclause+") THEN 1 ELSE 0 END) ) AS CANTIDAD " + 
																						" 		,(SUM(CASE WHEN (TC.ID_CUMPLE = "+rsCumple3.getInt("ID_CUMPLE")+" AND TC.ID_CUMPLE_RESUMEN = "+rsCumplimiento3.getInt("ID_CUMPLE_RESUMEN")+" AND TC.ID_CUMPLIMIENTO_2 = "+rsCumpleResumen3.getInt("ID_CUMPLIMIENTO_2")+" AND TC.ID_RESPONSABLE = "+rsResponsable3.getInt("ID_RESPONSABLE")+" "+""+") THEN 1 ELSE 0 END) ) AS CANTIDAD " + 
																						" 		,SUM(CASE WHEN (TC.ID_CUMPLE = 1 OR TC.ID_CUMPLE = 3 OR TC.ID_CUMPLE = 3) THEN 1 ELSE 0 END) as TOTAL " +
																						
																						"	from cumplimiento_kpiweb TC " + 
						 																"	WHERE 1 = 1 " + 
						 																" " + prefixclause +	
						 																"	AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+"', 'YYYY-MM-DD')-0, 'YYYY/MM/DD'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+"' " +
																						"	GROUP BY TC.FECHA_COMPROMISO_EOM " +
																						"	ORDER BY TC.FECHA_COMPROMISO_EOM ASC";
																		//out.print("<br>");
																		//out.print("SQLShowFechaResponsable3 = "+SQLShowFecha3);
																		//out.print("<br>");
																		psShowFecha3 = conn3.prepareStatement(SQLShowFecha3, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
																		rsShowFecha3 = psShowFecha3.executeQuery();
																		conn3.commit();
																		int contarShowFechaResponsable3 = 0;
																		int totalCantidadResponsable3 = 0;
																		int totalProcentajeResponsable3 = 0;
																		while(rsShowFecha3.next()) {
																			contarShowFechaResponsable3 = contarShowFechaResponsable3 + 1;
																			totalCantidadResponsable3 = totalCantidadResponsable3 + rsShowFecha3.getInt("CANTIDAD") ;
																		%>	
																		<td>
																			<table>
																				<tr>
																					<td>
																						<table>
																							<tr>
																								<td style="font-size:15px" align="left" WIDTH="50" nowrap="nowrap">
																								<%
																								 DecimalFormat formatea = new DecimalFormat("###,###.##");
																								 out.println(formatea.format(rsShowFecha3.getInt("CANTIDAD")));
																					 			%>
																								</td>
																								<td style="font-size:15px" align="left" WIDTH="50" nowrap="nowrap">
																								<%
																								if (rsShowFecha3.getInt("CANTIDAD") > 0 ) {
																									out.println( StringUtils.Redondear( String.valueOf( Float.parseFloat( (String.valueOf(((float ) ( (float ) rsShowFecha3.getInt("CANTIDAD") / (float ) rsShowFecha3.getInt("TOTAL")  ) * 100)))  ) ),2)+"%");
																								} else {
																									out.println( "-");																
																								}
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
																		
																	</tr>
																<%
																}	// end while Resumenee
															} //end while CumpleResumen 
														} // end while Cumplimiento
													}  // end while Cumple
												} catch (SQLException exQL) {
													conn3.rollback();
													out.println("Error SQL: " + exQL.getMessage());	
												} catch (Exception ex) {
													conn3.rollback();
													out.println("Error: " + ex.getMessage());
												} finally {
													if (rsCumple3 != null) rsCumple3.close();
													if (rsCumplimiento3 != null) rsCumplimiento3.close();
													if (rsCumpleResumen3 != null) rsCumpleResumen3.close();
													if (rsResponsable3 != null) rsResponsable3.close();
													
													if (psCumple3 != null) psCumple3.close();
													if (psCumplimiento3 != null) psCumplimiento3.close();
													if (psCumpleResumen3 != null) psCumpleResumen3.close();
													if (psResponsable3 != null) psResponsable3.close();
													
													if (rsHideCumple3 != null) rsHideCumple3.close();
													if (rsHideCumplimiento3 != null) rsHideCumplimiento3.close();
													if (rsHideCumpleResumen3 != null) rsHideCumpleResumen3.close();
													if (rsHideResponsable3 != null) rsHideResponsable3.close();
													if (rsShowCumple3 != null) rsShowCumple3.close();
													if (rsShowCumplimiento3 != null) rsShowCumplimiento3.close();
													if (rsShowCumpleResumen3 != null) rsShowCumpleResumen3.close();
													if (rsShowResponsable3 != null) rsShowResponsable3.close();
													
													if (psHideCumple3 != null) psHideCumple3.close();
													if (psHideCumplimiento3 != null) psHideCumplimiento3.close();
													if (psHideCumpleResumen3 != null) psHideCumpleResumen3.close();
													if (psHideResponsable3 != null) psHideResponsable3.close();
													if (psShowCumple3 != null) psShowCumple3.close();
													if (psShowCumplimiento3 != null) psShowCumplimiento3.close();
													if (psShowCumpleResumen3 != null) psShowCumpleResumen3.close();
													if (psShowResponsable3 != null) psShowResponsable3.close();
													
													if (psShowFecha3 != null) psShowFecha3.close();
													if (rsShowFecha3 != null) rsShowFecha3.close();
						
													if (conn3 != null) conn3.close();
												} 
												%>
											</table>
									            </div>
									            <!-- /.box-body -->
									
									                
									              </div>
									              <div class="modal-footer">
									                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Cerrar</button>
									              </div>
									            </div>
									            <!-- /.modal-content -->
									          </div>
									          <!-- /.modal-dialog -->
									        </div>
									        <!-- /.modal -->
								            
								            
								           
										  </div>
										  <!-- /.description-block -->
										</div>
								  	</div>
			
								  	<div class="box-header with-border"></div>
			
								  	
								  	<!-- /.row -->
								  	<div class="row">
										<div class="col-sm-12 col-xs-12">
										  <div class="description-block">
										  	<span class="description-percentage text-blue">
										  	<i class="fa fa-caret-right"> 
										  	<span style="font-size:15px">
			
										        <c:choose>
													  <c:when test="${ cantTotal > 0}">
													  	<fmt:formatNumber pattern="#,###,#00" value="${ cantTotal }"  type="number"/>
													  </c:when>
													  <c:otherwise>
													  ${ cantTotal }
													  </c:otherwise>
												  </c:choose> 
										    </span>
										  	</i> 
											</span>
											
											<h5 class="description-header" style="font-size:40px">
												<c:choose>
													  <c:when test="${ porcentajeTotal == '0.00'}">
													  	  0
													  </c:when>
													  <c:otherwise>
													  ${ porcentajeTotal } %
													  </c:otherwise>
												  </c:choose> 		
											</h5>
											<span class="description-text" style="font-size:20px">TOTAL</span>
										  </div>
										  <!-- /.description-block -->
										</div>
								  	</div>
								  	<!-- /.row -->
								</div>
								<!-- /.box-footer -->
								
								<!-- Inicio Grafico -->
								</br>
								<style type="text/css">
								${demo.css}
								</style>
								
								<script src="<c:url value="/js/Highcharts/highcharts.js"/>"></script>
								<script src="<c:url value="/js/Highcharts/highcharts-3d.js"/>"></script>
								<script src="<c:url value="/js/Highcharts/modules/exporting.js"/>"></script>
								  
								
								<div id="container" style="height: 400px"></div>
								
								<!--  
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
											categories: ['2017-10-10']
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
											data: [92.18]
										}, {
											name: 'Atrasado',
											data: [0.30]
										}, {
											name: 'No Cumple',
											data: [7.51]
										}]
									});
								});
								</script>
								-->
								<br></br>
								
								
										<script type="text/javascript">
								
										</script>
										
								
							  </div>
							  <!-- /.box -->
							</div>
							<!-- /.col -->
						  </div>
						  <!-- /.row -->
					 </c:when>
					 <c:otherwise>
					 	<div>
				            <div class="alert alert-error">
								<button type="button" class="close" data-dismiss="alert">X</button>
							    No hay registros a consultar
							</div>
			            </div>
					</c:otherwise>
					</c:choose> 

				  </div>
				</div>  
           </div> 
      </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
	<jsp:include page="../../include/footer.jsp" />
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Create the tabs -->
    <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
      <li><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
      <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
    </ul>
    <!-- Tab panes -->
    <div class="tab-content">
      <!-- Home tab content -->
      <div class="tab-pane" id="control-sidebar-home-tab">
        <h3 class="control-sidebar-heading">Recent Activity</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-birthday-cake bg-red"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

                <p>Will be 23 on April 24th</p>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-user bg-yellow"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Frodo Updated His Profile</h4>

                <p>New phone +1(800)555-1234</p>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-envelope-o bg-light-blue"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Nora Joined Mailing List</h4>

                <p>nora@example.com</p>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-file-code-o bg-green"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Cron Job 254 Executed</h4>

                <p>Execution time 5 seconds</p>
              </div>
            </a>
          </li>
        </ul>
        <!-- /.control-sidebar-menu -->

        <h3 class="control-sidebar-heading">Tasks Progress</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript:void(0)">
              <h4 class="control-sidebar-subheading">
                Custom Template Design
                <span class="label label-danger pull-right">70%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <h4 class="control-sidebar-subheading">
                Update Resume
                <span class="label label-success pull-right">95%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-success" style="width: 95%"></div>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <h4 class="control-sidebar-subheading">
                Laravel Integration
                <span class="label label-warning pull-right">50%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-warning" style="width: 50%"></div>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <h4 class="control-sidebar-subheading">
                Back End Framework
                <span class="label label-primary pull-right">68%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-primary" style="width: 68%"></div>
              </div>
            </a>
          </li>
        </ul>
        <!-- /.control-sidebar-menu -->

      </div>
      <!-- /.tab-pane -->
      <!-- Stats tab content -->
      <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
      <!-- /.tab-pane -->
      <!-- Settings tab content -->
      <div class="tab-pane" id="control-sidebar-settings-tab">
        <form method="post">
          <h3 class="control-sidebar-heading">General Settings</h3>

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Report panel usage
              <input type="checkbox" class="pull-right" checked>
            </label>

            <p>
              Some information about this general settings option
            </p>
          </div>
          <!-- /.form-group -->

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Allow mail redirect
              <input type="checkbox" class="pull-right" checked>
            </label>

            <p>
              Other sets of options are available
            </p>
          </div>
          <!-- /.form-group -->

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Expose author name in posts
              <input type="checkbox" class="pull-right" checked>
            </label>

            <p>
              Allow the user to show his name in blog posts
            </p>
          </div>
          <!-- /.form-group -->

          <h3 class="control-sidebar-heading">Chat Settings</h3>

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Show me as online
              <input type="checkbox" class="pull-right" checked>
            </label>
          </div>
          <!-- /.form-group -->

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Turn off notifications
              <input type="checkbox" class="pull-right">
            </label>
          </div>
          <!-- /.form-group -->

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Delete chat history
              <a href="javascript:void(0)" class="text-red pull-right"><i class="fa fa-trash-o"></i></a>
            </label>
          </div>
          <!-- /.form-group -->
        </form>
      </div>
      <!-- /.tab-pane -->
    </div>
  </aside>
  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>

<!-- ./wrapper -->
<!-- Bootstrap 3.3.7 -->
<script src="<c:url value="/bower_components/bootstrap/dist/js/bootstrap.min.js"/>"></script>
<!-- SlimScroll -->
<script src="<c:url value="/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"/>"></script>
<!-- FastClick -->
<script src="<c:url value="/bower_components/fastclick/lib/fastclick.js"/>"></script>
<!-- AdminLTE App -->
<script src="<c:url value="/dist/js/adminlte.min.js"/>"></script>
<!-- AdminLTE for demo purposes -->
<script src="<c:url value="/dist/js/demo.js"/>"></script>



</body>
</html>


