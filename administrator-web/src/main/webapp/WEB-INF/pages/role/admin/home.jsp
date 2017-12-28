<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <jsp:include page="../../include/head.jsp" />

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="../../assets/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../../assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../../assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../../assets/ico/apple-touch-icon-57-precomposed.png">
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
			<!--  
			<div class="stats">
				<p class="stat">
					<span class="number">53</span>tickets
				</p>
				<p class="stat">
					<span class="number">27</span>tasks
				</p>
				<p class="stat">
					<span class="number">15</span>waiting
				</p>
			</div>
			-->

			<h1 class="page-title">Dashboard Admin</h1>
		</div>

		<ul class="breadcrumb">
			<li><a href="home">Home</a> <span class="divider">/</span>
			</li>
			<li class="active">Dashboard</li>
		</ul>

		<div class="container-fluid">
			<div class="row-fluid">


				<div class="row-fluid">

					<jsp:include page="../../include/messages.jsp" />
					

				<div class="row-fluid">
					<div class="block ">
						<p class="block-heading">Panel Cencosud</p>
						
						<div class="block-body">
							<center>
							<h2>Bienvenido al Panel Cencosud</h2> 
							<!--  
 							<p>El Panel Cencosud tiene como finalidad obtener Estadisticas para los usuarios que quieran ver los reportes generados.
 							-->
 							<!--  
 							<p>El Acceso a la  Plataforma Panel Cencosud.
							Para obtener más información, por favor vaya a <a target="_new" href="#"></a>Cencosud.
							Atentamente, El Equipo de Cencosud Cencosud.</p> 
							 <p>Para Mayor informacion y documentacion sobre Plataforma Cencosud,
							por favor visitar <a target="_new" href="#">www.cencosud.cl</a>

							, por favor visite <a target="_new" href="#">www.cencosud.cl</a></p>
							 
							-->
							<br></br>
							<img src="<c:url value="/images/cencosud.png"/>" alt="" width="200" height="154" />
 							<p> 
 								<!--  <a target="_new" href="#" class="btn btn-primary btn-large">Pagina &raquo;</a> -->
 							</p> 
 							</center>
						</div>
						
					</div>
				</div>
					
				</div>	





				<footer>
				<hr>

					<!-- Purchase a site license to remove this link from the footer: http://www.portnine.com/bootstrap-themes -->
					<p class="pull-right">
						A <a href="#"
							target="_blank">Desarrollado</a> por <a
							href="#" target="_blank">Cencosud</a>
					</p>

					<p>
						&copy; 2017 <a href="#" target="_blank">Cencosud</a>
					</p>
				</footer>

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


