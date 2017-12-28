<%@include file="../../../include/taglib_includes.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<jsp:include page="../../../include/head.jsp" />
<script src="<c:url value="/js/admin/user/user.all.js"/>"
	type="text/javascript"></script>

<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

<!-- Le fav and touch icons -->
<link rel="shortcut icon" href="../../../assets/ico/favicon.ico">
	<link rel="apple-touch-icon-precomposed" sizes="144x144"
		href="../../../assets/ico/apple-touch-icon-144-precomposed.png">
		<link rel="apple-touch-icon-precomposed" sizes="114x114"
			href="../../../assets/ico/apple-touch-icon-114-precomposed.png">
			<link rel="apple-touch-icon-precomposed" sizes="72x72"
				href="../../../assets/ico/apple-touch-icon-72-precomposed.png">
				<link rel="apple-touch-icon-precomposed"
					href="../../../assets/ico/apple-touch-icon-57-precomposed.png">
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
		<h1 class="page-title">Usuarios</h1>
	</div>

	<ul class="breadcrumb">
		<li><a href="home">Home</a> <span class="divider">/</span></li>
		<li class="active">Usuarios</li>
	</ul>

	<div class="container-fluid">
		<div class="row-fluid">
			<!--  
			<div class="btn-toolbar">
				<button id="btn-add-user" class="btn btn-primary"><i class="icon-plus"></i> Nuevo</button>
				<button class="btn" disabled="disabled">Import</button>
				<button class="btn">Export</button>
				<div class="btn-group"></div>
			</div>
			-->
			<div id="myTabContent" class="tab-content">
				<div class="tab-pane active in" id="home">
					<form id="f_all_user" method="get" action="allUsers">
						<div class="form-group">
							<!--  
        					<label>Username</label>
        					-->
							Tipo
							Orden&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<select>
								<option value="1">Todas</option>
								<option value="1">Click & Collect</option>
								<option value="1">Intercambio</option>
								<option value="1">Paris.cl</option>
								<option value="1">POS Jhonson</option>
								<option value="1">POS Paris</option>
							</select> &nbsp; Tipo Venta&nbsp;&nbsp; <select>
								<option value="1">Cd Despacha</option>
								<option value="1">VEV CD</option>
							</select> &nbsp; Cliente Retira&nbsp; <select>
								<option value="1">No</option>
								<option value="1">Si</option>
							</select>
						</div>
						<div class="form-group">
							Descripcion
							Empleado&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <select>
								<option value="1">Cencosud Retail</option>
								<option value="1">Daniel Alejandro Barros</option>
								<option value="1">Mudanzas Navas</option>
							</select> &nbsp; Tipo Guia&nbsp;&nbsp;&nbsp;&nbsp; <select>
								<option value="1">0</option>
								<option value="1">4</option>
								<option value="1">5</option>
								<option value="1">6</option>
							</select> &nbsp;
							Horario&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<select>
								<option value="1">AM</option>
								<option value="1">AM,PM,TH</option>
								<option value="1">TH</option>
							</select>
						</div>
						<div class="form-group">
							Venta
							Empresa&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<select>
								<option value="1">NO</option>
							</select> &nbsp; Estado&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <select>
								<option value="1">1.- CUMPLE</option>
								<option value="1">2.- ATRASADO</option>
								<option value="1">3.- NO CUMPLE</option>
							</select> &nbsp; Fecha EOM&nbsp;&nbsp;&nbsp; <select>
								<option value="1">04-03-2017</option>
								<option value="1">03-03-2017</option>
								<option value="1">02-03-2017</option>
								<option value="1">01-03-2017</option>
								<option value="1">28-02-2017</option>
							</select>
						</div>
						<div class="btn-toolbar list-toolbar">
							<button class="btn btn-default" id="btn-all-user">
								<i class="fa fa-search"></i> Buscar
							</button>
						</div>
					</form>
				</div>
			</div>
			<br></br>
			<jsp:include page="../../../include/messages.jsp" />
			<div class="main-content">
				<div class="main-content">
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
								SQLFecha = "SELECT  REPLACE (REPLACE (C1.FECHA_COMPROMISO, '00:', ''), '00.0','') AS FECHA_COMPROMISO,   NVL((select count(*) from CUMPLIMIENTO C2 WHERE 1 = 1 AND C2.FECHA_COMPROMISO = C1.FECHA_COMPROMISO),0) AS CANTIDAD FROM CUMPLIMIENTO C1 WHERE ROWNUM <11 GROUP BY C1.FECHA_COMPROMISO ORDER BY C1.FECHA_COMPROMISO ASC";
								out.println("SQLFecha="+SQLFecha);
								//out.print("<br>");
								psFecha = connFecha.prepareStatement(SQLFecha, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
								rsFecha = psFecha.executeQuery();
								connFecha.commit();
								int contarFecha = 0;
								
								int totalProcentajeFecha = 0;
								while(rsFecha.next()) {
									// start while Fecha
									contarFecha = contarFecha + 1;
									totalCantidadFecha = totalCantidadFecha + rsFecha.getInt("CANTIDAD") ;
									//totalCantidadTotalCumple = totalCantidadTotalCumple + rsShowFechaCumple.getInt("CANTIDAD_TOTAL") ;
									//totalProcentajeCumple = totalProcentajeCumple + rsShowFechaCumple.getInt("PORCENTAJE") ;
									//out.print("contarFecha = "+contarFecha);
									//out.print("<br>");
									
							%>
							<th>
								<%=rsFecha.getString("FECHA_COMPROMISO")%>&nbsp;
								<table>
									<tr>
										<td>
											<table>
												<tr>
													<td align="left" WIDTH="60">Q</td>
													<td aalign="left" WIDTH="60">%</td>
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
							<td align="left" WIDTH="60">Total Q</td>
							<td align="left" WIDTH="60">Total %</td>
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
						
		
						try{
							Class.forName("oracle.jdbc.OracleDriver").newInstance();
							conn = DriverManager.getConnection("jdbc:oracle:thin:@172.18.163.15:1521/XE","kpiweb","kpiweb");//
							conn.setAutoCommit(false);
							SQLCumple = "SELECT  CUMPLE FROM CUMPLIMIENTO WHERE  1 = 1 GROUP BY CUMPLE ORDER BY CUMPLE ASC";
							//out.println("SQLCumple="+SQLCumple);
							//out.print("<br>");
							psCumple = conn.prepareStatement(SQLCumple, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
							rsCumple = psCumple.executeQuery();
							conn.commit();
							int contarCumple = 0;
							while(rsCumple.next()) {
								// start while Cumple
								contarCumple = contarCumple + 1;
								//out.print("contarCumple = "+contarCumple);
								//out.print("<br>");
								
						%>
								<script type="text/javascript">
									$(function(){
										<!--0-->
										$("#ocultar_cumplimiento_<%=contarCumple%>").click(function() {
											alert('ocultar_cumplimiento_<%=contarCumple%>');
											<%
								        	SQLHideCumplimiento = "SELECT  CUMPLIMIENTO_2 FROM CUMPLIMIENTO WHERE  1=1 AND CUMPLE = '"+rsCumple.getString("CUMPLE")+"' GROUP BY CUMPLIMIENTO_2 ORDER BY CUMPLIMIENTO_2 ASC";
								        	psHideCumplimiento = conn.prepareStatement(SQLHideCumplimiento, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		                                    rsHideCumplimiento = psHideCumplimiento.executeQuery();
		                                    conn.commit();
											int contarHideCumplimiento = 0;
		                                    while(rsHideCumplimiento.next()) {
												contarHideCumplimiento = contarHideCumplimiento + 1;
		                                    %>
												$("#cumplimiento_<%=contarCumple%>_<%=contarHideCumplimiento%>").hide('slow', function() {});
												<%
												SQLHideCumpleResumen = "SELECT  CUMPLE_RESUMEN FROM CUMPLIMIENTO WHERE  1 = 1 AND CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND CUMPLIMIENTO_2 = '"+rsHideCumplimiento.getString("CUMPLIMIENTO_2")+"' GROUP BY CUMPLE_RESUMEN ORDER BY CUMPLE_RESUMEN ASC";
												psHideCumpleResumen = conn.prepareStatement(SQLHideCumpleResumen, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
												rsHideCumpleResumen = psHideCumpleResumen.executeQuery();
												conn.commit();
												int contarHideCumpleResumen = 0;
												while(rsHideCumpleResumen.next()) {
													contarHideCumpleResumen = contarHideCumpleResumen + 1;
												%>
													$("#cumple_resumen_<%=contarCumple%>_<%=contarHideCumplimiento%>_<%=contarHideCumpleResumen%>").hide('slow', function() {});
													<%
													SQLHideResponsable = "SELECT  RESPONSABLE FROM CUMPLIMIENTO WHERE  1=1 AND CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND CUMPLIMIENTO_2 = '"+rsHideCumplimiento.getString("CUMPLIMIENTO_2")+"' AND CUMPLE_RESUMEN = '"+rsHideCumpleResumen.getString("CUMPLE_RESUMEN")+"' GROUP BY RESPONSABLE ORDER BY RESPONSABLE ASC";
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
								        	SQLShowCumplimiento = "SELECT  CUMPLIMIENTO_2 FROM CUMPLIMIENTO WHERE  1=1 AND CUMPLE = '"+rsCumple.getString("CUMPLE")+"' GROUP BY CUMPLIMIENTO_2 ORDER BY CUMPLIMIENTO_2 ASC";
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
												SQLShowCumpleResumen = "SELECT  CUMPLE_RESUMEN FROM CUMPLIMIENTO WHERE  1=1 AND CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND CUMPLIMIENTO_2 = '"+rsShowCumplimiento.getString("CUMPLIMIENTO_2")+"'  GROUP BY CUMPLE_RESUMEN ORDER BY CUMPLE_RESUMEN ASC";
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
									<td><button id="ocultar_cumplimiento_<%=contarCumple%>" style="display:none"><img src="../images/minus2.gif" /></button><button id="mostrar_cumplimiento_<%=contarCumple%>"><img src="../images/plus2.gif" /></button></td>
									<td align="left" nowrap="nowrap"><%=rsCumple.getString("CUMPLE")%></td>
									<%
								    SQLShowFechaCumple = "SELECT  C1.FECHA_COMPROMISO, NVL((select count(*) from CUMPLIMIENTO C2 WHERE 1 = 1 AND C2.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND C2.FECHA_COMPROMISO = C1.FECHA_COMPROMISO),0) AS CANTIDAD,  NVL( ROUND( TO_NUMBER(( (select count(*) from CUMPLIMIENTO C2  where 1 = 1 AND C2.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND C2.FECHA_COMPROMISO = C1.FECHA_COMPROMISO)/(select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO = C1.FECHA_COMPROMISO)  * 100)), 2 ),0) AS PORCENTAJE  FROM CUMPLIMIENTO C1 WHERE ROWNUM <11 GROUP BY C1.FECHA_COMPROMISO ORDER BY C1.FECHA_COMPROMISO ASC";
									out.println("SQLShowFechaCumple="+SQLShowFechaCumple);
									out.print("<br>");
								    psShowFechaCumple = conn.prepareStatement(SQLShowFechaCumple, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		                            rsShowFechaCumple = psShowFechaCumple.executeQuery();
		                            conn.commit();
									int contarShowFechaCumple = 0;
									int totalCantidadCumple = 0;
									int totalProcentajeCumple = 0;
		                            while(rsShowFechaCumple.next()) {
										contarShowFechaCumple = contarShowFechaCumple + 1;
										totalCantidadCumple = totalCantidadCumple + rsShowFechaCumple.getInt("CANTIDAD") ;
										//totalCantidadTotalCumple = totalCantidadTotalCumple + rsShowFechaCumple.getInt("CANTIDAD_TOTAL") ;
										//totalProcentajeCumple = totalProcentajeCumple + rsShowFechaCumple.getInt("PORCENTAJE") ;
		                            %>	
		                            	
									<td>
										<table>
											<tr>
												<td>
													<table>
														<tr>
															<td  align="left" WIDTH="60" nowrap="nowrap">
															<%
															 DecimalFormat formatea = new DecimalFormat("###,###.##");
															 out.println(formatea.format(rsShowFechaCumple.getInt("CANTIDAD")));
															 %>
															</td>
															<td  align="left" WIDTH="60" nowrap="nowrap">
															<%
															DecimalFormat df = new DecimalFormat("0.00"); 
															out.println(df.format(rsShowFechaCumple.getFloat("PORCENTAJE")));
															%>
															%</td>
														</tr>
													</table>
												</td>
											</tr>
										</table>
									</td>
									<%
									}
									%>
									
									<td align="left" WIDTH="60" nowrap="nowrap"><fmt:formatNumber maxFractionDigits="3" value="<%=totalCantidadCumple%>"  type="number"/></td>
									<td align="left" WIDTH="60" nowrap="nowrap">
									<%
									if (totalCantidadCumple == 0 && totalCantidadFecha == 0) {
										out.println("-");
									} else {
										float resultCumple = ((float ) ( (float ) totalCantidadCumple / (float )totalCantidadFecha) * 100);
										DecimalFormat df = new DecimalFormat("0.00"); 
										out.println(df.format(resultCumple));
									}
									%>
									</td>
								</tr>
						
								<!-- Segunda Fila Cumplimiento -->
								<%
								SQLCumplimiento = "SELECT  CUMPLIMIENTO_2 FROM CUMPLIMIENTO WHERE  1 = 1 AND CUMPLE = '"+rsCumple.getString("CUMPLE")+"' GROUP BY CUMPLIMIENTO_2 ORDER BY CUMPLIMIENTO_2 ASC";
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
												alert('ocultar_cumple_resumen_0');
												<%
												SQLHideCumpleResumen = "SELECT  CUMPLE_RESUMEN FROM CUMPLIMIENTO WHERE  1=1 AND CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND CUMPLIMIENTO_2 = '"+rsCumplimiento.getString("CUMPLIMIENTO_2")+"' GROUP BY CUMPLE_RESUMEN ORDER BY CUMPLE_RESUMEN ASC";
												psHideCumpleResumen = conn.prepareStatement(SQLHideCumpleResumen, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
												rsHideCumpleResumen = psHideCumpleResumen.executeQuery();
												conn.commit();
												int contarHideCumpleResumen = 0;
												while(rsHideCumpleResumen.next()) {
													contarHideCumpleResumen = contarHideCumpleResumen + 1;
												%>
													$("#cumple_resumen_<%=contarCumple%>_<%=contarCumplimiento%>_<%=contarHideCumpleResumen%>").hide('slow', function() {});
													<%
													SQLHideResponsable = "SELECT  RESPONSABLE FROM CUMPLIMIENTO WHERE  1=1 AND CUMPLE = '"+rsCumple.getString("CUMPLE")+"'  AND CUMPLIMIENTO_2 = '"+rsCumplimiento.getString("CUMPLIMIENTO_2")+"' AND CUMPLE_RESUMEN = '"+rsHideCumpleResumen.getString("CUMPLE_RESUMEN")+"' GROUP BY RESPONSABLE ORDER BY RESPONSABLE ASC";
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
												alert('mostrar_cumple_resumen_<%=contarCumple%>_<%=contarCumplimiento%>');
												<%
												SQLShowCumpleResumen = "SELECT  CUMPLE_RESUMEN FROM CUMPLIMIENTO WHERE  1=1 AND CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND CUMPLIMIENTO_2 = '"+rsCumplimiento.getString("CUMPLIMIENTO_2")+"' GROUP BY CUMPLE_RESUMEN ORDER BY CUMPLE_RESUMEN ASC";
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
										<td><button id="ocultar_cumple_resumen_<%=contarCumple%>_<%=contarCumplimiento%>" style="display:none"><img src="../images/minus2.gif" /></button><button id="mostrar_cumple_resumen_<%=contarCumple%>_<%=contarCumplimiento%>"/><img src="../images/plus2.gif" /></td>
										<td nowrap="nowrap"><%=rsCumplimiento.getString("CUMPLIMIENTO_2")%></td>	 
										<%
										
										SQLShowFechaCumplimiento = "SELECT  C1.FECHA_COMPROMISO, NVL((select count(*) from CUMPLIMIENTO C2  where 1 = 1 AND C2.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND C2.CUMPLIMIENTO_2 = '"+rsCumplimiento.getString("CUMPLIMIENTO_2")+"' AND C2.FECHA_COMPROMISO = C1.FECHA_COMPROMISO),0) AS CANTIDAD, NVL( ROUND( TO_NUMBER(( (select count(*) from CUMPLIMIENTO C2  where 1 = 1 AND C2.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND C2.CUMPLIMIENTO_2 = '"+rsCumplimiento.getString("CUMPLIMIENTO_2")+"' AND C2.FECHA_COMPROMISO = C1.FECHA_COMPROMISO)/(select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO = C1.FECHA_COMPROMISO)  * 100)), 2 ),0) AS PORCENTAJE FROM CUMPLIMIENTO C1 WHERE ROWNUM <11 GROUP BY C1.FECHA_COMPROMISO ORDER BY C1.FECHA_COMPROMISO ASC";
										out.println("SQLShowFechaCumplimiento="+SQLShowFechaCumplimiento);
										out.print("<br>");
										psShowFechaCumplimiento = conn.prepareStatement(SQLShowFechaCumplimiento, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
										rsShowFechaCumplimiento = psShowFechaCumplimiento.executeQuery();
										conn.commit();
										int contarShowFechaCumplimiento = 0;
										int totalCantidadCumplimiento = 0;
										int totalProcentajeCumplimiento = 0;
										while(rsShowFechaCumplimiento.next()) {
											contarShowFechaCumplimiento = contarShowFechaCumplimiento + 1;
											totalCantidadCumplimiento = totalCantidadCumplimiento + rsShowFechaCumplimiento.getInt("CANTIDAD") ;
											//totalCantidadTotalCumplimiento = totalCantidadTotalCumplimiento + rsShowFechaCumplimiento.getInt("CANTIDAD_TOTAL") ;
											//totalProcentajeCumplimiento = totalProcentajeCumplimiento + rsShowFechaCumplimiento.getInt("PORCENTAJE") ;
										%>						
										<td>
											<table>
												<tr>
													<td>
														<table>
															<tr>
																<td align="left" WIDTH="60" nowrap="nowrap">
																<%
																 DecimalFormat formatea = new DecimalFormat("###,###.##");
																 out.println(formatea.format(rsShowFechaCumplimiento.getInt("CANTIDAD")));
																 %>
																</td>
																<td align="left" WIDTH="60" nowrap="nowrap">
																<%
																DecimalFormat df = new DecimalFormat("0.00"); 
															 	out.println(df.format(rsShowFechaCumplimiento.getFloat("PORCENTAJE")));
																%>
																%</td>
															</tr>
														</table>
													</td>
												</tr>
											</table>
										</td>
										<%
										}
										%>
										<td align="left" WIDTH="60" nowrap="nowrap"><fmt:formatNumber maxFractionDigits="3" value="<%=totalCantidadCumplimiento%>"  type="number"/></td>
										<td align="left" WIDTH="60" nowrap="nowrap">
										<%
										if (totalCantidadCumplimiento == 0 && totalCantidadFecha == 0) {
											out.println("-");
										} else {
											float resultCumplimiento = ((float ) ( (float ) totalCantidadCumplimiento / (float )totalCantidadFecha) * 100);
											DecimalFormat df = new DecimalFormat("0.00"); 
											out.println(df.format(resultCumplimiento));
										}
										%>
										</td>
									</tr>
									<!-- Tercera Fila CumpleResumen -->
									<%
									SQLCumpleResumen = "SELECT  CUMPLE_RESUMEN FROM CUMPLIMIENTO WHERE  1=1 AND CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND CUMPLIMIENTO_2 = '"+rsCumplimiento.getString("CUMPLIMIENTO_2")+"' GROUP BY CUMPLE_RESUMEN ORDER BY CUMPLE_RESUMEN ASC";
									//out.println("SQLCumpleResumen="+SQLCumpleResumen);
									//out.print("<br>");
									psCumpleResumen = conn.prepareStatement(SQLCumpleResumen, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
									rsCumpleResumen = psCumpleResumen.executeQuery();
									conn.commit();
									int contarCumpleResumen = 0;
									while(rsCumpleResumen.next()) {
										// start while CumpleResumen
										contarCumpleResumen = contarCumpleResumen + 1;
										//out.print("contarCumpleResumen = "+contarCumpleResumen);
										//out.print("<br>");
									%>
										<script type="text/javascript">
											$(function(){
												<!--0-->
												$("#ocultar_responsable_<%=contarCumple%>_<%=contarCumplimiento%>_<%=contarCumpleResumen%>").click(function() {
													alert('ocultar_responsable_<%=contarCumple%>_<%=contarCumplimiento%>_<%=contarCumpleResumen%>');
													<%
													SQLHideResponsable = "SELECT  RESPONSABLE FROM CUMPLIMIENTO WHERE  1 = 1  AND CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND CUMPLIMIENTO_2 = '"+rsCumplimiento.getString("CUMPLIMIENTO_2")+"' AND CUMPLE_RESUMEN = '"+rsCumpleResumen.getString("CUMPLE_RESUMEN")+"' GROUP BY RESPONSABLE ORDER BY RESPONSABLE ASC";
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
													alert('mostrar_responsable_<%=contarCumple%>_<%=contarCumplimiento%>_<%=contarCumpleResumen%>');
													<%
													SQLShowResponsable = "SELECT  RESPONSABLE FROM CUMPLIMIENTO WHERE  1 = 1  AND CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND CUMPLIMIENTO_2 = '"+rsCumplimiento.getString("CUMPLIMIENTO_2")+"' AND CUMPLE_RESUMEN = '"+rsCumpleResumen.getString("CUMPLE_RESUMEN")+"'  GROUP BY RESPONSABLE ORDER BY RESPONSABLE ASC";
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
											<td><button id="ocultar_responsable_<%=contarCumple%>_<%=contarCumplimiento%>_<%=contarCumpleResumen%>" style="display:none"><img src="../images/minus2.gif" /></button><button id="mostrar_responsable_<%=contarCumple%>_<%=contarCumplimiento%>_<%=contarCumpleResumen%>"/><img src="../images/plus2.gif" /></td>
											<td nowrap="nowrap"><%=rsCumpleResumen.getString("CUMPLE_RESUMEN")%></td>
											<%
											SQLShowFechaCumpleResumen = "SELECT  C1.FECHA_COMPROMISO, NVL((select count(*) from CUMPLIMIENTO C2 WHERE 1 = 1 AND C2.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND C2.CUMPLIMIENTO_2 = '"+rsCumplimiento.getString("CUMPLIMIENTO_2")+"' AND C2.CUMPLE_RESUMEN = '"+rsCumpleResumen.getString("CUMPLE_RESUMEN")+"' AND C2.FECHA_COMPROMISO = C1.FECHA_COMPROMISO),0) AS CANTIDAD, NVL( ROUND( TO_NUMBER(( (select count(*) from CUMPLIMIENTO C2  where 1 = 1 AND C2.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND C2.CUMPLIMIENTO_2 = '"+rsCumplimiento.getString("CUMPLIMIENTO_2")+"' AND C2.CUMPLE_RESUMEN = '"+rsCumpleResumen.getString("CUMPLE_RESUMEN")+"'  AND C2.FECHA_COMPROMISO = C1.FECHA_COMPROMISO)/(select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO = C1.FECHA_COMPROMISO)  * 100)), 2 ),0) AS PORCENTAJE FROM CUMPLIMIENTO C1 WHERE ROWNUM <11 GROUP BY C1.FECHA_COMPROMISO ORDER BY C1.FECHA_COMPROMISO ASC";
											out.println("SQLShowFechaCumpleResumen="+SQLShowFechaCumpleResumen);
											out.print("<br>");
											psShowFechaCumpleResumen = conn.prepareStatement(SQLShowFechaCumpleResumen, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
											rsShowFechaCumpleResumen = psShowFechaCumpleResumen.executeQuery();
											conn.commit();
											int contarShowFechaCumpleResumen = 0;
											
											int totalCantidadCumpleResumen = 0;
											int totalProcentajeCumpleResumen = 0;
											while(rsShowFechaCumpleResumen.next()) {
												contarShowFechaCumpleResumen = contarShowFechaCumpleResumen + 1;
												totalCantidadCumpleResumen = totalCantidadCumpleResumen + rsShowFechaCumpleResumen.getInt("CANTIDAD") ;
												//totalCantidadTotalCumpleResumen = totalCantidadTotalCumpleResumen + rsShowFechaCumple.getInt("CANTIDAD_TOTAL") ;
												//totalProcentajeCumpleResumen = totalProcentajeCumpleResumen + rsShowFechaCumple.getInt("PORCENTAJE") ;
											%>	
												<td>
													<table>
														<tr>
															<td>
																<table>
																	<tr>
																		<td align="left" WIDTH="60" nowrap="nowrap">
																		<%
																		 DecimalFormat formatea = new DecimalFormat("###,###.##");
																		 out.println(formatea.format(rsShowFechaCumpleResumen.getInt("CANTIDAD")));
																		 %>
																		</td>
																		<td align="left" WIDTH="60" nowrap="nowrap">
																		<%
																		DecimalFormat df = new DecimalFormat("0.00"); 
																		 out.println(df.format(rsShowFechaCumpleResumen.getFloat("PORCENTAJE")));
																		%>%
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
											<td align="left" WIDTH="50" nowrap="nowrap"><fmt:formatNumber maxFractionDigits="3" value="<%=totalCantidadCumpleResumen%>"  type="number"/></td>
											<td align="left" WIDTH="50" nowrap="nowrap">
											<%
											if (totalCantidadCumpleResumen == 0 && totalCantidadFecha == 0) {
												out.println("-");
											} else {
												float resultCumpleResumen = ((float ) ( (float ) totalCantidadCumple / (float )totalCantidadFecha) * 100);
												DecimalFormat df = new DecimalFormat("0.00"); 
												out.println(df.format(resultCumpleResumen));
											}
											%>
											</td>
										</tr>
										<!-- Cuarta Fila Responsable -->
										<%
										SQLResponsable = "SELECT  RESPONSABLE FROM CUMPLIMIENTO WHERE  1 = 1 AND CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND CUMPLIMIENTO_2 = '"+rsCumplimiento.getString("CUMPLIMIENTO_2")+"' AND CUMPLE_RESUMEN = '"+rsCumpleResumen.getString("CUMPLE_RESUMEN")+"' GROUP BY RESPONSABLE ORDER BY RESPONSABLE ASC";
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
												<td style="background-color:#FFF;color:#000000" nowrap="nowrap"><%=rsResponsable.getString("RESPONSABLE")%></td>
												<%
												SQLShowFechaResponsable = "SELECT  C1.FECHA_COMPROMISO, NVL((select count(*) from CUMPLIMIENTO C2 WHERE 1 = 1 AND C2.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND C2.CUMPLIMIENTO_2 = '"+rsCumplimiento.getString("CUMPLIMIENTO_2")+"' AND C2.CUMPLE_RESUMEN = '"+rsCumpleResumen.getString("CUMPLE_RESUMEN")+"' AND RESPONSABLE = '"+rsResponsable.getString("RESPONSABLE")+"' AND C2.FECHA_COMPROMISO = C1.FECHA_COMPROMISO),0) AS CANTIDAD, NVL( ROUND( TO_NUMBER(( (select count(*) from CUMPLIMIENTO C2  where 1 = 1 AND C2.CUMPLE = '"+rsCumple.getString("CUMPLE")+"' AND C2.CUMPLIMIENTO_2 = '"+rsCumplimiento.getString("CUMPLIMIENTO_2")+"' AND C2.CUMPLE_RESUMEN = '"+rsCumpleResumen.getString("CUMPLE_RESUMEN")+"' AND C2.FECHA_COMPROMISO = C1.FECHA_COMPROMISO)/(select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO = C1.FECHA_COMPROMISO)  * 100)), 2 ),0) AS PORCENTAJE FROM CUMPLIMIENTO C1 WHERE ROWNUM <11 GROUP BY C1.FECHA_COMPROMISO ORDER BY C1.FECHA_COMPROMISO ASC";
												out.println("SQLShowFechaResponsable="+SQLShowFechaCumpleResumen);
												out.print("<br>");
												psShowFechaResponsable = conn.prepareStatement(SQLShowFechaResponsable, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
												rsShowFechaResponsable = psShowFechaResponsable.executeQuery();
												conn.commit();
												int contarShowFechaResponsable = 0;
												int totalCantidadResponsable = 0;
												int totalProcentajeResponsable = 0;
												while(rsShowFechaResponsable.next()) {
													contarShowFechaResponsable = contarShowFechaResponsable + 1;
													totalCantidadResponsable = totalCantidadResponsable + rsShowFechaResponsable.getInt("CANTIDAD") ;
													//totalCantidadResponsable = totalCantidadTotalResponsable + rsShowFechaResponsable.getInt("CANTIDAD_TOTAL") ;
													//totalProcentajeResponsable = totalProcentajeResponsable + rsShowFechaResponsable.getInt("PORCENTAJE") ;
												%>	
												<td>
													<table>
														<tr>
															<td>
																<table>
																	<tr>
																		<td align="left" WIDTH="60" nowrap="nowrap">
																		<%
																		 DecimalFormat formatea = new DecimalFormat("###,###.##");
																		 out.println(formatea.format(rsShowFechaResponsable.getInt("CANTIDAD")));
															 			%>
																		</td>
																		<td align="left" WIDTH="60" nowrap="nowrap">
																		<%
																		DecimalFormat df = new DecimalFormat("0.00"); 
																		out.println(df.format(rsShowFechaResponsable.getFloat("PORCENTAJE")));
																		%>
																		%</td>
																	</tr>
																</table>
															</td>
														</tr>
													</table>
												</td>
												<%
												}
												%>
												<td align="left" WIDTH="60" nowrap="nowrap"><fmt:formatNumber maxFractionDigits="3" value="<%=totalCantidadResponsable%>"  type="number"/></td>
												<td align="left" WIDTH="60" nowrap="nowrap">
												<%
												if (totalCantidadResponsable == 0 && totalCantidadFecha == 0) {
													out.println("-");
												} else {
													float resultResponsable = ((float ) ( (float ) totalCantidadResponsable / (float )totalCantidadFecha) * 100);
													DecimalFormat df = new DecimalFormat("0.00"); 
													out.println(df.format(resultResponsable));
												}
												%>
												%</td>
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
							
							if (psShowFechaCumple != null) psShowFechaCumple.close();
							if (rsShowFechaCumple != null) rsShowFechaCumple.close();
							if (psShowFechaCumplimiento != null) psShowFechaCumplimiento.close();
							if (rsShowFechaCumplimiento != null) rsShowFechaCumplimiento.close();
							if (psShowFechaCumpleResumen != null) psShowFechaCumpleResumen.close();
							if (rsShowFechaCumpleResumen != null) rsShowFechaCumpleResumen.close();
							if (psShowFechaResponsable != null) psShowFechaResponsable.close();
							if (rsShowFechaResponsable != null) rsShowFechaResponsable.close();

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
							try{
								Class.forName("oracle.jdbc.OracleDriver").newInstance();
								connTotal = DriverManager.getConnection("jdbc:oracle:thin:@172.18.163.15:1521/XE","kpiweb","kpiweb");//
								connTotal.setAutoCommit(false);
								SQLTotal = "SELECT  C1.FECHA_COMPROMISO, NVL((select count(*) from CUMPLIMIENTO C2 WHERE 1 = 1  AND C2.FECHA_COMPROMISO = C1.FECHA_COMPROMISO),0) AS CANTIDAD,  NVL( ROUND( TO_NUMBER(( (select count(*) from CUMPLIMIENTO C2  where 1 = 1  AND C2.FECHA_COMPROMISO = C1.FECHA_COMPROMISO)/(select count(*) from CUMPLIMIENTO C2 where  1 = 1 AND C2.FECHA_COMPROMISO = C1.FECHA_COMPROMISO)  * 100)), 2 ),0) AS PORCENTAJE  FROM CUMPLIMIENTO C1 WHERE ROWNUM <11 GROUP BY C1.FECHA_COMPROMISO ORDER BY C1.FECHA_COMPROMISO ASC";
								
								//SQLTotal = "SELECT  FECHA_COMPROMISO FROM CUMPLIMIENTO WHERE ROWNUM <11 GROUP BY FECHA_COMPROMISO ORDER BY FECHA_COMPROMISO ASC";
								//out.println("SQLTotal="+SQLTotal);
								//out.print("<br>");
								psTotal = connTotal.prepareStatement(SQLTotal, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
								rsTotal = psTotal.executeQuery();
								connTotal.commit();
								int contarTotal = 0;
								
								while(rsTotal.next()) {
									// start while Total
									contarTotal = contarTotal + 1;
									//out.print("contarTotal = "+contarTotal);
									//out.print("<br>");
									totalesCantidad = totalesCantidad + rsTotal.getInt("CANTIDAD") ;
									totalesProcentaje = totalesProcentaje + rsTotal.getInt("PORCENTAJE") ;
									
							%>
							<th>
								<table>
									<tr>
										<td>
											<table>
												<tr>
													<td align="left" WIDTH="60" nowrap="nowrap">
													<%
													DecimalFormat formatea = new DecimalFormat("###,###.##");
													out.println(formatea.format(rsTotal.getInt("CANTIDAD")));
													%>
													</td>
													<td align="left" WIDTH="60" nowrap="nowrap">
													<%
													DecimalFormat df = new DecimalFormat("0.00"); 
													out.println(df.format(rsTotal.getFloat("PORCENTAJE")));
													%>
													%</td>
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
							if (totalesCantidad == 0 && totalCantidadFecha == 0) {
								out.println("-");
							} else {
								float resultTotal = ((float ) ( (float ) totalesCantidad / (float )totalCantidadFecha) * 100);
								DecimalFormat df = new DecimalFormat("0.00"); 
								out.println(df.format(resultTotal));
							}
							%>
							%</td>
						</tr>
					</table>
				</div>
			</div>
			<!-- Modal Confirmacion Eliminar -->
			<div class="modal small hide fade" id="myModal" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">X</button>
					<h3 id="myModalLabel">Confirme</h3>
				</div>
				<div class="modal-body">
					<p class="error-text">
						<i class="icon-warning-sign modal-icon"></i>¿ Realmente desea
						modificar el estado ?
					</p>
				</div>
				<div class="modal-footer">
					<button class="btn" data-dismiss="modal" aria-hidden="true">Cancelar</button>
					<button class="btn btn-danger" data-dismiss="modal">Cambiar</button>
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
			$('.demo-cancel-click').click(function() {
				return false;
			});
		});
	</script>

</body>
</html>


