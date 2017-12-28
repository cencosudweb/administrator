<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta charset="utf-8">
    <title>Paris Cencosud </title>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="stylesheet" type="text/css" href="<c:url value="/js/bootstrap/css/bootstrap.css"/>">
    
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/theme.css"/>">
    <link rel="stylesheet" type="text/css"  href="<c:url value="/js/font-awesome/css/font-awesome.css"/>">
    <script src="<c:url value="/js/jquery-1.7.2.min.js"/>" type="text/javascript"></script>
	<script src="<c:url value="/js/login/login.js"/>" type="text/javascript"></script>
	<script src="<c:url value="/js/bootstrap/js/bootstrap.min.js"/>" type="text/javascript"></script>
	
    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="<c:url value="/images/favicon.ico"/>">
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
	        <!-- 
	        <a class="brand" href="index.html"><span class="first">Paris</span> <span class="second">Cencosud</span> <img src="<c:url value="/images/cencosud.png"/>" alt="" width="50" height="50" /> </a>
	         -->
	        <a class="brand" href="index.html"><span class="second">Paris</span> <span class="second">Cencosud</span> <img src="<c:url value="/images/apple-touch-icon.png"/>" alt="" width="40" height="40" /> </a>
        </div>
    </div>

	<div class="row-fluid">
		<div class="dialog">

			<div class="block">
				<p class="block-heading">Iniciar Sesi&oacute;n</p>
				<div class="block-body">
					<form name="f" id="f_login" action="<c:url value='j_spring_security_check' />" method="post">
						<label>Username</label><input type="text" class="span12" name="j_username"> 
						<label>Password</label> <input type="password" class="span12" name="j_password" id="j_password"> 
						<a id="btn-login" class="btn btn-primary pull-right">Sign In</a> 
						<div class="clearfix"></div>
					</form>
				</div>
			</div>

			<jsp:include page="../include/messages.jsp" />
			
<!-- 			<p class="pull-right" style=""> -->
<!-- 				<a href="http://www.portnine.com" target="blank">Theme byPortnine</a> -->
<!-- 			</p> -->
			<p>
				
				<!-- 
				<a href="forgotPassword">¿Olvido su Clave?</a>
				 -->
			</p>
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


