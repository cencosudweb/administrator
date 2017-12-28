<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
<%@ page import="com.cencosud.administrator.dto.users.GraficosDTO"%>
<%@ page import="com.cencosud.administrator.web.utils.DateUtils"%>
<%
Date dNow = new Date();
SimpleDateFormat ft =  new SimpleDateFormat ("dd/MM/yyyy");
String currentDate = ft.format(dNow);


//out.println("date1="+currentDate);
//out.println("date2="+DateUtils.restarDiaFecha(currentDate,"1"));


String exportToExcel = request.getParameter("exportToExcel");
if (exportToExcel != null && exportToExcel.toString().equalsIgnoreCase("YES")) {
	response.setContentType("application/vnd.ms-excel");
	response.setHeader("Content-Disposition", "inline; filename=" + "PrintUserExcel.xls");
}

SimpleDateFormat format = new SimpleDateFormat ("MM");

String[] monthname = {"January","February","March","April","May","June","July","August","September","October","November","December"};
Calendar cal = Calendar.getInstance();

Integer year_actual = (cal.get(Calendar.YEAR));


String dateInicio =  request.getParameter("dateInicio");
//out.println("dateInicio="+dateInicio);

//out.println("dateInicio="+dateInicio);
//String starttime = DateUtils.turnDate(dateInicio) != null?DateUtils.turnDate(dateInicio):DateUtils.turnDate(currentDate);

//String starttime = DateUtils.turnDate3(dateInicio) != null?DateUtils.turnDate3(dateInicio):DateUtils.turnDate3(currentDate);
String starttime = DateUtils.turnDate3(dateInicio) != null?DateUtils.turnDate3(dateInicio):DateUtils.turnDate3(DateUtils.restarDiaFecha(currentDate,"1"));
String starttime2 = DateUtils.turnDate4(dateInicio) != null?DateUtils.turnDate4(dateInicio):DateUtils.turnDate4(currentDate);
//out.println("starttime="+starttime);
//out.println("starttime2="+starttime2);






