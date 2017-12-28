<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="navbar">
    <div class="navbar-inner">
            <ul class="nav pull-right">
                
<!--                 <li><a href="#" class="hidden-phone visible-tablet visible-desktop" role="button">Settings</a></li> -->
                <li id="fat-menu" class="dropdown">
                    <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="icon-user"></i> ${user.username}
                        <i class="icon-caret-down"></i>
                    </a>

                    <ul class="dropdown-menu">
                        <li><a tabindex="-1" href="profile">Mi Cuenta</a></li>
                        <li class="divider"></li>
                        <li><a tabindex="-1" class="visible-phone" href="#">Settings</a></li>
                        <li class="divider visible-phone"></li>
                        <li>
	                        <c:url value="/j_spring_security_logout" var="logoutUrl" />
							<a href="${logoutUrl}">Salir</a>
                        </li>
                    </ul>
                </li>
                
            </ul>
            <a class="brand" href="home">
            	<!--  
            	<span class="first">Paris</span>
            	<span class="second">Cencosud</span> 
            	<img src="<c:url value="/images/cencosud.png"/>" alt="" width="50" height="50" />
            	-->
            	<span class="second">Paris</span>
            	<span class="second">Cencosud</span> <!--  -->
            	<img src="<c:url value="/images/apple-touch-icon.png"/>" alt="" width="40" height="40" />
            </a>
    </div>
</div>