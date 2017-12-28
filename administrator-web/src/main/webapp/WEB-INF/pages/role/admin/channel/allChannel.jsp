<%@include file="../../../include/taglib_includes.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="net.sf.jasperreports.engine.*" %>
<%@ page import="java.sql.CallableStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DatabaseMetaData" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Trans
itional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
  	<title>Paris Cencosud</title>
    <jsp:include page="../../../include/head.jsp" />
    <script src="<c:url value="/js/admin/channel/channel.all.js"/>" type="text/javascript"></script>
	<link rel="shortcut icon" href="<c:url value="/css/ges.css"/>">
    
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
            <h1 class="page-title">Canales</h1>
        </div>
        
        <ul class="breadcrumb">
            <li><a href="home">Home</a> <span class="divider">/</span></li>
            <li class="active">Canales</li>
        </ul>
        <div class="container-fluid">
	        <div class="row-fluid">
				<div class="btn-toolbar">
				    <button id="btn-add-channel" class="btn btn-primary"><i class="icon-plus"></i> Nueva</button>
				    <button class="btn" disabled="disabled">Import</button>
				    <button class="btn">Export</button>
				    <c:url value="xlsAll" var="downloadXls" />
				    <c:url value="pdfAll" var="downloadPdf" />
				    <c:url value="csvAll" var="downloadCsv" />
				    <c:url value="htmlAll" var="downloadHtml" />
				    <a class="btn" href="${downloadXls}?idChannel=<%if(request.getParameter("idChannel") != null){%><%=request.getParameter("idChannel")%><%}else{%><%=""%><% } %>">Download Excel</a>
				    <a class="btn" href="${downloadPdf}?idChannel=<%if(request.getParameter("idChannel") != null){%><%=request.getParameter("idChannel")%><%}else{%><%=""%><% } %>">Download Pdf</a>
				    <a class="btn" href="${downloadCsv}?idChannel=<%if(request.getParameter("idChannel") != null){%><%=request.getParameter("idChannel")%><%}else{%><%=""%><% } %>">Download Csv</a>
				    <a class="btn" target="self" href="${downloadHtml}?idChannel=<%if(request.getParameter("idChannel") != null){%><%=request.getParameter("idChannel")%><%}else{%><%=""%><% } %>">Download Html</a>
				        
				     
					<div class="btn-group"></div>
				</div>
				<div id="myTabContent" class="tab-content">
      				<div class="tab-pane active in" id="home" >
      					<form id="f_all_user" method="get" action="allChannel" >
        					<div class="form-group">
				            <label>Canales</label>
				            <select name="idChannel" id="idChannel" class="form-control">
					              <option value="">Todas los Canales</option>
					              <c:forEach items="${listChannels}" var="listChannel" varStatus="status">
					              	<option value="${listChannel.id}" ${param.idChannel == listChannel.id ? 'selected' : ''}>${listChannel.description}</option>
					              </c:forEach>
					            </select>
		          	</div>
        					<div class="btn-toolbar list-toolbar">
					      	<button class="btn btn-primary" id="btn-all-user" ><i class="fa fa-save"></i> Buscar</button>
					    	</div>
        				</form>	
        			</div>
        		</div>        
				</br>
				<jsp:include page="../../../include/messages.jsp" />
				
				<div class="well">
				    <table class="table">
				      <thead>
				        <tr>
				          <th>#</th>
				          <th>Canal</th>
				          <th style="width: 250px;">Acciones</th>
				        </tr>
				      </thead>
				      <tbody>
				      <c:if test="${!empty channels}">
					      <c:forEach items="${channels}" var="channel" varStatus="status">
					            <tr>
						          <td>${status.count}</td>
						          <td>${channel.description}</td>
						          <td>
						              <a href="editChannel?id=${channel.id}" title="Editar" ><i class="icon-pencil"></i> Editar</a><br />
						              <c:choose>
										  <c:when test="${channel.id != null}">
										  	<a href="#myModal" class="lockUnlock" modo='L' idchannel="${channel.id}" title="Deshabilitar" role="button" data-toggle="modal" style="margin-right: 15px"><i class="icon-ban-circle"></i> Deshabilitar</a><br />
										  	<a href="pdf?idChannel=${channel.id}" class="lockUnlock" style="margin-right: 15px"><i></i> Download Pdf</a><br />
										  	<a href="xls?idChannel=${channel.id}" class="lockUnlock" style="margin-right: 15px"><i></i> Download Excel</a><br />
										  	<a href="csv?idChannel=${channel.id}" class="lockUnlock" style="margin-right: 15px"><i></i> Download Csv</a><br />
										  	<a href="html?idChannel=${channel.id}" class="lockUnlock" style="margin-right: 15px"><i></i> Download Html</a>
				   
										  </c:when>
									  </c:choose>
						          </td>
						        </tr>
						</c:forEach>
						<form method="post"  action="deleteChannel" id="f_lock">
		        			<input type="hidden" name="id" id="id_channel"/>
		        			<input type="hidden" name="modo" id="modo"/>
						</form>
				      </c:if>
				        
				      </tbody>
				    </table>
				</div>
<!-- 				<div class="pagination"> -->
<!-- 				    <ul> -->
<!-- 				        <li><a href="#">Prev</a></li> -->
<!-- 				        <li><a href="#">1</a></li> -->
<!-- 				        <li><a href="#">2</a></li> -->
<!-- 				        <li><a href="#">3</a></li> -->
<!-- 				        <li><a href="#">4</a></li> -->
<!-- 				        <li><a href="#">Next</a></li> -->
<!-- 				    </ul> -->
<!-- 				</div> -->
				
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
    
  </body>
</html>