%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <jsp:include page="../../include/head.jsp" />
  
  <script src="<c:url value="/js/admin/call/call.all.js"/>" type="text/javascript"></script>

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic"/>
  
   <script src="<c:url value="/js/admin/call/call.all.js"/>" type="text/javascript"></script>
  
  <link rel="stylesheet" href="<c:url value="/js/jquery-ui.css"/>"/>
  <link rel="stylesheet" href="<c:url value="/js/style.css"/>"/>
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    //$( "#datepicker" ).datepicker();
	  $("#dateInicio").datepicker({
			changeMonth: true,
			changeYear: true,
			dateFormat: 'dd/mm/yy',
			minDate: new Date(2010, 1 - 1, 1),
			yearRange: '2010:2030',
			showOn: "button",
			buttonImage: "/administrator-webapp/images/calendar.png",
			buttonImageOnly: true
		});

    
  } );

  
  </script>
  
  
  </head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <jsp:include page="../../include/banner.jsp" />
  <jsp:include page="../../include/menu.jsp" />

  

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Panel
        <small>Control panel Version 1.0</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="home"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Reporte Cuadratura Venta en Verde <span class="divider"></span></li>
		<li class="active"><a href="#">Proceso Ultima Actualizacion:</a> <i class="fa fa-clock-o" aria-hidden="true"></i>
		    <c:forEach items="${horarios}" var="horario" varStatus="status">
		  	<c:out value="${horario.fecha}"></c:out>
		  </c:forEach>
		   
		   <span class="divider"></span>
		</li>
		   <!--  
            <li class="active"><a href="#">Proceso Proxima Actualizacion:</a> <i class="icon-time"></i>xxxxx</li>
            -->
          <!--
		  <li class="active">Top Navigation</li>
		  -->
      </ol>
    </section>

    <!-- Main content -->
     <section class="content">
	  		<div class="row">
				<!-- left column -->
				<div class="col-md-12">
				  <!-- general form elements -->
				  <div class="box box-primary">
					<div class="box-header with-border">
					  <h3 class="box-title">Consulta</h3>
					</div>
					<!-- /.box-header -->
					<!-- form start -->

					<form class="form-inline"  method="get" action="reporteCuadraturaVentaEnVerde">
					<!--	
					<form role="form" id="f_all_user" method="get" action="trazabilidad">
					-->
						<input type="hidden" name="posted" id="posted" value="ok"/>
					  <div class="box-body">
						<div class="form-group">
						  <label for="exampleInputEmail1">Dia</label>
						 	<input type="text" value="<% if (request.getParameter("dateInicio") != null) { %><% try { SimpleDateFormat formatoFecha = new SimpleDateFormat("dd/MM/yyyy", Locale.getDefault()); formatoFecha.setLenient(false); formatoFecha.parse(request.getParameter("dateInicio"));%><%=request.getParameter("dateInicio").toString().trim()%><% } catch(ParseException  e) {%><%=currentDate%><% } %><%  } else {%><%=currentDate %> <% } %>" readonly name="dateInicio" id="dateInicio" class="form-control"  />
						</div>
						
					  </div>
					  <!-- /.box-body -->
					  <div class="box-footer">
						<button type="submit" class="btn btn-primary">Consultar</button>
					  </div>
					</form>
				  </div>
				  <!-- /.box -->
				</div>
			</div>		
			
			<!-- /.row -->

			  <div class="row">
				<div class="col-md-12">
				  <div class="box">
					<div class="box-header with-border">
					  <h3 class="box-title">Cuadratura Venta en Verde</h3>
					  <div class="box-tools pull-right">
						<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
						</button>
					  </div>
					</div>
					<!-- ./box-body -->
					<div class="box-footer">
						<div class="row">
							<div class="col-sm-12 col-xs-12">
							  <div class="description-block">
							  	<a href="detalleOcEom?dateInicio=<%=starttime2%>&estado=0&orden_distribucion=0&solicitud_original=0" alt="Soporte Venta Detalle" title="Soporte Venta Detalle">
							  	<span class="description-percentage text-blue"><i class="fa fa-caret-right"> </i> 
								</span>
								
								
								
								
								</a>
								<h5 class="description-header" style="font-size:40px">
								<a href="detalleOcEom?dateInicio=<%=starttime2%>&estado_relacion=1&orden_distribucion=0&solicitud_original=0" style="color: #333">
								
								<c:choose>
								  <c:when test="${eom > 0}">
								    <fmt:formatNumber pattern="#,###,#00" value="${eom}"  type="number"/>
								  </c:when>
								  <c:otherwise>
								    0
								  </c:otherwise>
								</c:choose>
								
								
								</a>
								</h5>
								<span class="description-text" style="font-size:20px">CANTIDAD EOM</span>
							  </div>
							  <!-- /.description-block -->
							</div>
					  	</div>
					  	<div class="box-header with-border"></div>
					  	<!-- /.row -->
					  	<div class="row">
							<div class="col-sm-12 col-xs-12">
							  <div class="description-block">
							  	<a href="detalleOcEncontrado?dateInicio=<%=starttime2%>&estado_relacion=2&orden_distribucion=0&solicitud_original=0" alt="Eom Detalle" title="Eom Detalle">
								<span class="description-percentage text-green"><i class="fa fa-caret-right"></i> 
								</span>
								</a>
								<h5 class="description-header" style="font-size:40px">
								<a href="detalleOcEncontrado?dateInicio=<%=starttime2%>&estado=0&orden_distribucion=0&solicitud_original=0" style="color: #333">
								<c:choose>
								  <c:when test="${encontrado > 0}">
								    <fmt:formatNumber pattern="#,###,#00" value="${encontrado}"  type="number"/>
								  </c:when>
								  <c:otherwise>
								    0
								  </c:otherwise>
								</c:choose>				
								</a>
								</h5>
								<span class="description-text" style="font-size:20px">ENCONTRADOS EN JDA</span>
							  </div>
							  <!-- /.description-block -->
							</div>
					  	</div>
					  	<!-- /.row -->
					  	<div class="box-header with-border"></div>
					  	<div class="row">
							<div class="col-sm-12 col-xs-12">
							  <div class="description-block">
							  	<a href="detalleOcNoEncontrado?dateInicio=<%=starttime2%>&estado_relacion=3&orden_distribucion=0&solicitud_original=0" alt="Eom Detalle" title="Eom Detalle">
								<span class="description-percentage text-red"><i class="fa fa-caret-right"></i> 
								</span>
								</a>
								<h5 class="description-header" style="font-size:40px">
								<a href="detalleOcNoEncontrado?dateInicio=<%=starttime2%>&estado=0&orden_distribucion=0&solicitud_original=0" style="color: #333">
								<c:choose>
								  <c:when test="${noEncontrado > 0}">
								    <fmt:formatNumber pattern="#,###,#00" value="${noEncontrado}"  type="number"/>
								  </c:when>
								  <c:otherwise>
								    0
								  </c:otherwise>
								</c:choose>	
															
								</a>
								</h5>
								<span class="description-text" style="font-size:20px">NO ENCONTRADOS EN JDA</span>
							  </div>
							  <!-- /.description-block -->
							</div>
					  	</div>
					  	
					  	<div class="box-header with-border"></div>
					  	<div class="row">
							<div class="col-sm-12 col-xs-12">
							  <div class="description-block">
							  	<a href="detalleOcConError?dateInicio=<%=starttime2%>&estado_relacion=4&orden_distribucion=0&solicitud_original=0" alt="Eom Detalle" title="Eom Detalle">
								<span class="description-percentage text-yellow"><i class="fa fa-caret-right"></i> 
								</span>
								</a>
								<h5 class="description-header" style="font-size:40px">
								<a href="detalleOcConError?dateInicio=<%=starttime2%>&estado=0&orden_distribucion=0&solicitud_original=0" style="color: #333">
								<c:choose>
								  <c:when test="${ocConError > 0}">
								    <fmt:formatNumber pattern="#,###,#00" value="${ocConError}"  type="number"/>
								  </c:when>
								  <c:otherwise>
								    0
								  </c:otherwise>
								</c:choose>									
								</a>
								</h5>
								<span class="description-text" style="font-size:20px">OC ENCONTRADOS CON ERROR EN JDA</span>
							  </div>
							  <!-- /.description-block -->
							</div>
					  	</div>
					  	
					  	<div class="box-header with-border"></div>
					  	<div class="row">
							<div class="col-sm-12 col-xs-12">
							  <div class="description-block">
							  	<a href="detalleCantidaOc?dateInicio=<%=starttime2%>&estado_relacion=5&orden_distribucion=0&solicitud_original=0" alt="Eom Detalle" title="Eom Detalle">
								<span class="description-percentage text-black"><i class="fa fa-caret-right"></i> 
								</span>
								</a>
								<h5 class="description-header" style="font-size:40px">
								<a href="detalleCantidaOc?dateInicio=<%=starttime2%>&estado=0&orden_distribucion=0&solicitud_original=0" style="color: #333">
								<c:choose>
								  <c:when test="${cantidadOc > 0}">
								    <fmt:formatNumber pattern="#,###,#00" value="${cantidadOc}"  type="number"/>
								  </c:when>
								  <c:otherwise>
								    0
								  </c:otherwise>
								</c:choose>	
								
								
								
								</a>
								</h5>
								<span class="description-text" style="font-size:20px">CANTIDAD OC</span>
							  </div>
							  <!-- /.description-block -->
							</div>
					  	</div>
					  	<!-- /.row -->
					</div>
					<!-- /.box-footer -->
					
					
					<br>
					</br>
					<!--  
					<style type="text/css">
					${demo.css}
					</style>
					
					<script src="<c:url value="/js/Highcharts/highcharts.js"/>"></script>
					<script src="<c:url value="/js/Highcharts/highcharts-3d.js"/>"></script>
					<script src="<c:url value="/js/Highcharts/modules/exporting.js"/>"></script>
					
					<div id="container" style="height: 400px"></div>
					
					
							<script type="text/javascript">
					
					Highcharts.chart('container', {
					    chart: {
					        type: 'pie',
					        options3d: {
					            enabled: true,
					            alpha: 45,
					            beta: 0
					        }
					    },
					    title: {
					        text: 'Cuadratura Venta en Verde'
					    },
					    tooltip: {
					        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
					    },
					    plotOptions: {
					        pie: {
					            allowPointSelect: true,
					            cursor: 'pointer',
					            depth: 35,
					            dataLabels: {
					                enabled: true,
					                format: '{point.name}'
					            }
					        }
					    },
					    series: [{
					        type: 'pie',
					        name: 'Cantidad',
					        data: [
					            ['Cantida EOM', 451.0],
					            ['Encontrado', 441.0],
					            ['No Encontrado', 431.0],
					            ['OC Con Error', 415.0],
					            ['Cantidad OC', 425.0]
					        ]
					    }]
					});
							</script>
							-->
					
				  </div>
				  <!-- /.box -->
				</div>
				<!-- /.col -->
			  </div>
			  <!-- /.row -->
			  
			  
			  
			  
			  
			  
			  
      </section>
      <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
	<jsp:include page="../../include/footer.jsp" />
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Create the tabs -->
    <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
      <li><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
      <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
    </ul>
    <!-- Tab panes -->
    <div class="tab-content">
      <!-- Home tab content -->
      <div class="tab-pane" id="control-sidebar-home-tab">
        <h3 class="control-sidebar-heading">Recent Activity</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-birthday-cake bg-red"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

                <p>Will be 23 on April 24th</p>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-user bg-yellow"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Frodo Updated His Profile</h4>

                <p>New phone +1(800)555-1234</p>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-envelope-o bg-light-blue"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Nora Joined Mailing List</h4>

                <p>nora@example.com</p>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-file-code-o bg-green"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Cron Job 254 Executed</h4>

                <p>Execution time 5 seconds</p>
              </div>
            </a>
          </li>
        </ul>
        <!-- /.control-sidebar-menu -->

        <h3 class="control-sidebar-heading">Tasks Progress</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript:void(0)">
              <h4 class="control-sidebar-subheading">
                Custom Template Design
                <span class="label label-danger pull-right">70%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <h4 class="control-sidebar-subheading">
                Update Resume
                <span class="label label-success pull-right">95%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-success" style="width: 95%"></div>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <h4 class="control-sidebar-subheading">
                Laravel Integration
                <span class="label label-warning pull-right">50%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-warning" style="width: 50%"></div>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <h4 class="control-sidebar-subheading">
                Back End Framework
                <span class="label label-primary pull-right">68%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-primary" style="width: 68%"></div>
              </div>
            </a>
          </li>
        </ul>
        <!-- /.control-sidebar-menu -->

      </div>
      <!-- /.tab-pane -->
      <!-- Stats tab content -->
      <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
      <!-- /.tab-pane -->
      <!-- Settings tab content -->
      <div class="tab-pane" id="control-sidebar-settings-tab">
        <form method="post">
          <h3 class="control-sidebar-heading">General Settings</h3>

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Report panel usage
              <input type="checkbox" class="pull-right" checked>
            </label>

            <p>
              Some information about this general settings option
            </p>
          </div>
          <!-- /.form-group -->

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Allow mail redirect
              <input type="checkbox" class="pull-right" checked>
            </label>

            <p>
              Other sets of options are available
            </p>
          </div>
          <!-- /.form-group -->

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Expose author name in posts
              <input type="checkbox" class="pull-right" checked>
            </label>

            <p>
              Allow the user to show his name in blog posts
            </p>
          </div>
          <!-- /.form-group -->

          <h3 class="control-sidebar-heading">Chat Settings</h3>

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Show me as online
              <input type="checkbox" class="pull-right" checked>
            </label>
          </div>
          <!-- /.form-group -->

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Turn off notifications
              <input type="checkbox" class="pull-right">
            </label>
          </div>
          <!-- /.form-group -->

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Delete chat history
              <a href="javascript:void(0)" class="text-red pull-right"><i class="fa fa-trash-o"></i></a>
            </label>
          </div>
          <!-- /.form-group -->
        </form>
      </div>
      <!-- /.tab-pane -->
    </div>
  </aside>
  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>

