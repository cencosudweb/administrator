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
	response.setHeader("Content-Disposition", "inline; filename=" + "PrintEcommerceSoporteVenta.xls");
}
String dateInicio =  request.getParameter("dateInicio");


//out.println("estado="+request.getParameter("estado"));

//out.println("dateInicio="+dateInicio);
//String starttime = DateUtils.turnDate(dateInicio) != null?DateUtils.turnDate(dateInicio):DateUtils.turnDate(currentDate);

String starttime = DateUtils.turnDate3(dateInicio) != null?DateUtils.turnDate3(dateInicio):DateUtils.turnDate3(currentDate);
String starttime2 = DateUtils.turnDate4(dateInicio) != null?DateUtils.turnDate4(dateInicio):DateUtils.turnDate4(currentDate);

//out.println("starttime="+starttime);
//out.println("starttime2="+starttime2);

//out.println("posted="+request.getParameter("posted"));
//out.println("modo="+request.getParameter("modo"));


String tipo = "";
if("U".equalsIgnoreCase(request.getParameter("modo"))){
	tipo = "1";
} else if ("L".equalsIgnoreCase(request.getParameter("modo"))){
	tipo = "2";
} else if ("B".equalsIgnoreCase(request.getParameter("modo"))) {
	tipo = "3";
} else {
	tipo = "4";
}

//out.println("tipo="+tipo);
//out.println("starttime="+starttime);


String prefixclause ="";

if (request.getParameter("solicitud_original") != null && !"".equals(request.getParameter("solicitud_original"))) {
  prefixclause +=" AND VTA_EOM.SOLICITUDORIGINAL LIKE '"+request.getParameter("solicitud_original")+"%'";
}

if (request.getParameter("orden_distribucion") != null && !"".equals(request.getParameter("orden_distribucion")) ) {
  prefixclause +=" AND VTA_EOM.N_ORDEN_DISTRIBU LIKE '"+request.getParameter("orden_distribucion")+"%'";
}
//out.println("prefixclause="+prefixclause);



