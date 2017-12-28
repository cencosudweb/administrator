<%@include file="../../../include/taglib_includes.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<%@ page import="com.cencosud.administrator.dto.users.CumplimientoGraficosDTO"%>
<%@ page import="com.cencosud.administrator.dto.users.CumplimientoTotalesDTO"%>
<%@ page import="com.cencosud.administrator.dto.users.CumplimientoCabeceraDTO"%>

<%@ page import="com.cencosud.administrator.dto.users.GraficosDTO"%>
<%@ page import="com.cencosud.administrator.web.utils.DateUtils"%>
<%@ page import="com.cencosud.administrator.web.utils.StringUtils"%>
<%
Date dNow = new Date();
SimpleDateFormat ft = 
new SimpleDateFormat ("dd/MM/yyyy");
String currentDate = ft.format(dNow);
//out.println("date"+currentDate);
String dateInicio =  request.getParameter("dateInicio");
out.println("dateInicio="+dateInicio);
String starttime = DateUtils.turnDate(dateInicio) != null?DateUtils.turnDate(dateInicio):DateUtils.turnDate(currentDate);
out.println("starttime"+starttime);



String starttimeIni = DateUtils.turnDate222222( String.valueOf( DateUtils.restarDia(DateUtils.turnDate1111(starttime)  ) ) );
String starttimeTer = DateUtils.turnDate(dateInicio) != null?DateUtils.turnDate(dateInicio):DateUtils.turnDate(currentDate);

//out.println("starttimeIni"+starttimeIni);
//out.println("starttimeTer"+starttimeTer);
//out.println("======= "+request.getParameterValues("tipo_orden"));
//cliente_retira
String[] tipoOrdenes = request.getParameterValues("tipo_orden");
String[] tipoVentas = request.getParameterValues("tipo_venta");
String[] clienteRetiras = request.getParameterValues("cliente_retira");
String[] descripcionEmpresas = request.getParameterValues("descripcion_empresa");
String[] tipoGuias = request.getParameterValues("tipo_guia");
String[] horarios = request.getParameterValues("horario");
String[] ventaEmpresas = request.getParameterValues("venta_empresa");

//out.println("tipoOrdenes = "+tipoOrdenes);

String prefixclause ="";
String prefixclauseSub ="";

String prefixclauseCumple ="";
String prefixclauseCumple2 ="";
String prefixclauseCumpleExport ="";
String prefixclauseCumplimiento ="";
String prefixclauseCumplimiento2 ="";
String prefixclauseCumplimientoExport ="";
String prefixclauseCumplimiento_resumen ="";
String prefixclauseCumplimiento_resumen2 ="";
String prefixclauseCumplimiento_resumenExport ="";
String prefixclauseResponsable ="";
String prefixclauseResponsable2 ="";
String prefixclauseResponsableExport ="";
String prefixclauseTipoFecha ="";
String prefixclauseTipoFecha2 ="";
String prefixclauseTipoFechaExport ="";
String prefixclauseTipoOrden ="";
String prefixclauseTipoOrden2 ="";
String prefixclauseTipoOrdenExport ="";
String prefixclauseTipoVenta ="";
String prefixclauseTipoVenta2 ="";
String prefixclauseTipoVentaExport ="";
String prefixclauseClienteRetira ="";
String prefixclauseClienteRetira2 ="";
String prefixclauseClienteRetiraExport ="";
String prefixclauseDescripcionEmpresa ="";
String prefixclauseDescripcionEmpresa2 ="";
String prefixclauseDescripcionEmpresaExport ="";
String prefixclauseTipoGuia ="";
String prefixclauseTipoGuia2 ="";
String prefixclauseTipoGuiaExport ="";
String prefixclauseHorario ="";
String prefixclauseHorario2 ="";
String prefixclauseHorarioExport ="";
String prefixclauseVentaEmpresa ="";
String prefixclauseVentaEmpresa2 ="";
String prefixclauseVentaEmpresaExport ="";





