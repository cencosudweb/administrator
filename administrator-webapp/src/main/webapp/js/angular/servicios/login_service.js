var app = angular.module('login.loginService',[]);


app.factory('LoginService', ['$http','$q', function( $http, $q ){


	var self = {

		login: function( datos, day, month, year  ){
			//console.log(" usuario 	= " + datos.usuario );
			//console.log(" password 	= " + datos.password );
			//console.log( "dateInicio = " + datos.dateInicio );
			//console.log( "datos.fromstatsday_sday = " + datos.fromstatsday_sday );
			//console.log( "datos.fromstatsmonth_smonth = " + datos.fromstatsmonth_smonth );
			console.log( "datos.orden = " + datos.orden );
			console.log( "datos.guia = " + datos.guia );
			console.log( "datos.venta = " + datos.venta );
			console.log( "day = " + day );
			console.log( "month = " + month );
			console.log( "year = " + year );

			
			
			var d = $q.defer();
			
			
			$http.get('http://172.18.163.15:8086/administrator-ws/kitserviceRS/service/cumplimiento?fechaCompromisoEom='+year+'-'+month+'-'+day+'&tipoOrden='+datos.orden+'&tipoVenta='+datos.venta+'&tipoGuia='+datos.guia)
				 .success(function( data ){
				 	console.log( "data = " + data );
				 	d.resolve( data );

				 });
			return d.promise;

		}



	};

	




	return self;


}])



