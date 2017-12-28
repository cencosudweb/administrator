<%@include file="../include/taglib_includes.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta charset="utf-8">
    <title>Paris Cencosud</title>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="stylesheet" type="text/css" href="<c:url value="/js/bootstrap/css/bootstrap.css"/>">
    
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/theme.css"/>">
    <link rel="stylesheet" type="text/css"  href="<c:url value="/js/font-awesome/css/font-awesome.css"/>">
    <script src="<c:url value="/js/jquery-1.7.2.min.js"/>" type="text/javascript"></script>
	<script src="<c:url value="/js/login/qa.js"/>" type="text/javascript"></script>
	<script src="<c:url value="/js/bootstrap/js/bootstrap.min.js"/>" type="text/javascript"></script>
	
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
  <body class="" onload='document.f.j_username.focus();'> 
  <!--<![endif]-->
    
    <div class="navbar">
        <div class="navbar-inner">
	        <ul class="nav pull-right"></ul>
	        <a class="brand" href="index.html"><span class="first">Paris</span> <span class="second">Cencosud</span></a>
        </div>
    </div>

	<div class="row-fluid">
		<div class="dialog">

			<div class="block">
				<p class="block-heading">Preguntas Secretas</p>
				<div class="block-body">
				  <form:form method="post" action="saveQuestionsAnswer" modelAttribute="newUserQA" id="f_qa">
						
						<form:label path="" class="span12">* Pregunta Nº 1</form:label>
						<form:select id="select_q_1" path="qas[0].valSel" cssStyle="width:100%;">
   							<form:options items="${questions}" itemValue="question" itemLabel="question"/>
   							<form:option value="-1">Otra pregunta...</form:option>
						</form:select>
					    <c:choose>
							<c:when test="${newUserQA.qas[0].valSel == -1}">
								<form:input path="qas[0].question" id="q_1" cssClass="span12" placeholder="Escriba su pregunta personalizada ..." maxlength="300"/>							
							</c:when>
							<c:when test="${newUserQA.qas[0].valSel != -1}">
								<form:input path="qas[0].question" id="q_1" value="${newUserQA.qas[0].valSel}" cssClass="span12" cssStyle="display: none;" placeholder="Escriba su pregunta personalizada ..." maxlength="300"/>
							</c:when>
						</c:choose>
					    </br><form:errors path="qas[0].question" cssStyle="color:red"></form:errors>
					    <form:input path="qas[0].answer" id="a_1" cssClass="span12" placeholder="Escriba su respuesta..." maxlength="300" />
					    </br><form:errors path="qas[0].answer" cssStyle="color:red"></form:errors></br>
					    
					    <form:label path="" class="span12">* Pregunta Nº 2</form:label>
						<form:select id="select_q_2" path="qas[1].valSel"  cssStyle="width:100%;">
   							<form:options items="${questions}" itemValue="question" itemLabel="question"/>
   							<form:option value="-1">Otra pregunta...</form:option>
						</form:select>
					     <c:choose>
							<c:when test="${newUserQA.qas[1].valSel == -1}">
								<form:input path="qas[1].question" id="q_2" cssClass="span12" placeholder="Escriba su pregunta personalizada ..." maxlength="300"/>							
							</c:when>
							<c:when test="${newUserQA.qas[1].valSel != -1}">
								<form:input path="qas[1].question" id="q_2" value="${newUserQA.qas[1].valSel}" cssClass="span12" cssStyle="display: none;" placeholder="Escriba su pregunta personalizada ..."/>
							</c:when>
						</c:choose>
					    </br><form:errors path="qas[1].question" cssStyle="color:red"></form:errors>
					    <form:input path="qas[1].answer" id="a_2" cssClass="span12" placeholder="Escriba su respuesta..." maxlength="300"/>
					    </br><form:errors path="qas[1].answer" cssStyle="color:red"></form:errors></br>
					    
					    <form:label path="" class="span12">* Pregunta Nº 3</form:label>
						<form:select id="select_q_3" path="qas[2].valSel"  cssStyle="width:100%;">
   							<form:options items="${questions}" itemValue="question" itemLabel="question"/>
   							<form:option value="-1">Otra pregunta...</form:option>
						</form:select>
					    <c:choose>
							<c:when test="${newUserQA.qas[2].valSel == -1}">
								<form:input path="qas[2].question" id="q_3" cssClass="span12" placeholder="Escriba su pregunta personalizada ..." maxlength="300"/>							
							</c:when>
							<c:when test="${newUserQA.qas[2].valSel != -1}">
								<form:input path="qas[2].question" id="q_3" value="${newUserQA.qas[2].valSel}" cssClass="span12" cssStyle="display: none;" placeholder="Escriba su pregunta personalizada ..."/>
							</c:when>
						</c:choose>
					    </br><form:errors path="qas[2].question" cssStyle="color:red"></form:errors>
					    <form:input path="qas[2].answer" id="a_3" cssClass="span12" placeholder="Escriba su respuesta..." maxlength="300"/>
					    </br><form:errors path="qas[2].answer" cssStyle="color:red"></form:errors></br>
					    
					    <form:label path="" class="span12">(*) Todos los campos son requeridos</form:label>
					     	 	
						<a id="btn-save-qa" class="btn btn-primary pull-right">Guardar</a> 
						<div class="clearfix"></div>
					</form:form>	
				</div>
			</div>
			
		</div>
	</div>

	<script src="/js/bootstrap/js/bootstrap.js"></script>
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


