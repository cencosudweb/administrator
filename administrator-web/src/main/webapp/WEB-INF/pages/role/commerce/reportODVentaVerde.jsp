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
<%@ page import="com.cencosud.administrator.dto.users.GraficosDTO"%>
<%@ page import="com.cencosud.administrator.web.utils.DateUtils"%>
<%@ page import="com.cencosud.administrator.web.utils.InicializarMIS"%>
<%
InicializarMIS inicializarMIS = new InicializarMIS();
try {
	inicializarMIS.init();
} catch (Exception e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}


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


//out.println("estado="+request.getParameter("estado"));

//out.println("dateInicio="+dateInicio);
//String starttime = DateUtils.turnDate(dateInicio) != null?DateUtils.turnDate(dateInicio):DateUtils.turnDate(currentDate);

String starttime = DateUtils.turnDate3(dateInicio) != null?DateUtils.turnDate3(dateInicio):DateUtils.turnDate3(currentDate);
String starttime2 = DateUtils.turnDate4(dateInicio) != null?DateUtils.turnDate4(dateInicio):DateUtils.turnDate4(currentDate);

//out.println("starttime="+starttime);
//out.println("starttime2="+starttime2);

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
            'copy', 'excel', 'print'
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
            <h1 class="page-title">Reporte Cuadratura Venta en Verde PD</h1>
        </div>
        
      
        
        <ul class="breadcrumb">
            <li><a href="home">Home</a> <span class="divider">/</span></li>
            <li class="active">Reporte Cuadratura Venta en Verde PD<span class="divider">/</span></li>
        </ul>
        

        <div class="container-fluid">
	        <div class="row-fluid">
				<div class="btn-toolbar">
					<div class="btn-group"></div>
				</div>
				<br>
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="btn-toolbar">
							<form class="form-inline" id="f_all_user" method="get" action="reportODVentaVerde">
							
								<input type="hidden" name="posted" id="posted" value="ok"/>
								<div class="form-group">
								<label>Estado&nbsp;</label>&nbsp;&nbsp;
								<select name="estado" id="estado" class="form-control" style="width:150px;">
								
									<option value="Todas">Todas los Estados</option>
					              <c:forEach items="${estados}" var="estado" varStatus="status">
					              	<option value="${estado.codigo}" ${param.estado == estado.codigo ? 'selected' : ''}>${estado.description}</option>
					              </c:forEach>
					              <!--  
					              <option value="Todas">Todas los Estados</option>
					              <option value="Uno">Con OD</option>
					              <option value="Dos">Sin OD</option>
					              -->
					            </select>
					            &nbsp;&nbsp;
					            <label>&nbsp;Fecha EOM&nbsp;</label>
					            &nbsp;&nbsp;
								<input type="text" value="<% if (request.getParameter("dateInicio") != null) { %><% try { SimpleDateFormat formatoFecha = new SimpleDateFormat("dd/MM/yyyy", Locale.getDefault()); formatoFecha.setLenient(false); formatoFecha.parse(request.getParameter("dateInicio"));%><%=request.getParameter("dateInicio").toString().trim()%><% } catch(ParseException  e) {%><%=currentDate%><% } %><%  } else {%><%=currentDate %> <% } %>" readonly name="dateInicio" id="dateInicio" class="form-control span12" style="width:150px;" />
 								</div>
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
				

				<span class="label label-success">
				Encontrado 
				
				<c:choose>
								  <c:when test="${cantConOd > 0}">
								    <fmt:formatNumber pattern="#,###,#00" value="${cantConOd}"  type="number"/>
								  </c:when>
								  <c:otherwise>
								    0
								  </c:otherwise>
								</c:choose>
				
				</span>
				&nbsp;&nbsp;
				<span class="label label-danger"  style=" background-color:#d9534f">
				No Encontrado
				<c:choose>
								  <c:when test="${cantSinOd > 0}">
								    <fmt:formatNumber pattern="#,###,#00" value="${cantSinOd}"  type="number"/>
								  </c:when>
								  <c:otherwise>
								    0
								  </c:otherwise>
								</c:choose>
				</span>
				&nbsp;&nbsp;
				<span class="label label-primary" style=" background-color:#5bc0de"><i class="icon-time"></i> Desde ${starttime} Hasta ${endtime}</span>
				<br></br>
				<!-- /.box-header -->
            <div class="box-body table-responsive no-padding">
	            <table id="example" class="display nowrap" cellspacing="0" width="100%">
			        <thead>
			            <tr>
			                <th>N° Solicitud</th>
			                <th>N° OD</th>
			                <th>Fecha Creacion</th>
			            </tr>
			        </thead>
			        <tfoot>
			            <tr>
			                <th>N° Solicitud</th>
			                <th>N° OD</th>
			                <th>Fecha Creacion</th>
			            </tr>
			        </tfoot>
			        <tbody>
			        	<c:forEach items="${detalles}" var="detalle" varStatus="status">
							<tr>
								<td>${detalle.nSolicitudCliente}</td>
								<td>
									    <c:choose>
									    
											<c:when test="${empty detalle.nOrdenDistribu}">
												<span class="label label-danger"  style=" background-color:#d9534f">
												<i class="icon-remove-circle"></i> No encontrado
												</span>
											</c:when>
											<c:otherwise>
												<span class="label label-success">
												<i class="icon-ok-sign"></i>  ${detalle.nOrdenDistribu}</span>
											</c:otherwise>
										</c:choose>
								</td>
								<td>${detalle.fechaCreacionOrden}</td>
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


