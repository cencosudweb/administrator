var app = angular.module( 'loginApp',['login.loginService']);


app.controller('mainCtrl', ['$scope', '$http', 'LoginService', function( $scope, $http, LoginService ){
	
	

	var today2 = new Date();
	var dd2 = today2.getDate();
			var mm2 = today2.getMonth()+1; //January is 0!

			var yyyy2 = today2.getFullYear();
			if(dd2<10){
			    dd2='0'+dd2;
			} 
			if(mm2<10){
			    mm2='0'+mm2;
			} 
			
			var today2 = yyyy2+'-'+mm2+'-'+dd2;

			console.log('today2='+today2);



	$scope.date = today2;

	$scope.invalido = false;
	$scope.cargando = false;
	$scope.mensaje  = "";
	
	
	//$scope.date = "2017-09-01";

	$scope.datos = {};
	
	$scope.cumple = {};
	
	$scope.guias = {};

	$scope.ordenes = {};

	$scope.ventas = {};

	$scope.clima = {};

	$scope.clima2 = {};

	$http.jsonp('http://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&callback=JSON_CALLBACK&appid=9f50a805aa0089a1edd1829a5db029f0')
		.success(function(data){

			$scope.clima = data;


		});

	$http.get('http://172.18.163.15:8086/administrator-ws/kitserviceRS/service/ordenes')
		.success(function(data){

			$scope.clima2 = data;


		});
	
	
	
	//http://172.18.163.15:8086/administrator-ws/kitserviceRS/service/cumplimiento?fechaCompromisoEom=2017-09-04&tipoOrden=-1&tipoVenta=-1&tipoGuia=-1

	$http.get('http://172.18.163.15:8086/administrator-ws/kitserviceRS/service/ordenes')
		.success(function(data){
			$scope.ordenes = data;
	});	
	
	$http.get('http://172.18.163.15:8086/administrator-ws/kitserviceRS/service/guias')
		.success(function(data){
			$scope.guias = data;
	});
	
	$http.get('http://172.18.163.15:8086/administrator-ws/kitserviceRS/service/ventas')
		.success(function(data){
			$scope.ventas = data;
	});

	$scope.ingresar = function( datos ){
		var options = {  year: 'numeric', month: 'numeric', day: 'numeric' };
		
		var today = new Date();
		var day = "";
		var month = "";
		var year = "";
		/*console.log( "today = " + today );
		console.log( "today Day = " + today.getDate() );
		console.log( "today Month = " + today.getMonth() );
		console.log( "today Year = " + today.getFullYear() );
		console.log( "today 2 = " + datos.date );
		console.log( "today 1 = " + today.getDate() );
		*/






		if (datos.date != null) {
			console.log( "-------Y1------" );

			var dd = datos.date.getDate();
			var mm = datos.date.getMonth()+1; //January is 0!

			var yyyy = datos.date.getFullYear();
			if(dd<10){
			    dd='0'+dd;
			} 
			if(mm<10){
			    mm='0'+mm;
			} 
			
			var today = yyyy+'-'+mm+'-'+dd;
			var day = dd;
			var month  = mm;
			var year = yyyy;
			console.log( "today = " + today );



		} else {
			console.log( "-------Y2------ ");

			var dd = today.getDate();
			var mm = today.getMonth()+1; //January is 0!

			var yyyy = today.getFullYear();
			if(dd<10){
			    dd='0'+dd;
			} 
			if(mm<10){
			    mm='0'+mm;
			} 
			
			var today = yyyy+'-'+mm+'-'+dd;
			var day = dd;
			var month  = mm;
			var year = yyyy;
			console.log( "today = " + today );
			//console.log( "day = " + day );
			//console.log( "month = " + month );
			//console.log( "year = " + year );
		}


		//console.log( "today 2 = " + datos.date.getDate() );
		//console.log( "today 3 = " + datos.date.getMonth() );
		//console.log( "today 3 = " + datos.date.getFullYear() );
		

		/*
		if ( datos.date.getDate() >= 1 && datos.date.getDate() <= 9  ) {
			day = '0'+datos.date.getDate();
			console.log( "Day Test 1 = " );
			
			
		} else {
			day = datos.date.getDate();
			console.log( "Day Test 2 = ");
		}
		
		if ( datos.date.getMonth()+1 >= 1 &&  datos.date.getMonth()+1 <= 9  ) {
			month = '0'+(datos.date.getMonth()+1);
			console.log( "Month Test 1 = ");
		} else {
			month = (Integer.padatos.date.getMonth()+1);
			console.log( "Month Test 2 = ");
		}

		if ( datos.date.getFullYear() != null  ) {
			year = datos.date.getFullYear();
			console.log( "Year Test = ");
		}
		*/

		//year = "2017";
		//year

		console.log( "Day = " + day);
		console.log( "Mont =  " + month);
		console.log( "Year = " + year);

		
		
		
		
		
		//console.log( "datos.date = " + datos.date.toLocaleDateString().getDate() );
		//console.log( "fecha = " + datos.fecha );
		//console.log( "dateInicio = " + datos.dateInicio );
		//console.log( "datos.date_input = " + datos.date_input.toLocaleDateString() );
		
		
		
		
		//console.log( "datos.fromstatsday_sday = " + datos.fromstatsday_sday );
		
		//console.log( "datos.fromstatsmonth_smonth = " + datos.fromstatsmonth_smonth );
		console.log( "datos.orden = " + datos.orden );
		console.log( "datos.guia = " + datos.guia );
		console.log( "datos.venta = " + datos.venta );
		
		
		
		
		/*
		if (datos.fromstatsday_sday === undefined) {
			datos.fromstatsday_sday = dd;
		} else {
			datos.fromstatsday_sday = datos.fromstatsday_sday;
		}
		
		if (datos.fromstatsmonth_smonth === undefined) {
			datos.fromstatsmonth_smonth = yyyy+'-'+mm;
		} else {
			datos.fromstatsmonth_smonth = datos.fromstatsmonth_smonth;
		}
		*/
	
		if (datos.orden === undefined || datos.orden === '') {
			datos.orden = -1;
		} else {
			datos.orden = datos.orden;
		}
		
		if (datos.guia === undefined || datos.guia === '') {
			datos.guia = -1;
		} else {
			datos.guia = datos.guia;
		}
		
		if (datos.venta === undefined || datos.venta === '') {
			datos.venta = -1;
		} else {
			datos.venta = datos.venta;
		}
		console.log( "datos.orden="+datos.orden);	
		console.log( "datos.guia="+datos.guia);	
		console.log( "datos.venta="+datos.venta);	

		//console.log( "usuario = " + datos.usuario );
		//console.log( "usuario = " + datos.usuario.length );
		//console.log( "contrasena = " + datos.contrasena );
		//console.log( "contrasena = " + datos.contrasena.length );
		/*
		if( datos.usuario.length < 3 ){
			$scope.invalido = true;
			$scope.mensaje  = 'Ingrese su usuario';
			return;

		}else if( datos.contrasena.length < 3 ) {
			$scope.invalido = true;
			$scope.mensaje  = 'Ingrese su contraseña';
			return;
		}
		*/

		$scope.invalido = false;
		$scope.cargando = true;
		
		
		LoginService.login( datos, day, month, year ).then( function( data ){

			// TODO... continuar
			if( data.err ){
				console.log( "Error");
				//$scope.invalido = true;
				//$scope.cargando = true;
				//$scope.mensaje  = data.mensaje;
				//window.location = "http://localhost:8085/administrator-webapp/panelEstatico";
				//window.location = data.url;
			}else{
				
				console.log( "No Error");
				$scope.cumple = data;
				//$scope.datos2 = data;
				//window.location = data.url;
				//window.location = data.url;
				//http://localhost:8085/administrator-webapp/panelEstatico
			}

		});
		


	}



}]);






