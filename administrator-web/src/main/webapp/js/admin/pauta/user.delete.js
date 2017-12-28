$(function(){
	var addUser = function() {
		location.href = "addUser";
		return false;
	};
	
	$("#btn-add-user").button().live('click', addUser);
	
	var deleteUser = function() {
		var idUsuario = $(this).attr("iduser");
		$("#id_user").val(idUsuario);
	};
	
	$(".btn-danger").button().live('click', deleteUser);
	
	var setUserId = function(){
		var idUsuario = $(this).attr("iduser");
		$("#id_user").val(idUsuario);
	};
	
	$(".lockUnlock").button().live('click', setUserId);
	
});
