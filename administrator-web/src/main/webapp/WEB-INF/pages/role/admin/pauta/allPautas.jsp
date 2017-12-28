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
String exportToExcel = request.getParameter("exportToExcel");
if (exportToExcel != null && exportToExcel.toString().equalsIgnoreCase("YES")) {
	response.setContentType("application/vnd.ms-excel");
	response.setHeader("Content-Disposition", "inline; filename=" + "DescargaPanelDinamicoExcel.xls");
}
String dateInicio =  request.getParameter("dateInicio");
String starttime = DateUtils.turnDate(dateInicio) != null?DateUtils.turnDate(dateInicio):DateUtils.turnDate(currentDate);
//out.println("starttime"+starttime+"<BR>");

//out.println("starttime"+starttime+"<BR>");

String prefixclause ="";




if (!"-1".equals(request.getParameter("tienda")) && request.getParameter("tienda") != null && !"".equals(request.getParameter("tienda"))) {
		prefixclause += " AND PT.ID_TIENDA = " +  request.getParameter("tienda") + "  ";
} 

if (!"-1".equals(request.getParameter("padrino")) && request.getParameter("padrino") != null && !"".equals(request.getParameter("padrino"))) {
		prefixclause += " AND PT.ID_PADRINO = " +  request.getParameter("padrino") + "  ";
}

if (!"-1".equals(request.getParameter("gerente")) && request.getParameter("gerente") != null && !"".equals(request.getParameter("gerente"))) {
		prefixclause += " AND PT.ID_GERENTE = " +  request.getParameter("gerente") + "  ";
}

if (!"-1".equals(request.getParameter("contratante")) && request.getParameter("contratante") != null && !"".equals(request.getParameter("contratante"))) {
		prefixclause += " AND PT.ID_CONTRATANTE = " +  request.getParameter("contratante") + " ";
} 

if (!"-1".equals(request.getParameter("soporte")) && request.getParameter("soporte") != null && !"".equals(request.getParameter("soporte"))) {
		prefixclause += " AND PT.ID_SOPORTE = " +  request.getParameter("soporte") + " ";
} 

//out.println("prefixclause ="+ prefixclause+ "<br/>");



