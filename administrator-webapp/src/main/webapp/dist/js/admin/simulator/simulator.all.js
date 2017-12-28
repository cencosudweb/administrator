$(function(){
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
		
		
		var customer = $(this).attr("customer");
		var dateInicio = $(this).attr("dateInicio");
		var dateFin = $(this).attr("dateFin");
		//var idUsuario = $(this).attr("iduser");
		//var modo = $(this).attr("modo");
		//var username = $(this).attr("username");
		var p = $(this).attr("p");
		var terminatecauseid = $(this).attr("terminatecauseid");
		var number = $(this).attr("number");
		
		
		$("#customer").val(customer);
		$("#dateInicio").val(dateInicio);
		$("#dateFin").val(dateFin);
		//$("#id_user").val(idUsuario);
		//$("#modo").val(modo);
		//$("#username").val(username);
		$("#p").val(p);
		$("#terminatecauseid").val(terminatecauseid);
		$("#number").val(number);
	};
	
	$(".lockUnlock").button().live('click', setUserId);
	
});
