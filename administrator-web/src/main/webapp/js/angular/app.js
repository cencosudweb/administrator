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


	$scope.currentPage = 0;
    $scope.pageSize = 10;
    $scope.pages = [];		
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

	$scope.logs = [];

	
		


	$scope.currentPage = 0;
    $scope.pageSize = 10;
    $scope.pages = [];

    $http.get('http://localhost:8081/administrator-ws/kitserviceRS/service/logs')
		.success(function(data){

			$scope.logs = data;

			console.log("====1==="+$scope.logs );



	});
	


    /*
    $scope.logs = [
		{ id: 1, primernombre: 'Juan', segundonombre: 'Mario', primerapellido: 'Pérez', segundoapellido: 'Maldonado', fechanacimiento: '23-12-1985' },
		{ id: 2, primernombre: 'Jorge', segundonombre: 'Alfonzo', primerapellido: 'Quinto', segundoapellido: 'Marroquín', fechanacimiento: '15-01-1988' },
		{ id: 3, primernombre: 'Carlos', segundonombre: 'Alberto', primerapellido: 'Vargas', segundoapellido: 'Martínez', fechanacimiento: '09-03-1990' },
		{ id: 4, primernombre: 'Mario', segundonombre: 'Alvaro', primerapellido: 'Hernadez', segundoapellido: 'Morales', fechanacimiento: '23-02-1984' },
		{ id: 5, primernombre: 'Marlon', segundonombre: 'Federico', primerapellido: 'López', segundoapellido: 'Padilla', fechanacimiento: '01-03-1976' },
		{ id: 6, primernombre: 'Daniel', segundonombre: 'Francisco', primerapellido: 'Herrera', segundoapellido: 'Perdomo', fechanacimiento: '22-03-1989' },
		{ id: 7, primernombre: 'Cesar', segundonombre: 'Jaime', primerapellido: 'Arroche', segundoapellido: 'Pedrosa', fechanacimiento: '18-02-1987' },
		{ id: 8, primernombre: 'Julio', segundonombre: 'Ignacio', primerapellido: 'Carvajal', segundoapellido: 'Quevedo', fechanacimiento: '16-10-1988' },
		{ id: 9, primernombre: 'Carla', segundonombre: 'Daniela', primerapellido: 'Molino', segundoapellido: 'Díaz', fechanacimiento: '01-11-1988' },
		{ id: 10, primernombre: 'Daniela', segundonombre: 'Flor', primerapellido: 'Palma', segundoapellido: 'Gabiño', fechanacimiento: '23-08-1990' },
		{ id: 11, primernombre: 'Maritza', segundonombre: 'Gabriela', primerapellido: 'Quiñonez', segundoapellido: 'Gómez', fechanacimiento: '31-09-1987' },
		{ id: 12, primernombre: 'Aaron', segundonombre: 'Bernando', primerapellido: 'Salvatierra', segundoapellido: 'Gonzalez', fechanacimiento: '05-10-1990' },
		{ id: 13, primernombre: 'Adrian', segundonombre: 'Ignacio', primerapellido: 'Alvarez', segundoapellido: 'Villagran', fechanacimiento: '04-11-1987' },
		{ id: 14, primernombre: 'Bernardo', segundonombre: 'Javier', primerapellido: 'Alfaro', segundoapellido: 'Valdez', fechanacimiento: '06-12-1977' },
		{ id: 15, primernombre: 'Claudia', segundonombre: 'Melisa', primerapellido: 'Alva', segundoapellido: 'Villa', fechanacimiento: '15-03-1992' },
		{ id: 16, primernombre: 'Jorge', segundonombre: 'Mariano', primerapellido: 'Adelantado', segundoapellido: 'Villela', fechanacimiento: '04-05-1991' },
		{ id: 17, primernombre: 'Ignacio', segundonombre: 'Carlos', primerapellido: 'López', segundoapellido: 'Lara', fechanacimiento: '22-05-1993' },
		{ id: 18, primernombre: 'Melvin', segundonombre: 'Orlando', primerapellido: 'Vargas', segundoapellido: 'Lago', fechanacimiento: '29-04-1987' },
		{ id: 19, primernombre: 'Milton', segundonombre: 'Marlon', primerapellido: 'Quinto', segundoapellido: 'Perdomo', fechanacimiento: '27-03-1985' },
		{ id: 20, primernombre: 'Javier', segundonombre: 'Enrique', primerapellido: 'Pérez', segundoapellido: 'Maldonado', fechanacimiento: '14-01-1988' },
		{ id: 21, primernombre: 'Orlando', segundonombre: 'Pablo', primerapellido: 'Rosales', segundoapellido: 'Martínez', fechanacimiento: '17-10-1985' },
		{ id: 22, primernombre: 'Roberto', segundonombre: 'Pedro', primerapellido: 'Vargas', segundoapellido: 'Díaz', fechanacimiento: '19-08-1984' },
		{ id: 23, primernombre: 'Rolando', segundonombre: 'Vicente', primerapellido: 'Arroche', segundoapellido: 'Quevedo', fechanacimiento: '04-07-1988' },
		{ id: 24, primernombre: 'Mariano', segundonombre: 'Julio', primerapellido: 'Rosales', segundoapellido: 'Lara', fechanacimiento: '06-06-1989' }
	];
    */
    console.log("===="+$scope.logs);

    $scope.configPages = function() {
        $scope.pages.length = 0;
        var ini = $scope.currentPage - 4;
        var fin = $scope.currentPage + 5;
        if (ini < 1) {
            ini = 1;
            if (Math.ceil($scope.logs.length / $scope.pageSize) > 10)
                fin = 10;
            else
                fin = Math.ceil($scope.logs.length / $scope.pageSize);
        }
        else {
            if (ini >= Math.ceil($scope.logs.length / $scope.pageSize) - 10) {
                ini = Math.ceil($scope.logs.length / $scope.pageSize) - 10;
                fin = Math.ceil($scope.logs.length / $scope.pageSize);
            }
        }
        if (ini < 1) ini = 1;
        for (var i = ini; i <= fin; i++) {
            $scope.pages.push({no: i});
        }

        if ($scope.currentPage >= $scope.pages.length)
            $scope.currentPage = $scope.pages.length - 1;
    };

    $scope.setPage = function(index) {
        $scope.currentPage = index - 1;
    };

    $scope.seleccionarUsuario = function(id) {
    	alert('Se hizo click en el usuario: ' + id);
    };	

	$http.get('http://localhost:8081/administrator-ws/kitserviceRS/service/ordenes')
		.success(function(data){

			$scope.clima2 = data;


		});
	
	
	
	//http://172.18.163.15:8088/administrator-ws/kitserviceRS/service/cumplimiento?fechaCompromisoEom=2017-09-04&tipoOrden=-1&tipoVenta=-1&tipoGuia=-1

	$http.get('http://localhost:8081/administrator-ws/kitserviceRS/service/ordenes')
		.success(function(data){
			$scope.ordenes = data;
	});	
	
	$http.get('http://localhost:8081/administrator-ws/kitserviceRS/service/guias')
		.success(function(data){
			$scope.guias = data;
	});
	
	$http.get('http://localhost:8081/administrator-ws/kitserviceRS/service/ventas')
		.success(function(data){
			$scope.ventas = data;
	});

	


	




}])



.filter('startFromGrid', function() {
  return function(input, start) {
    start = +start;
    return input.slice(start);
  }
});













