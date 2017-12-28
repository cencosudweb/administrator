(function(){

var app = angular.module('ejemplosApp',[ ]);



app.controller('mainCtrl', ['$scope','$http', function($scope,$http){
  
  //http://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&callback=JSON_CALLBACK
	$scope.clima = {};

	$scope.clima2 = {};

	$scope.formData = {};


	$http.jsonp('http://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&callback=JSON_CALLBACK&appid=9f50a805aa0089a1edd1829a5db029f0')
		.success(function(data){

			$scope.clima = data;
			$scope.formData = {};


		});

	$http.jsonp('http://10.95.48.140:8081/administrator-ws/kitserviceRS/service/cumplimiento?fechaCompromisoEom=2017-08-24&tipoOrden=-1&tipoVenta=-1&tipoGuia=-1')
		.success(function(data){

			$scope.clima2 = data;
			$scope.formData = {};


		});
	
		$scope.kelvinCelcius = function(k) {
			c = k - 273.15;
			c = Math.round( c*100 ) / 100;

			return c;
		}


		
		$scope.consultar_datos = function(valido) {
			$scope.formData = {};

			if (!valido){
				return;
			}
			console.log("Posteando..." + valido.nombre);
		}

}]);





})();
