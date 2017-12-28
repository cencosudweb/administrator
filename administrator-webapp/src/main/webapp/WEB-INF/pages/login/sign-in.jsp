<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Paris Cencosud</title>
      <script src="<c:url value="/js/jquery-1.7.2.min.js"/>" type="text/javascript"></script>
	<script src="<c:url value="/js/login/login.js"/>" type="text/javascript"></script>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="<c:url value="/bower_components/bootstrap/dist/css/bootstrap.min.css"/>">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="<c:url value="/bower_components/font-awesome/css/font-awesome.min.css"/>">
  <!-- Ionicons -->
  <link rel="stylesheet" href="<c:url value="/bower_components/Ionicons/css/ionicons.min.css"/>">
  <!-- Theme style -->
  <link rel="stylesheet" href="<c:url value="/dist/css/AdminLTE.min.css"/>">
  <!-- iCheck -->

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">


  <!-- Favicon -->
  <link rel="apple-touch-icon" sizes="180x180" href="<c:url value="/dist/img/favicons/apple-touch-icon.png"/>">
  <link rel="icon" type="image/png" sizes="32x32" href="<c:url value="/dist/img/favicons/favicon-32x32.png"/>">
  <link rel="icon" type="image/png" sizes="16x16" href="<c:url value="/dist/img/favicons/favicon-16x16.png"/>">
  <link rel="manifest" href="<c:url value="/dist/img/favicons/manifest.json"/>">
  <link rel="mask-icon" href="<c:url value="/dist/img/favicons/safari-pinned-tab.svg"/>" color="#5bbad5">
  <meta name="theme-color" content="#ffffff">
  
  
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <a href="login" style="color: #337ab7"><b style="color: #337ab7">Paris</b>Cencosud</a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">Iniciar Sesi&oacute;n</p>

    <form name="f" id="f_login" action="<c:url value='j_spring_security_check' />" method="post">
      <div class="form-group has-feedback">
       <input type="email" class="form-control" placeholder="Usuario"  name="j_username"  id="j_username" data-error="Ingrese un email valido" required=""> 
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" class="form-control" name="j_password" placeholder="Password" id="j_password" required> 
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
      	<!--  
        <div class="col-xs-8">
          <div class="checkbox icheck">
            <label>
              <input type="checkbox"> Remember Me
            </label>
          </div>
        </div>
        -->
        <!-- /.col -->
        <div class="col-xs-4">
          <a id="btn-login"  class="btn btn-primary btn-block btn-flat">Sign In</a> 
        </div>
        <!-- /.col -->
      </div>
    </form>
    <br></br>
    
    <jsp:include page="../include/messages.jsp" />
	<!--  
    <div class="social-auth-links text-center">
      <p>- OR -</p>
      <a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i> Sign in using
        Facebook</a>
      <a href="#" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-google-plus"></i> Sign in using
        Google+</a>
    </div>
    -->
    <!-- /.social-auth-links -->
<!-- 
    <a href="#">I forgot my password</a><br>
    <a href="register.html" class="text-center">Register a new membership</a>
     -->

  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 3 -->
<script src="<c:url value="/bower_components/jquery/dist/jquery.min.js"/>"></script>
<!-- Bootstrap 3.3.7 -->
<script src="<c:url value="/bower_components/bootstrap/dist/js/bootstrap.min.js"/>"></script>
<!-- iCheck -->
<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' // optional
    });
  });
</script>
</body>
</html>
