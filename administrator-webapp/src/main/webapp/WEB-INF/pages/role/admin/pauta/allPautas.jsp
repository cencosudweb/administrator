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
    <script src="<c:url value="/js/admin/pauta/pauta.all.js"/>" type="text/javascript"></script>

  	<script src="<c:url value="/js/admin/calendar/calendar.all.js"/>" type="text/javascript"></script>
  	    <link rel="stylesheet" type="text/css" href="<c:url value="/css/datepicker/jquery.ui.all.css"/>"/>
    <script src="<c:url value="/js/jquery.ui.core.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/js/jquery.ui.datepicker.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/js/jquery.ui.datepicker-es.js"/>" type="text/javascript"></script>
    
    
    <script src="<c:url value="/js/admin/pauta/pauta.selected.level.js"/>" type="text/javascript"></script>
	 
    
    
	
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
            <h1 class="page-title">Pautas Visitas Tiendas</h1>
        </div>
        
        <ul class="breadcrumb">
            <li><a href="home">Home</a> <span class="divider">/</span></li>
            <li class="active">Pautas Visitas Tiendas</li>
        </ul>

        <div class="container-fluid">
	        <div class="row-fluid">
				<div class="btn-toolbar">
				    <button id="btn-add-pauta" class="btn btn-primary"><i class="icon-plus"></i> Nuevo</button>
				    <button class="btn" disabled="disabled">Import</button>
					<button id="exportButton" class="btn"><span class="fa fa-file-excel-o"></span> Exportar a Excel</button>
					<div class="btn-group"></div>
				</div>
				
				
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="btn-toolbar">
							<form class="form-inline" id="f_all_user" method="get" action="allPautas">
								<input type="hidden" name="posted" id="posted" value="ok"/>
								<div class="form-group" >
									<label>Tienda&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
									<!--  
									<select name="tienda" id="tienda"  class="form-control">
										<option value="-1">Todas las Tiendas</option>
										<c:forEach items="${tiendas}" var="tienda" varStatus="status" >
											<option value="${tienda.id}" ${param.tienda == tienda.id ? 'selected' : ''}>${tienda.description}</option>
											
								        </c:forEach>
								    </select>
								    -->
								    <select name="tienda" id="tienda" class="form-control">
				              			<option value="">Seleccionar Tienda...</option>
					              		<c:forEach items="${tiendas}" var="tienda1" varStatus="status">
					              		<option value="${tienda1.id}">${tienda1.description}</option>
					              		</c:forEach>
				            		</select>
								    
								    
			                        <label>&nbsp;&nbsp;Padrino&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<!--
									<select name="padrino" id="padrino"  class="form-control">
										<option value="-1">Todas los Padrinos</option>
										<c:forEach items="${padrinos}" var="padrino" varStatus="status" >
											<option value="${padrino.id}" ${param.padrino == padrino.id ? 'selected' : ''}>${padrino.description}</option>
								        </c:forEach>
								    </select>
								    -->
								    <select name="padrino" id="padrino" class="form-control">
		            				</select>
			                        &nbsp;
			                        <label>&nbsp;Gerente&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
									&nbsp;&nbsp;&nbsp;
									<!--  
									<select name="gerente" id="gerente"  class="form-control">
										<option value="-1">Todas los Gerentes</option>
										<c:forEach items="${gerentes}" var="gerente" varStatus="status" >
											<option value="${gerente.id}" ${param.gerente == gerente.id ? 'selected' : ''}>${gerente.description}</option>
								        </c:forEach>
								    </select>
								    -->
								    <select name="gerente" id="gerente" class="form-control">
		            				</select>
								    </div>
								    <br>
								     
								    <div class="form-group" >
								     
			                        <label>&nbsp;Contraparte&nbsp;&nbsp;&nbsp;</label>
									&nbsp;&nbsp;&nbsp;
									<!--  
									<select name="contratante" id="contratante"  class="form-control">
										<option value="-1">Todas las Contrapartes</option>
										<c:forEach items="${contratantes}" var="contratante" varStatus="status" >
											<option value="${contratante.id}" ${param.contratante == contratante.id ? 'selected' : ''}>${contratante.description}</option>
								        </c:forEach>
								    </select>
								    -->
								    <select name="contraparte" id="contraparte">
		            				</select>
								     &nbsp;
			                        <label>&nbsp;&nbsp;Soporte integral&nbsp;&nbsp;&nbsp;</label>
									&nbsp;&nbsp;&nbsp;
									<!--  
									<select name="soporte" id="soporte"  class="form-control">
										<option value="-1">Todas los Soportes</option>
										<c:forEach items="${soportes}" var="soporte" varStatus="status" >
											<option value="${soporte.id}" ${param.soporte == soporte.id ? 'selected' : ''}>${soporte.description}</option>
								        </c:forEach>
								    </select> 
								    -->
								     <select name="soporte" id="soporte" class="form-control">
		            				</select>
									&nbsp;
									<label>&nbsp;Fecha Visita&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
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
				
				
				
				<jsp:include page="../../../include/messages.jsp" />
				<div class="well">
				    <table  id="example"  class="display" cellspacing="0" width="100%">
				      <thead>
				        <tr>
				          <th>#</th>
				          <th align="left">Requerimiento</th>
				          <th  align="left">Prioridad</th>
				          <th  align="left">Descripcion</th>
				          <th  align="left">Reportado</th>
				          <th  align="left">Area</th>
				          <th  align="left">Observacion</th>
				          <th style="width: 150px;">Acciones</th>
				        </tr>
				      </thead>
				      <tbody>
					  <c:if test="${!empty pautas}">
					      <c:forEach items="${pautas}" var="pauta" varStatus="status">
					            <tr>
						          <td nowrap="nowrap">${status.count}</td>
						          <td nowrap="nowrap">${pauta.numeroRequerimiento}</td>
						          <td nowrap="nowrap">${pauta.prioridad.description}</td>
						          <td nowrap="nowrap">${pauta.descripcionIssue}</td>
						          <td nowrap="nowrap">${pauta.reportado.description}</td>
						          <td nowrap="nowrap">${pauta.area.description} ...</td>
						          <td nowrap="nowrap">${pauta.observacion}</td>
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
				        <button class="btn btn-danger"  data-dismiss="modal">Cambiar</button>
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
                    	Requerimiento: { type: String },
                    	Prioridad: { type: String },
                    	Descripcion: { type: String },
                    	Reportado: { type: String },
                    	Area: { type: String },
                    	Observacion: { type: String }
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
                                            value: "Requerimiento"
                                        },
                                        {
                                            style: {
                                                bold: true
                                            },
                                            type: String,
                                            value: "Prioridad"
                                        },
                                        {
                                            style: {
                                                bold: true
                                            },
                                            type: String,
                                            value: "Descripcion"
                                        },
                                        {
                                            style: {
                                                bold: true
                                            },
                                            type: String,
                                            value: "Reportado"
                                        },
                                        {
                                            style: {
                                                bold: true
                                            },
                                            type: String,
                                            value: "Area"
                                        },
                                        {
                                            style: {
                                                bold: true
                                            },
                                            type: String,
                                            value: "Observacion"
                                        }
                                    ]
                                }
                            ].concat($.map(data, function(item) {
                                return {
									
                                    cells: [
                                        { type: String, value: item.Requerimiento },
                                        { type: String, value: item.Prioridad },
                                        { type: String, value: item.Descripcion },
                                        { type: String, value: item.Reportado },
                                        { type: String, value: item.Area },
                                        { type: String, value: item.Observacion }
										
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


