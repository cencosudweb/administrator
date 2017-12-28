<%@include file="../../../include/taglib_includes.jsp" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <jsp:include page="../../../include/head.jsp" />
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/datepicker/jquery.ui.all.css"/>">
    <script src="<c:url value="/js/jquery.ui.core.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/js/jquery.ui.datepicker.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/js/jquery.ui.datepicker-es.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/js/admin/financial/agreement.add.js"/>" type="text/javascript"></script>

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
            <h1 class="page-title">Editar Convenio de ${financial.businessLine}</h1>
        </div>

		<ul class="breadcrumb">
			<li><a href="home">Home</a> <span class="divider">/</span></li>
			<li><a href="allFinancial">Instituciones Financieras</a> <span class="divider">/</span></li>
			<li><a href="allAgreement">Convenios</a> <span class="divider">/</span></li>
			<li class="active">Editar</li>
		</ul>

		<div class="container-fluid">
            <div class="row-fluid">
				<div class="btn-toolbar">
				    <button  id="btn-save-agreement" class="btn btn-primary"><i class="icon-save"></i> Guardar</button>
				    <a href="allFinancial"  class="btn">Cancelar</a>
				  	<div class="btn-group"></div>
				</div>
				
				<div class="well">
				    <ul class="nav nav-tabs">
				      <li class="active"><a href="#home" data-toggle="tab">Datos Convenio</a></li>
				    </ul>
				    <div id="myTabContent" class="tab-content">
				      <div class="tab-pane active in" id="home">
				      
				      	<jsp:include page="../../../include/messages.jsp" />
				      
					    <form:form method="post"  action="saveEditAgreement" modelAttribute="editAgreement" id="f_add_agreement">
					    
					    	<form:hidden path="id" />
					    	<form:hidden path="commerceId" />
					    	<form:hidden path="ifId" />
					        <form:label path="agreementId">C&oacute;digo Convenio</form:label>
					        <form:input path="agreementId" readonly="true" cssClass="input-xlarge" maxlength="6"/>
					        </br><form:errors path="agreementId" cssStyle="color:red"></form:errors></br>
					     	
					        <form:label path="initDateText">* Fecha Inicio</form:label>
					        <form:input path="initDateText" readonly="true" id="dateInicio" cssClass="input-xlarge" value="${editAgreement.initDateFormat}"/>
					        </br><form:errors path="initDateText" cssStyle="color:red"></form:errors></br>
					     	
					     	<form:label path="endDateText">* Fecha Fin</form:label>
					        <form:input path="endDateText" readonly="true" id="dateFin" cssClass="input-xlarge" value="${editAgreement.endDateFormat}"/>
					        </br><form:errors path="endDateText" cssStyle="color:red"></form:errors></br>
					        
<%-- 					        <form:label path="commerceId">Comercio</form:label> --%>
<%-- 					        <form:select path="commerceId" items="${commerces}" itemValue="id" itemLabel="businessLine"/></br> --%>
<!-- 					     	</br> -->
					        <form:label path="timeLimit">* Plazo</form:label>
					        <form:select path="timeLimit.id" items="${plazos}" itemValue="id" itemLabel="description"/></br>
					     	
					     	</br><form:label path="" >(*) Los campos son requeridos</form:label></br>
					     	
					     	<fieldset>
							<legend>** Urls Retorno Fin Pago</legend>
							
							
							<table>
								<!-- url1 -->
								<tr>
									<td><form:label path="">Url 1 de Confirmaci&oacute;n</form:label></td>
									<td><form:label path="">Url 1 de Fin</form:label></td>
									<td></td>
								</tr>
								<tr>
									<td><form:input path="urls[0].confirmationPath" cssClass="input-xlarge" maxlength="500" /></td>
									<td><form:input path="urls[0].endPath" cssClass="input-xlarge" maxlength="500" /></td>
									<td><form:select path="urls[0].channel.id">
					        		<form:option value="-1">Seleccione Canal</form:option>
   									<form:options items="${canales}" itemValue="id" itemLabel="description"/>
					        	</form:select></td>
								</tr>
								<tr>
									<td><form:errors path="urls[0].confirmationPath" cssStyle="color:red"></form:errors></td>
									<td></td>
									<td></td>
								</tr>
								
								<!-- url2 -->
								<tr>
									<td><form:label path="">Url 2 de Confirmaci&oacute;n</form:label></td>
									<td><form:label path="">Url 2 de Fin</form:label></td>
									<td></td>
								</tr>
								<tr>
									<td><form:input path="urls[1].confirmationPath" cssClass="input-xlarge" maxlength="500" /></td>
									<td><form:input path="urls[1].endPath" cssClass="input-xlarge" maxlength="500" /></td>
									<td><form:select path="urls[1].channel.id">
					        		<form:option value="-1">Seleccione Canal</form:option>
   									<form:options items="${canales}" itemValue="id" itemLabel="description"/>
					        	</form:select></td>
								</tr>
								<tr>
									<td><form:errors path="urls[1].confirmationPath" cssStyle="color:red"></form:errors></td>
									<td></td>
									<td></td>
								</tr>
								
								<!-- url3 -->
								<tr>
									<td><form:label path="">Url 3 de Confirmaci&oacute;n</form:label></td>
									<td><form:label path="">Url 3 de Fin</form:label></td>
									<td></td>
								</tr>
								<tr>
									<td><form:input path="urls[2].confirmationPath" cssClass="input-xlarge" maxlength="500" /></td>
									<td><form:input path="urls[2].endPath" cssClass="input-xlarge" maxlength="500" /></td>
									<td><form:select path="urls[2].channel.id">
					        		<form:option value="-1">Seleccione Canal</form:option>
   									<form:options items="${canales}" itemValue="id" itemLabel="description"/>
					        	</form:select></td>
								</tr>
								<tr>
									<td><form:errors path="urls[2].confirmationPath" cssStyle="color:red"></form:errors></td>
									<td></td>
									<td></td>
								</tr>
							</table>
							
							</fieldset>
							
							<form:label path="" >(**) Ingresar al menos una url de confirmaci&oacute;n y fin por canal</form:label>
					     
					    </form:form>
				      </div>
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
