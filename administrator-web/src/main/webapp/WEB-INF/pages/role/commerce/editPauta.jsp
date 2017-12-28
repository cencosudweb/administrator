<%@include file="../../include/taglib_includes.jsp" %>
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


<%
Date dNow = new Date();
SimpleDateFormat ft = 
new SimpleDateFormat ("dd/MM/yyyy");
String currentDate = ft.format(dNow);

%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
  <head>
    <jsp:include page="../../include/head.jsp" />
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/> 
    <script src="<c:url value="/js/admin/pauta/pauta.edit.js"/>" type="text/javascript"></script>
    
    
    <script src="<c:url value="/js/admin/calendar/calendar.pauta.all.js"/>" type="text/javascript"></script>
  	<link rel="stylesheet" type="text/css" href="<c:url value="/css/datepicker/jquery.ui.all.css"/>"/>
    <script src="<c:url value="/js/jquery.ui.core.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/js/jquery.ui.datepicker.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/js/jquery.ui.datepicker-es.js"/>" type="text/javascript"></script>
    

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="../../../assets/ico/favicon.ico"/>
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../../../assets/ico/apple-touch-icon-144-precomposed.png"/>
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../../../assets/ico/apple-touch-icon-114-precomposed.png"/>
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../../../assets/ico/apple-touch-icon-72-precomposed.png"/>
    <link rel="apple-touch-icon-precomposed" href="../../../assets/ico/apple-touch-icon-57-precomposed.png"/>
    
    
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<style>
	

	table {
		font-size: 1em;
	}

	.ui-draggable, .ui-droppable {
		background-position: top;
	}
	</style>  
	
    
    <script src="<c:url value="/js/admin/pauta/pauta.validate.selected.level.js"/>" type="text/javascript"></script>
	 
	
	
	
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
            <h1 class="page-title">Modificar Requerimiento</h1>
        </div>

		<ul class="breadcrumb">
			<li><a href="home">Home</a> <span class="divider">/</span></li>
			<li><a href="allPautas">Requerimientos</a> <span class="divider">/</span></li>
			<li class="active">Modificar</li>
		</ul>

		<div class="container-fluid">
            <div class="row-fluid">
				<div class="btn-toolbar">
				    <button  id="btn-save-pauta" class="btn btn-primary"><i class="icon-save"></i> Actualizar</button>
				    <a href="allPautas"  class="btn">Cancelar</a>
				  	<div class="btn-group"></div>
				</div>
				
				<div class="well">
				    <ul class="nav nav-tabs">
				      <li class="active"><a href="#home" data-toggle="tab">Datos Requerimiento</a></li>
				    </ul>
				    <div id="myTabContent" class="tab-content">
				      <div class="tab-pane active in" id="home">
					    <form:form method="post"  action="saveEditPauta" modelAttribute="editPauta" id="f_edit_pauta">
					    	<form:hidden path="id" />
					    	
					    	<form:hidden path="valorTienda" id="valorTienda" value="1" />
							<form:hidden path="valorPadrino" id="valorPadrino" value="1"/>
							<form:hidden path="valorGerente" id="valorGerente" value="1"/>
							<form:hidden path="valorContratante" id="valorContratante" value="1"/>
							<form:hidden path="valorSoporte" id="valorSoporte" value="1"/>
					    	
					    	
					    	<div>	
							<form:label path="tienda">* Tiendas</form:label>
					        <!--  
					        <form:select path="tienda.id" items="${tiendas}" itemValue="id" itemLabel="description"  cssStyle="width:300px"/></br></br>
							-->
							<form:select id="tiendaSelect" name="tiendaId" path="tienda.id" cssStyle="width:300px">
							    <c:forEach var="tienda" items="${tiendas}">
							        <form:option value="${tienda.id}"><c:out value="${tienda.description} - ${tienda.flag.description}"/></form:option>
							    </c:forEach>
							</form:select>
							
							<form:label path="padrino">* Reportado por</form:label>
					        <form:select path="padrino.id" items="${padrinos}" itemValue="id" itemLabel="description"  cssStyle="width:300px"/></br></br>
					    		
						  	
					    	</div>
					    	
					    
					    		
					    	<form:label path="area">* Areas</form:label>
					        <form:select path="area.id" items="${areas}" itemValue="id" itemLabel="description" cssStyle="width:300px"/></br></br>
					    
					    	<form:label path="prioridad">* Prioridad</form:label>
					        <form:select path="prioridad.id" items="${prioridades}" itemValue="id" itemLabel="description"  cssStyle="width:300px"/></br></br>
	
					    	<form:label path="estado">* Estado</form:label>
					        <form:select path="estado.id" items="${estados}" itemValue="id" itemLabel="description"  cssStyle="width:300px"/></br></br>
	
							<form:label path="descripcionIssue">* Descripcion Issue</form:label>
					        <form:input path="descripcionIssue"  cssStyle="width:300px" maxlength="3000"/>
					        </br><form:errors path="descripcionIssue" cssStyle="color:red"></form:errors></br>
	
							
					        <form:label path="observacion">* Observacion</form:label>
					        <form:textarea path="observacion" cssStyle="width:300px" maxlength="3000"/>
					        </br><form:errors path="observacion" cssStyle="color:red"></form:errors></br>
					        
					        <form:label path="ticketCu">* Ticket CU</form:label>
					        <form:textarea id="ticketCu" path="ticketCu" cssStyle="width:300px" maxlength="3000"/>
					        </br><form:errors path="ticketCu" cssStyle="color:red"></form:errors></br>
					        
					        
							<form:label path="fechaVisita2">Fecha Visita</form:label>
					        <form:input path="fechaVisita2" readonly="true"   cssStyle="width:300px" id="fechaVisita2"/>
							
					       
					       </br></br><form:label path="" >(*) Los campos son requeridos</form:label>
					    </form:form>
				      </div>
				  </div>
				</div>
				<jsp:include page="../../include/footer.jsp" />
            </div>
        </div>
    </div>
    <div id="dialog-confirm" title="Validacion">
  <p><span class="ui-icon ui-icon-alert" style="float:left; margin:12px 12px 20px 0;"></span><p id="texto"></p>Por favor, debe seleccionar todos los campos requeridos del formulario</p>
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