%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <jsp:include page="../../../include/head.jsp" />
	
 	
  	 <script src="<c:url value="/js/admin/calendar/calendar.all.js"/>" type="text/javascript"></script>
    
  	 <script src="<c:url value="/js/admin/ecommerce/ecommerce.all.js"/>" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/datepicker/jquery.ui.all.css"/>"/>
    <script src="<c:url value="/js/jquery.ui.core.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/js/jquery.ui.datepicker.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/js/jquery.ui.datepicker-es.js"/>" type="text/javascript"></script>
    
	
		<script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js" type="text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">
	<script type="text/javascript">
	 

	 $(document).ready(function() {
		    $('#example').DataTable( {
		        "order": [[ 0, "desc" ]],
				
				"scrollY":        "200px",
				"scrollCollapse": true,
				"paging":   false,
				"ordering": true,
				"info":     true,
				"searching": true,
				
				"language": {
					"lengthMenu": "Display _MENU_ records per page",
					"zeroRecords": "Nothing found - sorry",
					"info": "Mostrar page _PAGE_ de _PAGES_",
					"infoEmpty": "No records available",
					"infoFiltered": "(filtered from _MAX_ total records)",
					"decimal":        "",
					"emptyTable":     "No hay datos disponibles en la tabla",
					"info":           "Mostrar _START_ a _END_ de _TOTAL_ registros",
					"infoEmpty":      "Mostrar 0 a 0 de 0 registros",
					"infoFiltered":   "(filtered from _MAX_ total registros)",
					"infoPostFix":    "",
					"thousands":      ",",
					"lengthMenu":     "Mostrar _MENU_ registros",
					"loadingRecords": "Loading...",
					"processing":     "Processing...",
					"search":         "Buscar:",
					"zeroRecords":    "No se encontraron registros coincidentes",
					"paginate": {
						"first":      "Primero",
						"last":       "Ultimo",
						"next":       "Siguiente",
						"previous":   "Anterior"
					},
					"aria": {
						"sortAscending":  ": activate to sort column ascending",
						"sortDescending": ": activate to sort column descending"
					}
	
					
				}
		    } );
		} );
    </script>
   
    
    


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
    
    <div class="content">
        <div class="header">
            <h1 class="page-title">Reporte Cuadratura E-Commerce / Soporte Venta</h1>
        </div>
        
        
       

        <div class="container-fluid">
	        <div class="row-fluid">
				<div class="btn-toolbar">
					<button id="exportButton" class="btn"><i class="icon-book"></i> Exportar a Excel</button>
					<div class="btn-group"></div>
				</div>
				<br>
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="btn-toolbar">
							<form class="form-inline" id="f_all_user" method="get" action="reporteCuadraturaEcommerceSoporteVenta">
								<div class="form-group">
					            <label>Fecha EOM</label><br>
								<input type="text" value="<% if (request.getParameter("dateInicio") != null) { %><% try { SimpleDateFormat formatoFecha = new SimpleDateFormat("dd/MM/yyyy", Locale.getDefault()); formatoFecha.setLenient(false); formatoFecha.parse(request.getParameter("dateInicio"));%><%=request.getParameter("dateInicio").toString().trim()%><% } catch(ParseException  e) {%><%=currentDate%><% } %><%  } else {%><%=currentDate %> <% } %>" readonly name="dateInicio" id="dateInicio" class="form-control span12" style="width:150px;" />
								</div>
								<div class="btn-toolbar list-toolbar">
								<button class="btn btn-default" id="btn-all-user" ><i class="fa fa-search"></i> Buscar</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				
				<jsp:include page="../../../include/messages.jsp" />
				
				
				 <%
        Connection connHora = null;
		PreparedStatement psHora = null;
		ResultSet rsHora = null;
		String SQLHora = null; 
		int cant_ecommerce = 0;
		int cant_soporte_venta = 0;
		int cant_no_register = 0;
		try{
			Class.forName("oracle.jdbc.OracleDriver").newInstance();
			connHora = DriverManager.getConnection("jdbc:oracle:thin:@172.18.163.15:1521/XE","kpiweb","kpiweb");//
			
			//Class.forName("org.postgresql.Driver").newInstance();
			//connHora = DriverManager.getConnection("jdbc:postgresql://ec2-52-38-214-135.us-west-2.compute.amazonaws.com:5432/postgres","postgres","cencosud2017.,XxX");//
			
			connHora.setAutoCommit(false);
			
			SQLHora = 	" SELECT " +
					" ( select count(*) from CUADRATURA_ECOMMERCE  where 1 = 1 AND fectrantsl >= '"+starttime+"' and fectrantsl <= '"+starttime+"' ) as cant_ecommerce, " + 

					//" ( select count(*) from CUADRATURA_JPDTOTDAD  where 1 = 1 AND FECHA >= '"+starttime+"' and FECHA <= '"+starttime+"' ) as cant_soporte_venta,  " +
					
					" ( select count(*) from ECOMMERCE_SOPORTE_VENTA  where 1 = 1 AND fectrantsl >= '"+starttime+"' and fectrantsl <= '"+starttime+"' AND TIPO_ESTADO = 1) as cant_soporte_venta,  " +
							
					" ( select count(*) from ECOMMERCE_SOPORTE_VENTA  where 1 = 1 AND fectrantsl >= '"+starttime+"' and fectrantsl <= '"+starttime+"' AND TIPO_ESTADO = 0) as cant_no_register  " +
					
					" from dual";
			out.print("<br>");
			out.println("SQLHora="+SQLHora);
			out.print("<br>");
			psHora = connHora.prepareStatement(SQLHora, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			rsHora = psHora.executeQuery();
			connHora.commit();
			int contarHora = 0;
			while(rsHora.next()) {
				contarHora = contarHora + 1;
				cant_ecommerce = cant_ecommerce + rsHora.getInt("cant_ecommerce");
				cant_soporte_venta = cant_soporte_venta + rsHora.getInt("cant_soporte_venta");
				cant_no_register = cant_no_register + rsHora.getInt("cant_no_register");
				
				DecimalFormat formatea = new DecimalFormat("###,###.##");
         %>
				<center>
				<a class="btn btn-large btn-info" href="#myModal" modo='U' iduser="<%=rsHora.getInt("cant_ecommerce") %>" title="Deshabilitar" role="button" data-toggle="modal">
				<i class="icon-flag icon-2x pull-left"></i> &nbsp;E-Commerce&nbsp;&nbsp;<br>Cantidad <% out.println(formatea.format(rsHora.getInt("cant_ecommerce")));%></a>
				&nbsp;<i class="icon-signout"></i> &nbsp;
				<a class="btn btn-large btn-info" href="#myModal" modo='L' iduser="<%=rsHora.getInt("cant_soporte_venta") %>" title="Deshabilitar" role="button" data-toggle="modal">
				<i class="icon-flag icon-2x pull-left"></i> &nbsp;Encontrados S.V.&nbsp;<br>Cantidad  <% out.println(formatea.format(rsHora.getInt("cant_soporte_venta")));%></a>
				&nbsp;<i class="icon-signout"></i> &nbsp;
				<a class="btn btn-large btn-info" href="#myModal" modo='B' iduser="<%=rsHora.getInt("cant_no_register") %>" title="Deshabilitar" role="button" data-toggle="modal">
				<i class="icon-flag icon-2x pull-left"></i> &nbsp;No Encontrados S.V.<br>Cantidad <% out.println(formatea.format(rsHora.getInt("cant_no_register")));%></a>
				
				<!--		
				
				<span class="label label-primary" style=" background-color:#5bc0de;"><a href="#myModal" class="lockUnlock" modo='U' iduser="<%=rsHora.getInt("cant_ecommerce") %>" title="Deshabilitar" role="button" data-toggle="modal" style="margin-right: 15px"><i class="icon-flag-alt icon-4x"></i> <span style="color:#FFFFFF">Cantidad E-Commerce <i class="icon-share-alt"></i> <% out.println(formatea.format(rsHora.getInt("cant_ecommerce")));%></span></a></span>
				&nbsp;<i class="icon-signout"></i> &nbsp;
				<span class="label label-success" style=" color:#FFFFFF; background-color:#2a2a2f;"><a href="#myModal" class="lockUnlock" modo='L' iduser="<%=rsHora.getInt("cant_soporte_venta") %>" title="Deshabilitar" role="button" data-toggle="modal" style="margin-right: 15px"><i class="icon-flag-alt icon-4x"></i> <span style="color:#FFFFFF">Encontrados de Ecommerce en Soporte Venta <i class="icon-share-alt"></i> <% out.println(formatea.format(rsHora.getInt("cant_soporte_venta")));%></span> </a></span>
				&nbsp;
				<i class="icon-download"></i>
				
				<span class="label label-danger" style=" color:#FFFFFF; background-color:#d9534f"><a href="#myModal" class="lockUnlock" modo='B' iduser="<%=rsHora.getInt("cant_no_register") %>" title="Deshabilitar" role="button" data-toggle="modal" style="margin-right: 15px"><span style="color:#FFFFFF">No Encontrados de Ecommerce en Soporte Venta <i class="icon-share-alt"></i> <% out.println(formatea.format(rsHora.getInt("cant_no_register")));%></span> </a></span>
				-->
				</center>
				<br>
				
		<%
		
			}
		} catch (SQLException exQL) {
			connHora.rollback();
			out.println("Error SQL: " + exQL.getMessage());	
		} catch (Exception ex) {
			connHora.rollback();
			out.println("Error: " + ex.getMessage());
		} finally {
			if (rsHora != null) rsHora.close();
			if (psHora != null) psHora.close();
			if (connHora != null) connHora.close();
		} 	
		%>		
		<%
		
		//out.println("cant_ecommerce="+cant_ecommerce);
		//out.println("cant_soporte_venta="+cant_soporte_venta);
		//out.println("cant_no_register="+cant_no_register);
		
		%>				
		<br>
		
		
		<!--
		<%
		if ( cant_ecommerce == ( cant_no_register + cant_soporte_venta) ) {
		%>
		<div class="alert alert-success">
				<button type="button" class="close" data-dismiss="alert">X</button>
				${msg}
				</div>
		<%
		} else {
		%>		
				<div class="alert alert-error">
				<button type="button" class="close" data-dismiss="alert">X</button>
				${msg}
				</div>
		<%
		}
		%>
		</br>
		-->
		<script src="https://code.highcharts.com/highcharts.js"></script>
		<script src="https://code.highcharts.com/highcharts-3d.js"></script>
		<script src="https://code.highcharts.com/modules/exporting.js"></script>
		
		

		<div id="container" style="height: 400px"></div>
		
		<%
		if (cant_ecommerce > 0 || cant_no_register >0 || cant_soporte_venta>0) {
		%>
		<script type="text/javascript">

			Highcharts.chart('container', {
			    chart: {
			        type: 'pie',
			        options3d: {
			            enabled: true,
			            alpha: 45
			        }
			    },
			    title: {
			        text: 'Reporte Cuadratura E-Commerce / Soporte Venta'
			    },
			    subtitle: {
			        text: 'E-Commerce / Encontrados Soporte Venta / No Encontrados Soporte Venta'
			    },
			    plotOptions: {
			        pie: {
			            innerSize: 100,
			            depth: 45
			        }
			    },
			    series: [{
			        name: 'Cantidades',
			        data: [
			            ['E-Commerce', <%=cant_ecommerce%>],
			            ['Encontrados Soporte Venta', <%=cant_soporte_venta%>],
			            ['No Encontrados Soporte Venta', <%=cant_no_register%>]
			            
			        ]
			    }]
			});
		</script>
		
							<br></br>
							
					<% 
					if (request.getParameter("posted")!= null) {
					%>		
					<div class="well" style="height:300px; overflow: scroll;">
				    <table id="example"  class="display" cellspacing="0" width="100%">
				      <thead>
				        <tr>
				          <th>#</th>
				          <th>FECHA</th>
				          <th>NUMCTLTSL</th>
				          <th>NUMTERTSL</th>
				          <th>NUMTRANTSL</th>
				          <th>SKU</th>
				          <th>TOTARTTSL</th>
				        </tr>
				      </thead>
				      <tbody>
				      
				      <%
				        Connection connHora2 = null;
						PreparedStatement psHora2 = null;
						ResultSet rsHora2 = null;
						String SQLHora2 = null; 
						int totalCantidadHora2 = 0;
						try{
							Class.forName("oracle.jdbc.OracleDriver").newInstance();
							connHora2 = DriverManager.getConnection("jdbc:oracle:thin:@172.18.163.15:1521/XE","kpiweb","kpiweb");//
							
							//Class.forName("org.postgresql.Driver").newInstance();
							//connHora = DriverManager.getConnection("jdbc:postgresql://ec2-52-38-214-135.us-west-2.compute.amazonaws.com:5432/postgres","postgres","cencosud2017.,XxX");//
							
							
							connHora2.setAutoCommit(false);
							
							if ("1".equals(tipo)) {
								SQLHora2 = 	" select ID, FECTRANTSL as FECHA,NUMCTLTSL, NUMTERTSL,NUMTRANTSL,SKU,PXQ as TOTARTTSL  from CUADRATURA_ECOMMERCE  where 1 = 1 AND fectrantsl >= '"+starttime+"' and fectrantsl <= '"+starttime+"' ";
							} else if ("2".equals(tipo)) {
								//SQLHora2 = 	" select ID, FECHA,LOLOCA AS NUMCTLTSL, NUMTERTSL,NUMTRANTSL,SKU,TOTARTTSL  from CUADRATURA_JPDTOTDAD  where 1 = 1 AND FECHA >= '"+starttime+"' and FECHA <= '"+starttime+"' ";
								SQLHora2 = 	" select ID, FECTRANTSL as FECHA,NUMCTLTSL, NUMTERTSL,NUMTRANTSL,SKU,PXQ AS TOTARTTSL  from ECOMMERCE_SOPORTE_VENTA  where 1 = 1 AND fectrantsl >= '"+starttime+"' and fectrantsl <= '"+starttime+"' AND TIPO_ESTADO = 1 ";
								
								
							} else if ("3".equals(tipo)) {
								SQLHora2 = 	" select ID, FECTRANTSL as FECHA,NUMCTLTSL, NUMTERTSL,NUMTRANTSL,SKU,PXQ as TOTARTTSL  from ECOMMERCE_SOPORTE_VENTA  where 1 = 1 AND fectrantsl >= '"+starttime+"' and fectrantsl <= '"+starttime+"' AND TIPO_ESTADO = 0 ";
							} else {
								SQLHora2 = 	" select ID, FECTRANTSL AS FECHA,NUMCTLTSL, NUMTERTSL,NUMTRANTSL,SKU,PXQ as TOTARTTSL  from ECOMMERCE_SOPORTE_VENTA  where 1 = 1 AND fectrantsl >= '"+starttime+"' and fectrantsl <= '"+starttime+"' AND TIPO_ESTADO = 11 ";
							}
							
							out.print("<br>");
							out.println("SQLHora2="+SQLHora2);
							out.print("<br>");
							psHora2 = connHora2.prepareStatement(SQLHora2, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
							rsHora2 = psHora2.executeQuery();
							connHora2.commit();
							int contarHora2 = 0;
							while(rsHora2.next()) {
								contarHora2 = contarHora2 + 1;
								DecimalFormat formatea = new DecimalFormat("###,###.##");
								
				
			
         					%>
				      
					     
					            <tr>
						          <td><%=contarHora2 %></td>
						          <td><%=rsHora2.getString("FECHA") %></td>
						          <td><%=rsHora2.getInt("NUMCTLTSL") %></td>
						          <td><%=rsHora2.getInt("NUMTERTSL") %></td>
						          <td><%=rsHora2.getInt("NUMTRANTSL") %></td>
						          <td><%=rsHora2.getInt("SKU") %></td>
						          <td><%=formatea.format(rsHora2.getInt("TOTARTTSL") )%></td>
						        </tr>
						<%
						}
					} catch (SQLException exQL) {
						connHora2.rollback();
						out.println("Error SQL: " + exQL.getMessage());	
					} catch (Exception ex) {
						connHora2.rollback();
						out.println("Error: " + ex.getMessage());
					} finally {
						if (rsHora2 != null) rsHora2.close();
						if (psHora2 != null) psHora2.close();
						if (connHora2 != null) connHora2.close();
					} 	
						%>        
				      </tbody>
				    </table>
				</div>
				<%
					}
				%>	
				<br>	
				<form method="get"  action="reporteCuadraturaEcommerceSoporteVenta" id="f_lock">
							<input type="hidden" name="posted" id="posted" value="ok"/>
		        			<input type="hidden" name="id" id="id_user"/>
		        			<input type="hidden" name="modo" id="modo"/>
		        			<input type="hidden" name="dateInicio" id ="dateInicio2" value="<% if (request.getParameter("dateInicio") != null) { %><% try { SimpleDateFormat formatoFecha = new SimpleDateFormat("dd/MM/yyyy", Locale.getDefault()); formatoFecha.setLenient(false); formatoFecha.parse(request.getParameter("dateInicio"));%><%=request.getParameter("dateInicio").toString().trim()%><% } catch(ParseException  e) {%><%=currentDate%><% } %><%  } else {%><%=currentDate %> <% } %>"/>
				</form>	
				</div>
				<!-- 				<div class="pagination"> -->
<!-- 				    <ul> -->
<!-- 				        <li><a href="#">Prev</a></li> -->
<!-- 				        <li><a href="#">1</a></li> -->
<!-- 				        <li><a href="#">2</a></li> -->
<!-- 				        <li><a href="#">3</a></li> -->
<!-- 				        <li><a href="#">4</a></li> -->
<!-- 				        <li><a href="#">Next</a></li> -->
<!-- 				    </ul> -->
<!-- 				</div> -->
				
				<br>
				<%
		}
		%>
				
						

						
			<!---->
	
		
		
		
				<!-- Modal Confirmacion Eliminar -->
				<div class="modal small hide fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				    <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
				        <h3 id="myModalLabel">Informe</h3>
				    </div>
				    <div class="modal-body">
				        <p class="error-text"><i class="icon-info-sign modal-icon"></i>¿  Realmente desea consultar el detalle  ?</p>
				    </div>
				    <div class="modal-footer">
				        <button class="btn" data-dismiss="modal" aria-hidden="true">Cancelar</button>
				        <button class="btn btn-danger"  data-dismiss="modal">Ok</button>
				    </div>
				</div>
				<jsp:include page="../../../include/footer.jsp" />
	        </div>
        </div>
    </div>
	
	
		<link rel="stylesheet" type="text/css" href="<c:url value="/css/all.min.css"/>" />
<script type="text/javascript" src="<c:url value="/js/shieldui-all.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/jszip.min.js"/>"></script>

	<script type="text/javascript">
    jQuery(function ($) {
        $("#exportButton").click(function () {
            // parse the HTML table element having an id=exportTable
            var dataSource = shield.DataSource.create({
                data: "#example",
                schema: {
                    type: "table",
                    fields: {
                    	FECHA: { type: String },
                    	NUMCTLTSL: { type: String },
                    	NUMTERTSL: { type: String },
                    	NUMTRANTSL: { type: String },
                    	SKU: { type: String },
                    	TOTARTTSL: { type: String }
                    }
                }
            });

            // when parsing is done, export the data to Excel
            dataSource.read().then(function (data) {
                new shield.exp.OOXMLWorkbook({
                    author: "PrepBootstrap",
                    worksheets: [
                        {
                            name: "PrepBootstrap Table",
                            rows: [
                                {
                                    cells: [
                                        {
                                            style: {
                                                bold: true
                                            },
                                            type: String,
                                            value: "FECHA"
                                        },
                                        {
                                            style: {
                                                bold: true
                                            },
                                            type: String,
                                            value: "NUMCTLTSL"
                                        },
                                        {
                                            style: {
                                                bold: true
                                            },
                                            type: String,
                                            value: "NUMTERTSL"
                                        },
                                        {
                                            style: {
                                                bold: true
                                            },
                                            type: String,
                                            value: "NUMTRANTSL"
                                        },
                                        {
                                            style: {
                                                bold: true
                                            },
                                            type: String,
                                            value: "SKU"
                                        },
                                        {
                                            style: {
                                                bold: true
                                            },
                                            type: String,
                                            value: "TOTARTTSL"
                                        }
                                    ]
                                }
                            ].concat($.map(data, function(item) {
                                return {
									
                                    cells: [
                                        { type: String, value: item.FECHA },
                                        { type: String, value: item.NUMCTLTSL },
                                        { type: String, value: item.NUMTERTSL },
                                        { type: String, value: item.NUMTRANTSL },
                                        { type: String, value: item.SKU },
                                        { type: String, value: item.TOTARTTSL }
										
                                    ]
                                };
                            }))
                        }
                    ]
                }).saveAs({
                    fileName: "DowloadExcel"
                });
            });
        });
    });
</script>

    <script src="<c:url value="/js/bootstrap/js/bootstrap.js"/>"></script>
    <script type="text/javascript">
        $("[rel=tooltip]").tooltip();
        $(function() {
            $('.demo-cancel-click').click(function(){return false;});
        });
    </script>
    
  </body>
</html>


