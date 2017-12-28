<%@include file="../../../include/taglib_includes.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <jsp:include page="../../../include/head.jsp" />
    <script src="<c:url value="/js/admin/soporte/soporte.all.js"/>" type="text/javascript"></script>

  	<script src="<c:url value="/js/admin/calendar/calendar.all.js"/>" type="text/javascript"></script>
  	    <link rel="stylesheet" type="text/css" href="<c:url value="/css/datepicker/jquery.ui.all.css"/>"/>
    <script src="<c:url value="/js/jquery.ui.core.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/js/jquery.ui.datepicker.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/js/jquery.ui.datepicker-es.js"/>" type="text/javascript"></script>
    
    
	 
    
    
	
	<script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js" type="text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css"/>

	
	
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
            <h1 class="page-title">Soportes</h1>
        </div>
        
        <ul class="breadcrumb">
            <li><a href="home">Home</a> <span class="divider">/</span></li>
            <li class="active">Soportes</li>
        </ul>

        <div class="container-fluid">
	        <div class="row-fluid">
				<div class="btn-toolbar">
				    <button id="btn-add-soporte" class="btn btn-primary"><i class="icon-plus"></i> Nuevo</button>
				    <!--
				    <button class="btn" disabled="disabled">Import</button>
					<button id="exportButton" class="btn"><span class="fa fa-file-excel-o"></span> Exportar a Excel</button>
					-->
					<div class="btn-group"></div>
				</div>
				
				
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="btn-toolbar">
						</div>
					</div>
				</div>
				
				
				
				<jsp:include page="../../../include/messages.jsp" />
				<div class="well">
				    <table  id="example"  class="display" cellspacing="0" width="100%">
				      <thead>
				        <tr>
				          <th>#</th>
				          <th align="left">Descripcion</th>
				          <th align="left">Contraparte</th>
				          <th style="width: 150px;">Acciones</th>
				        </tr>
				      </thead>
				      <tbody>
					  <c:if test="${!empty soportes}">
					      <c:forEach items="${soportes}" var="soporte" varStatus="status">
					            <tr>
						          <td nowrap="nowrap">${status.count}</td>
						          <td nowrap="nowrap">${soporte.description}</td>
						          <td nowrap="nowrap">${soporte.contraparte.description}</td>
						          <td>
						          	  <!--  <a href="resetPassword1?id=${user.id}" title="Restablecer Clave" ><i class="icon-signin"></i> Restablecer Pass</a><br />-->
						              <a href="editSoporte?id=${soporte.id}" title="Editar" ><i class="icon-pencil"></i>Editar</a><br />
						              <a href="#myModal" class="lockUnlock" modo='U' idsoporte="${soporte.id}" title="Deshabilitar" role="button" data-toggle="modal" style="margin-right: 15px"><i class="icon-remove"></i>Eliminar</a><br />
						          </td>
						        </tr>
						</c:forEach>
				      </c:if>
				      </tbody>
				    </table>
					<form method="post"  action="lockUnlockSoporte" id="f_lock">
		        			<input type="hidden" name="id" id="id_soporte"/>
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
                    	Descripcion: { type: String },
                    	Tienda: { type: String }
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
                                            value: "Descripcion"
                                        },
                                        {
                                            style: {
                                                bold: true
                                            },
                                            type: String,
                                            value: "Contraparte"
                                        }
                                    ]
                                }
                            ].concat($.map(data, function(item) {
                                return {
									
                                    cells: [
                                        { type: String, value: item.Descripcion },
                                        { type: String, value: item.Contraparte }
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


