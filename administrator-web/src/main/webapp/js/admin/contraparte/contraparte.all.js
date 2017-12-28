$(function(){
	var addContraparte = function() {
		location.href = "addContraparte";
		return false;
	};
	
	$("#btn-add-contraparte").button().live('click', addContraparte);
	
	var deleteContraparte = function() {
		$("#f_lock").submit();
		return false;
	};
	
	$(".btn-danger").button().live('click', deleteContraparte);
	
	var setContraparteId = function(){
		var idContraparte = $(this).attr("idcontraparte");
		var modo = $(this).attr("modo");
		$("#id_contraparte").val(idContraparte);
		$("#modo").val(modo);
	};
	
	$(".lockUnlock").button().live('click', setContraparteId);
	
});
