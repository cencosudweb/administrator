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
            'copy', 'csv', 'excel', 'print'
        ]
    } );
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
        <li class="active">Reporte Cuadratura Orden Stock Pendientes <span class="divider"></span></li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
	  			
			
			<!-- /.row -->
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">Detalle Orden Stock Pendientes</h3>
				<!-- 
              <div class="box-tools">
                <div class="input-group input-group-sm" style="width: 150px;">
                  <input type="text" name="table_search" class="form-control pull-right" placeholder="Search">

                  <div class="input-group-btn">
                    <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                  </div>
                </div>
              </div>
              -->
            </div>
            
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

					<form class="form-inline"  method="get" action="allOrdeneStockPendientes">
					<!--	
					<form role="form" id="f_all_user" method="get" action="trazabilidad">
					-->
						<input type="hidden" name="posted" id="posted" value="ok"/>
					  <div class="box-body">
						<div class="form-group">
						  <label for="exampleInputEmail1">Dia</label>
							<input type="text" value="<% if (request.getParameter("dateInicio") != null) { %><% try { SimpleDateFormat formatoFecha = new SimpleDateFormat("dd/MM/yyyy", Locale.getDefault()); formatoFecha.setLenient(false); formatoFecha.parse(request.getParameter("dateInicio"));%><%=request.getParameter("dateInicio").toString().trim()%><% } catch(ParseException  e) {%><%=DateUtils.restarDiaFecha(currentDate,"1")%><% } %><%  } else {%><%=DateUtils.restarDiaFecha(currentDate,"1") %> <% } %>" readonly name="dateInicio" id="dateInicio" class="form-control"/>
 								
						</div>
						</br>
						
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
					
					
            <!-- /.box-header -->
            <div class="box-body table-responsive">
	            <table id="example" class="display nowrap" cellspacing="0" width="100%">
			        <thead>
			            <tr>
			                <th>ORDER_ID</th>
			                <th>ORDER_LINE_ID</th>
			                <th>Size Desc</th>
			                <th>Shpd Qty</th>
			                <th>Fecha Creacion</th>
			                <th>Tipo Orden</th>
			                <th>Pedido</th>
			                <th>Sku</th>
			                <th>C. Despachada</th>
			                <th>C. Ordenada</th>
			                <th>C. Pediente</th>
			            </tr>
			        </thead>
			        <tfoot>
			            <tr>
			                <th>ORDER_ID</th>
			                <th>ORDER_LINE_ID</th>
			                <th>Size Desc</th>
			                <th>Shpd Qty</th>
			                <th>Fecha Creacion</th>
			                <th>Tipo Orden</th>
			                <th>Pedido</th>
			                <th>Sku</th>
			                <th>C. Despachada</th>
			                <th>C. Ordenada</th>
			                <th>C. Pediente</th>
			            </tr>
			        </tfoot>
			        <tbody>
			        	<c:forEach items="${ordenes}" var="orden" varStatus="status">
							<tr>
								<td>${orden.ordeId}</td>
								<td>${orden.ordeLineId}</td>
								<td>${orden.sizeDesc}</td>
								<td>${orden.shpdQty}</td>
								<td>${orden.fechaCreacion}</td>
								<td>${orden.tipoOrden}</td>
								<td>${orden.pedido}</td>
								<td>${orden.sku}</td>
								<td>${orden.cantidadDespachada}</td>
								<td>${orden.cantidadOrdenada}</td>
								<td>${orden.cantidadPendiente}</td>
							</tr>
						</c:forEach>	
			        </tbody>
	    		</table>
            </div>
            <!--  
             <c:if test="${!empty detalles}">
				<div class="pagination"> 
				<c:if test="${numpages != null}">
	            	<ul class="pagination">
		            	<li>${pagelinks}</li>
	            	</ul>
           		</c:if>
           		</div>
           		</c:if>
           		-->
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
      </div>
      
      <br></br>
      <!--  -->
      <div class="row">
		<div class="col-sm-12 col-xs-12">
			<div class="description-block">
				<h5 class="description-header" style="font-size:30px">
					<form role="form" id="f_all_user" method="get" action="home">
						<button type="submit" class="btn btn-primary">Volver</button>
					</form>
				</h5>
				<span class="description-text"><!--  eCommerce--></span>
			</div>
			<!-- /.description-block -->
			</div>
		</div>
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
