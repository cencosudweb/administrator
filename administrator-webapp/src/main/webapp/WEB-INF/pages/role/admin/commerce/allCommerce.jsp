<%@include file="../../../include/taglib_includes.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <jsp:include page="../../../include/head.jsp" />
    <script src="<c:url value="/js/admin/commerce/commerce.all.js"/>" type="text/javascript"></script>

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
            <h1 class="page-title">Comercios Asociados</h1>
        </div>
        
        <ul class="breadcrumb">
            <li><a href="home">Home</a> <span class="divider">/</span></li>
            <li class="active">Comercios</li>
        </ul>

        <div class="container-fluid">
	        <div class="row-fluid">
				<div class="btn-toolbar">
				    <button id="btn-add-commerce" class="btn btn-primary"><i class="icon-plus"></i> Nueva</button>
				    <button class="btn" disabled="disabled">Import</button>
				    <button class="btn">Export</button>
					<div class="btn-group"></div>
				</div>
				
				<jsp:include page="../../../include/messages.jsp" />
				
				<div class="well">
				    <table class="table">
				      <thead>
				        <tr>
				          <th>#</th>
				          <th class="der">Rut</th>
				          <th>Nombre</th>
				          <th>C&oacute;digo</th>
				          <th style="width: 250px;">Acciones</th>
				        </tr>
				      </thead>
				      <tbody>
				      <c:if test="${!empty commerces}">
					      <c:forEach items="${commerces}" var="commerce" varStatus="status">
					            <tr>
						          <td>${status.count}</td>
						          <td class="der">${commerce.rut}</td>
						          <td>${commerce.businessLine}</td>
						          <td>${commerce.mnemonic}</td>
						          <td>
						              <a href="editCommerce?id=${commerce.id}" title="Editar" ><i class="icon-pencil"></i> Editar</a><br />
						              <c:choose>
										  <c:when test="${commerce.status == 0}">
										  	<a href="#myModal" class="lockUnlock" modo='L' idcommerce="${commerce.id}" title="Deshabilitar" role="button" data-toggle="modal" style="margin-right: 15px"><i class="icon-ban-circle"></i> Deshabilitar</a>
										  </c:when>
										  <c:when test="${commerce.status == 1}">
										  	<a href="#myModal" class="lockUnlock" modo='U' idcommerce="${commerce.id}" title="Habilitar" role="button" data-toggle="modal" style="margin-right: 15px"><i class="icon-ok"></i> Habilitar</a>
										  </c:when>
										  <c:when test="${commerce.status == 2}">
										  	<a href="#myModal" class="lockUnlock" modo='U' idcommerce="${commerce.id}" title="Habilitar" role="button" data-toggle="modal" style="margin-right: 15px"><i class="icon-ok"></i> Habilitar</a>
										  </c:when>
									  </c:choose>
						          </td>
						        </tr>
						</c:forEach>
						<form method="post"  action="lockUnlockCommerce" id="f_lock">
		        			<input type="hidden" name="id" id="id_commerce"/>
		        			<input type="hidden" name="modo" id="modo"/>
						</form>
				      </c:if>
				        
				      </tbody>
				    </table>
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


