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
    
    
    <div class="content" style=" border:soli">
        <div class="container-fluid">
	        <div class="row-fluid">
				<div class="btn-toolbar">
					
                	
					<div class="btn-group"></div>
				</div>
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="btn-toolbar">
							
						</div>
					</div>
				</div>
				
				<div class="well" style="overflow:scroll; height:600px">
					
					<table id="dataTables-example"  width="100%"  border="0" cellspacing="0" cellpadding="0" style="font-size:13px">
					
						
						<tr bgcolor="#305496" style="text-align:left; color:#FFF; font-size:13px; border: solid 1px #a6a6a6;">
							<th></th>
							<th align="left">Total EOM&nbsp;</th>
							<th align="left">Total JDA&nbsp;</th>
							<th align="left">Opciones&nbsp;</th>
						</tr>
						
						<tr style="background-color:#8ea9db;color:#FFF; " >
							<td></td>
							<td align="left" nowrap="nowrap">-</td>
							<td align="left" nowrap="nowrap">-</td>
							<td align="left" nowrap="nowrap">
							<a target="_blank" href="inconsistenciaJda?dateInicio=<% if (request.getParameter("dateInicio") != null) { %><% try { SimpleDateFormat formatoFecha = new SimpleDateFormat("dd/MM/yyyy", Locale.getDefault()); formatoFecha.setLenient(false); formatoFecha.parse(request.getParameter("dateInicio"));%><%=request.getParameter("dateInicio").toString().trim()%><% } catch(ParseException  e) {%><%=currentDate%><% } %><%  } else {%><%=currentDate %> <% } %>" title="Inconsistencia" ><i class="icon-signin"></i>Inconsistencia en JDA</a><br />
							</td>
						</tr>

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
						
						
						int contarCumple = 0;
								
						try{
							Class.forName("oracle.jdbc.OracleDriver").newInstance();
							conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE","system","admin");//
							conn.setAutoCommit(false);
							
							if ("Encontrado".equals(request.getParameter("estado"))) {
								SQLCumple = " SELECT " + 
										"  (select VTA_EOM_2.SOLICITUDORIGINAL from CUADRATURA_OC_VTAV_EOM VTA_EOM_2 where VTA_EOM_2.N_ORDEN_DISTRIBU = VTA_EOM.N_ORDEN_DISTRIBU) AS SOLICITUDORIGINAL, " +
										"  VTA_EOM.N_ORDEN_DISTRIBU, " +
										"  (select to_char(REPLACE(VTA_EOM_2.FECHA_CREACION_ORDEN,',000000000',''))  from CUADRATURA_OC_VTAV_EOM VTA_EOM_2 where VTA_EOM_2.N_Orden_Distribu = VTA_EOM.N_ORDEN_DISTRIBU) AS FECHA_CREACION_ORDEN, " +
										"  (select VTA_EOM_2.CANCELADO from CUADRATURA_OC_VTAV_EOM VTA_EOM_2 where VTA_EOM_2.N_ORDEN_DISTRIBU = VTA_EOM.N_ORDEN_DISTRIBU) AS CANCELADO, " +
										"  CASE WHEN (SELECT VTA_JDA.NUMDO FROM CUADRATURA_OC_VTAV_JDA VTA_JDA WHERE VTA_JDA.POFECE >= '"+starttime+"' AND VTA_JDA.POFECE <= '"+starttime+"' AND VTA_JDA.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU) IS NOT NULL THEN 'Encontrado' ELSE 'No Encontrado' END    as ENCONTRADOENJDA, " +
										
										"  (SELECT VTA_JDA.POVNUM FROM CUADRATURA_OC_VTAV_JDA VTA_JDA WHERE VTA_JDA.POFECE >= '"+starttime+"' AND VTA_JDA.POFECE <= '"+starttime+"' AND VTA_JDA.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU) AS POVNUM, " +
										"  (SELECT VTA_JDA.NUMDO FROM CUADRATURA_OC_VTAV_JDA VTA_JDA WHERE VTA_JDA.POFECE >= '"+starttime+"' AND VTA_JDA.POFECE <= '"+starttime+"' AND VTA_JDA.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU) AS NUMDO, " +
										"  (SELECT VTA_JDA.POFECE FROM CUADRATURA_OC_VTAV_JDA VTA_JDA WHERE VTA_JDA.POFECE >= '"+starttime+"' AND VTA_JDA.POFECE <= '"+starttime+"' AND VTA_JDA.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU) AS POFECE, " +
										"  (SELECT VTA_JDA.EX14ERROR FROM CUADRATURA_OC_VTAV_JDA VTA_JDA WHERE VTA_JDA.POFECE >= '"+starttime+"' AND VTA_JDA.POFECE <= '"+starttime+"' AND VTA_JDA.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU) AS EX14ERROR, " +
										"  (SELECT VTA_JDA.POHORE FROM CUADRATURA_OC_VTAV_JDA VTA_JDA WHERE VTA_JDA.POFECE >= '"+starttime+"' AND VTA_JDA.POFECE <= '"+starttime+"' AND VTA_JDA.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU) AS POHORE " +
										
										
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
										"  CASE WHEN (SELECT VTA_JDA.NUMDO FROM CUADRATURA_OC_VTAV_JDA VTA_JDA WHERE VTA_JDA.POFECE >= '"+starttime+"' AND VTA_JDA.POFECE <= '"+starttime+"' AND VTA_JDA.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU) IS NOT NULL THEN 'Encontrado' ELSE 'No Encontrado' END    as ENCONTRADOENJDA, " +
										
										"  (SELECT VTA_JDA.POVNUM FROM CUADRATURA_OC_VTAV_JDA VTA_JDA WHERE VTA_JDA.POFECE >= '"+starttime+"' AND VTA_JDA.POFECE <= '"+starttime+"' AND VTA_JDA.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU) AS POVNUM, " +
										"  (SELECT VTA_JDA.NUMDO FROM CUADRATURA_OC_VTAV_JDA VTA_JDA WHERE VTA_JDA.POFECE >= '"+starttime+"' AND VTA_JDA.POFECE <= '"+starttime+"' AND VTA_JDA.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU) AS NUMDO, " +
										"  (SELECT VTA_JDA.POFECE FROM CUADRATURA_OC_VTAV_JDA VTA_JDA WHERE VTA_JDA.POFECE >= '"+starttime+"' AND VTA_JDA.POFECE <= '"+starttime+"' AND VTA_JDA.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU) AS POFECE, " +
										"  (SELECT VTA_JDA.EX14ERROR FROM CUADRATURA_OC_VTAV_JDA VTA_JDA WHERE VTA_JDA.POFECE >= '"+starttime+"' AND VTA_JDA.POFECE <= '"+starttime+"' AND VTA_JDA.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU) AS EX14ERROR, " +
										"  (SELECT VTA_JDA.POHORE FROM CUADRATURA_OC_VTAV_JDA VTA_JDA WHERE VTA_JDA.POFECE >= '"+starttime+"' AND VTA_JDA.POFECE <= '"+starttime+"' AND VTA_JDA.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU) AS POHORE " +
										
										
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
										"  CASE WHEN (SELECT VTA_JDA.NUMDO FROM CUADRATURA_OC_VTAV_JDA VTA_JDA WHERE VTA_JDA.POFECE >= '"+starttime+"' AND VTA_JDA.POFECE <= '"+starttime+"' AND VTA_JDA.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU) IS NOT NULL THEN 'Encontrado' ELSE 'No Encontrado' END    as ENCONTRADOENJDA, " +
										
										"  (SELECT VTA_JDA.POVNUM FROM CUADRATURA_OC_VTAV_JDA VTA_JDA WHERE VTA_JDA.POFECE >= '"+starttime+"' AND VTA_JDA.POFECE <= '"+starttime+"' AND VTA_JDA.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU) AS POVNUM, " +
										"  (SELECT VTA_JDA.NUMDO FROM CUADRATURA_OC_VTAV_JDA VTA_JDA WHERE VTA_JDA.POFECE >= '"+starttime+"' AND VTA_JDA.POFECE <= '"+starttime+"' AND VTA_JDA.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU) AS NUMDO, " +
										"  (SELECT VTA_JDA.POFECE FROM CUADRATURA_OC_VTAV_JDA VTA_JDA WHERE VTA_JDA.POFECE >= '"+starttime+"' AND VTA_JDA.POFECE <= '"+starttime+"' AND VTA_JDA.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU) AS POFECE, " +
										"  (SELECT VTA_JDA.EX14ERROR FROM CUADRATURA_OC_VTAV_JDA VTA_JDA WHERE VTA_JDA.POFECE >= '"+starttime+"' AND VTA_JDA.POFECE <= '"+starttime+"' AND VTA_JDA.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU) AS EX14ERROR, " +
										"  (SELECT VTA_JDA.POHORE FROM CUADRATURA_OC_VTAV_JDA VTA_JDA WHERE VTA_JDA.POFECE >= '"+starttime+"' AND VTA_JDA.POFECE <= '"+starttime+"' AND VTA_JDA.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU) AS POHORE " +
																				
										
										" from CUADRATURA_OC_VTAV_EOM VTA_EOM " + 
										" where 1 = 1 " + 
										" AND VTA_EOM.FECHA_CREACION_ORDEN >= '"+starttime2+" 00:00:00' and VTA_EOM.FECHA_CREACION_ORDEN <= '"+starttime2+" 23:59:59' " +
										" GROUP BY VTA_EOM.N_ORDEN_DISTRIBU " +
										" ORDER BY VTA_EOM.N_ORDEN_DISTRIBU ASC ";
							}
							
							//out.println("SQLCumple="+SQLCumple);
							//out.print("<br>");
							
							
							
							
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
											alert('ocultar_cumplimiento_<%=contarCumple%>');
											$("#cumplimiento_<%=contarCumple%>").hide('slow', function() {});
											$("#mostrar_cumplimiento_<%=contarCumple%>").show('slow', function() {});
											$("#ocultar_cumplimiento_<%=contarCumple%>").hide('slow', function() {});
										});
										
										$("#mostrar_cumplimiento_<%=contarCumple%>").click(function() {
											alert('mostrar_cumplimiento_<%=contarCumple%>');
												
											$("#cumplimiento_<%=contarCumple%>").show('slow', function() {});
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
									<td><%=contarCumple %></td>
									<td align="left" nowrap="nowrap"><%=rsCumple.getString("SOLICITUDORIGINAL")%></td>
									<td align="left" nowrap="nowrap"><%=rsCumple.getString("N_ORDEN_DISTRIBU")%></td>
									<td align="left" nowrap="nowrap"><%=rsCumple.getString("FECHA_CREACION_ORDEN")%></td>
									<td align="left" nowrap="nowrap"><%=rsCumple.getString("CANCELADO")%></td>
									<td align="left" nowrap="nowrap"><%=rsCumple.getString("ENCONTRADOENJDA")%></td>
								</tr>
								
								
							
								<!-- Segunda Fila Cumplimiento -->
								<%
								%>
						
									<script type="text/javascript">
										
									</script>
								
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
										Povnum
										<table>
											<tr>
												<td nowrap="nowrap" style="text-align:left;font-size:13px;color:#000000"><%=rsCumple.getString("POVNUM")%></td>
											</tr>
										</table>
										</td>	 
										<td nowrap="nowrap" style="text-align:left;font-size:13px;color:#000000">
										Numero
										<table>
											<tr>
												<td nowrap="nowrap" style="text-align:left;font-size:13px;color:#000000"><%=rsCumple.getString("NUMDO")%></td>
											</tr>
										</table>
										</td> 
										<td nowrap="nowrap" style="text-align:left;font-size:13px;color:#000000">
										Fecha
										<table>
											<tr>
												<td nowrap="nowrap" style="text-align:left;font-size:13px;color:#000000"><%=rsCumple.getString("POFECE")%></td>
											</tr>
										</table>
										</td>	 
										<td nowrap="nowrap" style="text-align:left;font-size:13px;color:#000000">
										Mensaje
										<table>
											<tr>
												<td nowrap="nowrap" style="text-align:left;font-size:13px;color:#000000"><%=rsCumple.getString("EX14ERROR")%></td>
											</tr>
										</table>
										</td>	 
										<td nowrap="nowrap" style="text-align:left;font-size:13px;color:#000000">
										Cuenta
										<table>
											<tr>
												<td nowrap="nowrap" style="text-align:left;font-size:13px;color:#000000"><%=rsCumple.getString("POHORE")%></td>
											</tr>
										</table>
										</td>	 
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
				        <p class="error-text"><i class="icon-warning-sign modal-icon"></i>� Realmente desea modificar el estado ?</p>
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


