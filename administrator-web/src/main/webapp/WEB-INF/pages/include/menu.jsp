<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
 
    <div class="sidebar-nav">
    
        <a href="#dashboard-menu" class="nav-header" data-toggle="collapse"><i class="icon-dashboard"></i>Home<i class="icon-chevron-up"></i></a>
        <ul id="dashboard-menu" class="nav nav-list collapse in">
        	<li><a href="home">Home</a></li>
        	<sec:authorize access="hasRole('ROLE_ADMIN')">
        		
	            <li><a href="allUsers">Usuarios</a></li>
	            <li><a href="allCommerces">Comercios</a></li>
	            <li><a href="allFinancial">Insituciones Financieras</a></li>
	            <li><a href="allLogs">Logs</a></li>
	            <li><a href="allLogs2">Logs2</a></li>
	             <li><a href="allLogs2">Logs2</a></li>
	            <li><a href="allChannel">Canales</a></li>
	            <!--  
	            <li><a href="allPadrinos">Padrinos</a></li>
	            <li><a href="allGerentes">Gerentes</a></li>
	            <li><a href="allContrapartes">Contrapartes</a></li>
	            <li><a href="allSoportes">Soporte Integral</a></li>
	            -->
            </sec:authorize>
            <sec:authorize access="hasRole('ROLE_USER_IF')">
            	  
            	<li><a href="#" class="inactivo">Convenios</a></li>
            	<li><a href="#" class="inactivo">Comercios</a></li>
            	
            </sec:authorize>
            <sec:authorize access="hasRole('ROLE_COMMERCE')">
            	<!--  <li><a href="#" class="inactivo">Mis Instituciones</a></li>-->
            </sec:authorize>
        </ul>
        
        
         <a href="#error-menu2" class="nav-header collapsed" data-toggle="collapse"><i class="icon-briefcase"></i>Gestion Tienda<i class="icon-chevron-up"></i></a>
        <ul id="error-menu2" class="nav nav-list collapse">
        	<sec:authorize access="hasRole('ROLE_ADMIN')">
        		<li><a href="allPautas">Requerimiento visita a tienda</a></li>
            </sec:authorize>
            <sec:authorize access="hasRole('ROLE_USER_IF')">
				<li><a href="allPautas">Requerimiento visita a tienda</a></li>

         	</sec:authorize>
        	<sec:authorize access="hasRole('ROLE_COMMERCE')">
            	<li><a href="allPautas">Requerimiento visita a tienda</a></li>
        	</sec:authorize>
        	<!--  
        	<sec:authorize access="hasRole('ROLE_COMMERCE')">
            	<li><a href="cuadraturaVtavPd">Requerimiento visita a tienda</a></li>
        	</sec:authorize>
        	-->
        	
        </ul>
		
		
		
        <a href="#error-menu" class="nav-header collapsed" data-toggle="collapse"><i class="icon-briefcase"></i>Cumplimiento Logistico<i class="icon-chevron-up"></i></a>
        <ul id="error-menu" class="nav nav-list collapse">
        	<sec:authorize access="hasRole('ROLE_ADMIN')">
        		<li><a href="reportePanelDinamico">Kpi Cumplimiento Dinamico</a></li>
        		<li><a href="reporteTrackLogistica">Kpi Logistica</a></li>
	            <li><a href="reportePanelEstatico">Kpi Cumplimiento Estatico</a></li>
        		<li><a href="reportePanelDinamicoMensual">Kpi Cumplimiento Dinamico Mensual</a></li>
        		<li><a href="reporteResponsableCumplimiento">Kpi Responsable Cumplimiento</a></li>
        		

        		<!--  <li><a href="reportePanelDinamicoMensualComparar">Kpi Cumplimiento Dinamico Mensual Comparar</a></li>-->
            </sec:authorize>
            <sec:authorize access="hasRole('ROLE_USER_IF')">
				<li><a href="reportePanelDinamico">Kpi Cumplimiento Dinamico</a></li>
            	<li><a href="reportePanelEstatico">Kpi Cumplimiento Estatico</a></li>
            	<li><a href="reportePanelDinamicoMensual">Kpi Cumplimiento Dinamico Mensual</a></li>
        		<li><a href="reporteResponsableCumplimiento">Kpi Responsable Cumplimiento</a></li>

            	<!--  
            	<li><a href="reportePanelDinamicoMensualComparar">Kpi Cumplimiento Dinamico Mensual Comparar</a></li>
            	---->
            	

         	</sec:authorize>
        	<sec:authorize access="hasRole('ROLE_COMMERCE')">
            	<li><a href="reportePanelDinamico">Kpi Cumplimiento Dinamico</a></li>
            	<li><a href="reportePanelEstatico">Kpi Cumplimiento Estatico</a></li>
            	<li><a href="reportePanelDinamicoMensual">Kpi Cumplimiento Dinamico Mensual</a></li>
        		<li><a href="reporteResponsableCumplimiento">Kpi Responsable Cumplimiento</a></li>
            	
            	<!--<li><a href="reportePanelDinamicoMensualComparar">Kpi Cumplimiento Dinamico Mensual Comparar</a></li>-->
            	
            	
            	

        	</sec:authorize>
        </ul>
        
        <a href="#accounts-menu" class="nav-header collapsed" data-toggle="collapse"><i class="icon-briefcase"></i>Cuadraturas<i class="icon-chevron-up"></i></a>
        <ul id="accounts-menu" class="nav nav-list collapse">
            
          <sec:authorize access="hasRole('ROLE_ADMIN')">
	            <li><a href="reporteCuadraturaOrdenDeCompra">Cuadraturas Orden de Compra</a></li>
	            <li><a href="reporteCuadraturaVentaEnVerde">OC Venta En Verde</a></li>
	             <li><a href="reporteOrdenDeCompraStock">OC de Stock</a></li>
	             <li><a href="reporteOrdenDeCompraStock2">OC de Stock</a></li>
	            <li><a href="reporteProcesoIgualacion" class="inactivo">Proceso de Igualacion</a></li>
	             <li><a href="reporteCuadraturaEcommerceSoporteVenta" >Cuadratura Ecommerce Soporte Venta</a></li>
	           <li><a href="reportODVentaVerde">Cuadratura Venta En Verde PD</a></li>
	           <li><a href="allOrdeneStockPendientes">Cuadratura Ordenes Stock Pendientes</a></li>

	           <li><a href="cuadraturaCtl">Cuadratura CTL</a></li>
	           <li><a href="cuadraturaDo">Cuadratura DO</a></li>

            </sec:authorize>
            <sec:authorize access="hasRole('ROLE_USER_IF')">
	 			<li><a href="reporteCuadraturaVentaEnVerde">OC Venta En Verde</a></li>            	
	 			<li><a href="reporteOrdenDeCompraStock">OC de Stock</a></li> 
	 			<li><a href="reporteCuadraturaEcommerceSoporteVenta" >Cuadratura Ecommerce Soporte Venta</a></li>           	
	 			<li><a href="reportODVentaVerde">Cuadratura Venta En Verde PD</a></li>
	 			<li><a href="allOrdeneStockPendientes">Cuadratura Ordenes Stock Pendientes</a></li>
	 			<li><a href="cuadraturaCtl">Cuadratura CTL</a></li>
         	</sec:authorize>
        	<sec:authorize access="hasRole('ROLE_COMMERCE')">
	 			<li><a href="reporteCuadraturaVentaEnVerde">OC Venta En Verde</a></li>  
	 			<li><a href="reporteOrdenDeCompraStock">OC de Stock</a></li>          	
	 			<li><a href="reporteCuadraturaEcommerceSoporteVenta" >Cuadratura Ecommerce Soporte Venta</a></li>
	 			<li><a href="reportODVentaVerde">Cuadratura Venta En Verde PD</a></li>
	 			<li><a href="allOrdeneStockPendientes">Cuadratura Ordenes Stock Pendientes</a></li>
	 			<li><a href="cuadraturaCtl">Cuadratura CTL</a></li>
        	</sec:authorize>
        </ul>
        
        <!--  
        <a href="#accounts-menu" class="nav-header collapsed" data-toggle="collapse"><i class="icon-briefcase"></i>Mi Cuenta<i class="icon-chevron-up"></i></a>
        <ul id="accounts-menu" class="nav nav-list collapse">
            
            <li><a href="#" class="inactivo">Perfil</a></li>
            <li><a href="#" class="inactivo">Cambiar Contrase&ntilde;a</a></li>
        </ul>

        <a href="#legal-menu" class="nav-header" data-toggle="collapse"><i class="icon-legal"></i>Legal</a>
        <ul id="legal-menu" class="nav nav-list collapse">
            <li><a href="#" class="inactivo">Privacy Policy</a></li>
            <li><a href="#" class="inactivo">Terms and Conditions</a></li>
        </ul>

        <a href="#" class="nav-header" ><i class="icon-question-sign"></i>Help</a>
        <a href="#" class="nav-header" ><i class="icon-comment"></i>Faq</a>
        -->
    </div>
    
