<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<header class="main-header">
    <!-- Logo -->
    <a href="home" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>Paris Cencosud</b></span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><img src="<c:url value="/dist/img/favicons/apple-touch-icon.png"/> " class="user-image" alt="User Image" width="50" height="50"><!--<b>Paris Cencosud</b>--></span>
    </a>
	

    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>

      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- Messages: style can be found in dropdown.less-->
          
		  <!-- Notifications: style can be found in dropdown.less -->
          
		  <!-- Tasks: style can be found in dropdown.less -->
          
          <!-- User Account: style can be found in dropdown.less -->
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="<c:url value="/dist/img/favicons/apple-touch-icon.png"/>" class="user-image" alt="User Image">
              <span class="hidden-xs">Tiendas Por Departamento</span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="<c:url value="/dist/img/favicons/apple-touch-icon.png"/>" class="img-circle" alt="User Image">

                <p>
                  Tiendas Por Departamento
                  <small>${user.username}</small>
                </p>
              </li>
              <!-- Menu Body -->
			  <!--  
              <li class="user-body">
                <div class="row">
                  <div class="col-xs-4 text-center">
                    <a href="#">Followers</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a href="#">Sales</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a href="#">Friends</a>
                  </div>
                </div>
              </li>
              -->
			  
              <!-- Menu Footer-->
              
			  <li class="user-footer">
                <div class="pull-left">
                  <a href="#" class="btn btn-default btn-flat">Mi Cuenta</a>
                </div>
                <div class="pull-right">
                	<c:url value="/j_spring_security_logout" var="logoutUrl" />
                  <a href="${logoutUrl}" class="btn btn-default btn-flat">Cierre de Session</a>
                </div>
              </li>
			 
            </ul>
          </li>
          <!-- Control Sidebar Toggle Button -->
		  <!--  
          <li>
            <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
          </li>
          -->
		  
        </ul>
      </div>
    </nav>
  </header>