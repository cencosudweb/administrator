<%@include file="../include/taglib_includes.jsp" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <jsp:include page="../include/head.jsp" />
    <script src="<c:url value="/js/admin/user/user.edit.js"/>" type="text/javascript"></script>

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="../assets/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">
  </head>

  <!--[if lt IE 7 ]> <body class="ie ie6"> <![endif]-->
  <!--[if IE 7 ]> <body class="ie ie7 "> <![endif]-->
  <!--[if IE 8 ]> <body class="ie ie8 "> <![endif]-->
  <!--[if IE 9 ]> <body class="ie ie9 "> <![endif]-->
  <!--[if (gt IE 9)|!(IE)]><!--> 
  
  <body class=""> 
  <!--<![endif]-->
    
    <jsp:include page="../include/banner.jsp" />
	<jsp:include page="../include/menu.jsp" />
	<script src="<c:url value="/js/user/user.add.js"/>" type="text/javascript"></script>
    
    <div class="content">
        
        <div class="header">
            <h1 class="page-title">Cambiar Contrase&ntilde;a</h1>
        </div>

		<ul class="breadcrumb">
			<li><a href="home">Mi Cuenta</a> <span class="divider">/</span></li>
			<li class="active">Cambiar Contrase&ntilde;a</li>
		</ul>

		<div class="container-fluid">
            <div class="row-fluid">
				<div class="btn-toolbar">
				    <button  id="btn-save-user" class="btn btn-primary"><i class="icon-save"></i> Guardar</button>
				    <a href="home"  class="btn">Cancelar</a>
				  	<div class="btn-group"></div>
				</div>
				
				<div class="well">
				    <ul class="nav nav-tabs">
				      <li class="active"><a href="#home" data-toggle="tab">Nueva Contrase&ntilde;a</a></li>
				    </ul>
				    
				    <jsp:include page="../include/messages.jsp" />
				    
				    <div id="myTabContent" class="tab-content">
				      <div class="tab-pane active in" id="home">
					    <form:form method="post"  action="saveResetMyPassword" modelAttribute="newUser" id="f_edit_user">
					    	<form:hidden path="id" />
					    	
					    	<form:label path="passwordActualReset">* Contrase&ntilde;a Actual</form:label>
					        <form:password path="passwordActualReset" cssClass="input-xlarge"/>
					        </br><form:errors path="passwordActualReset" cssStyle="color:red"></form:errors></br>
					        
					    	<form:label path="password">* Nueva Contrase&ntilde;a</form:label>
					        <form:password path="password" cssClass="input-xlarge" />
					        </br><form:errors path="password" cssStyle="color:red"></form:errors></br>
					        
					        <form:label path="password2">* Re-ingrese Nueva Contrase&ntilde;a</form:label>
					        <form:password path="password2" cssClass="input-xlarge" />
					        </br><form:errors path="password2" cssStyle="color:red"></form:errors></br>
							
							<form:label path="" >(*) Todos los campos son requeridos</form:label></br>
					    </form:form>
				      </div>
				  </div>
				</div>
				<jsp:include page="../include/footer.jsp" />
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
