<%@include file="../../../include/taglib_includes.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<%@ page import="com.cencosud.administrator.web.utils.InicializarMIS"%>
<%@ page import="com.cencosud.administrator.web.utils.DateUtils"%>

<% 
	InicializarMIS inicializarMIS = new InicializarMIS();
	try {
		inicializarMIS.init();
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	Date dNow = new Date();
	SimpleDateFormat ft = new SimpleDateFormat("dd/MM/yyyy");
	String currentDate = ft.format(dNow);
	//out.println("date"+currentDate);
	String exportToExcel = request.getParameter("exportToExcel");
	if (exportToExcel != null && exportToExcel.toString().equalsIgnoreCase("YES")) {
		response.setContentType("application/vnd.ms-excel");
		response.setHeader("Content-Disposition", "inline; filename=" + "PrintVentaEnVerdeExcel.xls");
	}
	String dateInicio = request.getParameter("dateInicio");
%>
<c:set var="totalNoEncontrado" value="${ countNoEncontrado }"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>Paris Cencosud</title>
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/js/bootstrap/css/bootstrap.css"/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/css/theme.css"/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/css/premium.css"/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/js/font-awesome/css/font-awesome.css"/>">
<script src="<c:url value="/js/jquery-1.7.2.min.js"/>"
	type="text/javascript"></script>
<link rel="shortcut icon" href="<c:url value="/images/favicon.ico"/>">
<link rel="stylesheet"
	href="<c:url value="/css/bootstrap-multiselect.css"/>" type="text/css">
<script type="text/javascript"
	src="<c:url value="/js/bootstrap-multiselect.js"/>"></script>
<script src="<c:url value="/js/admin/call/call.all.js"/>"
	type="text/javascript"></script>
<script src="<c:url value="/js/admin/user/user.all.js"/>"
	type="text/javascript"></script>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/css/datepicker/jquery.ui.all.css"/>">
<script src="<c:url value="/js/jquery.ui.core.min.js"/>"
	type="text/javascript"></script>
<script src="<c:url value="/js/jquery.ui.datepicker.min.js"/>"
	type="text/javascript"></script>
<script src="<c:url value="/js/jquery.ui.datepicker-es.js"/>"
	type="text/javascript"></script>
<link rel="stylesheet"
	href="<c:url value="/css/jquery.dataTables.min.css"/>" />
<link rel="stylesheet"
	href="<c:url value="/css/buttons.dataTables.min.css"/>" />
<script src="<c:url value="/js/jquery.dataTables.min.js"/>"></script>
<script src="<c:url value="/js/dataTables.buttons.min.js"/> "></script>
<script src="<c:url value="/js/buttons.flash.min.js"/> "></script>
<script src="<c:url value="/js/jszip.min.js"/> "></script>
<script src="<c:url value="/js/pdfmake.min.js"/> "></script>
<script src="<c:url value="/js/buttons.html5.min.js"/> "></script>
<script src="<c:url value="/js/buttons.print.min.js"/> "></script>

<script>
	$(document).ready(function() {
		$('#example').DataTable({
			language : {
				"decimal" : "",
				"emptyTable" : "No hay información",
				"info" : "Mostrando _START_ a _END_ de _TOTAL_ Registros",
				"infoEmpty" : "Mostrando 0 to 0 of 0 Registros",
				"infoFiltered" : "(Filtrado de _MAX_ total registros)",
				"infoPostFix" : "",
				"thousands" : ",",
				"lengthMenu" : "Mostrar _MENU_ Registros",
				"loadingRecords" : "Cargando...",
				"processing" : "Procesando...",
				"search" : "Buscar:",
				"zeroRecords" : "Sin resultados encontrados",
				"paginate" : {
					"first" : "Primero",
					"last" : "Ultimo",
					"next" : "Siguiente",
					"previous" : "Anterior"
				}
			},
			dom : 'Bfrtip',
			buttons : [ 'copy', 'excel', 'print' ]
		});
	});
</script>


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
			<h1 class="page-title">Reporte Cuadratura DO</h1>
		</div>


		<ul class="breadcrumb">
			<li><a href="home">Home</a> <span class="divider">/</span></li>
			<li class="active">Reporte Cuadratura DO<span class="divider">/</span></li>
		
		</ul>
		


		<div class="container-fluid">
			<div class="row-fluid">
				<div class="btn-toolbar">
					<div class="btn-group"></div>
				</div>
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="btn-toolbar">
							<form class="form-inline" id="f_all_user" method="get"
								action="cuadraturaDo">

								<input type="hidden" name="posted" id="posted" value="ok" />
								<div class="form-group">
									<label>Fecha Desde&nbsp;</label> &nbsp; 
									
									
									<input type="text" value="<% if (request.getParameter("dateInicio") != null) { %><% try { SimpleDateFormat formatoFecha = new SimpleDateFormat("dd/MM/yyyy", Locale.getDefault()); formatoFecha.setLenient(false); formatoFecha.parse(request.getParameter("dateInicio"));%><%=request.getParameter("dateInicio").toString().trim()%><% } catch(ParseException  e) {%><%=DateUtils.restarDiaFecha(currentDate,"1")%><% } %><%  } else {%><%=DateUtils.restarDiaFecha(currentDate,"1") %> <% } %>" readonly name="dateInicio" id="dateInicio" class="form-control" style="width: 200px;"/>
									&nbsp;<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Fecha Hasta&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label> 
									<input type="text" value="<% if (request.getParameter("dateFin") != null) { %><% try { SimpleDateFormat formatoFecha = new SimpleDateFormat("dd/MM/yyyy", Locale.getDefault()); formatoFecha.setLenient(false); formatoFecha.parse(request.getParameter("dateFin"));%><%=request.getParameter("dateFin").toString().trim()%><% } catch(ParseException  e) {%><%=DateUtils.restarDiaFecha(currentDate,"1")%><% } %><%  } else {%><%=DateUtils.restarDiaFecha(currentDate,"1") %> <% } %>" readonly name="dateFin" id="dateFin" class="form-control" style="width: 200px;"/>
										&nbsp;&nbsp;
										
									
						            
										
								</div>
								</br>
								<div class="form-group">
								
									
									
								</div>
								</br>
								<!--  
 								<div class="form-group">
								<label>Carga</label></br>
								<input type="text" value="" name="carga" id="carga" class="span12" />
 								</div>
 								</br>
 								<div class="form-group">
								<label>bogeda</label></br>
								<input type="text" value="" name="bogeda" id="bogeda" class="span12" />
 								</div>
 								</br>
								<div class="form-group">
								<label>Tran Nbr</label></br>
								<input type="text" value="" name="tranNbr" id="tranNbr" class="span12" />
 								</div>
 								-->

								<div class="form-group"></div>


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
				
				<!--  
				<span class="label label-success"> 
					Encontrado &nbsp; 
					
					<c:choose>
								  <c:when test="${countEncontrado > 0}">
								    <fmt:formatNumber pattern="#,###,#00" value="${countEncontrado}"  type="number"/>
								  </c:when>
								  <c:otherwise>
								    0
								  </c:otherwise>
								</c:choose>		
								
								
	


				</span> &nbsp;&nbsp; 
				-->
				<span class="label label-danger" style="background-color: #d9534f">
				
					No Encontrado&nbsp; 
					<c:choose>
								  <c:when test="${countNoEncontrado > 0}">
								    <fmt:formatNumber pattern="#,###,#00" value="${countNoEncontrado}"  type="number"/>
								  </c:when>
								  <c:otherwise>
								    0
								  </c:otherwise>
								</c:choose>		
					</span> &nbsp;&nbsp; 
					
					<span class="label label-warning" >
					
					<i class="icon-time"></i>
					Desde ${starttime} Hasta ${endtime}</span> <br></br>



				<!-- /.box-header -->
				<div class="box-body table-responsive no-padding" style="overflow:scroll;">
					<table id="example" class="display nowrap" cellspacing="0"
						width="100%">
						<thead>
							<tr>
								<th>Orden Num</th>
								<th>Est Sc</th>
								<th>Fecha Creacion</th>
								<th>Eta</th>
								<th>Facility</th>
								<th>Soli Cliente</th>
								<th>Do Eom</th>
								<th>Estado Do</th>
								<th>T.Orden</th>
								<th>Anterior Estado</th>
								<th>Nuevo Esadot</th>
								<th>Do Wms</th>
								<th>sc</th>
								<th>Estado</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>Orden Num</th>
								<th>Est Sc</th>
								<th>Fecha Creacion</th>
								<th>Eta</th>
								<th>Facility</th>
								<th>Soli Cliente</th>
								<th>Do Eom</th>
								<th>Estado Do</th>
								<th>T.Orden</th>
								<th>Anterior Estado</th>
								<th>Nuevo Esadot</th>
								<th>Do Wms</th>
								<th>sc</th>
								<th>Estado</th>
							</tr>
						</tfoot>
						<tbody>
							<c:forEach items="${dos}" var="do" varStatus="status">
								<tr>
									<td>${do.ordenNum}</td>
									<td>${do.estSc}</td>
									<td>${do.fCreacion}</td>
									<td>${do.eta}</td>
									<td>${do.facility}</td>
									<td>${do.solCliente}</td>
									<td>${do.doEom}</td>
									<td>${do.estDo}</td>
									<td>${do.tOrden}</td>
									<td>${do.antEst}</td>
									<td>${do.nuevEst}</td>
									<td>${do.doWms}</td>
									<td>${do.sc}</td>
									<td><c:choose>

											<c:when test="${do.estado != 0}">
												<span class="label label-success"> Encontrados </span>
											</c:when>
											<c:otherwise>
												<span class="label label-danger"
													style="background-color: #d9534f"> No Encontrado</span>
											</c:otherwise>
										</c:choose></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					
					<br><br>
					
			</div>




			<!-- Modal Confirmacion Eliminar -->
			<div class="modal small hide fade" id="myModal" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">X</button>
					<h3 id="myModalLabel">Informe</h3>
				</div>
				<div class="modal-body">
					<p class="error-text">
						<i class="icon-warning-sign modal-icon"></i>¿ Advertencia ?
					</p>
				</div>
				<div class="modal-footer">
					<button class="btn" data-dismiss="modal" aria-hidden="true">Cancelar</button>
					<button class="btn btn-danger" data-dismiss="modal">Ok</button>
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


