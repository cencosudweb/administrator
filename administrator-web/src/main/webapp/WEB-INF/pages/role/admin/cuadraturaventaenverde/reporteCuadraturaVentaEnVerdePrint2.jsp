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
        <div class="header">
            <h1 class="page-title">Reporte Cuadratura Venta en Verde</h1>
        </div>
        
        <ul class="breadcrumb">
            <li><a href="home">Home</a> <span class="divider">/</span></li>
            <li class="active">Reporte Cuadratura Venta en Verde</li>
        </ul>

        <div class="container-fluid">
	        <div class="row-fluid">
				
				
				
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
								connFecha = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE","system","admin");//
								connFecha.setAutoCommit(false);
								
								SQLFecha = 	" SELECT " +
											" ( select count(*)   from CUADRATURA_OC_VTAV_EOM VTA_EOM  where 1 = 1 AND VTA_EOM.FECHA_CREACION_ORDEN >= '"+starttime2+" 00:00:00' and VTA_EOM.FECHA_CREACION_ORDEN <= '"+starttime2+" 23:59:59') as totalEom, " + 
											" (select count(*)   from CUADRATURA_OC_VTAV_JDA VTA_JDA  where 1 = 1 and VTA_JDA.POFECE >= '"+starttime+"' AND VTA_JDA.POFECE <= '"+starttime+"') as totalJda " +
											" from dual";
											
								
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
							<th>#</th>
							<th align="left">Solicitud EOM&nbsp;</th>
							<th align="left">DO EOM&nbsp;</th>
							<th align="left">F. Creacion DO&nbsp;</th>
							<th align="left">OC JDA&nbsp;</th><!-- mostrar PONUMB (orden de conpra jda)-->
							<th align="left">Log B2B&nbsp;</th><!-- mostrar EX14ERROR (orden de conpra jda)-->
							<th align="left">Despa&nbsp;</th>
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
										
										//"  CASE WHEN (SELECT VTA_JDA.NUMDO FROM CUADRATURA_OC_VTAV_JDA VTA_JDA WHERE VTA_JDA.POFECE >= '"+starttime+"' AND VTA_JDA.POFECE <= '"+starttime+"' AND VTA_JDA.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU) IS NOT NULL THEN 'Encontrado' ELSE 'No Encontrado' END    as ENCONTRADOENJDA, " +
										" CASE WHEN (select  EX14ERROR from CUADRATURA_OC_VTAV_JDA VTA_JDA where 1 = 1 and VTA_JDA.POFECE >= '"+starttime+"' AND VTA_JDA.POFECE <= '"+starttime+"' and VTA_JDA.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU and   VTA_JDA.Ex14error like '%La OC se cargo correctamente%') IS NOT NULL THEN 'Log Envio Encontrado' ELSE 'Log Envio No Encontrado' END as LOGENCONTRADOENJDA," +
										
										" NVL( (SELECT VTA_JDA.DESPA FROM CUADRATURA_OC_VTAV_JDA VTA_JDA WHERE VTA_JDA.POFECE >= '"+starttime+"' AND VTA_JDA.POFECE <= '"+starttime+"' AND VTA_JDA.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU ),'-') AS DESPA, " + 		
										" NVL( (SELECT VTA_JDA.PONUMB FROM CUADRATURA_OC_VTAV_JDA VTA_JDA WHERE VTA_JDA.POFECE >= '"+starttime+"' AND VTA_JDA.POFECE <= '"+starttime+"' AND VTA_JDA.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU ),'OC JDA No Encontrado') AS PONUMB, " + 		
										" NVL( (SELECT VTA_JDA.EX14ERROR FROM CUADRATURA_OC_VTAV_JDA VTA_JDA WHERE VTA_JDA.POFECE >= '"+starttime+"' AND VTA_JDA.POFECE <= '"+starttime+"' AND VTA_JDA.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU ),'Log B2B No Encontrado') AS EX14ERROR " + 
										
										
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

										//"  CASE WHEN (SELECT VTA_JDA.NUMDO FROM CUADRATURA_OC_VTAV_JDA VTA_JDA WHERE VTA_JDA.POFECE >= '"+starttime+"' AND VTA_JDA.POFECE <= '"+starttime+"' AND VTA_JDA.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU) IS NOT NULL THEN 'Encontrado' ELSE 'No Encontrado' END    as ENCONTRADOENJDA, " +
										" CASE WHEN (select  EX14ERROR from CUADRATURA_OC_VTAV_JDA VTA_JDA where 1 = 1 and VTA_JDA.POFECE >= '"+starttime+"' AND VTA_JDA.POFECE <= '"+starttime+"' and VTA_JDA.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU and   VTA_JDA.Ex14error  like '%La OC se cargo correctamente%') IS NOT NULL THEN 'Log Envio Encontrado' ELSE 'Log Envio No Encontrado' END as LOGENCONTRADOENJDA," +

										" NVL( (SELECT VTA_JDA.DESPA FROM CUADRATURA_OC_VTAV_JDA VTA_JDA WHERE VTA_JDA.POFECE >= '"+starttime+"' AND VTA_JDA.POFECE <= '"+starttime+"' AND VTA_JDA.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU ),'-') AS DESPA, " + 		
										" NVL( (SELECT VTA_JDA.PONUMB FROM CUADRATURA_OC_VTAV_JDA VTA_JDA WHERE VTA_JDA.POFECE >= '"+starttime+"' AND VTA_JDA.POFECE <= '"+starttime+"' AND VTA_JDA.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU ),'OC JDA No Encontrado') AS PONUMB, " + 		
										" NVL( (SELECT VTA_JDA.EX14ERROR FROM CUADRATURA_OC_VTAV_JDA VTA_JDA WHERE VTA_JDA.POFECE >= '"+starttime+"' AND VTA_JDA.POFECE <= '"+starttime+"' AND VTA_JDA.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU ),'Log B2B No Encontrado') AS EX14ERROR " + 
												
												
										
										
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

										//"  CASE WHEN (SELECT VTA_JDA.NUMDO FROM CUADRATURA_OC_VTAV_JDA VTA_JDA WHERE VTA_JDA.POFECE >= '"+starttime+"' AND VTA_JDA.POFECE <= '"+starttime+"' AND VTA_JDA.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU) IS NOT NULL THEN 'Encontrado' ELSE 'No Encontrado' END    as ENCONTRADOENJDA, " +
										" CASE WHEN (select  EX14ERROR from CUADRATURA_OC_VTAV_JDA VTA_JDA where 1 = 1 and VTA_JDA.POFECE >= '"+starttime+"' AND VTA_JDA.POFECE <= '"+starttime+"' and VTA_JDA.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU and   VTA_JDA.Ex14error like '%La OC se cargo correctamente%') IS NOT NULL THEN 'Log Envio Encontrado' ELSE 'Log Envio No Encontrado' END as LOGENCONTRADOENJDA," +

										" NVL( (SELECT VTA_JDA.DESPA FROM CUADRATURA_OC_VTAV_JDA VTA_JDA WHERE VTA_JDA.POFECE >= '"+starttime+"' AND VTA_JDA.POFECE <= '"+starttime+"' AND VTA_JDA.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU ),'-') AS DESPA, " + 		
										" NVL( (SELECT VTA_JDA.PONUMB FROM CUADRATURA_OC_VTAV_JDA VTA_JDA WHERE VTA_JDA.POFECE >= '"+starttime+"' AND VTA_JDA.POFECE <= '"+starttime+"' AND VTA_JDA.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU ),'OC JDA No Encontrado') AS PONUMB, " + 		
										" NVL( (SELECT VTA_JDA.EX14ERROR FROM CUADRATURA_OC_VTAV_JDA VTA_JDA WHERE VTA_JDA.POFECE >= '"+starttime+"' AND VTA_JDA.POFECE <= '"+starttime+"' AND VTA_JDA.NUMDO = VTA_EOM.N_ORDEN_DISTRIBU ),'Log B2B No Encontrado') AS EX14ERROR " + 
										
										
										" from CUADRATURA_OC_VTAV_EOM VTA_EOM " + 
										" where 1 = 1 " + 
										" AND VTA_EOM.FECHA_CREACION_ORDEN >= '"+starttime2+" 00:00:00' and VTA_EOM.FECHA_CREACION_ORDEN <= '"+starttime2+" 23:59:59' " +
										" GROUP BY VTA_EOM.N_ORDEN_DISTRIBU " +
										" ORDER BY VTA_EOM.N_ORDEN_DISTRIBU ASC ";
							}
							
							
							
							
							psCumple = conn.prepareStatement(SQLCumple, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
							rsCumple = psCumple.executeQuery();
							conn.commit();
							int h = 0;
							while(rsCumple.next()) {
								// start while Cumple
								// TO_TIMESTAMP ('04/05/17', 'DD-MM-YY')
								h = h +1;
								contarCumple = contarCumple + 1;
						%>
						
								<tr  style="background-color:#8ea9db;color:#FFF;">
									<td><%=contarCumple%></td>
									<td align="left" nowrap="nowrap"><%=rsCumple.getString("SOLICITUDORIGINAL")%></td>
									<td align="left" nowrap="nowrap"><%=rsCumple.getString("N_ORDEN_DISTRIBU")%></td>
									<td align="left" nowrap="nowrap"><%=rsCumple.getString("FECHA_CREACION_ORDEN")%></td>
									<td align="left" nowrap="nowrap"
									<%
								
								
								if ("OC JDA No Encontrado".equals(rsCumple.getString("PONUMB"))) {
								%>
								style="background-color:#D7DF01;color:#FFF;" 
								<% 	
								}  else {
								%>
								style="background-color:#8ea9db;color:#FFF;" 
								<%
								}
								%>
								>
									
									
									<%=rsCumple.getString("PONUMB")%>
									</td>
									<td align="left" nowrap="nowrap"
									<%
								
								
								if ("Log B2B No Encontrado".equals(rsCumple.getString("EX14ERROR"))) {
								%>
								style="background-color:#D7DF01;color:#FFF;" 
								
								
								<% 	
								}  else if ("Log Envio No Encontrado".equals(rsCumple.getString("LOGENCONTRADOENJDA"))) {
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
									<%=rsCumple.getString("EX14ERROR")%></td>
									<td align="left" nowrap="nowrap"><%=rsCumple.getString("DESPA")%></td>
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


