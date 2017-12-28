$(function(){
	var addProvider = function() {
		location.href = "addProvider";
		return false;
	};
	
	$("#btn-add-provider").button().live('click', addProvider);
	
	var deleteProvider = function() {
		$("#f_lock").submit();
		return false;
	};
	
	$(".btn-danger").button().live('click', deleteProvider);
	
	var setProviderId = function(){
		var idProvider = $(this).attr("idprovider");
		var modo = $(this).attr("modo");
		$("#id_provider").val(idProvider);
		$("#modo").val(modo);
	};
	
	$(".delete").button().live('click', setProviderId);
	
});
