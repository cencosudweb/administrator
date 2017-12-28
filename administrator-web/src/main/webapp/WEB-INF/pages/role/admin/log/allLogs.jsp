<%@include file="../../../include/taglib_includes.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
            <h1 class="page-title">Logs de Usuarios</h1>
        </div>
        
        <ul class="breadcrumb">
            <li><a href="home">Home</a> <span class="divider">/</span></li>
            <li class="active">Logs de Usuarios</li>
        </ul>

        <div class="container-fluid">
	        <div class="row-fluid">
				<div class="btn-toolbar">
					<!--  
				    <button id="ban-add-user" class="btn btn-primary" disabled="disabled"><i class="icon-plus"></i> Nuevo</button>
				    <button class="btn" disabled="disabled">Import</button>
				    <button class="btn">Export</button>
				   
				    <button id="exportButton" class="btn btn-lg btn-danger clearfix"><span class="fa fa-file-excel-o"></span> Exportar a Excel</button>
				     -->
				    <!--  
				    <button id="exportButtonPdf" class="btn btn-lg btn-danger clearfix"><span class="fa fa-file-pdf-o"></span> Exportar a PDF</button>
				    -->
					<div class="btn-group"></div>
				</div>
				
				
				<div class="col-md-4">
    <br>
    <div id="myTabContent" class="tab-content">
    	<!--  
      <div class="tab-pane active in" id="home">
      <form method="get"  action="allLogs" id="f_lock">
      <input type="hidden" name="p" id="p" value="1"/>
          
        <div class="form-group">
        <label>Descripcion</label>
        <input type="text" id="description" name="description" value="<% if (request.getParameter("description") != null) { %><%=request.getParameter("description")%><% } else {%><%}%>" class="form-control"/>
        </div>
        <div class="form-group">
            <label>Clientes</label>
            <select name="idUser" id="idUser" class="form-control">
              <option value="0">ALL</option>
              <c:forEach items="${users}" var="user" varStatus="status">
              	<option value="${user.id}" ${param.idUser == user.id ? 'selected' : ''}>${user.name}</option>
              </c:forEach>
            </select>
          </div>
        </form>
      </div>
      

      <div class="tab-pane fade" id="profile">

        <form id="tab2">
          <div class="form-group">
            <label>New Password</label>
            <input type="password" class="form-control">
          </div>
          <div>
              <button class="btn btn-primary">Update</button>
          </div>
        </form>
      </div>
    </div>
    
    

    <div class="btn-toolbar list-toolbar">
      <a href="#myModal" data-toggle="modal" class="btn btn-primary">Buscar</a>
    </div>
  </div>
  -->
				
				<jsp:include page="../../../include/messages.jsp" />
				<c:if test="${empty logs}">
					<tr>
				    	<td colspan="8">No se encontraron datos</td>
				    </tr> 
			 	</c:if>
			 	
				<div class="well">

				    <table id="example"  class="display" cellspacing="0" width="100%">
				      <thead>
				        <tr>
				          <th>#</th>
				          <th>Accion</th>
				          <th class="der">Descripcion</th>
				          <th>IP</th>
				          <th>Fecha</th>
				        </tr>
				      </thead>
				      <tbody>
				      <c:if test="${!empty logs}">
					      <c:forEach items="${logs}" var="log" varStatus="status">
					            <tr>
						          <td>${status.count}</td>
						          <td align="left" nowrap="nowrap">${log.action}</td>
						          <td align="left" nowrap="nowrap">
						         <c:choose>
										  <c:when test="${log.description == 'false'}">
										  	<c:out value="Admin"/>
										  </c:when>
										  <c:otherwise>
										  ${log.description}
										  </c:otherwise>
									  </c:choose>
						          </td>
						          <td align="left" nowrap="nowrap">${log.ipaddress}</td>
						          <td align="left" nowrap="nowrap">${log.creationdate}</td>
						        </tr>
						</c:forEach>
						<form method="post"  action="lockUnlockUser" id="f_lock">
		        			<input type="hidden" name="id" id="id_user"/>
		        			<input type="hidden" name="modo" id="modo"/>
						</form>
				      </c:if>
				        
				      </tbody>
				    </table>
				</div>
				<!--  
				<c:if test="${numpages > 0}">
 				<div class="pagination"> 
 				    <ul> 
 				    	<li>${pagelinks}</li>
 				    	
 				    </ul> 
 				</div> 
 				</c:if>
 				-->

				<!-- Modal Confirmacion Eliminar -->
				<div class="modal small hide fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				    <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
				        <h3 id="myModalLabel">Confirme</h3>
				    </div>
				    <div class="modal-body">
				        <p class="error-text"><i class="icon-info-sign modal-icon"></i>¿Realmente desea consultar?</p>
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
    
    

<style>
    #exportButton {
        border-radius: 0;
    }
    #exportButtonPdf {
        border-radius: 0;
    }
</style>
    
  </body>
</html>


