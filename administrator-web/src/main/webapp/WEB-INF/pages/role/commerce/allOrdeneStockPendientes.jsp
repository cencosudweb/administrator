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




%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
  <title>Paris Cencosud</title>
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">


<link rel="stylesheet" type="text/css" href="<c:url value="/js/bootstrap/css/bootstrap.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/css/theme.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/css/premium.css"/>">


    
    
<link rel="stylesheet" type="text/css" href="<c:url value="/js/font-awesome/css/font-awesome.css"/>">

<script src="<c:url value="/js/jquery-1.7.2.min.js"/>" type="text/javascript"></script>

<link rel="shortcut icon" href="<c:url value="/images/favicon.ico"/>">
	
 	<link rel="stylesheet" href="<c:url value="/css/bootstrap-multiselect.css"/>" type="text/css">
    <script type="text/javascript" src="<c:url value="/js/bootstrap-multiselect.js"/>"></script>
    
    
   <script src="<c:url value="/js/admin/call/call.all.js"/>" type="text/javascript"></script>
   <script src="<c:url value="/js/admin/user/user.all.js"/>" type="text/javascript"></script>
   
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/datepicker/jquery.ui.all.css"/>">
    <script src="<c:url value="/js/jquery.ui.core.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/js/jquery.ui.datepicker.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/js/jquery.ui.datepicker-es.js"/>" type="text/javascript"></script>
    
    
    
    
    <link rel="stylesheet" href="<c:url value="/css/jquery.dataTables.min.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/css/buttons.dataTables.min.css"/>"/>

	  <script src="<c:url value="/js/jquery.dataTables.min.js"/>"></script>
	  <script src="<c:url value="/js/dataTables.buttons.min.js"/> "></script>
	  <script src="<c:url value="/js/buttons.flash.min.js"/> "></script>
	  <script src="<c:url value="/js/jszip.min.js"/> "></script>
	  <script src="<c:url value="/js/pdfmake.min.js"/> "></script>
	  <script src="<c:url value="/js/buttons.html5.min.js"/> "></script>
	  <script src="<c:url value="/js/buttons.print.min.js"/> "></script>

  <script>
  
  $(document).ready(function() {
    $('#example').DataTable( {
    	language: {
            "decimal": "",
            "emptyTable": "No hay información",
            "info": "Mostrando _START_ a _END_ de _TOTAL_ Registros",
            "infoEmpty": "Mostrando 0 to 0 of 0 Registros",
            "infoFiltered": "(Filtrado de _MAX_ total registros)",
            "infoPostFix": "",
            "thousands": ",",
            "lengthMenu": "Mostrar _MENU_ Registros",
            "loadingRecords": "Cargando...",
            "processing": "Procesando...",
            "search": "Buscar:",
            "zeroRecords": "Sin resultados encontrados",
            "paginate": {
                "first": "Primero",
                "last": "Ultimo",
                "next": "Siguiente",
                "previous": "Anterior"
            }
        },
        dom: 'Bfrtip',
        buttons: [
        	'copy', 'csv', 'excel', 'print'
        ]
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
    
    <jsp:include page="../../include/banner.jsp" />
	<jsp:include page="../../include/menu.jsp" />
    
    <div class="content">
        <div class="header">
            <h1 class="page-title">Reporte Cuadratura Ordenes Stock Pendientes</h1>
        </div>
        
      
        
        <ul class="breadcrumb">
            <li><a href="home">Home</a> <span class="divider">/</span></li>
            <li class="active">Reporte Cuadratura Ordenes Stock Pendientes<span class="divider">/</span></li>
        </ul>
        

        <div class="container-fluid">
	        <div class="row-fluid">
				<div class="btn-toolbar">
					<div class="btn-group"></div>
				</div>
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="btn-toolbar">
							<form class="form-inline" id="f_all_user" method="get" action="allOrdeneStockPendientes">
							
								<input type="hidden" name="posted" id="posted" value="ok"/>
								<div class="form-group">
								<label>Fecha Desde&nbsp;</label> &nbsp; 
									
									
									<input type="text" value="<% if (request.getParameter("dateInicio") != null) { %><% try { SimpleDateFormat formatoFecha = new SimpleDateFormat("dd/MM/yyyy", Locale.getDefault()); formatoFecha.setLenient(false); formatoFecha.parse(request.getParameter("dateInicio"));%><%=request.getParameter("dateInicio").toString().trim()%><% } catch(ParseException  e) {%><%=DateUtils.restarDiaFecha(currentDate,"1")%><% } %><%  } else {%><%=DateUtils.restarDiaFecha(currentDate,"1") %> <% } %>" readonly name="dateInicio" id="dateInicio" class="form-control" style="width: 200px;"/>
									&nbsp;<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Fecha Hasta&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label> 
									<input type="text" value="<% if (request.getParameter("dateFin") != null) { %><% try { SimpleDateFormat formatoFecha = new SimpleDateFormat("dd/MM/yyyy", Locale.getDefault()); formatoFecha.setLenient(false); formatoFecha.parse(request.getParameter("dateFin"));%><%=request.getParameter("dateFin").toString().trim()%><% } catch(ParseException  e) {%><%=DateUtils.restarDiaFecha(currentDate,"1")%><% } %><%  } else {%><%=DateUtils.restarDiaFecha(currentDate,"1") %> <% } %>" readonly name="dateFin" id="dateFin" class="form-control" style="width: 200px;"/>
										&nbsp;&nbsp;
 								</div>
 								</br>
 								<!--  
								<div class="form-group">
								<label>Fecha Hasta</label></br><input type="text" value="<% if (request.getParameter("dateFin") != null) { %><% try { SimpleDateFormat formatoFecha = new SimpleDateFormat("dd/MM/yyyy", Locale.getDefault()); formatoFecha.setLenient(false); formatoFecha.parse(request.getParameter("dateFin"));%><%=request.getParameter("dateFin").toString().trim()%><% } catch(ParseException  e) {%><%=currentDate%><% } %><%  } else {%><%=currentDate %> <% } %>" readonly name="dateFin" id="dateFin" class="span12" style="width:200px;" />

 								</div>
 								-->
 								<!--
 								<div class="form-group">
								<label>Estado</label></br>
								<select name="estado" id="estado" class="form-control" style="width:150px;">
								<option value="">Todas los Estados</option>
					              	<c:forEach items="${estados}" var="estado" varStatus="status">
					              	<option value="${estado.codigo}" ${param.estado == estado.codigo ? 'selected' : ''}>${estado.description}</option>
					            	</c:forEach>
					            </select>
								
 								</div>
								-->
								
 								<div class="form-group">
 								</div>
								
								
								<div class="btn-toolbar list-toolbar">
								<button class="btn btn-default" id="btn-all-user" ><i class="fa fa-search"></i> Buscar</button>
								</div>
								
								
								
							</form>
						</div>
					</div>
				</div>
				
				<jsp:include page="../../include/messages.jsp" />
				
				<!--
				<span class="label label-success">
				No Despachados 
				</span>
				&nbsp;&nbsp;
				<span class="label label-danger"  style=" background-color:#d9534f">
				No Despachados
				</span>
				&nbsp;&nbsp;
				--> 
				<span class="label label-primary" style=" background-color:#5bc0de"><i class="icon-time"></i> Desde ${starttime} Hasta ${endtime}</span>
				<br></br>
				
				

				
				<!-- /.box-header -->
            	<div class="box-body table-responsive no-padding" style="overflow:scroll;">
	            <table id="example" class="display nowrap" cellspacing="0" width="100%">
			        <thead>
			            <tr>
			                <th>ORDER_ID</th>
			                <th>ORDER_LINE_ID</th>
			                <th>Sku</th>
			                <th>Bodega</th>
			                <th>C. Pendiente</th>
			                <th>Size Desc</th>
			                <th>Shpd Qty</th>
			                <th>Fecha Creacion</th>
			                <th>Tipo Orden</th>
			                <th>Pedido</th>
			                <th>C. Despachada</th>
			                <th>C. Ordenada</th>
			                
			            </tr>
			        </thead>
			        <tfoot>
			            <tr>
			                <th>ORDER_ID</th>
			                <th>ORDER_LINE_ID</th>
			                <th>Sku</th>
			                 <th>Bodega</th>
			                <th>C. Pendiente</th>
			                <th>Size Desc</th>
			                <th>Shpd Qty</th>
			                <th>Fecha Creacion</th>
			                <th>Tipo Orden</th>
			                <th>Pedido</th>
			                <th>C. Despachada</th>
			                <th>C. Ordenada</th>
			            </tr>
			        </tfoot>
			        <tbody>
			        	<c:forEach items="${ordenes}" var="orden" varStatus="status">
							<tr>
								<td>${orden.ordeId}</td>
								<td>${orden.ordeLineId}</td>
								<td>${orden.sku}</td>
								<td>${orden.bodega}</td>
								<td>${orden.cantidadPendiente}</td>
								<td>${orden.sizeDesc}</td>
								<td>${orden.shpdQty}</td>
								<td>${orden.fechaCreacion}</td>
								<td>${orden.tipoOrden}</td>
								<td>${orden.pedido}</td>
								<td>${orden.cantidadDespachada}</td>
								<td>${orden.cantidadOrdenada}</td>
								
							</tr>
						</c:forEach>	
			        </tbody>
	    		</table>
            </div>
		</div>
				
			
	
		
		<script src="<c:url value="/js/Highcharts/highcharts.js"/>"></script>
		<script src="<c:url value="/js/Highcharts/modules/exporting.js"/>"></script>

		<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
		
		
				<!-- Modal Confirmacion Eliminar -->
				<div class="modal small hide fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				    <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
				        <h3 id="myModalLabel">Informe</h3>
				    </div>
				    <div class="modal-body">
				        <p class="error-text"><i class="icon-warning-sign modal-icon"></i>¿ Advertencia ?</p>
				    </div>
				    <div class="modal-footer">
				        <button class="btn" data-dismiss="modal" aria-hidden="true">Cancelar</button>
				        <button class="btn btn-danger"  data-dismiss="modal">Ok</button>
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
    
  </body>
</html>