<!-- ./wrapper -->
<!-- Bootstrap 3.3.7 -->
<script src="<c:url value="/bower_components/bootstrap/dist/js/bootstrap.min.js"/>"></script>
<!-- SlimScroll -->
<script src="<c:url value="/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"/>"></script>
<!-- FastClick -->
<script src="<c:url value="/bower_components/fastclick/lib/fastclick.js"/>"></script>
<!-- AdminLTE App -->
<script src="<c:url value="/dist/js/adminlte.min.js"/>"></script>
<!-- AdminLTE for demo purposes -->
<script src="<c:url value="/dist/js/demo.js"/>"></script>



<script type="text/javascript">
		$(window).load(function () {
			$('#dvLoading').fadeOut(1000);
		});
		
    </script>
    

<script type="text/javascript">
$(function(){
	
	var addUser = function() {
		location.href = "addUser";
		return false;
	};
	
	
	$("#btn-add-user").button().live('click', addUser);
	
	
	var addUser = function() {
		location.href = "addUser";
		return false;
	};
	
	$("#btn-add-user").button().live('click', addUser);
	
	var deleteUser = function() {
		$("#f_lock").submit();
		return false;
	};
	
	
	
	$(".btn-danger").button().live('click', deleteUser);
	
	var setUserId = function(){
		var idUsuario = $(this).attr("iduser");
		var modo = $(this).attr("modo");
		$("#id_user").val(idUsuario);
		$("#modo").val(modo);
	};
	
	$(".lockUnlock").button().live('click', setUserId);
	
	
	var allUser = function() {
		$('#f_all_user').submit();
		return false;
	};
	
	$("#btn-all-user").button().live('click', allUser);
	
});
        
</script>

</body>
</html>
