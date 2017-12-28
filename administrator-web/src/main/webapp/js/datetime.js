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
		var idUsuario = $(this).attr("iduser");
		var modo = $(this).attr("modo");
		//var lastname = $(this).attr("lastname");
		$("#id_user").val(idUsuario);
		$("#modo").val(modo);
		//$("#lastname").val(lastname);
	};
	
	
	$(".lockUnlock").button().live('click', setUserId);
	
	var allUser = function() {
		$('#f_all_user').submit();
		return false;
	};
	
	$("#btn-all-user").button().live('click', allUser);
	
	
});