%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
  
  <jsp:include page="../../../include/head.jsp" />
   
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
    
    <jsp:include page="../../../include/banner.jsp" />
	<jsp:include page="../../../include/menu.jsp" />
    
    <div class="content">
        <div class="header">
            <h1 class="page-title">Requerimiento Visitas Tiendas</h1>
        </div>
        
        <ul class="breadcrumb">
            <li><a href="home">Home</a> <span class="divider">/</span></li>
            <li class="active">Requerimiento Visitas Tiendas</li>
        </ul>

        <div class="container-fluid">
	        <div class="row-fluid">
				<div class="btn-toolbar">
				    <button id="btn-add-pauta" class="btn btn-primary"><i class="icon-plus"></i> Nuevo</button>
				    <!--  <button class="btn" disabled="disabled">Import</button>
					<button id="exportButton" class="btn"><span class="fa fa-file-excel-o"></span> Exportar a Excel</button>
					-->
					<div class="btn-group"></div>
				</div>
				
				
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="btn-toolbar">
							<form class="form-inline" id="f_all_user" method="get" action="allPautas">
								<input type="hidden" name="posted" id="posted" value="ok"/>
								<div class="form-group" >
									<label>Tienda&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
									<select name="tienda" id="tienda"  class="form-control">
										<option value="">Todas las Tiendas</option>
										<c:forEach items="${tiendas}" var="tienda" varStatus="status" >
											<option value="${tienda.id}" ${param.tienda == tienda.id ? 'selected' : ''}>${tienda.description} - ${tienda.flag.description}</option>
											
								        </c:forEach>
								    </select>
								    <!--  
								    <select name="tienda" id="tienda" class="form-control">
				              			<option value="">Seleccionar Tienda...</option>
					              		<c:forEach items="${tiendas}" var="tienda1" varStatus="status">
					              		<option value="${tienda1.id}">${tienda1.description}</option>
					              		</c:forEach>
				            		</select>
				            		-->
								    
								    <!--  
			                        <label>&nbsp;&nbsp;Padrino&nbsp;&nbsp;</label>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									 <select name="padrino" class="form-control">
									 	<option value="">Todas los Padrinos</option>
					              		<c:forEach items="${padrinos}" var="padrino" varStatus="status">
					              		<option value="${padrino.id}" ${param.padrino == padrino.id ? 'selected' : ''} >${padrino.description}</option>
					              		</c:forEach>
				            		</select>
				            		-->
									<!--  
								    <select name="padrino" id="padrino" class="form-control">
		            				</select>
		            				-->
			                        &nbsp;
			                          
			                        <label>&nbsp;Estados&nbsp;&nbsp;&nbsp;</label>
									&nbsp;&nbsp;&nbsp;
								    <select name="estado" class="form-control">
									 	<option value="">Todas los Estados</option>
					              		<c:forEach items="${estados}" var="estado" varStatus="status">
					              		<option value="${estado.id}" ${param.estado == estado.id ? 'selected' : ''} >${estado.description}</option>
					              		</c:forEach>
				            		</select>
		            				
								    </div>
								   <!--  
								  <div class="form-group" >
								     
			                        <label>&nbsp;Contraparte&nbsp;&nbsp;&nbsp;</label>
									&nbsp;&nbsp;&nbsp;
								    <select name="contraparte" id="contraparte">
		            				</select>
								     &nbsp;
			                        <label>&nbsp;&nbsp;Soporte integral&nbsp;&nbsp;&nbsp;</label>
									&nbsp;&nbsp;&nbsp;
								     <select name="soporte" id="soporte" class="form-control">
		            				</select>
									&nbsp;
									<label>&nbsp;Fecha Visita&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
									<input type="text" value="<% if (request.getParameter("dateInicio") != null) { %><% try { SimpleDateFormat formatoFecha = new SimpleDateFormat("dd/MM/yyyy", Locale.getDefault()); formatoFecha.setLenient(false); formatoFecha.parse(request.getParameter("dateInicio"));%><%=request.getParameter("dateInicio").toString().trim()%><% } catch(ParseException  e) {%><%=currentDate%><% } %><%  } else {%><%=currentDate %> <% } %>" readonly name="dateInicio" id="dateInicio" class="form-control span12" style="width:100px;" />
								</div>
								-->
								
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
				
				
				
				<jsp:include page="../../../include/messages.jsp" />
				<div class="well" style="overflow:scroll;">
				    <table  id="example"  class="display" cellspacing="0" width="100%">
				      <thead>
				        <tr>
				          <th>#</th>
				          <th  align="left">Prioridad</th>
				          <th  align="left">Descripcion</th>
				          <th  align="left">Reportado</th>
				          <th  align="left">Area</th>
				          <th  align="left">Estado</th>
				          <th  align="left">Tienda</th>
				          <th  align="left">Fecha</th>
				          <th style="width: 150px;">Acciones</th>
				        </tr>
				      </thead>
				      <tbody>
					  <c:if test="${!empty pautas}">
					      <c:forEach items="${pautas}" var="pauta" varStatus="status">
					            <tr>
						          <td nowrap="nowrap">${status.count}</td>
						          <td nowrap="nowrap">${pauta.prioridad.description}</td>
						          <td nowrap="nowrap">${pauta.descripcionIssue}  </td>
						          <td nowrap="nowrap">${pauta.padrino.description}</td>
						          <td nowrap="nowrap">${pauta.area.description}</td>
						          <td nowrap="nowrap">
						          	<c:choose>
										  <c:when test="${pauta.estado.id == 1}">
										  	<span class="label label-danger" style=" background-color:#d9534f">${pauta.estado.description}</span>
										  </c:when>
										  <c:when test="${pauta.estado.id == 2}">
										  	<span class="label label-success" >${pauta.estado.description}</span>
										  </c:when>
									</c:choose>
						          	<!--  
						          	<c:choose>
										  <c:when test="${pauta.estado.id == 1}">
										  	<span class="label label-success">${pauta.estado.description}</span>
										  </c:when>
										  <c:when test="${pauta.estado.id == 2}">
										  	<span class="label label-danger"  style=" background-color:#d9534f">${pauta.estado.description}</span>
										  </c:when>
									</c:choose>
									-->
						          </td>
						          <td nowrap="nowrap">${pauta.tienda.description}</td>
						          <td nowrap="nowrap">${pauta.fechaVisita}</td>
						          <td>
						          	  <!--  <a href="resetPassword1?id=${user.id}" title="Restablecer Clave" ><i class="icon-signin"></i> Restablecer Pass</a><br />-->
						              <a href="editPauta?id=${pauta.id}" title="Editar" ><i class="icon-pencil"></i>Editar</a><br />
						              <a href="#myModal" class="lockUnlockPauta" modo='D' iduser="${pauta.id}" title="Deshabilitar" role="button" data-toggle="modal" style="margin-right: 15px"><i class="icon-remove"></i>Eliminar</a><br />
						          </td>
						        </tr>
						</c:forEach>
				      </c:if>
				      </tbody>
				    </table>
					<form method="post"  action="lockUnlockPauta" id="f_lock">
		        			<input type="hidden" name="id" id="id_user"/>
		        			<input type="hidden" name="modo" id="modo"/>
						</form>
				</div>
				<!--
 				<div class="pagination"> 
 				    <ul> 
 				        <li><a href="#">Prev</a></li> 
 				        <li><a href="#">1</a></li> 
 				        <li><a href="#">2</a></li> 
 				        <li><a href="#">3</a></li> 
 				        <li><a href="#">4</a></li> 
 				        <li><a href="#">Next</a></li> 
 				    </ul> 
				</div> 
				-->
				
				<!-- Modal Confirmacion Eliminar -->
				<div class="modal small hide fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				    <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
				        <h3 id="myModalLabel">Confirme</h3>
				    </div>
				    <div class="modal-body">
				        <p class="error-text"><i class="icon-warning-sign modal-icon"></i>¿ Realmente desea realizar esta operacion ?</p>
				    </div>
				    <div class="modal-footer">
				        <button class="btn" data-dismiss="modal" aria-hidden="true">Cancelar</button>
				        <button class="btn btn-danger"  data-dismiss="modal">Aceptar</button>
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