//out.println("prefixclause ="+ prefixclause+ "<br/>");
//out.println("prefixclauseSub ="+ prefixclauseSub+ "<br/>");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <jsp:include page="../../../include/head.jsp" />
	
 	<link rel="stylesheet" href="<c:url value="/css/bootstrap-multiselect.css"/>" type="text/css">
    <script type="text/javascript" src="<c:url value="/js/bootstrap-multiselect.js"/>"></script>
    
    
   <script src="<c:url value="/js/admin/call/call.all.js"/>" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/datepicker/jquery.ui.all.css"/>">
    <script src="<c:url value="/js/jquery.ui.core.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/js/jquery.ui.datepicker.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/js/jquery.ui.datepicker-es.js"/>" type="text/javascript"></script>


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
    
    
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic"/>
  
   <link rel="stylesheet" href="<c:url value="css/jquery.dataTables.min.css"/>"/>
    <link rel="stylesheet" href="<c:url value="css/buttons.dataTables.min.css"/>"/>


	  <script src="<c:url value="js/jquery.dataTables.min.js"/>"></script>
	  <script src="<c:url value="js/dataTables.buttons.min.js"/> "></script>
	  <script src="<c:url value="js/buttons.flash.min.js"/> "></script>
	  <script src="<c:url value="js/jszip.min.js"/> "></script>
	  <script src="<c:url value="js/pdfmake.min.js"/> "></script>
	  <script src="<c:url value="js/buttons.html5.min.js"/> "></script>
	  <script src="<c:url value="js/buttons.print.min.js"/> "></script>
	  
	  
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
            'copy', 'csv', 'excel', 'pdf', 'print'
        ]
    } );
} );
 

  
  </script>
	
   
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
            <h1 class="page-title">Reporte Kpi Cumplimiento Logistico Dinamico <%
            		out.println("starttime"+starttime);

            %></h1>
        </div>
        
        <ul class="breadcrumb">
            <li><a href="home">Home</a> <span class="divider">/</span></li>
            <li class="active">Reporte Kpi Cumplimiento Logistico Dinamico</li>
        </ul>

        <div class="container-fluid">
	        <div class="row-fluid">
	        
	        
	        	  <table id="example" class="display nowrap" cellspacing="0" width="100%">
	        	  <thead>
			            <tr>
			                 <th>RELNUM</th>
			                  <th>POMUMB</th>
			                  <th>INUMBR</th>
			                  <th>RELBL5</th>
			            </tr>
			        </thead>
			        <tfoot>
			            <tr>
			                   <th>RELNUM</th>
			                  <th>POMUMB</th>
			                  <th>INUMBR</th>
			                  <th>RELBL5</th>
			            </tr>
			        </tfoot>
			        <tbody>
			        	<tr>
			        		<td>XXXXX</td>
			        		<td>XXXXX</td>
			        		<td>XXXXX</td>
			        		<td>XXXXX</td>
			        		<td>XXXXX</td>
			        	</tr>
			        </tbody>
	        	  </table>
				
				
				
				<jsp:include page="../../../include/messages.jsp" />
				<c:if test="${posted == null}"><tr><td colspan="8">Por favor presionar boton buscar</td></tr></c:if>
				<c:if test="${posted != null}">
				<div class="well" style="overflow:scroll;">
					<%
						Connection connFecha = null;
						PreparedStatement psFecha = null;
						ResultSet rsFecha = null;
						String SQLFecha = null; 
							
						CumplimientoCabeceraDTO cabecera = null;
						CumplimientoTotalesDTO total = null;
						CumplimientoGraficosDTO graficoCumple1 = null;
						CumplimientoGraficosDTO graficoCumple2 = null;
						CumplimientoGraficosDTO graficoCumple3 = null;
						List<CumplimientoCabeceraDTO> resultCabecera = new ArrayList<CumplimientoCabeceraDTO>();
						List<CumplimientoTotalesDTO> resultTotal = new ArrayList<CumplimientoTotalesDTO>();
						List<CumplimientoGraficosDTO> resultCumple1 = new ArrayList<CumplimientoGraficosDTO>();
						List<CumplimientoGraficosDTO> resultCumple2 = new ArrayList<CumplimientoGraficosDTO>();
						List<CumplimientoGraficosDTO> resultCumple3 = new ArrayList<CumplimientoGraficosDTO>();
							
						int contarFecha = 0;
						int totalProcentajeFecha = 0;
						int totalCantidadFecha = 0;
						int totalesCantidadGraficos1 = 0;
						int totalesCantidadGraficos2 = 0;
						int totalesCantidadGraficos3 = 0;
						try{
							Class.forName("oracle.jdbc.OracleDriver").newInstance();
							connFecha = DriverManager.getConnection("jdbc:oracle:thin:@172.18.163.15:1521/XE","kpiweb","kpiweb");//
							connFecha.setAutoCommit(false);
							SQLFecha = 	"	SELECT  " + 
										"		TC.ID  " +
										"		" +
										"	from CUMPLIMIENTO TC " + 
										"	WHERE 1 = 1 " +
										"	" + prefixclause +
										"	AND TC.FECHA_COMPROMISO_EOM >= REPLACE(TO_CHAR(to_date('"+starttime+" 00:00:00', 'YYYY-MM-DD HH24:MI:SS')-8, 'YYYY/MM/DD HH24:MI:SS'),'/','-') AND TC.FECHA_COMPROMISO_EOM <= '"+starttime+" 23:59:59' " +
										"	 " +
										"	ORDER BY TC.FECHA_COMPROMISO_EOM ASC";
							out.println("<BR>");
							out.println("SQLFecha="+SQLFecha);
							out.println("<BR>");
							psFecha = connFecha.prepareStatement(SQLFecha, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
							rsFecha = psFecha.executeQuery();
							connFecha.commit();
							while(rsFecha.next()) {
								out.println("<BR>");
								out.println("ID="+rsFecha.getInt("ID"));
								out.println("<BR>");
									
							}  // end while Fecha
						} catch (SQLException exQL) {
							connFecha.rollback();
							out.println("Error SQL: " + exQL.getMessage());	
						} catch (Exception ex) {
							connFecha.rollback();
							out.println("Error: " + ex.getMessage());
						} finally {
							if (rsFecha != null) rsFecha.close();
							if (psFecha != null) psFecha.close();
							if (connFecha != null) connFecha.close();
						} 
					%>
				</div>
				
				
				
		</c:if>					
		<script src="<c:url value="/js/Highcharts/highcharts.js"/>"></script>
		<script src="<c:url value="/js/Highcharts/modules/exporting.js"/>"></script>
		<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
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
    <script type="text/javascript">
		$(window).load(function () {
			$('#dvLoading').fadeOut(1000);
		});
		
    </script>
  </body>
</html>


